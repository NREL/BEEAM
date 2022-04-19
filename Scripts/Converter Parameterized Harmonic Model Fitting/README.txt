

Outline of the optimization procedure
-------------------------------------

Measurements data directory: ./meas_data

Characterization script for a converter harmonic magnitude model: hrmModeling_magnitude.m 

Characterization script for a converter harmonic phase angle model: hrmModeling_phaseAngle.m

>> To run the script as a standalone, load the measurement data for a single converter 
from the folder and run the characterization script.

>> For a batch run over all available converters, run:  batchRun_harmonicModel_magnitude.m
or batchRun_harmonicModel_phaseAngle.m

Models will be saved in folder ./models/magnitude/ or ./models/phaseAngle/
in .mat format.

Model values will be saved as a struct with fields containing: parameters (extracted
from the optimization run), rms error at the end of the run, and device name.

Phase angle modeling requires additional data for the weights. If the phase angle 
fit is incorrect, define the weights manually or define the weights in the 
weights_phaseAngle_model folder (This will require additional steps such as 
specifiying correct variable name ("deviceName") in the workspace. Please look 
at the scripts for example implementation).

>> Validation runs - time domain reconstruction:
For a converter, Load measurements data, model parameters for magnitude and phase
angle.
Run the script: validation_timeDomain.m]

NOTE: Using the extracted parameters
Extracted parameters can be used in the Modelica HPF converter model by simply
passing the parameters to the Modelica model. IMPORTANT: model parameters
in Modelica are written in curly brackets {val1, val2, ...}

