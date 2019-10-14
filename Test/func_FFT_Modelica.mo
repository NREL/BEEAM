within HPF.Test;

function func_FFT_Modelica
  //input Integer a;
  input Real uRe[:];
  input Real uIm[:];
  output Integer retInfo;
  
  output Real yRe[size(uRe, 1)] "Output real values";
  output Real yIm[size(uRe, 1)] "Output imaginary values";
  
protected 
  //Real yRe[size(uRe, 1)];
  //Real yIm[size(uRe, 1)];
  external "C" retInfo = func_FFT(uRe, size(uRe, 1), uIm, size(uIm, 1), yRe, yIm)
    annotation( Include = "#include \"func_FFT.c\"", 
                IncludeDirectory = "modelica://HPF/Resources/source",
                Library = "kiss-fft", LibraryDirectory = "modelica://HPF/Resources/source");

end func_FFT_Modelica;