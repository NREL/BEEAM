# Summary

This directory contains the [OpenStudio Parametric Analysis Tool (PAT)](https://github.com/NREL/OpenStudio-PAT) (version 3.1.0) project that was used to calibrate the whole-building model to measured data and produce the `in.idf` for the co-simulation.

## /data

This folder contains supporting data files used for the architectural and mechanical calibrations. These files are also the same files used for the co-simulation.

### schedulefile_*_15min.csv

These files contain the annual 15 minute interval data used by the `Schedule File` measures to add measured data to the simulations. The `elec` file contains the electrical power in Watts for the AC and DC equipment. The `mech` file contains the adjacent thermal zone temperature in Celsius.

### timeseries_objective_function_*.csv

These files contain the measured data for the architectural calibration (zone and plenum temperature in Celsius) and the mechanical calibration (cooling load and fan power in Watts).

## /pat_project

Self-contained folder for the PAT project. When opening this folder in the PAT application, the following changes will need to be made to successfully run the project.

1. The `Schedule File` measures `File Path` arguments will need to be changed to the corresponding `schedulefile_*_15min.csv` files in the `/data` folder.
2. The OpenStudio Results reporting measure will need to be added to the project and assigned to all design alternatives.
3. The `Time Series Objective Function` measures `Path to CSV file for the metered data` will need to be changed to the corresponding `timeseries_objective_function_*.csv` files in the `/data` folder.

### /measures

This folder contains the measures used in the PAT project. See the README files for descriptions.

### /seeds

This folder contains the OpenStudio Models (version 3.1.0) used in the PAT project, described below.

#### FLEXLAB_X3_1arch.osm

This OpenStudio model was used for the architectural calibration from Oct 30 - Nov 4, 2020 with a preceding warmup period from Oct 28-29. During this period it was assumed that unidirectional air mixing from the occupied zone to the plenum zone occurred due to natural convection when the mechanical system was not operating.

#### FLEXLAB_X3_2mech.osm

This OpenStudio model was used for the mechanical calibration from Nov 5-6, 2020. The mechanical system availability and cooling setpoint schedules in the model were changed to start on Nov 4 to allow the mechanical system to fully adjust to cooling mode during the transition period from the architectural calibration.

#### FLEXLAB_X3_3cosim.osm

This OpenStudio model was used to produce the `in.idf` for the co-simulation. The mechanical system cooling capacity was hard-sized to 2800 Watts to fully meet the cooling loads during the AC and DC experiments.

### /weather

This folder contains the EnergyPlus Weather (.epw) file created from measured site data, which is the same file used for the co-simulation.