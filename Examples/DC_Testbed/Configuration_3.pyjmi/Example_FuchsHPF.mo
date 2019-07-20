#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul 19 16:54:15 2019

@author: avpreetsingh

Function to get all the components for a specified type.

Example, user would pass the component type and the function would return
a list containing all the components of that type.
"""

import numpy as N
import pylab as p

from pymodelica import compile_fmu
from pyfmi import load_fmu
from pyjmi.common.plotting import plot_gui

def getComponentName(fmu_name, componentType):
    """
    Get all the components with the property matching the componentType
    using the function from pyfmi:
        'get_model_variables()'
        Extract the names of the variables in a model. (using filter option)
        Not specifying type.
    """
    matchVars = fmu_name.get_model_variables(filter = "*properties*")
    # above line returns an ordered dictionary
    