# insert your copyright here

class OpenStudio::Model::ModelObject

  # from Julien Marrec
  # https://unmethours.com/question/17616/get-thermal-zone-supply-terminal/  
  # Extend ModelObject class to add a to_actual_object method
  # Casts a ModelObject into what it actually is (OS:Node for example...)
  def to_actual_object
    obj_type = self.iddObjectType.valueName
    obj_type_name = obj_type.gsub('OS_','').gsub('_','')
    method_name = "to_#{obj_type_name}"
    if self.respond_to?(method_name)
      actual_thing = self.method(method_name).call
      if !actual_thing.empty?
        return actual_thing.get
      end
    end
    return false
  end

end

def get_setters(class_name)

  array = []

  instance_methods = OpenStudio::Model.const_get(class_name).instance_methods

  instance_methods.each do |instance_method|
    array << instance_method.to_s if instance_method.to_s.start_with? 'set'
  end

  # remove the last 12 elements, which are general setters
  array.pop(12)

  return array

end

# function to make thermostats
def make_thermostat(model, thermal_zone_array)

  thermal_zone_array.each do |thermal_zone|
    next if thermal_zone.thermostat.is_initialized     
    thermostat = OpenStudio::Model::ThermostatSetpointDualSetpoint.new(model)
    thermostat.setName("#{thermal_zone.name.to_s} Thermostat")
  end

end

# see the URL below for information on how to write OpenStudio measures
# http://nrel.github.io/OpenStudio-user-documentation/reference/measure_writing_guide/

# start the measure
class WholeBuildingScheduleFile < OpenStudio::Measure::ModelMeasure
  # human readable name
  def name
    # Measure name should be the title case of the class name.
    return 'Schedule File'
  end

  # human readable description
  def description
    return 'Adds a ScheduleFile object to the model and applies it to a single object or all objects of a class.'
  end

  # human readable description of modeling approach
  def modeler_description
    return 'https://github.com/NREL/OpenStudio-resources/blob/develop/model/simulationtests/schedule_file.rb'
  end

  # define the arguments that the user will input
  def arguments(model)
    args = OpenStudio::Measure::OSArgumentVector.new

    # Name
    name = OpenStudio::Ruleset::OSArgument::makeStringArgument('name', true)
    name.setDisplayName('Name')
    name.setDefaultValue('Schedule File')
    args << name

    # Schedule Type Limits Name
    schedule_type_limits_names = OpenStudio::StringVector.new
    model.getScheduleTypeLimitss.sort.each { |obj| schedule_type_limits_names << obj.name.to_s }
    schedule_type_limits_name = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('schedule_type_limits_name', schedule_type_limits_names, true)
    schedule_type_limits_name.setDisplayName('Schedule Type Limits Name')
    schedule_type_limits_name.setDescription('(must be compatible with model object schedule)')
    args << schedule_type_limits_name

    # File Name
    file_path = OpenStudio::Ruleset::OSArgument.makeStringArgument('file_path', true)
    file_path.setDisplayName('File Path')
    file_path.setDescription('(full path)')
    args << file_path

    # Column Number
    column = OpenStudio::Ruleset::OSArgument::makeIntegerArgument('column', true)
    column.setDisplayName('Column Number')
    column.setDescription('(1 = first)')
    args << column

    # Rows to Skip at Top
    rows_to_skip = OpenStudio::Ruleset::OSArgument::makeIntegerArgument('rows_to_skip', true)
    rows_to_skip.setDisplayName('Rows to Skip at Top')
    args << rows_to_skip

    # Number of Hours of Data
    num_hrs_data_choices = OpenStudio::StringVector.new
    num_hrs_data_choices << 8760.to_s
    num_hrs_data_choices << 8784.to_s
    num_hrs_data = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('num_hrs_data', num_hrs_data_choices, true)
    num_hrs_data.setDisplayName('Number of Hours of Data')
    num_hrs_data.setDescription('(8784 = leap year)')
    num_hrs_data.setDefaultValue('8760')
    args << num_hrs_data

    # Interpolate to Timestep
    interpolate = OpenStudio::Ruleset::OSArgument::makeBoolArgument('interpolate', false)
    interpolate.setDisplayName('Interpolate to Timestep')
    interpolate.setDefaultValue(true)
    args << interpolate
    
    # Column Separator
    col_separator_choices = OpenStudio::StringVector.new
    col_separator_choices << 'Comma'
    col_separator_choices << 'Tab'
    col_separator_choices << 'Fixed'
    col_separator_choices << 'Semicolon'
    col_separator = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('col_separator', col_separator_choices, true)
    col_separator.setDisplayName('Column Separator')
    col_separator.setDefaultValue('Comma')
    args << col_separator

    # Minutes Per Item
    minutes_per_item = OpenStudio::Ruleset::OSArgument::makeIntegerArgument('minutes_per_item', true)
    minutes_per_item.setDisplayName('Minutes Per Item')
    minutes_per_item.setDescription("(must be ≤ to 60 and evenly divisible into 60, same as timestep)")
    args << minutes_per_item

    # class name and object name arrays for choices
    cls_names_array = [] # array needed for .uniq method below
    obj_names = OpenStudio::StringVector.new
    cls_names_array << 'NONE' #HACK https://github.com/NREL/OpenStudio-PAT/issues/176
    obj_names << 'NONE'
    model.getModelObjects.sort.each do |obj|
      next unless obj.to_actual_object.respond_to?('setSchedule') || 	obj.to_actual_object.respond_to?('setThermostatSetpointDualSetpoint')
      cls_names_array << obj.to_actual_object.class.to_s.gsub('OpenStudio::Model::', '')
      obj_names << obj.name.to_s
    end

    # class name
    cls_names = OpenStudio::StringVector.new
    cls_names_array.uniq.each { |name| cls_names << name }
    cls_name = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('cls_name', cls_names, true)
    cls_name.setDisplayName('Class Name')
    cls_name.setDescription('(apply to ALL objects)')
    args << cls_name
    
    # object name
    obj_name = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('obj_name', obj_names, true)
    obj_name.setDisplayName('Object Name')
    obj_name.setDescription('(apply to ONE object)')
    args << obj_name

    setpoint_type_choices = OpenStudio::StringVector.new
    setpoint_type_choices << 'NA'
    setpoint_type_choices << 'CoolingSetpoint'
    setpoint_type_choices << 'HeatingSetpoint'
    setpoint_type = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('setpoint_type', setpoint_type_choices, true)
    setpoint_type.setDisplayName('Setpoint Type')
    setpoint_type.setDescription('for ThermalZone class or object')
    setpoint_type.setDefaultValue('NA')
    args << setpoint_type

    return args
  end

  # define what happens when the measure is run
  def run(model, runner, user_arguments)
    super(model, runner, user_arguments)

    # use the built-in error checking
    if !runner.validateUserArguments(arguments(model), user_arguments)
      return false
    end

    # assign the user inputs to variables
    name = runner.getStringArgumentValue('name', user_arguments)
    schedule_type_limits_name = runner.getStringArgumentValue('schedule_type_limits_name', user_arguments)
    file_path = runner.getStringArgumentValue('file_path', user_arguments)
    column = runner.getIntegerArgumentValue('column', user_arguments)
    rows_to_skip = runner.getIntegerArgumentValue('rows_to_skip', user_arguments)
    num_hrs_data = runner.getStringArgumentValue('num_hrs_data', user_arguments).to_i
    interpolate = runner.getBoolArgumentValue('interpolate', user_arguments)
    col_separator = runner.getStringArgumentValue('col_separator', user_arguments)
    # TODO remove cast to string (https://github.com/NREL/OpenStudio/issues/4226)
    minutes_per_item = runner.getIntegerArgumentValue('minutes_per_item', user_arguments).to_s
    cls_name = runner.getStringArgumentValue('cls_name', user_arguments)
    obj_name = runner.getStringArgumentValue('obj_name', user_arguments)
    setpoint_type = runner.getStringArgumentValue('setpoint_type', user_arguments)

    # remove double quotes
    file_path.gsub!('"', '')

    # check if file exists
    if !File.exist?(file_path)
      runner.registerError("file not found @ #{file_path}")
      return false
    end  

    # check col num
    # TODO vs. file columns

    # check rows to skip
    # TODO vs. file rows

    # check num hrs data
    # TODO vs. file rows 

    # check minutes per item
    # TODO vs. timestep

    # check class name and object name, get object(s)
    if cls_name != 'NONE' && obj_name != 'NONE'
      runner.registerError('choose EITHER a class name OR an object name')
      return false
    elsif cls_name != 'NONE'
      objs_or_obj = model.send('get' + cls_name + 's')
      runner.registerInfo("CLASS NAME = #{cls_name}")
    elsif obj_name != 'NONE'
      objs_or_obj = []
      objs_or_obj << model.getModelObjectByName(obj_name).get.to_actual_object
      runner.registerInfo("OBJECT NAME = #{obj_name}")
    end

    # unique case: check setpoint type, make thermostat if needed
    if objs_or_obj[0].class.to_s.end_with?('ThermalZone')
      if setpoint_type == 'NA'
        runner.registerAsNotApplicable('class name = ThermalZone, but setpoint type = NA')
      else
        # make_thermostat(model, objs_or_obj)
        objs_or_obj.each do |thermal_zone|
          next if thermal_zone.thermostat.is_initialized     
          thermostat = OpenStudio::Model::ThermostatSetpointDualSetpoint.new(model)
          thermostat.setName("#{thermal_zone.name.to_s} Thermostat")
          thermal_zone.setThermostatSetpointDualSetpoint(thermostat)
          runner.registerInfo("new object = #{thermostat.name.to_s}")
        end      
      end
    end

    # report initial condition of model
    runner.registerInitialCondition("ScheduleFiles = #{model.getScheduleFiles.size}")

    # external file
    file_name = File.realpath(file_path)
    external_file = OpenStudio::Model::ExternalFile.getExternalFile(model, file_name)
    external_file = external_file.get

    # schedule file
    schedule_file = OpenStudio::Model::ScheduleFile.new(external_file, column, rows_to_skip)
    schedule_file.setName(name)
    schedule_file.setScheduleTypeLimits(model.getScheduleTypeLimitsByName(schedule_type_limits_name).get)
    schedule_file.setNumberofHoursofData(num_hrs_data)
    schedule_file.setInterpolatetoTimestep(interpolate)
    schedule_file.setColumnSeparator(col_separator)
    schedule_file.setMinutesperItem(minutes_per_item)

    # pointer index
    #HACK for https://github.com/NREL/OpenStudio/issues/4260 using setPointer
    runner.registerInfo('Using `setPointer` method rather than `setSchedule`.')
    case setpoint_type
    when 'CoolingSetpoint'
      pointer_index = 3
    when 'HeatingSetpoint'
      pointer_index = 2
    else
      pointer_index = 4 # equipment, lights
    end
    runner.registerInfo("setPointer index = #{pointer_index}")

    # set object(s) schedule to schedule file
    case objs_or_obj[0].class.to_s.end_with?('ThermalZone')
    when true
      schedule_file_objs = [] 
      objs_or_obj.each { |obj| schedule_file_objs << obj.thermostatSetpointDualSetpoint.get.to_actual_object }
    when false
      schedule_file_objs = objs_or_obj #.each { |obj| obj.setPointer(pointer_index, schedule_file.handle) } #setSchedule(schedule_file)
    end

    # set object(s)
    schedule_file_objs.each { |obj| obj.setPointer(pointer_index, schedule_file.handle) } #setSchedule(schedule_file)

    # report final condition of model
    runner.registerFinalCondition("ScheduleFiles = #{model.getScheduleFiles.size}")

    return true
  end
end

# register the measure to be used by the application
WholeBuildingScheduleFile.new.registerWithApplication
