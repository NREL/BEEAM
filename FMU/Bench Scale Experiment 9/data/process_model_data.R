# Script to select relevant columns from bench-scale co-sim output data

## Setup
# Load required packages
library(tidyverse)
library(fs)
library(lubridate)

# Column specification
data_cols <- cols(
  Time = col_double(),
  .default = col_double()
)

## Load data
# Set path to "results.csv"
results_file <- path(".","model_output", "results", ext = "csv")

# Read data
raw <- read_csv(results_file, col_names = TRUE, col_types = data_cols)

## Process Data
# Select columns
d <- select(raw,
  EventCounter,
  Time                       = Time,
  P_In                       = `Vin.P`,
  P_Loss_PS1                 = `PowerSupply1.PLoss`,
  P_Loss_PS2                 = `PowerSupply2.PLoss`,
  P_Loss_Fan                 = `FanPowerSupply.PLoss`,
  P_Out_Load1                = `Load1_Power.power`,
  P_Out_Load2                = `Load2_Power.power`,
  P_Out_Fan1                 = `FanPower1.power`,
  P_Out_Fan2                 = `FanPower2.power`,
  Temp_Conditioned_Zone      = `in_cs2_fmu1.conditioned_zone_temp`,
  Temp_Plenum                = `in_cs2_fmu1.plenum_zone_temp`,
  Temp_Ambient               = `in_cs2_fmu1.site_outdoor_air_drybulb_temperature`,
  Heat_Gain_Conditioned_Zone = `in_cs2_fmu1.conditioned_space_load`,
  Heat_Gain_Plenum           = `in_cs2_fmu1.plenum_space_load`,
  CHW_Cooling                = `in_cs2_fmu1.chilled_water_gain_total_heating_rate`
)

# Take values from largest event count at each timestemp
d <- group_by(d, Time) %>%
  group_modify(~ {
    arrange(.x, EventCounter) %>% slice(n()) 
  }) %>%
  ungroup()

# Add calculations
d <- mutate(d,
  Timestamp   = lubridate::ymd("2020-07-06", tz = "America/Los_Angeles")
                + lubridate::seconds(Time),
  P_In        = -P_In, # correct sign
  P_Out       = P_Out_Load1 + P_Out_Load2 + P_Out_Fan1 + P_Out_Fan2,
  P_Loss      = P_Loss_PS1 + P_Loss_PS2 + P_Loss_Fan,
  CHW_Cooling = -CHW_Cooling # correct sign
)

# Subset to comparison period
#d <- filter(d,
#  Timestamp >= lubridate::ymd_hm("2020-07-07 16:00", tz = "America/Los_Angeles"),
#  Timestamp <= lubridate::ymd_hm("2020-07-09 20:58", tz = "America/Los_Angeles")
#)

## Export Data
# Clean up column order
d <- select(d, 
  `Timestamp`                         = Timestamp,
  `Simulation Time Elapsed (s)`       = Time,
  `Electrical Power Input (W)`        = P_In,
  `Electrical Power Output (W)`       = P_Out,
  `Electrical Power Loss (W)`         = P_Loss,
  `PS1 Loss (W)`                      = P_Loss_PS1,
  `PS2 Loss (W)`                      = P_Loss_PS2,
  `Fan Power Supply Loss (W)`         = P_Loss_Fan,
  `Resistor 1 Load (W)`               = P_Out_Load1,
  `Resistor 2 Load (W)`               = P_Out_Load2,
  `Fan 1 Load (W)`                    = P_Out_Fan1,
  `Fan 2 Load (W)`                    = P_Out_Fan2,
  `Ambient Temperature (°C)`          = Temp_Ambient,
  `Conditioned Zone Temperature (°C)` = Temp_Conditioned_Zone,
  `Plenum Temperature (°C)`           = Temp_Plenum,
  `Conditioned Zone Heat Gain (W)`    = Heat_Gain_Conditioned_Zone,
  `Plenum Heat Gain (W)`              = Heat_Gain_Plenum,
  `CHW Cooling (W)`                   = CHW_Cooling
)

# Write CSV
mutate(d, Timestamp = format(Timestamp, "%Y-%m-%d %H:%M:%S")) %>%
  write_csv("modeled_data.csv")

## Downsample to 15-min
# Aux. column for grouping
d15 <- mutate(d, fifteen_min = `Simulation Time Elapsed (s)` %/% (15*60)) %>%
  group_by(fifteen_min)

# Now, summarize
d15 <- bind_cols(
  select(d15, one_of("Timestamp", "Simulation Time Elapsed (s)", "fifteen_min")) %>%
    summarise_all(min) %>%
    select(-fifteen_min),
  select(d15, -one_of("Timestamp", "Simulation Time Elapsed (s)")) %>%
    summarise_all(mean) %>%
    select(-fifteen_min)
)

# Write CSV
mutate(d15, Timestamp = format(Timestamp, "%Y-%m-%d %H:%M:%S")) %>%
  write_csv("modeled_data_15min.csv")

