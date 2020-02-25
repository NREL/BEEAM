# insert your copyright here

# see the URL below for information on how to write OpenStudio measures
# http://nrel.github.io/OpenStudio-user-documentation/reference/measure_writing_guide/

# start the measure
class ScheduleFileElectricEquipment < OpenStudio::Measure::ModelMeasure
  # human readable name
  def name
    # Measure name should be the title case of the class name.
    return 'ScheduleFileElectricEquipment'
  end

  # human readable description
  def description
    return 'Add Schedule:File to ElectricEquipment object'
  end

  # human readable description of modeling approach
  def modeler_description
    return 'Adds a ScheduleFile object to an ElectricEquipment object'
  end

  # define the arguments that the user will input
  def arguments(model)
    args = OpenStudio::Measure::OSArgumentVector.new

    #name of the schedule:file object
    schedule_name = OpenStudio::Ruleset::OSArgument::makeStringArgument("schedule_name",true)
    schedule_name.setDisplayName("schedule_name")
    schedule_name.setDescription("Schedule:file Name")
    args << schedule_name
    
    #name of the schedule:file object
    electric_equipment_name = OpenStudio::Ruleset::OSArgument::makeStringArgument("electric_equipment_name",true)
    electric_equipment_name.setDisplayName("electric_equipment_name")
    electric_equipment_name.setDescription("ElectricEquipment Name")
    args << electric_equipment_name

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
    schedule_name = runner.getStringArgumentValue("schedule_name",user_arguments)
    electric_equipment_name = runner.getStringArgumentValue("electric_equipment_name",user_arguments)

    #find schedule:file by name
    schedule = nil
    scheduless = model.getScheduleFiles
    scheduless.each do |schedules|
      if schedules.name.to_s == schedule_name
        schedule = schedules
        runner.registerInfo("found schedule:file #{schedule}")
      end
    end
    
    if schedule.nil?
      runner.registerError("No schedule:file found with name: #{schedule_name}")
      return false
    end
    
    #find ElectricEquipment by name and set schedule
    ees = model.getElectricEquipments
    ees.each do |ee|
      if ee.name.to_s == electric_equipment_name
        ee.setSchedule(schedule)
        runner.registerInfo("setting electric:equipment #{ee.name.to_s} schedule to: #{schedule.name.to_s}") 
      end
    end
    return true
  end
end

# register the measure to be used by the application
ScheduleFileElectricEquipment.new.registerWithApplication
