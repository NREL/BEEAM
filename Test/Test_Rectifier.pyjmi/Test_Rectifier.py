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
#from pyjmi.common.plotting import plot_gui


#def run_demo(with_plots=True):
"""
INFO
"""

#curr_dir = os.path.dirname(os.path.abspath(__file__));

class_name = 'HPF.Test.Test_Rectifier'
library_name = '../../../HPF'
log_level = 'verbose: compile_log.txt'  # options: 'warning'/'w', 'error'/'e', 'verbose'/'v', 'info'/'i' or 'debug'/'d'.
fmu_name = compile_fmu(class_name, library_name, compiler_log_level = log_level)

#test_rectifier = load_fmu(fmu_name)

#res = test_rectifier.simulate(final_time = 1)

 
"""
Compute system losses:
    Get losses from the voltage and current values from the resistor and the
    impedances
    Using the following notation for harmonics:
        Example: 1st harmonic voltage
        v_1
"""
# Resistor 1 'r'

rlc = load_fmu(fmu_name)

res = rlc.simulate(final_time=30)
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
