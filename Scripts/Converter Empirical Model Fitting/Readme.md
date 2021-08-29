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

**TO DO:** Explain BEEAM empirical harmonic model input structure

Input File Structure
--------------------

**TO DO:** Explain `Power_data.csv` and `Harmonics.csv`; explain how
power data can be derived from harmonics data if necessary

Functions
---------

**TO DO:** Document each function

Dependencies
------------

The scripts are compatible with both MATLAB or GNU Octave. They will
automatically detect whether they are running in MATLAB or Octave and adjust
accordingly.

If using Octave, the `io` and `optim` packages must be installed; use the `pkg`
command to install the packages from Octave Forge. (Note: The Windows installer
for Octave already includes these packages.)

Workflow
--------

**TO DO:** Give 2 workflow options; talk about example functions




**TO DO:** Rewrite old content below for new functions! 

1) Get converter data from the csv file and put it in a struct named 'convData'
Example: convData = getConverterData(dataDirectory, device)
where, 'dataDirectory' is the path (string) to the data folder containing csv 
files. 'device' is the name of the folder containing data.
2) Run 'generate_harmonic_load_model' script to generate model
The mode is in the form of variables:
X, Y, Z_mag, Z_arg, alpha, beta, gamma

NOTE: One can generate multiple models using additional script 'iterate_converters'

Example:
--------
Included is a folder (Example Data) containing data for an AC/DC converter.
Steps to generate model: (copy and run the following lines in the 
command window)
% get converter data from csv data files;
dataDir = './Example Data/';
device = 'AC-DC - HP Laptop Charger - LBNL1 - 19.5V, 90W';
convData = getConverterData(dataDir, device)
% generate harmonic model
generate_harmonic_load_model


Model variables description
---------------------------
X:                  harmonic numbers in meshgrid format
Y:                  converter power at fundamental (h=1) in meshgrid format
Z_mag:              converter harmonic magnitude data
Z_arg:              converter harmonic angle data
alpha, beta, gamma: parameters for converter loss model
