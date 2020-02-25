# insert your copyright here

# see the URL below for information on how to write OpenStudio measures
# http://nrel.github.io/OpenStudio-user-documentation/reference/measure_writing_guide/

# start the measure
class ScheduleFile < OpenStudio::Measure::ModelMeasure
  # human readable name
  def name
    # Measure name should be the title case of the class name.
    return 'ScheduleFile'
  end

  # human readable description
  def description
    return 'This adds a schedule:file to the model'
  end

  # human readable description of modeling approach
  def modeler_description
    return 'This adds a schedule:file to the model'
  end

  # define the arguments that the user will input
  def arguments(model)
    args = OpenStudio::Measure::OSArgumentVector.new

    #name of the schedule:file object
    schedule_name = OpenStudio::Ruleset::OSArgument::makeStringArgument("schedule_name",true)
    schedule_name.setDisplayName("schedule_name")
    schedule_name.setDescription("Schedule:file Name")
    args << schedule_name
    
    schedule_csv = OpenStudio::Measure::OSArgument.makeStringArgument('schedule_csv', true)
    schedule_csv.setDisplayName('full path to the schedule.csv file')
    schedule_csv.setDescription('full path to the schedule.csv file.')
    schedule_csv.setDefaultValue('c:/OpenStudio/schedule.csv')
    args << schedule_csv

    column_number = OpenStudio::Ruleset::OSArgument::makeIntegerArgument("column_number",true)
    column_number.setDisplayName("column_number")
    column_number.setDescription("column_number")
    column_number.setDefaultValue(2)
    args << column_number
    
    rows_to_skip = OpenStudio::Ruleset::OSArgument::makeIntegerArgument("rows_to_skip",true)
    rows_to_skip.setDisplayName("rows_to_skip")
    rows_to_skip.setDescription("rows_to_skip")
    rows_to_skip.setDefaultValue(1)
    args << rows_to_skip
    
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
    schedule_csv = runner.getStringArgumentValue('schedule_csv', user_arguments)
    rows_to_skip = runner.getIntegerArgumentValue("rows_to_skip",user_arguments)
    column_number = runner.getIntegerArgumentValue("column_number",user_arguments)

    runner.registerInfo("schedule_csv is #{schedule_csv}")
    schedule_csv_actual = File.expand_path("#{schedule_csv}", __FILE__)
    runner.registerInfo("Measure is looking here for the file: #{schedule_csv_actual}") 
    if schedule_csv_actual.nil?
      runner.registerError("No schedule csv file found at #{schedule_csv_actual}") 
      return false
    end
    
    external_file = OpenStudio::Model::ExternalFile::getExternalFile(model, schedule_csv_actual)
    if external_file.is_initialized
      external_file = external_file.get
    else
      runner.registerError("external_file #{external_file} is not initialized")
      return false    
    end
    schedule_file = OpenStudio::Model::ScheduleFile.new(external_file, column_number, rows_to_skip)
    schedule_file.setName(schedule_name)

    # echo the new space's name back to the user
    runner.registerInfo("schedule:file #{schedule_file.name} was added.")

    # report final condition of model
    runner.registerFinalCondition("The building finished with #{model.getSpaces.size} spaces.")

    return true
  end
end

# register the measure to be used by the application
ScheduleFile.new.registerWithApplication
