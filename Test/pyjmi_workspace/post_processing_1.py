#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul 19 14:29:54 2019

@author: avpreetsingh

Post processing:
    
    Getting all the component base object names.
    * search all variables with property specifying component type.
    * group the components according to something....
"""

import numpy as N
import pylab as p

from pymodelica import compilse_fmu
from pyfmi import load_fmu
from pyjmi.common.plotting import plot_gui


"""
Searching all the components with 'properties' member attribute
"""


c = test_rectifier.get_model_variables(filter="*properties*")

"""
c is an ordered dictionary.
Access the ordDict using the keys
"""

cKeys = c.keys()

# find the first occurence of '.' and save the index
tmpDotIndx = cKeys[0].find('.')
# using the index, get the name of the component
componentName = cKeys[0][0:tmpDotIndx]

print(componentName)

# get property name ------------
# get value reference
valRef = test_rectifier.get_variable_valueref(cKeys[0])
property_CompName = test_rectifier.get_string(valRef)

print(property_CompName[0])