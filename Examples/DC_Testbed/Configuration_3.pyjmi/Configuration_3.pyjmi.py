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

import numpy as N
import pylab as p

from pymodelica import compile_fmu
from pyfmi import load_fmu
from pyjmi.common.plotting import plot_gui
import getComponentFromTypes

#def run_demo(with_plots=True):
"""
INFO
"""

#curr_dir = os.path.dirname(os.path.abspath(__file__));

class_name = 'HPF.Examples.DC_Testbed.Configuration_3'
library_name = '../../../../HPF'
log_level = 'verbose: compile_log.txt'  # options: 'warning'/'w', 'error'/'e', 'verbose'/'v', 'info'/'i' or 'debug'/'d'.
fmu_name = compile_fmu(class_name, library_name, compiler_log_level = log_level)

# Post processing section -----------------------------------------------------
"""
    -   A straigh forward way of computing losses would be to extract voltage
        and current values from components. One must come up with a methodology
        to automate the discovery process so as to crawl over all the 
        components in the simulation and group the losses.
        Cons:   This would require the user to explicitly name the components
       
    -   In a system setup, the losses would be          
"""
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
# load fmu
fmu_conf_3 = load_fmu(fmu_name)
# simulate fmu
res = fmu_conf_3.simulate(final_time=1)

"""
Struct for HPF model specific definitions.
These parameters are defined in the 'outer' class called 'SystemDef'. Each simulation
model can contain only one instance of this class callded 'systemDef'. The 
systemDef instance contains the system solver algorithm, and other system-wide
parameters, such as:
        * Number of harmonics
        * Fundamental frequency
        * sampling frequency
        * Number of phases
        * etc.
"""
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

mdl_conf_3 = ModelParameters(fmu_conf_3)

"""
    struct for saving component classes for the purpose of loss calculations
    For consistency, the object names should have the same names used in the
    Modelica properties record.
"""
class CompPwrClass: # Component Power Calculation Classes
    # this is like a constructor, executed at the creation of the object
    def __init__(self, CompClassName):
        self.CompClassName = CompClassName
        self.expansionRealPwr = ''
        self.expansionImagPwr = ''
        """
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
    
        
"""
instantiating all the component power calc classes
These would be globally defined.
"""
VoltageSource = CompPwrClass('VoltageSource');
MultiPhaseTransformer = CompPwrClass('MultiPhaseTransformer')
DC_Load = CompPwrClass('DC_Load')
NonlinearLoad = CompPwrClass('NonlinearLoad')

"""
Each component class has a specific structure pertaining to the underlying 
variables, partial models and classes.
For a given class, the getComponentFromTypes function would get the base object name.
To get the required value of a contituent attribute, one would concatenate
the obtained component base name with the quantity class expansion. 
Example: voltage in a resistor is obtained using the following,
'ComponentName' + '.v'
"""

"""
Losses in the system = Power delivered at the sources (Voltage source) - 
                        Power consumed at the DC Loads
"""
# compute input power, 'VoltageSource' -----
VoltageSource.addCompName(getComponentFromTypes.getComponentName(fmu_conf_3, "VoltageSource"))
inputPwr = 0
for comp in VoltageSource.CompName:
    inputPwr = inputPwr + res[comp+VoltageSource.expansionRealPwr]
    print(res[comp+VoltageSource.expansionRealPwr])
# compute consumed power, 'DC_Load5' -----
DC_Load.addCompName(getComponentFromTypes.getComponentName(fmu_conf_3, 'DC_Load'))
consumedPwr = 0
for comp in DC_Load.CompName:
    consumedPwr = consumedPwr + res[comp+DC_Load.expansionRealPwr]
    print(res[comp + DC_Load.expansionRealPwr])

pwrLosses = inputPwr - consumedPwr
print(pwrLosses)



"""
Reconstructing time waveforms from frequency domain.

Example:
    Reconstructing time domain waveforms for the input voltage, phase A.
    The input voltage variables for all the harmonics have the form:
        PhA.v[h].re     :: real part of the voltage for hth harmonic
        
    1) populate the complex vector by extracting from the simulation
    
    2) run ifft on the complex vector
"""

#plot_gui.startGUI()


"""
sine_y = res['sine.y']
resistor_v = res['resistor.v']
inductor1_i = res['inductor1.i']
t = res['time']

assert N.abs(res.final('resistor.v') - 0.159255008028) < 1e-3

if with_plots:
    fig = p.figure()
    p.plot(t, sine_y, t, resistor_v, t, inductor1_i)
    p.legend(('sine.y','resistor.v','inductor1.i'))
    p.show()
"""

#if __name__=="__main__":
#    run_demo()
