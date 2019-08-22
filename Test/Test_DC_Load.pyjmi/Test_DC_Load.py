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

class_name = 'HPF.Test.Test_DC_Load'
library_name = '../../../HPF'
log_level = 'verbose: compile_log.txt'  # options: 'warning'/'w', 'error'/'e', 'verbose'/'v', 'info'/'i' or 'debug'/'d'.
fmu_name = compile_fmu(class_name, library_name, compiler_log_level = log_level)

test_DC_Load = load_fmu(fmu_name)

res = test_DC_Load.simulate(final_time = 1)