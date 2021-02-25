DC Design Tool Co-Simulation: Bench-Scale Validation
====================================================

This directory contains the BEEAM (HPF library) models and resources for the DC Design Tool cosimulation validation excercise, which combines an electrical model of a simple distribution system (two laptop power supplies with resistive loads) with a thermal model of a simple thermal chamber (a partitioned refrigerator). Experiment details are found elsewhere; this REAMDE focuses on the electrical model.

Files
-----

- **Bench_Scale_Exp_9.mo:** Modelica model of electrical system used in bench-scale validation experiment 9
- **Experiment 9 Data Crunching.xlsx:** Experimental data, with plots and analysis
- **One-Line Diagram.pptx:** System one-line diagram with modeling notes
- **Power Supply 1.jpg:** Photograph of nameplate for laptop power supply 1
  - *Input Voltage:* 120 V(AC)
  - *Output Voltage:* 19 V(DC)
  - *Rated Power:* 90 W
- **Power Supply 2.jpg:** Photograph of nameplate for laptop power supply 2
  - *Input Voltage:* 120 V(AC)
  - *Output Voltage:* 19.5 V(DC)
  - *Rated Power:* 90 W

Issues
------

The following is a list of known issues and "To Do" items:

1. Power supplies still need to be characterized and to have efficiency curves defined; these characterization files will replace the defaults currently in use in the model. Note that Modelica cannot load a resource file that is not in a Modelica library. Therefore, the resulting **.mat** files will need to be placed into the BEEAM library. 
2. A method for FMU compilation is needed.