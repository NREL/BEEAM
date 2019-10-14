within HPF.Test;

model IFFT
/*
  IFFT using FFT 
    1) get the complex numbers
    2) take the conjugate of those
    3) compute fft
    4) conjugate the output
    5) divide all by the size of the fft window
    
  Workflow:
    1) pass the complex vectors to the model 
    2) pad the fft window 
    3) get the full length ifft using above steps
    4) use the sample to generate the waveform by simply populating the output at 
       sample intervals
    NOTE: keep all the intermediary products protected.
*/


  import Modelica.Constants.pi;
  extends Modelica.Icons.Example;
  
  Integer info;
  Real u[:] = {1, 1, 1, 1, 1, 0, 0, 0, 0, 0};
  Real uMag_FFT[6];
  Real uArg_FFT[6];
  
  
 // Integer info_2 (start = 1);
  Real real_sizeFFT = div(size(u,1),2)+1 ;
  final parameter Integer sizeFFT = div(size(u,1),2)+1 ;

  //Real Am[sizeFFT];
  //Real Ap[sizeFFT];
initial equation
  
algorithm
  (info, uMag_FFT, uArg_FFT) := Modelica.Math.FastFourierTransform.realFFT(u, 6);
  
 // (info_2, Am, Ap) := Modelica.Math.FastFourierTransform.Internal.rawRealFFT(u);
  
end IFFT;