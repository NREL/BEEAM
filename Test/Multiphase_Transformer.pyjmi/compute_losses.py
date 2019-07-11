#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jun 24 12:01:22 2019

@author: avpreetsingh
"""
import os

import numpy as N
import pylab as p

from pymodelica import compile_fmu
from pyfmi import load_fmu
from pyjmi.common.plotting import plot_gui

# load fmu
multiphase_transformer = load_fmu('HPF_Test_Multiphase_Transformer.fmu')
# simulate for t = 1 sec
res = multiphase_transformer.simulate(final_time = 1)

"""
Compute system losses:
    Get losses from the voltage and current values from the resistor and the
    impedances
    Using the following notation for harmonics:
        Example: 1st harmonic voltage
        r_v_1
"""

# defining a class (struct) for component VI values
class Comp:
    """Class for defining component electrical simulation outputs
    x_y: x = voltage, current or an electrical quantity, y = harmonic
    """
    def __init__(self, v_1, v_3, i_1, i_3):
        self.v_1 = v_1  # 1st harmonic voltage
        self.v_3 = v_3
        self.i_1 = i_1  # 3rd harmonic current
        self.i_3 = i_3
        
z = Comp(0 , 0, 0, 0)
r1 = Comp(0, 0, 0, 0)
r2 = Comp(0, 0, 0, 0)
# Impedance 1 'z'---------------------------
# 1st harmonic (last element, real or imaginary part)
z.v_1 = N.complex(res['z.v[1].re'][-1], res['z.v[1].im'][-1])
z.i_1 = N.complex(res['z.i[1].re'][-1], res['z.i[1].im'][-1])
# 3rd harmonic (3rd harmonic resides on the 2nd index)
z.v_3 = N.complex(res['z.v[2].re'][-1], res['z.v[2].im'][-1])
z.i_3 = N.complex(res['z.i[2].re'][-1], res['z.i[2].im'][-1])
# Resistor 1 'r1'---------------------------
# 1st harmonic
r1.v_1 = N.complex(res['r1.v[1].re'][-1], res['r1.v[1].im'][-1])
r1.i_1 = N.complex(res['r1.i[1].re'][-1], res['r1.i[1].im'][-1])
# 3rd harmonic
r1.v_3 = N.complex(res['r1.v[2].re'][-1], res['r1.v[2].im'][-1])
r1.i_3 = N.complex(res['r1.i[2].re'][-1], res['r1.i[2].im'][-1])
# Resistor 2 'r2'---------------------------
# 1st harmonic
r2.v_1 = N.complex(res['r2.v[1].re'][-1], res['r2.v[1].im'][-1])
r2.i_1 = N.complex(res['r2.i[1].re'][-1], res['r2.i[1].im'][-1])
# 3rd harmonic
r2.v_3 = N.complex(res['r2.v[2].re'][-1], res['r2.v[2].im'][-1])
r2.i_3 = N.complex(res['r2.i[2].re'][-1], res['r2.i[2].im'][-1])

# computing losses, S = v * conjugate(i)
pwrZ_1 = z.v_1 * N.conjugate(z.i_1) 
print(N.abs(pwrZ_1))
