#!/usr/bin/env python 
# -*- coding: utf-8 -*-

"""
jModelica usage template
"""

import os

import numpy as N
import pylab as p

from pymodelica import compile_fmu
from pyfmi import load_fmu
from pyjmi.common.plotting import plot_gui


#def run_demo(with_plots=True):
"""
INFO
"""

#curr_dir = os.path.dirname(os.path.abspath(__file__));

class_name = 'HPF.Test.SinglePhase_Basic'
library_name = '../../../HPF'
log_level = 'verbose: compile_log.txt'  # options: 'warning'/'w', 'error'/'e', 'verbose'/'v', 'info'/'i' or 'debug'/'d'.
fmu_name = compile_fmu(class_name, library_name, compiler_log_level = log_level)

singlePhaseBasic = load_fmu(fmu_name)

res = singlePhaseBasic.simulate(final_time = 1)

"""
simlation result object usage:
    example:
    resultObject = fmuName.simulate(final_time = 1)
    
    The above line simulates an FMU for time 1 second and returns the result in
    a result object called 'resultObject'.
    
    The res object has several methods. Listing a few of those:
        * res.result_data.name
            one can use this to search for a specific variable name and then 
            do the subsequent computations.
    
    Search for a substring and save all matches in a list
    c = []  # initialize an empty list c
    for text in a:  # a is the master list
        if 'test_D' in text:  # search string 'test_D'
            c.append(text)  # save by appending in list c
                
One must get the name of component starting with the prefix defined
in the naming convention description.

Example: laptop_1.hPin_N.v

One would lookup all the variable names, starting with 'laptop' and the string
ending at the first '.' dot. 

Using string manipulation functions one can search for the first occurence
of a dot. 
Example:
    s1 = 'laptop_adpt_3.loadBase1.pin_p.h'
    indexDot = s1.fund('.')

Then one can use the index to isolate the required name.
    stringName = s1[0:indexDot]

To summarize:
    * Get the first strings for the prefix using the for loop.
    * Using find method search for first dot to search for top level
      class names.
    * Run a subsequent code to eliminate repetions to get the component names.
    
    
Using this technique, find the first matching strings, then, 



----------------------------  
FROM PYFMI DOCUMENTATION

test_rectifier.get_model_variables(type=3, filter="z.properties*")
* First get variables

* using "get_variable_valuere", get value reference.
* to get string value assigned to a string variable, used the returned reference
  and get the string.
  Example: 
      valRef = fmu_name.get_variable_valueref('z.p.x')
      string_name = fmu_name.get_string(valRef)
* get_model_variables()
"""
 

# ----------------------------------------------
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


"""
rlc = load_fmu(fmu_name)

res = rlc.simulate(final_time=30)

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
