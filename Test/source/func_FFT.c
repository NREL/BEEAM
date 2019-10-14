

/*
    external code test.

*/

#ifndef _FUNC_FFT_C_
#define _FUNC_FFT_C_

#include "kiss_fft.h"

#define COMPUTE_FFT 0
#define COMPUTE_IFFT 1

#define N 16

/**


*/
int func_FFT(double *uRe, size_t uRe_sz, double *uIm, size_t uIm_sz, double *yRe, double *yIm){

    kiss_fft_cpx in[uRe_sz], out[uRe_sz]; // kiss-fft complex datatype
    /*
        Converting input double arrays to kiss-fft complex type.
        Adhoc method. Run a loop and assign values.
        A more efficient way would be to assign the pointer value.
        (Future release? Look for help from other people.)
    */
    int sz = sizeof(*uRe);
    for (int k = 0; k < uRe_sz; k++){
        in[k].r = *(uRe + k);
        in[k].i = *(uIm + k);
    }

    /*
        kiss-fft usage
        1) create a cfg.
        2)  Initalizes state buffer using kiss_fft_alloc
        3) perform fft or ifft using kiss_fft
        4) clean memory
    */
    kiss_fft_cfg cfg;
    if ((cfg = kiss_fft_alloc(uRe_sz, COMPUTE_FFT, NULL, NULL)) != NULL){
        // get fft
        kiss_fft(cfg, in, out);
        // free memory
        free(cfg);
    }
    else{
        return -1;  // Error. Could not allocate memory
    }

    // populate output
    for(int k = 0; k < uRe_sz; k ++){
        *(yRe + k) = out[k].r;
        *(yIm + k) = out[k].i;
    }
    /*
        diagnostics output
    */
    return 3;
}


#endif
