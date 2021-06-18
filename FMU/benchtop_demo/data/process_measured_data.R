# Script to select relevant columns from bench-scale co-sim output data

## Setup
# Load required packages
library(tidyverse)
library(fs)
library(lubridate)

# Column specification
data_cols <- cols(
  `Time (Raw)`    = col_skip(),
  `Time (Parsed)` = col_datetime(),
  .default        = col_double()
)

## Load data
# Set path to "results.csv"
data_file <- path(".", "measured_data", ext = "csv")

# Read data
raw <- read_csv(data_file, col_names = TRUE, col_types = data_cols)

## Process Data
# Select columns
d <- select(raw,
  Time                       = `Time (Parsed)`,
  P_In                       = `Total Internal Heat Gain`,
  Temp_Conditioned_Zone      = `Conditioned Chamber Avg.`,
  Temp_Plenum                = `Unconditioned Chamber Avg.`,
  Temp_Ambient               = `Exterior Space Avg.`,
  CHW_Flow                   = `Flow`,
  CHW_Inlet_Temp             = `Probe 8 water inlet`,
  CHW_Outlet_Temp            = `Probe 3 water outlet`,
  CHW_Delta_T                = `Delta T`,
  CHW_Cooling                = `Cooling Power`
)

# Set time zone
tz(d$Time) <- "America/Los_Angeles"

# Subset to comparison period
#d <- filter(d,
#  Timestamp >= lubridate::ymd_hm("2020-07-07 16:00", tz = "America/Los_Angeles"),
#  Timestamp <= lubridate::ymd_hm("2020-07-09 20:58", tz = "America/Los_Angeles")
#)

## Export Data
# Clean up column order
d <- select(d, 
  `Timestamp`                         = Time,
  `Electrical Power Input (W)`        = P_In,
  `Ambient Temperature (°C)`          = Temp_Ambient,
  `Conditioned Zone Temperature (°C)` = Temp_Conditioned_Zone,
  `Plenum Temperature (°C)`           = Temp_Plenum,
  `CHW Inlet Temperature (°C)`        = CHW_Inlet_Temp,
  `CHW Outlet Temperature (°C)`       = CHW_Outlet_Temp,
  `CHW Delta T (°C)`                  = CHW_Delta_T,
  `CHW Flow (L/min)`                  = CHW_Flow,
  `CHW Cooling (W)`                   = CHW_Cooling
)

# Write CSV
#mutate(d, Timestamp = format(Timestamp, "%Y-%m-%d %H:%M:%S")) %>%
#  write_csv("measured_data_clean.csv")

## Downsample to 15-min
# Round down to nearest 15 minute interval, group, and average
d15 <- mutate(d, Timestamp = floor_date(Timestamp, "15 mins")) %>%
  group_by(Timestamp) %>%
  summarise_all(mean)

# Write CSV
mutate(d15, Timestamp = format(Timestamp, "%Y-%m-%d %H:%M:%S")) %>%
  write_csv("measured_data_15min.csv")

