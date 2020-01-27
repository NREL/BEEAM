
/*
    Octave test fft c functions


*/

#include <octave/oct.h>

#ifdef __cplusplus
extern "C"
{
#endif

#include "func_FFT.h"
#include "fft_utils.h"

#ifdef __cplusplus
}  /* end extern "C" */
#endif 


DEFUN_DLD (oct_test_fft, args, nargout,
           "Hello World Help String")
{
  if (args.length() != 3){
    print_usage();
  }
  octave_value_list retVal;

  NDArray model_sel = args(2).array_value();
  // test func_fft ---------------------------------------
  // get size of inputs
  if (model_sel.elem(0) == 1){
    // first 2 arguments are for fft
    NDArray uRe = args(0).array_value();
    NDArray uIm = args(1).array_value();

    
    int uRe_sz = uRe.numel();
    int uIm_sz = uIm.numel();
    double uReArray[uRe_sz];
    double uImArray[uIm_sz];
    double yReArray[uRe_sz];
    double yImArray[uIm_sz];

    octave_stdout << "Arg 2\n";
    // populate array to pass to the c function
    for (int i = 0; i < uRe_sz; i++){
      uReArray[i] = uRe.elem(i);
      octave_stdout << uReArray[i] << "\n";
    }
    octave_stdout << "Arg 1\n";
    for (int i = 0; i < uIm_sz; i++){
      uImArray[i] = uIm.elem(i);
      octave_stdout << uImArray[i] << "\n";
    }

    func_FFT(uReArray, uRe_sz, uImArray, uIm_sz, yReArray, yImArray, int(0));
    dim_vector dv(uRe_sz, 1);
    NDArray yRe(dv);
    NDArray yIm(dv);
    //debugging 
    octave_stdout << "Output Re\n";
    for (int i = 0; i < uIm_sz; i++){
      octave_stdout << yReArray[i] << "\n";
      yRe.elem(i) = yReArray[i];
    }
    octave_stdout << "Output Im\n";
    for (int i = 0; i < uIm_sz; i++){
      octave_stdout << yImArray[i] << "\n";
      yIm.elem(i) = yImArray[i];
    }
    retVal(0) = yRe;
    retVal(1) = yIm;
  }
  // test getCmplxMagArg ---------------------------------------
  else if(model_sel.elem(0) == 2){
    NDArray mag = args(0).array_value();
    NDArray arg = args(1).array_value();      
    int mag_sz = mag.numel();
    double magArray[mag_sz];
    double argArray[mag_sz];
    // populate array to pass to the c function
    for (int i = 0; i < mag_sz; i++){
      magArray[i] = mag.elem(i);
      argArray[i] = arg.elem(i);
      octave_stdout << "mag[" << i << "]= " << magArray [i] << "arg[" << i << "]= " << argArray[i] << "\n";
    }

    int N = 1302;
    double yReArray[N];
    double yImArray[N];
    dim_vector dv(N, 1);
    NDArray yRe(dv);
    NDArray yIm(dv);
    
    func_fft_getCmplxMagArg(magArray, mag_sz, argArray, mag_sz, N, yReArray, yImArray);
    for (int i = 0; i < N; i++){
      yRe.elem(i) = yReArray[i];
      yIm.elem(i) = yImArray[i];
    }
    retVal(0) = yRe;
    retVal(1) = yIm;
  }

  // test getCmplxMagArg_OddHrms ---------------------------------------
  else if(model_sel.elem(0) == 3){
    NDArray mag = args(0).array_value();
    NDArray arg = args(1).array_value();      
    int mag_sz = mag.numel();
    double magArray[mag_sz];
    double argArray[mag_sz];
    // populate array to pass to the c function
    for (int i = 0; i < mag_sz; i++){
      magArray[i] = mag.elem(i);
      argArray[i] = arg.elem(i);
      octave_stdout << "mag[" << i << "]= " << magArray [i] << "arg[" << i << "]= " << argArray[i] << "\n";
    }

    int N = 1302;
    double yReArray[N];
    double yImArray[N];
    dim_vector dv(N, 1);
    NDArray yRe(dv);
    NDArray yIm(dv);
    
    func_fft_getCmplxMagArg_OddHrms(magArray, mag_sz, argArray, mag_sz, N, yReArray, yImArray);
    for (int i = 0; i < N; i++){
      yRe.elem(i) = yReArray[i];
      yIm.elem(i) = yImArray[i];
    }
    retVal(0) = yRe;
    retVal(1) = yIm;
  }


  
  return retVal;
} 