#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""

"""

import numpy as N
import pylab as p
from pymodelica import compile_fmu
from pyfmi import load_fmu

class_name = 'HPF.Examples.Demo'
library_name = '../../../HPF'
log_level = 'verbose: compile_log.txt'  # options: 'warning'/'w', 'error'/'e', 'verbose'/'v', 'info'/'i' or 'debug'/'d'.
fmu_name = compile_fmu(class_name, library_name, compiler_log_level = log_level)

Demo = load_fmu('HPF_Examples_Demo.fmu')

res = Demo.simulate(final_time=1)