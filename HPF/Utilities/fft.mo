within HPF.Utilities;
function fft "FFT performed in external function"
  extends Modelica.Icons.Function;
  input Real uRe[:] "Input complex vector, real part";
  input Real uIm[:] "Input complex vector, imaginary part";
  output Real yRe[size(uRe, 1)] "Output complex vector, real part";
  output Real yIm[size(uRe, 1)] "Output complex vector, imaginary part";
  /*
            int func_FFT(double *uRe, size_t uRe_sz, double *uIm, size_t uIm_sz, double *yRe, double *yIm, int fftModeSel)
            
            in kiss_fft_alloc(), the 2nd argument sets the mode.
            Modes:
              * FFT = 0
              * IFFT = 1
          */

  external "C" func_FFT(uRe, size(uRe, 1), uIm, size(uIm, 1), yRe, yIm, 0) annotation (
    Include = "#include \"func_FFT.c\"",
    IncludeDirectory = "modelica://HPF/Resources/source");
  annotation (
    Documentation(info = "<html><head></head><body>Using kiss_fft library. (https://github.com/mborgerding/kissfft)</body></html>"));
end fft;
