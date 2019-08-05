# -*- coding: utf-8 -*-

import os
import sys
import numpy as N
import pylab as p

from pymodelica import compile_fmu
from pyfmi import load_fmu
from pyjmi.common.plotting import plot_gui
import modelica
fmu_conf_3 = load_fmu('./test_fmus/HPF_Examples_DC_Testbed_Configuration_3.fmu')
# simulate fmu
#res = fmu_conf_3.simulate(final_time=1)
configuration_3 = modelica.ModelicaModel(fmu_conf_3)

compTypes = ['MultiPhaseTransformer', 'NonlinearLoad', 'DC_Load', 'VoltageSource', 'Impedance']
for t in compTypes:
    print('Components = ')
    print (configuration_3.getComponentTypes(t))

