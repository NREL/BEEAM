#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri May 22 12:39:38 2020

@author: avpreetsingh

Python script for running openmodelica simulation
* using OMPython interface
"""

import os
import subprocess
import numpy as np
from OMPython import OMCSessionZMQ
from OMPython import ModelicaSystem

os.environ["OPENMODELICAHOME"] = "/home/avpreetsingh/programfiles/OpenModelica_stable/"
print(os.environ.get('OPENMODELICAHOME'))
omc = OMCSessionZMQ()

# simulation options
# default settings result in translation errors
cmdOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst"        

# run simulation
scenario = 4
dataSet = 3

model = "HPF.Examples.ModelingValidation.Scenario_" + str(scenario) + \
            "_Data_Set_" + str(scenario) + "_" + str(dataSet)
print("=============================")
print("== Scenario ", str(scenario), " DataSet ", str(scenario), ".", \
      str(dataSet), "==")
print("=============================")

mod = ModelicaSystem("../../../HPF/package.mo", model, \
                     commandLineOptions = cmdOptions)
#mod.simulate()
# simulate
simRunRes = subprocess.run(["./" + model], stdout=subprocess.PIPE)
print(simRunRes.stdout)
# ??? remove executable
# using python routines
os.remove(model)

# cleanup, all except result file 
os.system("rm *.json *.c *.h *.o *.makefile *.libs *.xml *.log")