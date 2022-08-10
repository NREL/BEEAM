# insert your copyright here

# see the URL below for information on how to write OpenStudio measures
# http://nrel.github.io/OpenStudio-user-documentation/reference/measure_writing_guide/

# start the measure
class ZoneMixing < OpenStudio::Measure::ModelMeasure
  # human readable name
  def name
    # Measure name should be the title case of the class name.
    return 'Zone Mixing'
  end

  # human readable description
  def description
    return 'This measure adds a ZoneMixing object to the model.'
  end

  # human readable description of modeling approach
  def modeler_description
    return 'https://github.com/NREL/OpenStudio-resources/blob/develop/model/simulationtests/zone_mixing.rb'
  end

  # define the arguments that the user will input
  def arguments(model)
    args = OpenStudio::Measure::OSArgumentVector.new

    # arrays for choice arguments
    zone_names = OpenStudio::StringVector.new
    model.getThermalZones.sort.each { |obj| zone_names << obj.name.to_s }
    schedule_ruleset_names = OpenStudio::StringVector.new
    model.getScheduleRulesets.sort.each { |obj| schedule_ruleset_names << obj.name.to_s }

    # Zone Name
    zone_name = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('zone_name', zone_names, true)
    zone_name.setDisplayName('Zone Name')
    args << zone_name

    # Schedule Name
    schedule_name = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('schedule_name', schedule_ruleset_names, true)
    schedule_name.setDisplayName('Schedule Name')
    schedule_name.setDescription('(ScheduleRuleset objects only)')
    args << schedule_name

    # Design Flow Rate Calculation Method (inferred by OpenStudio)

    # Design Flow Rate
    design_flow_rate = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('design_flow_rate', true)
    design_flow_rate.setDisplayName('Design Flow Rate (ft3/min)')
    design_flow_rate.setDefaultValue(0)
    args << design_flow_rate

    # Flow Rate per Zone Floor Area
    flow_rate_per_zone_floor_area = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('flow_rate_per_zone_floor_area', true)
    flow_rate_per_zone_floor_area.setDisplayName('Flow Rate per Zone Floor Area (ft3/min-ft2)')
    flow_rate_per_zone_floor_area.setDefaultValue(0)
    args << flow_rate_per_zone_floor_area

    # Flow Rate per Person
    flow_rate_per_person = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('flow_rate_per_person', true)
    flow_rate_per_person.setDisplayName('Flow Rate per Person (ft3/min-person')
    flow_rate_per_person.setDefaultValue(0)
    args << flow_rate_per_person

    # Air Changes per Hour
    air_changes_per_hour = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('air_changes_per_hour', true)
    air_changes_per_hour.setDisplayName('Air Changes per Hour')
    air_changes_per_hour.setDefaultValue(0)
    args << air_changes_per_hour

    # Source Zone Name
    source_zone_name = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('source_zone_name', zone_names, true)
    source_zone_name.setDisplayName('Source Zone Name')
    args << source_zone_name

    # Delta Temperature
    delta_temperature = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('delta_temperature', true)
    delta_temperature.setDefaultValue(0)
    delta_temperature.setDisplayName('Delta Temperature (F)')
    args << delta_temperature

    # Delta Temperature Schedule Name
    delta_temperature_schedule_name = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('delta_temperature_schedule_name', schedule_ruleset_names, false)
    delta_temperature_schedule_name.setDisplayName('Delta Temperature Schedule Name')
    args << delta_temperature_schedule_name

    # Minimum Zone Temperature Schedule Name
    minimum_zone_temperature_schedule_name = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('minimum_zone_temperature_schedule_name', schedule_ruleset_names, false)
    minimum_zone_temperature_schedule_name.setDisplayName('Minimum Zone Temperature Schedule Name')
    args << minimum_zone_temperature_schedule_name

    # Maximum Zone Temperature Schedule Name
    maximum_zone_temperature_schedule_name = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('maximum_zone_temperature_schedule_name', schedule_ruleset_names, false)
    maximum_zone_temperature_schedule_name.setDisplayName('Maximum Zone Temperature Schedule Name')
    args << maximum_zone_temperature_schedule_name

    # Minimum Source Zone Temperature Schedule Name
    minimum_source_zone_temperature_schedule_name = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('minimum_source_zone_temperature_schedule_name', schedule_ruleset_names, false)
    minimum_source_zone_temperature_schedule_name.setDisplayName('Minimum Source Zone Temperature Schedule Name')
    args << minimum_source_zone_temperature_schedule_name

    # Maximum Source Zone Temperature Schedule Name
    maximum_source_zone_temperature_schedule_name = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('maximum_source_zone_temperature_schedule_name', schedule_ruleset_names, false)
    maximum_source_zone_temperature_schedule_name.setDisplayName('Maximum Source Zone Temperature Schedule Name')
    args << maximum_source_zone_temperature_schedule_name

    # Minimum Outdoor Temperature Schedule Name
    minimum_outdoor_temperature_schedule_name = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('minimum_outdoor_temperature_schedule_name', schedule_ruleset_names, false)
    minimum_outdoor_temperature_schedule_name.setDisplayName('Minimum Outdoor Temperature Schedule Name')
    args << minimum_outdoor_temperature_schedule_name

    # Maximum Outdoor Temperature Schedule Name
    maximum_outdoor_temperature_schedule_name = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('maximum_outdoor_temperature_schedule_name', schedule_ruleset_names, false)
    maximum_outdoor_temperature_schedule_name.setDisplayName('Maximum Outdoor Temperature Schedule Name')
    args << maximum_outdoor_temperature_schedule_name

    # ZoneAirMassFlowConservation
    zone_air_mass_flow_conservation_bool = OpenStudio::Ruleset::OSArgument::makeBoolArgument('zone_air_mass_flow_conservation_bool', false)
    zone_air_mass_flow_conservation_bool.setDisplayName('add ZoneAirMassFlowConservation object?')
    zone_air_mass_flow_conservation_bool.setDescription('Adjust Zone Mixing For Zone Air Mass Flow Balance = Yes')
    args << zone_air_mass_flow_conservation_bool

    # Infiltration Balancing Method
    infiltration_balancing_methods = ['AddInfiltrationFlow', 'AdjustInfiltrationFlow', 'None']
    infiltration_balancing_method = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('infiltration_balancing_method', infiltration_balancing_methods, false)
    infiltration_balancing_method.setDisplayName('Infiltration Balancing Method')
    infiltration_balancing_method.setDescription('required for ZoneAirMassFlowConservation')
    args << infiltration_balancing_method

    # Infiltration Balancing Zones
    infiltration_balancing_zones_choices = ['MixingSourceZonesOnly', 'AllZones']
    infiltration_balancing_zones = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('infiltration_balancing_zones', infiltration_balancing_zones_choices, false)
    infiltration_balancing_zones.setDisplayName('Infiltration Balancing Zones')
    infiltration_balancing_zones.setDescription('required for ZoneAirMassFlowConservation')
    args << infiltration_balancing_zones

    return args
  end

  # define what happens when the measure is run
  def run(model, runner, user_arguments)
    super(model, runner, user_arguments)

    # use the built-in error checking
    if !runner.validateUserArguments(arguments(model), user_arguments)
      return false
    end

    # array for error checking
    flow_rates_array = []

    # assign user arguments to variables, convert units, get optional objects
    zone_name = runner.getStringArgumentValue('zone_name', user_arguments)
    schedule_name = runner.getStringArgumentValue('schedule_name', user_arguments)
    
    design_flow_rate = runner.getDoubleArgumentValue('design_flow_rate', user_arguments)
    if design_flow_rate > 0
      design_flow_rate_si = OpenStudio.convert(design_flow_rate, 'ft^3/min', 'm^3/s').get
    else
      design_flow_rate_si = nil
    end
    flow_rates_array << design_flow_rate_si
    
    flow_rate_per_zone_floor_area = runner.getDoubleArgumentValue('flow_rate_per_zone_floor_area', user_arguments)
    if flow_rate_per_zone_floor_area > 0
      flow_rate_per_zone_floor_area_si = OpenStudio.convert(flow_rate_per_zone_floor_area, 'ft/min', 'm/s').get
    else
      flow_rate_per_zone_floor_area_si = nil
    end
    flow_rates_array << flow_rate_per_zone_floor_area_si

    flow_rate_per_person = runner.getDoubleArgumentValue('flow_rate_per_person', user_arguments)
    if flow_rate_per_person > 0
      flow_rate_per_person_si = OpenStudio.convert(flow_rate_per_person, 'ft^3/min', 'm^3/s').get
    else
      flow_rate_per_person_si = nil
    end
    flow_rates_array << flow_rate_per_person_si

    air_changes_per_hour = runner.getDoubleArgumentValue('air_changes_per_hour', user_arguments)
    air_changes_per_hour = nil if air_changes_per_hour == 0
    flow_rates_array << air_changes_per_hour

    source_zone_name = runner.getStringArgumentValue('source_zone_name', user_arguments)
    
    delta_temperature = runner.getDoubleArgumentValue('delta_temperature', user_arguments)
    if delta_temperature > 0
      delta_temperature_si = OpenStudio.convert(delta_temperature, 'F', 'C').get
    else
      delta_temperature_si = nil
    end
    
    if runner.getOptionalStringArgumentValue('delta_temperature_schedule_name', user_arguments).is_initialized
      delta_temperature_schedule_name = runner.getOptionalStringArgumentValue('delta_temperature_schedule_name', user_arguments).get
      delta_temperature_schedule = model.getScheduleRulesetByName(delta_temperature_schedule_name).get
    end
    if runner.getOptionalStringArgumentValue('minimum_zone_temperature_schedule_name', user_arguments).is_initialized
      minimum_zone_temperature_schedule_name = runner.getOptionalStringArgumentValue('minimum_zone_temperature_schedule_name', user_arguments).get
      minimum_zone_temperature_schedule = model.getScheduleRulesetByName(minimum_zone_temperature_schedule_name).get
    end
    if runner.getOptionalStringArgumentValue('maximum_zone_temperature_schedule_name', user_arguments).is_initialized
      maximum_zone_temperature_schedule_name = runner.getOptionalStringArgumentValue('maximum_zone_temperature_schedule_name', user_arguments).get
      maximum_zone_temperature_schedule = model.getScheduleRulesetByName(maximum_zone_temperature_schedule_name).get
    end
    if runner.getOptionalStringArgumentValue('minimum_source_zone_temperature_schedule_name', user_arguments).is_initialized
      minimum_source_zone_temperature_schedule_name = runner.getOptionalStringArgumentValue('minimum_source_zone_temperature_schedule_name', user_arguments).get
      minimum_source_zone_temperature_schedule = model.getScheduleRulesetByName(minimum_source_zone_temperature_schedule_name).get
    end
    if runner.getOptionalStringArgumentValue('maximum_source_zone_temperature_schedule_name', user_arguments).is_initialized
      maximum_source_zone_temperature_schedule_name = runner.getOptionalStringArgumentValue('maximum_source_zone_temperature_schedule_name', user_arguments).get
      maximum_source_zone_temperature_schedule = model.getScheduleRulesetByName(maximum_source_zone_temperature_schedule_name).get
    end
    if runner.getOptionalStringArgumentValue('minimum_outdoor_temperature_schedule_name', user_arguments).is_initialized
      minimum_outdoor_temperature_schedule_name = runner.getOptionalStringArgumentValue('minimum_outdoor_temperature_schedule_name', user_arguments).get
      minimum_outdoor_temperature_schedule = model.getScheduleRulesetByName(minimum_outdoor_temperature_schedule_name).get
    end
    if runner.getOptionalStringArgumentValue('maximum_outdoor_temperature_schedule_name', user_arguments).is_initialized
      maximum_outdoor_temperature_schedule_name = runner.getOptionalStringArgumentValue('maximum_outdoor_temperature_schedule_name', user_arguments).get
      maximum_outdoor_temperature_schedule = model.getScheduleRulesetByName(maximum_outdoor_temperature_schedule_name).get
    end
    zone_air_mass_flow_conservation_bool = runner.getBoolArgumentValue('zone_air_mass_flow_conservation_bool', user_arguments)
    if runner.getOptionalStringArgumentValue('infiltration_balancing_method', user_arguments).is_initialized
      infiltration_balancing_method = runner.getOptionalStringArgumentValue('infiltration_balancing_method', user_arguments).get
    end
    if runner.getOptionalStringArgumentValue('infiltration_balancing_zones', user_arguments).is_initialized
      infiltration_balancing_zones = runner.getOptionalStringArgumentValue('infiltration_balancing_zones', user_arguments).get
    end

    # hash of {flow_rate:count, ...} for Ruby 2.4+ (Ruby 2.7+ has array.tally method that does this)
    # https://stackoverflow.com/a/48053739/4228267
    flow_rates_hash = flow_rates_array.group_by(&:itself).transform_values(&:count) 
    
    # check the array of hash values, which should be [nil_count, not_nil_count]
    if flow_rates_hash.values.size > 2
      runner.registerError('more than (1) flow rate argument')
      return false
    end

    # report initial condition of model
    runner.registerInitialCondition("ZoneMixing objects = #{model.getZoneMixings.size}")

    # add object to model
    thermal_zone = model.getThermalZoneByName(zone_name).get
    obj = OpenStudio::Model::ZoneMixing.new(thermal_zone)
    obj.setName("#{thermal_zone.name.to_s} Zone Mixing")

    # set object fields
    obj.setSchedule(model.getModelObjectByName(schedule_name).get.to_ScheduleRuleset.get)
    obj.setDesignFlowRate(design_flow_rate_si) if design_flow_rate_si
    obj.setFlowRateperZoneFloorArea(flow_rate_per_zone_floor_area_si) if flow_rate_per_zone_floor_area_si
    obj.setFlowRateperPerson(flow_rate_per_person_si) if flow_rate_per_person_si
    obj.setAirChangesperHour(air_changes_per_hour) if air_changes_per_hour
    obj.setSourceZone(model.getThermalZoneByName(source_zone_name).get)
    obj.setDeltaTemperature(delta_temperature_si) if delta_temperature_si
    obj.setDeltaTemperatureSchedule(delta_temperature_schedule) if delta_temperature_schedule
    obj.setMinimumZoneTemperatureSchedule(minimum_zone_temperature_schedule) if minimum_zone_temperature_schedule
    obj.setMaximumZoneTemperatureSchedule(maximum_zone_temperature_schedule) if maximum_zone_temperature_schedule
    obj.setMinimumSourceZoneTemperatureSchedule(minimum_source_zone_temperature_schedule) if minimum_source_zone_temperature_schedule
    obj.setMaximumSourceZoneTemperatureSchedule(maximum_source_zone_temperature_schedule) if maximum_source_zone_temperature_schedule
    obj.setMinimumOutdoorTemperatureSchedule(minimum_outdoor_temperature_schedule) if minimum_outdoor_temperature_schedule
    obj.setMaximumOutdoorTemperatureSchedule(maximum_outdoor_temperature_schedule) if maximum_outdoor_temperature_schedule

    # conserve some mass
    if zone_air_mass_flow_conservation_bool
      if infiltration_balancing_method && infiltration_balancing_zones
        zamfc = model.getZoneAirMassFlowConservation
        zamfc.setAdjustZoneMixingForZoneAirMassFlowBalance(zone_air_mass_flow_conservation_bool)
        zamfc.setInfiltrationBalancingMethod(infiltration_balancing_method)
        zamfc.setInfiltrationBalancingZones(infiltration_balancing_zones)
        # zamfc.setSourceZoneInfiltrationTreatment() TODO
        runner.registerInfo('ZoneAirMassFlowConservation = TRUE')
      else
        runner.registerError('ZoneAirMassFlowConservation missing Infiltration Balancing Method or Zones')
        return false
      end
    end

    # report final condition of model
    runner.registerFinalCondition("ZoneMixing objects = #{model.getZoneMixings.size}")

    return true
  end
end

# register the measure to be used by the application
ZoneMixing.new.registerWithApplication
