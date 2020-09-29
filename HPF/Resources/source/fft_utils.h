
/**
 * Header file for fft_utils.c
 * Used only for octave debugging.
*/

#include <stddef.h>
#include <math.h>

#ifdef __cplusplus
extern "C" {
#endif

int func_fft_getCmplxMagArg(double *mag, size_t szMag, double *arg, size_t szArg, int N, double *fftRe, double *fftIm);

int func_fft_getCmplxMagArg_OddHrms(double *mag, size_t szMag, double *arg, size_t szArg, int N, double *fftRe, double *fftIm);

#ifdef __cplusplus
} 
#endif
