# DC Design Tool Co-Simulation: FLEXLAB Experimental Validation

This directory contains the BEEAM (HPF library) and EnergyPlus model files and resources for the DC Design Tool validation study conducted using Lawrence Berkeley National Laboratory's FLEXLAB facility. These models are a supplement to the following publication:

Frank, Stephen M., Jordan Shackelford, Omkar Ghatpande, Matthew Steen, Brian Ball, Daniel L. Gerber, Arthur Santos, and Richard E. Brown. 2021. "Experimental Validation of a Co-Simulation Architecture for Modeling Whole-Building and Detailed Electrical Distribution Performance." *Journal TBD*; to be published.

The co-simulation models in this directory combine a thermal model of FLEXLAB with two electrical models: one each for an AC and a DC distribution system. The models mirror physical configurations implemented in a series of FLEXLAB experiements intended to validate the accuracy of the co-simulation architecture. Experiment details are documented in the associated publication (citation above); this REAMDE documents the directory organization, directory contents, and how to execute the co-simulation.

## Files

### This Directory

- **README.md**: This README file
- **flexlab_ac.mo**: Modelica model of the AC distribution configuration, with embedded FMU
- **flexlab_dc.mo**: Modelica model of the DC distribution configuration, with embedded FMU

### /openstudio

This directory contains the [OpenStudio Parametric Analysis Tool (PAT)](https://github.com/NREL/OpenStudio-PAT) (version 3.1.0) project that was used to calibrate the whole-building model to measured data and produce the `in.idf` for the co-simulation.

### idf - @brianlball rename `energyplus`?

Contains the EnergyPlus input description file (IDF) `in.idf` and supporting files required to build the FMU.

### fmu

Contains the functional mockup unit (FMU) `in.fmu` built from the EnergyPlus IDF.

### /notebooks

***TO DO:** @MatthewSteen to include data processing Python scripts and document them (at a high level) here. Data files should be excluded, but cross-referenced to elsewhere (ultimately to NREL data warehouse?)*

This directory contains Jupyter Notebooks to calculate and plot the validation results.

## Co-Simulation in Dymola

Executing the models requires Dymola 2020 or greater. Successful execution of the co-simulation model requires loading the BEEAM library, FMU, and model file in a specific order and correctly setting the simulation parameters.

### Simulation Execution Instructions

1. Download BEEAM
2. Load the BEEAM library in Dymola
3. Import the FMU `in.fmu` into Dymola, using the default options
4. Open the `flexlab_ac.mo` and/or `flexlab_dc.mo` model(s) in Dymola
5. Check the model(s) to verify no errors
6. Within the simultaion setup, modify:
   a. Output interval length to 900 seconds (15 minutes) ***TO DO:** @brianlball/@MatthewSteen to confirm time*
   b. Fixed integrator step to 900 seconds (15 minutes) ***TO DO:** @brianlball/@MatthewSteen to confirm time*
7. Simulate the model(s)

The BEEAM library, FMU, and model files may be loaded via drag-and-drop or using the relevant menu options. Either method works.

### Troubleshooting

The Modelica conversion from 3.2.3 to 3.2.2 can be ignored. (Choose either "Ok" or "Cancel" at the prompt; either works.)

The FMU must be loaded before the model(s). If the FMU does not load properly, then the FMU block must be deleted and re-inserted into the model(s). In that case, the following FMU parameters must be reconfigured under the *FMI* tab of the FMU parameters dialog:

#### AC Model FMU Parameters

- `fmi_StartTime` = 27216000
- `fmi_StopTime` = 27734400
- `fmi_NumberOfSteps` = 576

#### DC Model FMU Parameters

- `fmi_StartTime` = 27648000
- `fmi_StopTime` = 28944000
- `fmi_NumberOfSteps` = 1440
