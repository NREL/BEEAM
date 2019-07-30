#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jul 29 14:52:34 2019

@author: avpreetsingh

Test script:
    Waveform reconstruction: frequency to time domain
    
    Example:
    Reconstructing time domain waveforms for the input voltage, phase A.
    The input voltage variables for all the harmonics have the form:
        PhA.v[h].re     :: real part of the voltage for hth harmonic
        
    1) populate the complex vector by extracting from the simulation
        *** How to read data directly from a results file?
        
    2) run ifft on the complex vector
"""

import os

import numpy as N
import pylab as p

from pymodelica import compile_fmu
from pyfmi import load_fmu
from pyjmi.common.plotting import plot_gui
import getComponentFromTypes

# get all the harmonics -------------------------------------------------------
"""
Using the getComponentName function, get the names of all instances for which
to analyze the fft.

A simpler approach would be, assume that we know the name of the object.
Pass the name into this function and get the complex valued vector.

"""

# a globally visible variable would store the system definitions
# example: max harmonics, fundamental frequency, sampling rate (for fft)
numHarmonics = 3

componentName = 'PhA'
componentExpansion_vRe = '].re'
componentExpansion_vIm = '].im'
    
"""
Increment from start to max harmonics and get the values
"""
PhA_voltage = N.zeros(numHarmonics, dtype = complex)
for h in range(1, maxHarmonics+1):
    tmpRe = res[componentName + '.v[' + str(h) + componentExpansion_vRe]
    tmpIm = res[componentName + '.v[' + str(h) + componentExpansion_vIm]
    PhA_voltage[h-1] = complex(tmpRe[-1], tmpIm[-1])
    
print(PhA_voltage)


"""
fft section -------------------------------------------------------------------

"""


    