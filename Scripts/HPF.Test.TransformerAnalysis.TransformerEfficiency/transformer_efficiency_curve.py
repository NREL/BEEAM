#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri May 22 12:39:38 2020

@author: avpreetsingh


Transformer efficiency curve generation.
Using OpenModelica python interface.
    * Parametrically set load values
    * create results file for each run
    * import results file in MATLAB and run analysis.
"""

import os
import subprocess
import numpy as np
from OMPython import OMCSessionZMQ
from OMPython import ModelicaSystem

#os.environ["OPENMODELICAHOME"] = "/home/avpreetsingh/programfiles/OpenModelica_stable/"
#print(os.environ.get('OPENMODELICAHOME'))
omc = OMCSessionZMQ()

model = "HPF.Test.TransformerAnalysis.TransformerEfficiency"
mod = ModelicaSystem("../../DC-Design/HPF/package.mo", model)

# set resistor values, (decreasing)
# using Pout values from Google drive "Energy Balance - Phase 2 Validation/Loss Model: Transformer (Modelica)"
Pout = np.array([1e-5, 155.49, 295.12, 443.76, 590.64, 752.62, 895.59, 1048.46, \
                 1192.41, 1350.64, 1506.68, 1657.16, 1800.54, 1949.58, 2097.18, \
                 2253.9, 2404.18, 2551.03, 2699.13, 2850.55, 2997.55])
#Pout = np.linspace(1e-5, 3e3, 5)
resistorVals = ((120.0**2) / Pout)*3
# run simulations
indx = 1
for resistorVal in resistorVals:
    # set resistor values
    mod.setParameters("a_r1.r = " + str(resistorVal))
    mod.setParameters("a_r2.r = " + str(resistorVal))
    mod.setParameters("a_r3.r = " + str(resistorVal))
    print(mod.getParameters("a_r1.r"))
    
    
    # set simulation result file
    resultfile = "resFile_TransformerEfficiency_resVal_" + str(indx) 
    #mod.simulate()
    # simulate
    simRunRes = subprocess.run(["./" + model, "-r="+resultfile+".mat", \
                                "-override=" + "a_r1.r=" + str(resistorVal) + ",a_r2.r=" + \
                                str(resistorVal) + ",a_r3.r=" + str(resistorVal)], stdout=subprocess.PIPE)
    print(simRunRes.stdout)
    indx = indx + 1
