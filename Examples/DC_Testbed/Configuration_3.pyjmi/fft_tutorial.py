#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jul 28 15:54:06 2019

@author: avpreetsingh

scipy fft
"""

import numpy as np
import matplotlib.pyplot as plt
from scipy.fftpack import fft, ifft

#number of samples
N = 600
# sampling space
T = 1.0/800.0
x = np.linspace(0.0, N*T, N)
y = np.sin(50.0 * 2.0 * np.pi*x) + 0.5*np.sin(80.0 * 2.0*np.pi*x)
yf = fft(y)
xf = np.linspace(0.0, 1.0/(2.0*T), N/2)

plt.plot(xf, 2.0/N * np.abs(yf[0:N//2]))
plt.grid()
plt.show()
