

###### (Automatically generated documentation)

# Schedule File

## Description
Adds a ScheduleFile object to the model and applies it to a single object or all objects of a class.

## Modeler Description
https://github.com/NREL/OpenStudio-resources/blob/develop/model/simulationtests/schedule_file.rb

## Measure Type
ModelMeasure

## Taxonomy


## Arguments


### Name

**Name:** name,
**Type:** String,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Schedule Type Limits Name
(must be compatible with model object schedule)
**Name:** schedule_type_limits_name,
**Type:** Choice,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### File Path
(full path)
**Name:** file_path,
**Type:** String,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Column Number
(1 = first)
**Name:** column,
**Type:** Integer,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Rows to Skip at Top

**Name:** rows_to_skip,
**Type:** Integer,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Number of Hours of Data
(8784 = leap year)
**Name:** num_hrs_data,
**Type:** Choice,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Interpolate to Timestep

**Name:** interpolate,
**Type:** Boolean,
**Units:** ,
**Required:** false,
**Model Dependent:** false

### Column Separator

**Name:** col_separator,
**Type:** Choice,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Minutes Per Item
(must be ≤ to 60 and evenly divisible into 60, same as timestep)
**Name:** minutes_per_item,
**Type:** Integer,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Class Name
(apply to ALL objects)
**Name:** cls_name,
**Type:** Choice,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Object Name
(apply to ONE object)
**Name:** obj_name,
**Type:** Choice,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Setpoint Type
for ThermalZone class or object
**Name:** setpoint_type,
**Type:** Choice,
**Units:** ,
**Required:** true,
**Model Dependent:** false




