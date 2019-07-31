#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Todo: add licence section and preamble



@author: avpreetsingh


fft coefficient reconstruction

NOTE:
    Verification did not give same results.
    Redo the implementation and recheck.
"""

import numpy as np
import matplotlib.pyplot as plt
from scipy.fftpack import fft, ifft
import scipy.io as sio

def fftCoefReconsruct(mag, phase, N):
    """
    Explanation
    
    Parameters::
        
    Returns::
        
    Example::
            
    """
    # get lengths of input vectors
    lMag = mag.size
    lPhase = phase.size
    
    # even or odd N
    N_d2 = int(np.floor(N/2))
    # reconstructing magnitude
    fftMag = np.zeros(N)
    """
    fft of data of any length produces fft mag (symmetric) with first
         coefficient zero and last coef = 2nd coef
    """
    fftMagTmp = np.zeros(N_d2)
    fftMagTmp[0:lMag] = mag * ((np.sqrt(2) * N) / 2)
    # populating first half of symmetric coefficients
    fftMag[0:N_d2] = fftMagTmp
    """
    populating second half, reverse order, last element = 2nd element
    from beginning
    beginning coef or 2nd half would be: l - (floor(n/2) - 1)
    """    
    beginIndx2H =  N - (N_d2 - 1)
    fftMag[beginIndx2H:-1] = fftMagTmp[np.arange(N_d2-1, 1, -1)]
    
    # reconstructing phase ------------------------------------------------
    fftPhase = np.zeros(N);
    fftPhaseTmp = np.zeros(N_d2)
    fftPhaseTmp[0:lPhase] = phase - np.pi/2
    # populating first half of symmetric coefficients
    fftPhase[0:N_d2] =  fftPhaseTmp
    """
    populating second half, reverse order, last element = 2nd element
     from beginning
     beginning coef or 2nd half would be: l - (floor(n/2) - 1)
    """
    fftPhase[beginIndx2H:-1] = -fftPhaseTmp[np.arange(N_d2-1, 1, -1)];
    
    
    # generating fft coeficients |mag|/_angle -> x + iy
    fftCoef = fftMag * np.exp(fftPhase*1j)
    return fftCoef