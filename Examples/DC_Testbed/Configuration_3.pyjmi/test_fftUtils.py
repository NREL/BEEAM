#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jul 29 20:15:39 2019

@author: avpreetsingh

Test fft utils 
"""

import numpy as np
import matplotlib.pyplot as plt
from scipy.fftpack import fft, ifft
import scipy.io as sio

from fftUtils import fftCoefReconsruct

plt.close()

m = np.array([0, 0.287253207422570, 0, 0.229946440093193, 0, 0.181242428171434, 0, 0.140420320607098, 0, 0.106759266349995, 0, 0.0795384143499295, 0, 0.0580369135567104, 0, 0.0415339129201447, 0, 0.0293085613900394, 0, 0.0206400079162019, 0, 0.0148074014484395, 0, 0.0110898909365593, 0, 0.00876662533036865, 0, 0.00711675357967478, 0, 0.00541942463428496])
ph = np.array([0,	 0.971063928053762, 0, 5.54348161932727, 0, 4.07214275842560, 0, 2.77037296879014, 0, 1.57812105877616, 0, 0.446466620900013, 0, 5.62212763108622, 0, 4.51604151201669, 0, 3.40379926827583, 0, 2.29422654969967, 0, 1.21389125062308, 0, 0.208425801947275, 0, 5.62703477038696, 0, 4.99107592181955, 0, 4.69449435643022])
N = 1302

fftCoef = fftCoefReconsruct(m, ph, N)


plt.plot(range(0, N), ifft(fftCoef))
plt.grid()
plt.show()
# verification
matContents = sio.loadmat('fftCoefs_test.mat')
fftCoefs_verify = matContents['fftCoef_fit'].reshape(N)

plt.plot(range(0, N), ifft(fftCoefs_verify))

plt.show()
