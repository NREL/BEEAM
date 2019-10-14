#include <stdio.h>
#include <stdlib.h>
#include "kiss_fft.h"

#define N 16
int main()
{

    // defining input and output arrays
    double uRe[N] = {1.0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0};
    double uIm[N] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    double yRe[N];
    double yIm[N];

    func_FFT(uRe, N, uIm, N, yRe, yIm);

    double tmp = 3.14159265358979324;
    printf("Mem = %d\n", &uRe[1]);
    printf("Mem = %d\n", &uRe[2]);
    printf("size(double) = %d\n", sizeof(tmp));

    for(int k = 0; k < N; k ++){
        printf("y[%d] = %f  %fi\n", k, yRe[k], yIm[k]);
    }
    return 0;
}
