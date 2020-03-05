MATLAB Phasor Model
===================

This folder includes MATLAB phasor models of the CSU test configurations (AC1, AC2, AC3, DC) together with supporting functions and data. All models were run using MATLAB 2013b; newer versions haven't been tested.

MATLAB Files
------------

The following MATLAB script generates the component models: Component_Models.m

The following MATLAB scripts run the models for the four test cases:

1. Phasor_Model_AC1.m
2. Phasor_Model_AC2.m
3. Phasor_Model_AC3.m
4. Phasor_Model_DC.m

Other upper-case .m files are test scripts of various sorts and the lower-case .m files are supporting functions, including model function definitions.

Supporting Data
---------------

Supporting data files originated from Arthur; the originals are elsewhere on this Google drive. The versions here have been modified for ease of import into MATLAB, typically by removing headers or reducing the volume of data. To save space, the folders with supporting data are included as zipped archives. To use, download all contents of this folder to a single directory, including the zipped archives, and then unzip the archives in place.

- efficiency-curves.zip
- scenario-data.zip
- waveforms.zip

Other Stuff
-----------

I also included scanned notes that give some background on how I constructed the models as well as a transformer modeling guide that I found useful.