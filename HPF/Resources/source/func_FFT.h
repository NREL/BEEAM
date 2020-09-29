#ifndef FUNC_FFT_H
#define FUNC_FFT_H

/**
 * @brief Computes FFT.
 *
 * This function is based on the Kiss FFT library. The function itself is derived 
 * from the FFT implementation in the Modelica Standard Library.
 * 
 * @param[in] uRe, Pointer to the real part vector (C/C++ single dim matrix).
 * @param[in] uRe_sz, Size of the real part vector.
 * @param[in] uIm, Pointer to the imaginary part vector.
 * @param[in] uIm_sz, Size of the imaginary part vector.
 * @param[out] yRe, Pointer to the real part vector.
 * @param[out] yIm, Pointer to the imaginary part vector. 
 *
 * @return Diagnostic info. Returns -1 if error in mem allocation. Returns 3 on success.
 */
 

int func_FFT(double *uRe, size_t uRe_sz, double *uIm, size_t uIm_sz, double *yRe, double *yIm, int fftModeSel);



#endif