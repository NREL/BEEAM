#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
@author: avpreetsingh

Function to get all the components for a specified type.

User would pass the component type and the function would return
a list containing all the components of that type.
"""

import numpy as N
import pylab as p

from pymodelica import compile_fmu
from pyfmi import load_fmu
from pyjmi.common.plotting import plot_gui

def getComponentName(fmu_name, _componentType):
    """
    Get all the components with the property matching the componentType
    using the function from pyfmi:
        'get_model_variables()'
        Extract the names of the variables in a model. (using filter option)
        Not specifying type.
    """
    vars = fmu_name.get_model_variables(filter = "*properties.ComponentType")
    """
    Above line returns an ordered dictionary.
    Get dictionary keys in a list
    """
    varName = vars.keys()
    """
        get reference value for all the vars.
        interpreter is throwing an error when passing the vars list.
        Using for to loop through the list.
    """
    valueRef = []
    k = 0
    for w in varName[:]:
        valueRef.append(fmu_name.get_variable_valueref(varName[k]))
        k = k + 1
    """
        Get property 'ComponentType' for the value references
    """
    componentType = fmu_name.get_string(valueRef)
    """
        Get indices matching the argument
    """
    compTypeIndices = [i for i,x in enumerate(componentType) if  x == _componentType]
    matchVarNames = []
    for k in compTypeIndices:
        matchVarNames.append(varName[k])
        
    #print(matchVarNames)
    """    
       Extracting object names 
    """
    k = 0
    componentName = []
    for w in matchVarNames:
        tmpDotIndx = matchVarNames[k].find('.')
        componentName.append(matchVarNames[k][0:tmpDotIndx])
        k = k + 1
    return componentName