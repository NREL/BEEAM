

#ifndef _FFT_GETCMPLXMAGARG_ODDHRMS_C_
#define _FFT_GETCMPLXMAGARG_ODDHRMS_C_

/*
    Assigning odd harmonics to the odd indices.
    C/C++ array indexing begins from 0.
*/
int func_fft_getCmplxMagArg_OddHrms(double *mag, size_t szMag, double *arg, size_t szArg, int N, double *fftRe, double *fftIm){

    int k = 0;
    double fftMag[N];
    double fftArg[N];
    int N_d2 = floor((double)N / 2.0);
    double tmp[N_d2];

    //magnitude
    for(k = 0; k < N_d2; k ++){
        if (k % 2 != 0) 
            tmp[k] = *(mag + k) * ((sqrt(2) * (double)N) / 2.0);
        else
            tmp[k] = 0.0;
    }

    // populating first half of symmetric coefficients
    for (k = 0; k < N_d2; k ++)
        fftMag[k] = tmp[k];
    // populating second half, reverse order
    int p = N_d2;
    for (k = (N + 2 - N_d2); k < N; k ++){
        fftMag[k] = tmp[p];
        p = p - 1;
    }

    // reset tmp to zero
    for(k = 0; k < N_d2; k ++)
        tmp[k] = 0.0;

    // phase 
    for (k = 0; k < N_d2; k ++){
        if (k % 2 != 0)
            tmp[k] = *(arg + k) - 1.570796326794897;
        else 
            tmp[k] = 0.0;

    }
        
    // populating first half of symmetric coefficients
    for (k = 0; k < N_d2; k ++)
        fftArg[k] = tmp[k];
    // populating second half, reverse order
    p = N_d2;
    for (k = (N + 2 - N_d2); k < N; k ++){
        fftArg[k] = tmp[p];
        p = p - 1;
    }

    // generating fft coeficients |mag|/_angle -> x + iy
    for (k = 0; k < N; k ++){
        *(fftRe + k) = fftMag[k] * cos(fftArg[k]);
        *(fftIm + k) = fftMag[k] * sin(fftArg[k]);
    }

    return 0;
}
#endif