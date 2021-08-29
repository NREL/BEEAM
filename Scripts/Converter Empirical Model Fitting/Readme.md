AC/DC Converter Empirical Model Fitting
=======================================

This directory contains MATLAB/GNU Octave scripts for generating interpolation-
based AC/DC converter efficiency and harmonic models. The scripts are modular;
different sections of the model generation are distributed across multiple
scripts and functions. The output of these scripts is a `.mat` file suitable for
import to Modelica/BEEAM.

The resulting models are normalized with respect to device power, voltage, and
current ratings, such that the models can be scaled easily in BEEAM for devices
with arbitrary ratings. Such scaling is accomplished solely by changing the
device ratings in BEEAM; the underlying `.mat` file remains unchanged.

Model Structure
---------------

The empirical AC/DC converter model in BEEAM requires a `.mat` file with seven
parameters:

- **alpha:** Coefficient for constant term of normalized converter loss model
- **beta:** Coefficient for linear term of normalized converter loss model
- **gamma:** Coefficient for quadratic term of normalized converter loss model
- **X:** Matrix of harmonic numbers (meshgrid format)
- **Y:** Matrix of normalized converter fundamental powers (meshgrid format)
- **Z_mag:** Matrix of converter hamonic current normalized magnitude data
- **Z_arg:** Matrix of converter hamonic current unwrapped phase angle data

Parameters **alpha**, **beta**, and **gamma** model the converter efficiency
curve; parameters **X**, **Y**, **Z_mag**, and **Z_arg** provide the 2D
interpolation table for the converter harmonic current model.

All parameters are fit with respect to normalized power, voltage, and current,
that is, the models are fit in per-unit relative to the device's ratings (or
"bases"). This allows the models to be rescaled in BEEAM by altering the device
power ratings.

Functions
---------

This directory includes the following functions and scripts:

- `import_measured_converter_data.m`: Function to import converter data from
  a standard file format; see *Input File Structure* below
- `loss_model.m`: Function to fit **alpha**, **beta**, and **gamma** converter
  loss model parameters
- `empirical_harmonic_model.m`: Function to fit **X**, **Y**, **Z_mag**, and
  **Z_arg** converter harmonic current model parameters
- `individual_example.m`: Example script; fits an individual converter model
- `batch_example.m`: Example script; fits multiple converter models based on a
  user-provided input file
- `rescale_empirical_model.m`: Utility script to rescale existing empirical
  model parameters to use new per-unit bases, while retaining the original
  volt-amphere model output

Of these, `individual_example.m` is the best place to start.

Dependencies
------------

The scripts are compatible with both MATLAB or GNU Octave. They will
automatically detect whether they are running in MATLAB or Octave and adjust
accordingly.

If using Octave, the `io` and `optim` packages must be installed; use the `pkg`
command to install the packages from Octave Forge. (Note: The Windows installer
for Octave already includes these packages.)

Input File Structure
--------------------

The `import_measured_converter_data` function expects two files within a common
directory: `Power_data.csv` and `Harmonics.csv`. These files must be in
comma-separated values (CSV) files format using `,` as a delimiter. They may
have any number of labeled columns, but *must* at a minimum include the
following columns (with exact names as specified and correct units):

- Columns in *Power_data.csv*:
  - `Input Active Power (W)`: Converter AC input power (sum across all harmonics)
  - `Output Active Power (W)`: Converter DC output power
- Columns in *Harmonics.csv*:
  - `Harmonic`: Harmonic index
  - `Input Voltage Mag (Vrms)`: AC input voltage magnitude
  - `Input Voltage Angle (deg)`: AC input voltage phase angle
  - `Input Current Mag (Arms)`: AC input current magnitude
  - `Input Current Angle (deg)`: AC input current phase angle
  - A labeled grouping column; default is `Power Step`

The first row must contain column labels; all subsequent rows must contain
values. However, column order is not important. In *Harmonics.csv*, the grouping
column contains a label or number that will be used to group observations of
harmonic currents at different frequencies when populating one row of the 2D
interpolation table. All harmonic currents in each group should be from a single
experimental condition (for both voltage and power).

Workflow
--------

There are two possible workflows for creating an empirical converter model. The
first workflow relies on the `import_measured_converter_data` helper function
and the file format described in *Input File Structure* above:

1. Obtain (or create) CSV files `Power_data.csv` and `Harmonics.csv` that
   describe the converter behavior and place them in a common directory.
2. Import converter data to a *struct* object using the 
   `import_measured_converter_data` function.
3. Clean and/or filter the data as desired.
4. Define device power, voltage, and current ratings (nominal values).
5. Fit the converter loss model using the `loss_model` function.
6. Fit the converter harmonic current model using the `empirical_harmonic_model`
   function.
7. Save the generated parameters to a `.mat` file for use with BEEAM: **alpha**,
   **beta**, **gamma**, **X**, **Y**, **Z_mag**, and **Z_arg** as described in
   *Model Structure* above.

The example scripts `individual_example.m` and `batch_example.m` illustrate this
workflow. Note the data cleaning and filtering steps in the example scripts,
plus the requirement to provide the device ratings to the model fitting
functions.

The alternative workflow is for cases where the original data is not stored in
the standard format. In this case, it is the user's responsibility to assemble
input vectors compatible with the `loss_model` and `empirical_harmonic_model`
functions. Note that input and output power *may* be able to be calculated from
harmonic voltage and current data if enough harmonic measurements are available
at both converter input and output.

1. Assemble input vectors for `loss_model` and `empirical_harmonic_model`
   functions:
   a. `loss_model` requires measured input power with corresponding output
      power.
   b. `empirical_harmonic_model` requires measured complex harmonic current with
      corresponding harmonic order and measured fundamental frequency AC input
      power.
2. Define device power, voltage, and current ratings (nominal values).
3. Fit the converter loss model using the `loss_model` function.
4. Fit the converter harmonic current model using the `empirical_harmonic_model`
   function.
5. Save the generated parameters to a `.mat` file for use with BEEAM: **alpha**,
   **beta**, **gamma**, **X**, **Y**, **Z_mag**, and **Z_arg** as described in
   *Model Structure* above.