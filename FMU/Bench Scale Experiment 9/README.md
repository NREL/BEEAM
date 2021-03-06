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
  - *Output Voltage:* 19.5 V(DC)
  - *Rated Power:* 90 W
- **Power Supply 2.jpg:** Photograph of nameplate for laptop power supply 2
  - *Input Voltage:* 120 V(AC)
  - *Output Voltage:* 19.0 V(DC)
  - *Rated Power:* 90 W

Modeling Notes
--------------

1. Power supplies 1 and 2 were characterized by Arthur and converted to BEEAM component models by Avpreet. The implemented model uses the component models (efficiency tables) developed by Avpreet.
2. Power supply output voltage varies with load. The 32.7 ohm resistors applied as loads are closest to the 10% load step from Arthur's tests. Therefore, the fixed output voltage for each converter assumed in the experiment was set to the measured average DC voltage from the "Decreasing Power" test at the 10% load step.
  - *Power Supply 1:* 19.92 V(DC)
  - *Power Supply 2:* 19.51 V(DC)
3. The fan power supply was not characterized. Therefore, the efficiency curve for a generic 24V, 25W LED driver was used instead.
4. To demonstrate data exchange, the 32.7 ohm resistors were modeled with a small temperature coeffcient of resistance (alpha) determined from the power variation with temperature present in the experimental data. The "R Temp Coefficient" worksheet of the *Experiment 9 Data Crunching.xlsx* spreadsheet shows the calculation for this.
