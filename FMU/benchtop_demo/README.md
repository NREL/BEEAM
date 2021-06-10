DC Design Tool Co-Simulation: Benchtop Demonstration & Validation
=================================================================

This directory contains the BEEAM (HPF library) and EnergyPlus model files and resources for the DC Design Tool cosimulation demonstration and validation using a bench-top thermal chamber. The co-simulation model combines an electrical model of a simple distribution system (two laptop power supplies with resistive loads) with a thermal model of a simple thermal chamber (a partitioned refrigerator). Experiment details are documented in the associated publication; this REAMDE documents the directory contents and aspects of the electrical model.

Files
-----

### This Directory ###

- **README.md**: This README file
- **benchtop_demo.mo**: Modelica model of electrical system used in the benchtop cosim demonstration
- **One-Line Diagram.pptx**: System one-line diagram with modeling notes
- **Power Supply 1.jpg**: Photograph of nameplate for laptop power supply 1 (HP model 677777-002)
  - *Input Voltage:* 120 V(AC)
  - *Output Voltage:* 19.5 V(DC)
  - *Rated Power:* 90 W
- **Power Supply 2.jpg**: Photograph of nameplate for laptop power supply 2 (HP model 608428-002)
  - *Input Voltage:* 120 V(AC)
  - *Output Voltage:* 19.0 V(DC)
  - *Rated Power:* 90 W

### idf ###

Contains the EnergyPlus input description file (IDF) and supporting files required to build the FMU.

### fmu ###

Contains the functional mockup unit (FMU) built from the EnergyPlus IDF.

### data ###

Contains data files for experimental validation:

- **Measured Data.xlsx**: Processed experimental and model data, with plots and analysis
- **measured_data.csv** and **measured_data_15min.csv**: Measured (experimental) data post-processed at native and 15-min aggregate resolutions
- **modeled_data.csv** and **modeled_data_15min.csv**: Model output data post-processed at native and 15-min aggregate resolutions
- **process_measured_data.R**: Post-processing R script for measured data
- **process_model_data.R**: Post-processing R script for model output data

Prior to executing **process_model_data.R**, the model output file 'results.csv'  (exported from Dymola) must be placed into a 'model_output' subdirectory within this directory. This results file is large and therefore not included in the repository.

Co-Simulation in Dymola
-----------------------

Successfully co-simulating the BEEAM model and the FMU containing the thermal chamber model in Dymola requires first loading the FMU into the Dymola workspace:

1. Open the BEEAM model 'benchtop_demo.mo' in Dymola
2. Import the FMU 'fmu/in.fmu' to Dymola (HOW?)
3. Ensure that the imported FMU is recognized in the BEEAM model (no red X on the FMU block)
4. Simulate

**TO DO: Verify this description with a Dymola user by testing the process.**

Modeling Notes
--------------

1. Power supplies 1 and 2 were characterized by Arthur Santos and converted to BEEAM component models by Avpreet Singh. The implemented model uses the component models (efficiency tables) developed by Avpreet Singh.
2. Power supply output voltage varies with load. The 32.7 ohm resistors applied as loads are closest to the 10% load step from Arthur's tests. Therefore, the fixed output voltage for each converter assumed in the experiment was set to the measured average DC voltage from the "Decreasing Power" test at the 10% load step.
  - *Power Supply 1:* 19.92 V(DC)
  - *Power Supply 2:* 19.51 V(DC)
3. The fan power supply was not characterized. Therefore, the efficiency curve for a generic 24V, 25W LED driver was used for the fan power supply.
4. To demonstrate data exchange, the 32.7 ohm resistors were modeled with a small temperature coeffcient of resistance (alpha) estimated from the power variation with temperature present in the experimental data. The "R Temp Coefficient" worksheet of the *Measured Data.xlsx* spreadsheet shows the calculation for this. This calculation had little practical effect on the validation outcome.
