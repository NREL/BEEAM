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

# see the URL below for information on how to write OpenStudio measures
# http://nrel.github.io/OpenStudio-user-documentation/reference/measure_writing_guide/

# start the measure
class ZoneHVACPackagedTerminalAirConditioner < OpenStudio::Measure::ModelMeasure
  # human readable name
  def name
    # Measure name should be the title case of the class name.
    return 'ZoneHVAC Packaged Terminal Air Conditioner'
  end

  # human readable description
  def description
    return 'This measure gets one or all Packaged Terminal Air Conditioner(s) in the model and sets the(ir) properties. Currently does not support setting heating or cooling coil properties.'
  end

  # human readable description of modeling approach
  def modeler_description
    return ''
  end

  # define the arguments that the user will input
  def arguments(model)
    args = OpenStudio::Measure::OSArgumentVector.new

    # PTAC

    # name
    obj_names = OpenStudio::StringVector.new
    obj_names << 'ALL'
    model.getZoneHVACPackagedTerminalAirConditioners.each { |obj| obj_names << obj.name.to_s }
    obj_names = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('obj_name', obj_names, true)
    obj_names.setDisplayName('Object Name')
    args << obj_names
    
    # outdoor air flow rate during cooling
    oa_flow_clg = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('oa_flow_clg', false)
    oa_flow_clg.setDisplayName('Cooling Outdoor Air Flow Rate')
    oa_flow_clg.setDescription('(m3/s)')
    args << oa_flow_clg

    # Fan
    
    # total efficiency
    fan_tot_eff = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('fan_tot_eff', false)
    fan_tot_eff.setDisplayName('Fan Total Efficiency')
    args << fan_tot_eff

    # total static pressure
    fan_pressure = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('fan_pressure', false)
    fan_pressure.setDisplayName('Fan Pressure Rise')
    fan_pressure.setDescription('(Pa)')
    args << fan_pressure

    # autosize maximum flow rate
    #HACK https://github.com/NREL/OpenStudio-PAT/issues/176
    auto_fan_flow = OpenStudio::Ruleset::OSArgument::makeBoolArgument('auto_fan_flow', false)
    auto_fan_flow.setDisplayName('Autosize Fan Maximum Flow Rate?')
    auto_fan_flow.setDefaultValue('true')
    args << auto_fan_flow

    # maximum flow rate
    fan_flow = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('fan_flow', false)
    fan_flow.setDisplayName('Fan Maximum Flow Rate')
    fan_flow.setDescription('(m3/s)')
    args << fan_flow

    # motor efficiency
    fan_mtr_eff = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('fan_mtr_eff', false)
    fan_mtr_eff.setDisplayName('Fan Motor Efficiency')
    args << fan_mtr_eff

    # motor in airstream fraction
    fan_mtr_in_air_fraction = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('fan_mtr_in_air_fraction', false)
    fan_mtr_in_air_fraction.setDisplayName('Fan Motor In Airstream Fraction')
    args << fan_mtr_in_air_fraction

    # Heating Coil
    # TODO add support for all types
    
    # Cooling Coil
    # TODO add support for all types
    
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
    # add_obj = runner.getBoolArgumentValue('add_obj', user_arguments)
    
    # apply_measure = runner.getBoolArgumentValue('apply_measure', user_arguments)   

    # PTAC
    obj_name = runner.getStringArgumentValue('obj_name', user_arguments)
    if runner.getOptionalDoubleArgumentValue('oa_flow_clg', user_arguments).is_initialized
      oa_flow_clg = runner.getOptionalDoubleArgumentValue('oa_flow_clg', user_arguments).get
    end

    # Fan
    if runner.getOptionalDoubleArgumentValue('fan_tot_eff', user_arguments).is_initialized
      fan_tot_eff = runner.getOptionalDoubleArgumentValue('fan_tot_eff', user_arguments).get
    end
    if runner.getOptionalDoubleArgumentValue('fan_pressure', user_arguments).is_initialized
      fan_pressure = runner.getOptionalDoubleArgumentValue('fan_pressure', user_arguments).get
    end
    auto_fan_flow = runner.getBoolArgumentValue('auto_fan_flow', user_arguments)
    if runner.getOptionalDoubleArgumentValue('fan_flow', user_arguments).is_initialized
      fan_flow = runner.getOptionalDoubleArgumentValue('fan_flow', user_arguments).get
    end
    if runner.getOptionalDoubleArgumentValue('fan_mtr_eff', user_arguments).is_initialized
      fan_mtr_eff = runner.getOptionalDoubleArgumentValue('fan_mtr_eff', user_arguments).get
    end
    if runner.getOptionalDoubleArgumentValue('fan_mtr_in_air_fraction', user_arguments).is_initialized
      fan_mtr_in_air_fraction = runner.getOptionalDoubleArgumentValue('fan_mtr_in_air_fraction', user_arguments).get
    end

    # Heating Coil

    # Cooling Coil

    # get objects(s)
    case obj_name
    when 'ALL'
      objs_or_obj = model.getZoneHVACPackagedTerminalAirConditioners
    else
      objs_or_obj = []
      objs_or_obj << model.getZoneHVACPackagedTerminalAirConditionerByName(obj_name).get
    end

    # set object(s)
    objs_or_obj.each do |obj|

      # PTAC
      obj.setOutdoorAirFlowRateDuringCoolingOperation(oa_flow_clg) if oa_flow_clg

      # Fan
      fan = obj.supplyAirFan.to_actual_object
      fan.setFanTotalEfficiency(fan_tot_eff) if fan_tot_eff
      fan.setPressureRise(fan_pressure) if fan_pressure
      if auto_fan_flow
        fan.autosizeMaximumFlowRate()
      else
        fan.setMaximumFlowRate(fan_flow) if fan_flow
      end
      fan.setMotorEfficiency(fan_mtr_eff) if fan_mtr_eff
      fan.setMotorInAirstreamFraction(fan_mtr_in_air_fraction) if fan_mtr_in_air_fraction

      # Heating Coil

      # Cooling Coil

    end

    # report final condition of model
    # runner.registerFinalCondition("The building finished with #{model.getSpaces.size} spaces.")

    return true
  end
end

# register the measure to be used by the application
ZoneHVACPackagedTerminalAirConditioner.new.registerWithApplication
