#!/usr/bin/env python 
# -*- coding: utf-8 -*-

"""
DC testbed configuration 3.
Description about testbed configurations can be found in the DC-Design tool 
Google drive.

-----
Avpreet
"""

import os
import sys
import numpy as N
import pylab as p

from pymodelica import compile_fmu
from pyfmi import load_fmu
from pyjmi.common.plotting import plot_gui
import matplotlib.pyplot as plt
# os.environ['PYTHONPATH'] = os.path.expandvars('${JMODELICA_HOME}') + 'Python/::'
sys.path.insert(0, '../../../Resources/')
from hpf.modelica import ModelicaModel
#from fftUtils import fftCoefReconsruct

class_name = 'HPF.Examples.DC_Testbed.Configuration_3'
library_name = '../../../../HPF'
log_level = 'verbose: compile_log.txt'  # options: 'warning'/'w', 'error'/'e', 'verbose'/'v', 'info'/'i' or 'debug'/'d'.
fmu_name = compile_fmu(class_name, library_name, compiler_log_level = log_level)

# Post processing section -----------------------------------------------------

"""
The post processing section would consist of several subsections:
    
1) compile the fmu
    
2) simulate the fmu

3) post processing
    a) get properties of all components
    b) using the property values, group components
        i) Sources
        ii) AC loads
        iii) DC loads
"""
# load fmux
fmu_conf_3 = load_fmu(fmu_name)
# simulate fmu
res = fmu_conf_3.simulate(final_time=1)
configuration_3 = ModelicaModel(fmu_conf_3)
fft_N = int(N.floor(configuration_3.smplFreq / configuration_3.fFund)) # size of fft window

# Input section ---------------------------------------------------------------
""" freq -> time for input section
    This would involve, getting all the voltage sources and
    running an ifft on the voltage and current harmonics.
"""
voltageSources = configuration_3.getComponentTypes('VoltageSource')
for vs in voltageSources:
    ph_v = configuration_3.getComplexVector(vs + '.v', res)
    ph_i = configuration_3.getComplexVector(vs + '.i', res)
    # plotting harmonic magitudes and angles
    plt.stem(configuration_3.hrms, N.abs(ph_i))
    # plotting time waveforms
    #plt.plot(range(0, fft_N), ifft(fftCoefReconsruct(N.abs(ph_v), N.angle(ph_v), fft_N)))
    plt.show()
    plt.figure()
    #plt.plot(range(0, fft_N), ifft(fftCoefReconsruct(N.abs(ph_i), N.angle(ph_i), fft_N)))
    plt.show()
    
# AC-DC converters ------------------------------------------------------------
    
    
    
# visualization function
"""
    Function computes ifft for all the converters and input sources
"""   
