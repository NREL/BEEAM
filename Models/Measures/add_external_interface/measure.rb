# insert your copyright here

# see the URL below for information on how to write OpenStudio measures
# http://nrel.github.io/OpenStudio-user-documentation/reference/measure_writing_guide/

# start the measure
class AddExternalInterface < OpenStudio::Measure::ModelMeasure
  # human readable name
  def name
    # Measure name should be the title case of the class name.
    return 'AddExternalInterface'
  end

  # human readable description
  def description
    return 'add external interface objects'
  end

  # human readable description of modeling approach
  def modeler_description
    return 'add external interface objects'
  end

  # define the arguments that the user will input
  def arguments(model)
    args = OpenStudio::Measure::OSArgumentVector.new

    # the name of the space to add to the model
    local_test = OpenStudio::Measure::OSArgument::makeBoolArgument("local_test", false)
    local_test.setDisplayName("Local Test")
    local_test.setDescription("Use EMS for Local Testing")
    local_test.setDefaultValue(true)
    args << local_test

    return args
  end

  # define what happens when the measure is run
  def run(model, runner, user_arguments)
    super(model, runner, user_arguments)

    # use the built-in error checking
    if !runner.validateUserArguments(arguments(model), user_arguments)
      return false
    end

    spaces = model.getSpaces
    # assign the user inputs to variables
    local_test = runner.getBoolArgumentValue("local_test",user_arguments) 
    runner.registerInfo("local_test = #{local_test}")

    externalInterface = model.getExternalInterface
    externalInterface.setNameofExternalInterface("FunctionalMockupUnitExport")    

    electric_demand = OpenStudio::Model::ExternalInterfaceFunctionalMockupUnitExportFromVariable.new(model, "Thermal Zone: Steca_Freezer_Cooling_Chamber", "Zone Electric Equipment Electric Power", "electric_demand")
    electric_heat = OpenStudio::Model::ExternalInterfaceFunctionalMockupUnitExportToSchedule.new(model, "Q", 0)
    spaces.each do |space|
      space.otherEquipment.each do |equip|
        equip.setSchedule(electric_heat)
      end
    end
    return true
  end
end

# register the measure to be used by the application
AddExternalInterface.new.registerWithApplication
