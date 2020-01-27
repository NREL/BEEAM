

#include "fft_utils.h"


/**
 * @brief Returns complex fft coefficients from magnitudes and phase data
 * 
 *  Use this function to reconstruct fft coefficients. Running an ifft on the returned
 *  complex values would give the time domain waveform.
 * 
 *  (magitude, phase) -> fft data -> ifft() -> time domain waveform
 * 
 * @param[in] mag, Magnitude data vector.
 * @param[in] szMag, Size of the magnitude data vector.
 * @param[in] arg, Argument (phase) data vector (in radians).
 * @param[in] szArg, Size of the argument data vector.
 * @param[in] N, Size of the final fft. The resulting time domain waveform using ifft will be of length N.
 * @param[out] fftRe, Real part of the fft coefficients.
 * @param[out] fftIm, Imaginary part of the fft coefficients.
 * 
 * @return 0 on success.
 */


int func_fft_getCmplxMagArg(double *mag, size_t szMag, double *arg, size_t szArg, int N, double *fftRe, double *fftIm){

    int k = 0;
    double fftMag[N];
    double fftArg[N];
    int N_d2 = floor((double)N / 2.0);
    double tmp[N_d2];

    //magnitude
    for(k = 0; k < szMag; k ++)
        tmp[k] = *(mag + k) * ((sqrt(2.0) * (double)N) / 2.0);
    // populating first half of symmetric coefficients
    for (k = 0; k < N_d2; k ++)
        fftMag[k] = tmp[k];
    // populating second half, reverse order
    int p = N_d2;
    for (k = (N + 0 - N_d2); k < N; k ++){
        fftMag[k] = tmp[p];
        p = p - 1;
    }

    // reset tmp to zero
    for(k = 0; k < N_d2; k ++)
        tmp[k] = 0.0;

    // phase 
    for (k = 0; k < szArg; k ++)
        tmp[k] = *(arg + k) - 1.570796326794897;
    // populating first half of symmetric coefficients
    for (k = 0; k < N_d2; k ++)
        fftArg[k] = tmp[k];
    // populating second half, reverse order
    p = N_d2;
    for (k = (N + 0 - N_d2); k < N; k ++){
        fftArg[k] = - tmp[p];
        p = p - 1;
    }

    // generating fft coeficients |mag|/_angle -> x + iy
    for (k = 0; k < N; k ++){
        *(fftRe + k) = fftMag[k] * cos(fftArg[k]);
        *(fftIm + k) = fftMag[k] * sin(fftArg[k]);
    }

    return 0;
}


/**
 * @brief Returns complex fft coefficients from magnitudes and phase data for odd harmonics.
 * 
 *  Use this function to reconstruct fft coefficients. Running an ifft on the returned
 *  complex values would give the time domain waveform.
 * 
 *  (magitude (odd harmonics), phase (odd harmonics)) -> fft data -> ifft() -> time domain waveform
 * 
 * @param[in] mag, Magnitude data vector (odd harmonics).
 * @param[in] szMag, Size of the magnitude data vector.
 * @param[in] arg, Argument (phase) data vector (in radians) (odd harmonics).
 * @param[in] szArg, Size of the argument data vector.
 * @param[in] N, Size of the final fft. The resulting time domain waveform using ifft will be of length N.
 * @param[out] fftRe, Real part of the fft coefficients.
 * @param[out] fftIm, Imaginary part of the fft coefficients.
 * 
 * @return 0 on success.
 */
int func_fft_getCmplxMagArg_OddHrms(double *magOdd, size_t szMagOdd, double *argOdd, size_t szArgOdd, int N, double *fftRe, double *fftIm){

    int k = 0;
    double fftMag[N];
    double fftArg[N];
    int N_d2 = floor((double)N / 2.0);
    double tmp[N_d2];

    double mag[szMagOdd * 2];
    double arg[szArgOdd * 2];
    /*
        0  x  0  x  0  x
        0  1  2  3  4  5
    */
    for(k = 0; k < szMagOdd; k = k + 1){
        mag[k*2 + 1] = magOdd[k];
        arg[k*2 + 1] = argOdd[k];
    }

    func_fft_getCmplxMagArg(mag, (int)(szMagOdd*2), arg, (int)(szArgOdd*2), N, fftRe, fftIm);

    return 0;
}