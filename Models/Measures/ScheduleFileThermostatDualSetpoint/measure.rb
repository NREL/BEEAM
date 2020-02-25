# insert your copyright here

# see the URL below for information on how to write OpenStudio measures
# http://nrel.github.io/OpenStudio-user-documentation/reference/measure_writing_guide/

# start the measure
class ScheduleFileThermostatDualSetpoint < OpenStudio::Measure::ModelMeasure
  # human readable name
  def name
    # Measure name should be the title case of the class name.
    return 'ScheduleFileThermostatDualSetpoint'
  end

  # human readable description
  def description
    return 'Add Schedule:File to ThermostatDualSetpoint object'
  end

  # human readable description of modeling approach
  def modeler_description
    return 'Adds a ScheduleFile object to an ThermostatDualSetpoint object'
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
    thermostat_dual_setpoint_name = OpenStudio::Ruleset::OSArgument::makeStringArgument("thermostat_dual_setpoint_name",true)
    thermostat_dual_setpoint_name.setDisplayName("thermostat_dual_setpoint_name")
    thermostat_dual_setpoint_name.setDescription("ThermostatDualSetpoint Name")
    args << thermostat_dual_setpoint_name

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
    thermostat_dual_setpoint_name = runner.getStringArgumentValue("thermostat_dual_setpoint_name",user_arguments)

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
    
    #find ThermostatDualSetpoint by name and set schedule
    ees = model.getThermostatSetpointDualSetpoints                
    ees.each do |ee|
      if ee.name.to_s == thermostat_dual_setpoint_name
        ee.setHeatingSetpointTemperatureSchedule(schedule)
        runner.registerInfo("setting ThermostatDualSetpoint #{ee.name.to_s} HeatingSetpointTemperatureSchedule to: #{schedule.name.to_s}")
        ee.setCoolingSetpointTemperatureSchedule(schedule)
        runner.registerInfo("setting ThermostatDualSetpoint #{ee.name.to_s} CoolingSetpointTemperatureSchedule to: #{schedule.name.to_s}")
      end
    end
    return true
  end
end

# register the measure to be used by the application
ScheduleFileThermostatDualSetpoint.new.registerWithApplication
