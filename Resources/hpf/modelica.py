#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""


@author: avpreetsingh
"""

import numpy as N
import pylab as p

from pymodelica import compile_fmu
from pyfmi import load_fmu

class ModelParameters:  # retrieve parameters
    def __init__(self, fmu_name):
        # save last element from the returned vector
        # retreive number of harmonics
        self.numHrm = int(res['systemDef.numHrm'][-1])
        self.hrms = N.zeros(self.numHrm)
        for h in range(1, self.numHrm + 1):  # modelica indexing starts from 1
            self.hrms[h-1] = int(res['systemDef.hrms[' + str(h) + ']'][-1])
        self.fFund = res['systemDef.fFund'][-1]
        self.numPh = int(res['systemDef.numPh'][-1])
        self.smplFreq = res['systemDef.smplFreq'][-1]

class CompPwrClass: # Component Power Calculation Classes
    # this is like a constructor, executed at the creation of the object
    def __init__(self, CompClassName):
        self.CompClassName = CompClassName
        self.expansionRealPwr = ''
        self.expansionImagPwr = ''
        """
        TODO:
            a lookup table would match the class type and assign the quantity
            variable a class specific quantity class expansion based on the 
            modelica implementation.
        """
        if CompClassName == 'VoltageSource':
            self.expansionRealPwr = '.P'
        elif CompClassName == 'DC_Load':
            self.expansionRealPwr = '.pwr'
        else:
            self.expansionRealPwr = ''
        # and so on
        
    def addCompName(self, CompName):
        #self.CompName.append(_CompName)
        self.CompName = CompName

def getComponentName(fmu_name, _componentType):
    """
    Get all the components with the property matching the componentType
    using the function from pyfmi:
        'get_model_variables()'
        Extract the names of the variables in a model. (using filter option)
        Not specifying type.
        
    
    Explanation
    
    Parameters::
        
    Returns::
        
    Example::
        
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

def computeLosses():
    """
    
    """