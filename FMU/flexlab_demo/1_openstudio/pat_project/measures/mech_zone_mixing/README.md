

###### (Automatically generated documentation)

# Zone Mixing

## Description
This measure adds a ZoneMixing object to the model.

## Modeler Description
https://github.com/NREL/OpenStudio-resources/blob/develop/model/simulationtests/zone_mixing.rb

## Measure Type
ModelMeasure

## Taxonomy


## Arguments


### Zone Name

**Name:** zone_name,
**Type:** Choice,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Schedule Name
(ScheduleRuleset objects only)
**Name:** schedule_name,
**Type:** Choice,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Design Flow Rate (ft3/min)

**Name:** design_flow_rate,
**Type:** Double,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Flow Rate per Zone Floor Area (ft3/min-ft2)

**Name:** flow_rate_per_zone_floor_area,
**Type:** Double,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Flow Rate per Person (ft3/min-person

**Name:** flow_rate_per_person,
**Type:** Double,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Air Changes per Hour

**Name:** air_changes_per_hour,
**Type:** Double,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Source Zone Name

**Name:** source_zone_name,
**Type:** Choice,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Delta Temperature (F)

**Name:** delta_temperature,
**Type:** Double,
**Units:** ,
**Required:** true,
**Model Dependent:** false

### Delta Temperature Schedule Name

**Name:** delta_temperature_schedule_name,
**Type:** Choice,
**Units:** ,
**Required:** false,
**Model Dependent:** false

### Minimum Zone Temperature Schedule Name

**Name:** minimum_zone_temperature_schedule_name,
**Type:** Choice,
**Units:** ,
**Required:** false,
**Model Dependent:** false

### Maximum Zone Temperature Schedule Name

**Name:** maximum_zone_temperature_schedule_name,
**Type:** Choice,
**Units:** ,
**Required:** false,
**Model Dependent:** false

### Minimum Source Zone Temperature Schedule Name

**Name:** minimum_source_zone_temperature_schedule_name,
**Type:** Choice,
**Units:** ,
**Required:** false,
**Model Dependent:** false

### Maximum Source Zone Temperature Schedule Name

**Name:** maximum_source_zone_temperature_schedule_name,
**Type:** Choice,
**Units:** ,
**Required:** false,
**Model Dependent:** false

### Minimum Outdoor Temperature Schedule Name

**Name:** minimum_outdoor_temperature_schedule_name,
**Type:** Choice,
**Units:** ,
**Required:** false,
**Model Dependent:** false

### Maximum Outdoor Temperature Schedule Name

**Name:** maximum_outdoor_temperature_schedule_name,
**Type:** Choice,
**Units:** ,
**Required:** false,
**Model Dependent:** false

### add ZoneAirMassFlowConservation object?
Adjust Zone Mixing For Zone Air Mass Flow Balance = Yes
**Name:** zone_air_mass_flow_conservation_bool,
**Type:** Boolean,
**Units:** ,
**Required:** false,
**Model Dependent:** false

### Infiltration Balancing Method
required for ZoneAirMassFlowConservation
**Name:** infiltration_balancing_method,
**Type:** Choice,
**Units:** ,
**Required:** false,
**Model Dependent:** false

### Infiltration Balancing Zones
required for ZoneAirMassFlowConservation
**Name:** infiltration_balancing_zones,
**Type:** Choice,
**Units:** ,
**Required:** false,
**Model Dependent:** false




