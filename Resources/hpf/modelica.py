#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""


@author: avpreetsingh
"""

import numpy as N
import pylab as p

from pymodelica import compile_fmu
from pyfmi import load_fmu

class ModelicaModel:  # retrieve parameters
    """
    Modelica HPF class for accessing model parameters and other related misc
    model varialbes etc.
    
    
    """
    def __init__(self, fmu_name):
        # save last element from the returned vector
        # retreive number of harmonics
        """
        this technique is useless. These are intial parameters and these do not
        change as the simulation progresses. Thus, model parameters must be 
        extracted from the compiled fmu and not from the results object.
        
        """
        self.fmu_name = fmu_name
        #self.numHrm = int(res['systemDef.numHrm'][-1])
        self.numHrm = int(fmu_name.get_integer(fmu_name.get_variable_valueref('systemDef.numHrm')))
        self.hrms = N.zeros(self.numHrm)
        """
        pyfmi is unable to extract arrays or vectors directly from the fmu.
        To get the 'hrms' array, one must manually iterate through the 
        variable string, incrementing the vector index and retreiving the vector.
        """
        for h in range(1, self.numHrm + 1):  # modelica indexing starts from 1
            #self.hrms[h-1] = int(res['systemDef.hrms[' + str(h) + ']'][-1])
            self.hrms[h-1] = int(fmu_name.get_integer(fmu_name.get_variable_valueref('systemDef.hrms[' + str(h) + ']')))
        self.fFund = float(fmu_name.get_real(fmu_name.get_variable_valueref('systemDef.fFund')))
        self.smplFreq = float(fmu_name.get_real(fmu_name.get_variable_valueref('systemDef.smplFreq')))
        self.numPh = int(fmu_name.get_integer(fmu_name.get_variable_valueref('systemDef.numPh')))
        
    def getComponentTypes(self, componentType):
        """
        Get all the components with the property matching the componentType
        using the function from pyfmi:
            'get_model_variables()'
            Extract the names of the variables in a model. (using filter option)
        
        Parameters
        ----------
        componentType : str
            Component type corresponding to the component types defined in the 
            modelica library 'properties' record for each component.
            
        Returns
        -------
        componentNames : list
            String list containing all the component names matching the 
            component type
        
        Example
        -------  
            componentNames = fmu.getComponentTypes('Rectifier')
        """
        # get all varibles with the property ComponentType
        vars = self.fmu_name.get_model_variables(filter = "*properties.ComponentType")
        """
        Above line returns an ordered dictionary.
        Get dictionary keys in a list
        """
        varName = vars.keys()
        """
            get reference value for all the vars.
            interpreter is throwing an error when passing the vars list.
            Using for to loop through the list.
            
            varName -> valRef -> fieldValue
        """
        matchVarName = []
        k = 0
        for w in varName[:]:
            # get value ref
            valueRef = self.fmu_name.get_variable_valueref(varName[k])
            # get component type, i.e. field value for the ComponentType 
            compType = self.fmu_name.get_string(valueRef)
            if compType[0] == componentType:
                matchVarName.append(varName[k])
            k = k + 1
        # Extracting object names 
        k = 0
        componentNames = []
        for w in matchVarName:
            tmpDotIndx = matchVarName[k].find('.')
            componentNames.append(matchVarName[k][0:tmpDotIndx])
            k = k + 1
        return componentNames

    def getComplexVector(self, variableName, resultObject):
        """
        Returns a numpy complex vector from a modelica complex vector type 
        variable
        
        Parameters
        ----------
        variableName : str
            Name of the modelica complex variable.
        resultObject : pyfmi result object
            Result object returned by pyfmi simulation.
        
        Returns
        -------
        cmplxVect : numpy complex array
            
        Example
        -------
        mdl.getComplexVector('rectifier1.resistor.v', resultObject)
        """
        
        """ -------------------------------------------------------------------
        jModelica returns a time series array. It parses a complex vector
        as separate real and imaginary arrays, that must be combined into
        a python style numpy complex array.
        
        result has the member function, 'final', that can be used to retreive
        the last (final) value of the variable
        res.final('modelica_variable')
        
        this way, one can pass the result object to a function.
        
        one can also use the function, '__getitem__' to get data.
        For more help, use the help() command.
        """
        cmplxVect = N.zeros(self.numHrm, dtype = complex)
        for h in range(1, self.numHrm + 1):
            tmpRe = resultObject.__getitem__(variableName + '[' + str(h) + '].re')
            tmpIm = resultObject.__getitem__(variableName + '[' + str(h) + '].im')
            cmplxVect[h - 1] = complex(tmpRe[-1], tmpIm[-1])
        return cmplxVect

class CompPwrClass: # Component Power Calculation Classes
    #TODO: name change
    """
    
    """
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




    
    
def computeLosses():
    """
    A high level function that would compute overall losses in the system.
    
    Deffered implementation: this would build upon the post processing 
    tools being developed above.
    
    """