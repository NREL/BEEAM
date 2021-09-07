# insert your copyright here

# see the URL below for information on how to write OpenStudio measures
# http://nrel.github.io/OpenStudio-user-documentation/reference/measure_writing_guide/

# start the measure
class SimpleGlazing < OpenStudio::Measure::ModelMeasure
  # human readable name
  def name
    # Measure name should be the title case of the class name.
    return 'Simple Glazing'
  end

  # human readable description
  def description
    return 'Sets SimpleGlazing object(s) properties.'
  end

  # human readable description of modeling approach
  def modeler_description
    return ''
  end

  # define the arguments that the user will input
  def arguments(model)
    args = OpenStudio::Measure::OSArgumentVector.new

    # object name
    obj_names = OpenStudio::StringVector.new
    obj_names << 'ALL'
    model.getSimpleGlazings.each { |obj| obj_names << obj.name.to_s }
    obj_name = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('obj_name', obj_names, true)
    obj_name.setDisplayName('Object Name')
    args << obj_name    

    # inch-pound, international system
    ip_units = OpenStudio::Ruleset::OSArgument::makeBoolArgument('ip_units', false)
    ip_units.setDisplayName('IP units?')
    ip_units.setDefaultValue(true)
    args << ip_units

    # u-factor
    ufactor = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('ufactor', false)
    ufactor.setDisplayName('U-Factor')
    ufactor.setDescription('(W/m2-K or Btu/h-ft2)')
    args << ufactor

    # shgc
    shgc = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('shgc', false)
    shgc.setDisplayName('Solar Heat Gain Coefficient')
    shgc.setDescription('(National Fenestration Rating Council)')
    args << shgc

    # visible transmittance
    vt = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('vt', false)
    vt.setDisplayName('Visible Transmittance')
    vt.setDescription('(National Fenestration Rating Council)')
    args << vt

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
    obj_name = runner.getStringArgumentValue('obj_name', user_arguments)
    ip_units = runner.getBoolArgumentValue('ip_units', user_arguments)
    if runner.getOptionalDoubleArgumentValue('ufactor', user_arguments).is_initialized
      ufactor = runner.getOptionalDoubleArgumentValue('ufactor', user_arguments).get
      if ip_units
        ufactor = OpenStudio.convert(ufactor, 'Btu/ft^2*h*R', 'W/m^2*K').get
      end
    end
    if runner.getOptionalDoubleArgumentValue('shgc', user_arguments).is_initialized
      shgc = runner.getOptionalDoubleArgumentValue('shgc', user_arguments).get
    end
    if runner.getOptionalDoubleArgumentValue('vt', user_arguments).is_initialized
      vt = runner.getOptionalDoubleArgumentValue('vt', user_arguments).get
    end

    # report initial condition of model
    # runner.registerInitialCondition("The building started with #{model.getSpaces.size} spaces.")

    # get objects(s)
    case obj_name
    when 'ALL'
      objs_or_obj = model.getSimpleGlazings
    else
      objs_or_obj = []
      objs_or_obj << model.getSimpleGlazingByName(obj_name).get
    end

    # set object(s)
    objs_or_obj.each do |obj|

      obj.setUFactor(ufactor) if ufactor
      obj.setSolarHeatGainCoefficient(shgc) if shgc
      obj.setVisibleTransmittance(vt) if vt
      runner.registerInfo("changed object = #{obj.name.to_s}")

    end

    # report final condition of model
    # runner.registerFinalCondition("The building finished with #{model.getSpaces.size} spaces.")

    return true
  end
end

# register the measure to be used by the application
SimpleGlazing.new.registerWithApplication
