within HPF;

package Utilities
  extends Modelica.Icons.UtilitiesPackage;

  function polyval
    /*
                                    Polynomial evaluation of the form,
                                    y = a3*x^3 + a2*x^2 + a1*x^1 + a0
                                    
                                  */
    extends Modelica.Icons.Function;
    input Real a[:];
    input Real x;
    output Real y;
  algorithm
    y := a[:] * {x ^ i for i in size(a[:], 1) - 1:(-1):0};
    annotation(
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})),
      Documentation(info = "<html>
  <h4>Syntax</h4>
  <blockquote><pre>
  Utilities.<b>polyval</b>(a, x);
  </pre></blockquote>
  <h4>Description</h4>
  <p>
  Function <b>polyval</b>(..) evaluates a polynomial described by coeficients a (vector) at value x. The polynomail is of the form, 
  
  <p>y = a3*x^3 + a2*x^2 + a1*x^1 + a0 </p>
  
  
  </p>
  </html>"));
  end polyval;

  record ComponentProperties
    extends Modelica.Icons.Record;
    /*
                                      Modelica record for assigning property values to classes.
                                      
                                      This can be used to identify components during the post processing.
                                    */
    String ComponentType "Type of the component";
    annotation(
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})),
      Documentation(info = "<html><head></head><body>Types of components:<div><br></div><div>* Impedance</div><div>* Resistance</div><div>* Voltage Source</div><div>* Nonlinear load</div><div>...</div><div><br></div><div>(This doc is incomplete)</div></body></html>"));
  end ComponentProperties;

  package DataIO
    function writeNodeVoltage
      /*
                                                    Writing data to file.    
                                                    Using write matrix from Modelia.Utilities
                                                    */
      extends Modelica.Icons.Function;
      input Complex data;
      input String name;
    protected
      Real dataMatrix[2, 1] = {{data.re}, {data.im}};
    algorithm
      Modelica.Utilities.Streams.writeRealMatrix(name + ".mat", "data", dataMatrix);
      annotation(
        Icon(coordinateSystem(grid = {0, 0})),
        Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
    end writeNodeVoltage;

    function readNodeVoltage
      /*
                                                      Reading data from file
                                                      */
      extends Modelica.Icons.Function;
      input String name;
      // returns complex record
      output Complex v;
    protected
      Real readMatrix[2, 1];
    algorithm
/*
    final parameter Real A1[:,:] = Modelica.Utilities.Streams.readRealMatrix(file1,matrixName1,dim1[1],dim1[2]) "Data of check matrix 1";
    */
      readMatrix := Modelica.Utilities.Streams.readRealMatrix(name + ".mat", "data", 2, 1);
      v.re := readMatrix[1, 1];
      v.im := readMatrix[2, 1];
      annotation(
        Icon(coordinateSystem(grid = {0, 0})),
        Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
    end readNodeVoltage;

    class loadDataFromFile "Load data from a mat file"
      /*
                                                  Template class for loading data from a mat file.
                                                  Can be used for loading input voltage harmonics data.
                                                  User would extract harmonics from a steady state waveforms
                                                  measurement file and save the harmonics in a mat file.
                                                */
      /*
                                                  File reading caveates:
                                                  A file in the current modelica model directory can be referenced 
                                                  using the URI: 'file://'
                                                  A file in a modelica library structure can be referenced using the 
                                                  URI: 'modelica://' followed by the path to the file.
                                                  The path should be a UNIX like directory path. Thus it is always
                                                  beneficial to create a package class as a folder and not as a 
                                                  single file. 
                                                        
                                                  Refer to documentation on the use of: 'loadResource' from the 
                                                  Modelica.Utilities sublibrary.
                                                */
      parameter String fileName;
    equation

      annotation(
        Icon(coordinateSystem(grid = {0, 0})),
        Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
    end loadDataFromFile;

    class loadHarmonicData
      /*
                                                  Template class for loading data from a mat file.
                                                  Can be used for loading input voltage harmonics data.
                                                  User would extract harmonics from a steady state waveforms
                                                  measurement file and save the harmonics in a mat file.
                                                */
      /*
                                                  File reading caveates:
                                                  A file in the current modelica model directory can be referenced 
                                                  using the URI: 'file://'
                                                  A file in a modelica library structure can be referenced using the 
                                                  URI: 'modelica://' followed by the path to the file.
                                                  The path should be a UNIX like directory path. Thus it is always
                                                  beneficial to create a package class as a folder and not as a 
                                                  single file. 
                                                        
                                                  Refer to documentation on the use of: 'loadResource' from the 
                                                  Modelica.Utilities sublibrary.
                                                  
                                                  
                                                */
      parameter String NOTE = "IMPORTANT INFO" "Read Documentation about this Model";
      parameter String magVariableName "Name of the magnitude variable";
      parameter String argVariableName "Name of the argument (phase angle) variable";
      parameter String fileName "File location in UNIX format within Modelica Libarary";
      // get name of the file as a string
      final parameter String fileNameResource = Modelica.Utilities.Files.loadResource("modelica://" + fileName);
      // read matrix size
      final parameter Integer magDimMat[2] = Modelica.Utilities.Streams.readMatrixSize(fileNameResource, magVariableName) "Dimension of mag matrix";
      final parameter Integer argDimMat[2] = Modelica.Utilities.Streams.readMatrixSize(fileNameResource, argVariableName) "Dimension of arg matrix";
      // use the file name to read matrix
      final parameter Real magDataMat[:, :] = Modelica.Utilities.Streams.readRealMatrix(fileNameResource, "magV", 32, 1);
      // Hardcoded dimensions.
      final parameter Real argDataMat[:, :] = Modelica.Utilities.Streams.readRealMatrix(fileNameResource, "argV", 32, 1);
    equation
//final parameter Real magData[32] = magDataMat[32, 1];
//final parameter Real argData[32] = magDataMat[32, 1];/\
      annotation(
        Icon(coordinateSystem(grid = {0, 0})),
        Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})),
        Documentation(info = "<html><head></head><body><h1>IMPORTANT:</h1><div><br></div><div>Describe the usage with an example.</div><div><br></div><div>Standardize variable names.</div><div>Minimize user input.</div><div><br></div><div><br></div><div>An imporovement to this would be, let the user just specify the filename. Append the data directory directly in the module code.</div></body></html>"));
    end loadHarmonicData;
    annotation(
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end DataIO;

  package Frequency2Time
  end Frequency2Time;

  function fft "FFT performed in external function"
    extends Modelica.Icons.Function;
    input Real uRe[:] "Input complex vector, real part";
    input Real uIm[:] "Input complex vector, imaginary part";
    output Integer retInfo;
    //return info from c function (for diagnostics)
    output Real yRe[size(uRe, 1)] "Output complex vector, real part";
    output Real yIm[size(uRe, 1)] "Output complex vector, imaginary part";
    /*
                          in kiss_fft_alloc(), the 2nd argument sets the mode.
                          Modes:
                            * FFT = 0
                            * IFFT = 1
                        */
  
    external "C" retInfo = func_FFT(uRe, size(uRe, 1), uIm, size(uIm, 1), yRe, yIm, 0) annotation(
      Include = "#include \"func_FFT.c\"",
      IncludeDirectory = "modelica://HPF/Resources/source");
    annotation(
      Documentation(info = "<html><head></head><body>Using kiss_fft library. (https://github.com/mborgerding/kissfft)</body></html>"));
  end fft;

  /*  Moved the code from kiss_fft.c to the fft function.
                          This would ease running the code across operating systems.
                          The technique of creating and linking static libraries is not robust
                          as each operating system handles static libraries differently.
                              Library = "kiss-fft", LibraryDirectory = "modelica://HPF/Resources/source"*/

  function ifft
    extends Modelica.Icons.Function;
    input Real uRe[:] "Input complex vector, real part";
    input Real uIm[:] "Input complex vector, imaginary part";
    output Integer retInfo;
    //return info from c function (for diagnostics)
    output Real yRe[size(uRe, 1)] "Output complex vector, real part";
    output Real yIm[size(uRe, 1)] "Output complex vector, imaginary part";
    /*
                          in kiss_fft_alloc(), the 2nd argument sets the mode.
                          Modes:
                            * FFT = 0
                            * IFFT = 1
                        */
  
    external "C" retInfo = func_FFT(uRe, size(uRe, 1), uIm, size(uIm, 1), yRe, yIm, 1) annotation(
      Include = "#include \"func_FFT.c\"",
      IncludeDirectory = "modelica://HPF/Resources/source");
    annotation(
      Documentation(info = "<html><head></head><body>Using kiss_fft library. (https://github.com/mborgerding/kissfft)</body></html>"));
  end ifft;

  function ifft_fromMagPhase "Run ifft from fft magnitudes and phase"
    input Real mag[:] "Magnitude data of the harmonics";
    input Real arg[:] "Phase data of the harmonics";
    input Real fs "Sampling frequency";
    output Real y "Time domain output";
  algorithm

    annotation(
      Documentation(info = "<html><head></head><body>This function computes an IFFT from magnitude and phase information. Inputs are magnitude, phase and the sampling frequency.&nbsp;<div><br></div><div>Most of the relevant information of a Fourier transform of a time series waveform is present in the the first few harmonics. The rest of the higher harmonics are small in magnitude and hence can be set to zero. Given the sampling frequency, the function reconstructs the fft (complex form) of the given magnitude and phase data.</div><div><br></div><div>The function then runs an ifft on the reconstructed fft data and returns a time domain waveform.</div></body></html>"));
  end ifft_fromMagPhase;

  function fft_fromMagPhase "Get fft from magnitudes and phase"
    extends Modelica.Icons.Function;
    input Real mag[:] "Magnitude data of the harmonics";
    input Real arg[:] "Phase data of the harmonics";
    input Integer N "Size of the FFT";
    output Real yRe[N] "FFT coefficients";
    output Real yIm[N];
    
    /*
      Using the symmetric property of an fft.
    */
  
  protected
    
  /*    
  algorithm
    // magnitude --------------
    fftMag[:] := zeros(N);
    tmp := zeros(N_d2);
    tmp[1:size(mag, 1)] := mag[1:size(mag, 1)] .* ((sqrt(2) * N) / 2);
    // populating first half of symmetric coefficients
    fftMag[1:N_d2] := tmp[:];
    //  populating second half, reverse order, last element = 2nd element
    //  from beginning
    //  beginning coef or 2nd half would be: l - (N_d2 - 1)
    fftMag[(N - N_d2 + 2):1:end] := tmp[N_d2:-1:2];
    //   phase (argument / arg) [using arg for maintaining consistency with
    //    modelica]
    tmp[:] := zeros(N_d2);
    fftArg[:] := zeros(N);
    tmp[1:size(arg, 1)] := arg[1:size(arg, 1)] .- Modelica.Constants.pi / 2;
    // populating first half of symmetric coefficients
    fftArg[1:N_d2] := tmp[:];
    // populating second half
    fftArg[(N - N_d2 + 2):1:end] := tmp[N_d2:-1:2];
    // generating fft coeficients |mag|/_angle -> x + iy
    //tmpC[:] := fftMag .* (cos(fftArg) + Modelica.ComplexMath.j*sin(fftArg));
    yRe[1:N] := fftMag .* cos(fftArg);
    yIm[1:N] := fftMag .* sin(fftArg);
  */
   external "C" func_fft_getCmplxMagArg(mag, size(mag, 1), arg, size(arg, 1), N, yRe, yIm) annotation (
      Include = "#include \"fft_getCmplxMagArg.c\"",
      IncludeDirectory = "modelica://HPF/Resources/source");
  
  annotation (
      Documentation(info = "<html><head></head><body>This function computes an FFT from magnitude and phase information. Inputs are magnitude, phase and the sampling frequency.&nbsp;<div><br></div><div>Most of the relevant information of a Fourier transform of a time series waveform is present in the the first few harmonics. The rest of the higher harmonics are small in magnitude and hence can be set to zero. Given the sampling frequency, the function reconstructs the fft (complex form) of the given magnitude and phase data.</div><div><br></div><div>(Modelica implementation of the function from matlab (Avpreet Othee, Colorado State University))</div><div><br></div></body></html>"));
  end fft_fromMagPhase;

  /*    
    algorithm
      // magnitude --------------
      fftMag[:] := zeros(N);
      tmp := zeros(N_d2);
      tmp[1:size(mag, 1)] := mag[1:size(mag, 1)] .* ((sqrt(2) * N) / 2);
      // populating first half of symmetric coefficients
      fftMag[1:N_d2] := tmp[:];
      //  populating second half, reverse order, last element = 2nd element
      //  from beginning
      //  beginning coef or 2nd half would be: l - (N_d2 - 1)
      fftMag[(N - N_d2 + 2):1:end] := tmp[N_d2:-1:2];
      //   phase (argument / arg) [using arg for maintaining consistency with
      //    modelica]
      tmp[:] := zeros(N_d2);
      fftArg[:] := zeros(N);
      tmp[1:size(arg, 1)] := arg[1:size(arg, 1)] .- Modelica.Constants.pi / 2;
      // populating first half of symmetric coefficients
      fftArg[1:N_d2] := tmp[:];
      // populating second half
      fftArg[(N - N_d2 + 2):1:end] := tmp[N_d2:-1:2];
      // generating fft coeficients |mag|/_angle -> x + iy
      //tmpC[:] := fftMag .* (cos(fftArg) + Modelica.ComplexMath.j*sin(fftArg));
      yRe[1:N] := fftMag .* cos(fftArg);
      yIm[1:N] := fftMag .* sin(fftArg);
    */
  /*    
      algorithm
      
        // magnitude --------------
        fftMag[:] := zeros(N);
        tmp := zeros(N_d2);
        tmp[1:size(mag, 1)] := mag[1:size(mag, 1)] .* ((sqrt(2) * N) / 2);
        // populating first half of symmetric coefficients
        fftMag[1:N_d2] := tmp[:];
        //  populating second half, reverse order, last element = 2nd element
        //  from beginning
        //  beginning coef or 2nd half would be: l - (N_d2 - 1)
        fftMag[(N - N_d2 + 2):1:end] := tmp[N_d2:-1:2];
        //   phase (argument / arg) [using arg for maintaining consistency with
        //    modelica]
        tmp[:] := zeros(N_d2);
        fftArg[:] := zeros(N);
        tmp[1:size(arg, 1)] := arg[1:size(arg, 1)] .- Modelica.Constants.pi / 2;
        // populating first half of symmetric coefficients
        fftArg[1:N_d2] := tmp[:];
        // populating second half
        fftArg[(N - N_d2 + 2):1:end] := tmp[N_d2:-1:2];
        // generating fft coeficients |mag|/_angle -> x + iy
        //tmpC[:] := fftMag .* (cos(fftArg) + Modelica.ComplexMath.j*sin(fftArg));
        yRe[1:N] := fftMag .* cos(fftArg);
        yIm[1:N] := fftMag .* sin(fftArg);
      */
  /*    
        algorithm
        
          // magnitude --------------
          fftMag[:] := zeros(N);
          tmp := zeros(N_d2);
          tmp[1:size(mag, 1)] := mag[1:size(mag, 1)] .* ((sqrt(2) * N) / 2);
          // populating first half of symmetric coefficients
          fftMag[1:N_d2] := tmp[:];
          //  populating second half, reverse order, last element = 2nd element
          //  from beginning
          //  beginning coef or 2nd half would be: l - (N_d2 - 1)
          fftMag[(N - N_d2 + 2):1:end] := tmp[N_d2:-1:2];
          //   phase (argument / arg) [using arg for maintaining consistency with
          //    modelica]
          tmp[:] := zeros(N_d2);
          fftArg[:] := zeros(N);
          tmp[1:size(arg, 1)] := arg[1:size(arg, 1)] .- Modelica.Constants.pi / 2;
          // populating first half of symmetric coefficients
          fftArg[1:N_d2] := tmp[:];
          // populating second half
          fftArg[(N - N_d2 + 2):1:end] := tmp[N_d2:-1:2];
          // generating fft coeficients |mag|/_angle -> x + iy
          //tmpC[:] := fftMag .* (cos(fftArg) + Modelica.ComplexMath.j*sin(fftArg));
          yRe[1:N] := fftMag .* cos(fftArg);
          yIm[1:N] := fftMag .* sin(fftArg);
          */
  /*    
          algorithm
          
            // magnitude --------------
            fftMag[:] := zeros(N);
            tmp := zeros(N_d2);
            tmp[1:size(mag, 1)] := mag[1:size(mag, 1)] .* ((sqrt(2) * N) / 2);
            // populating first half of symmetric coefficients
            fftMag[1:N_d2] := tmp[:];
            //  populating second half, reverse order, last element = 2nd element
            //  from beginning
            //  beginning coef or 2nd half would be: l - (N_d2 - 1)
            fftMag[(N - N_d2 + 2):1:end] := tmp[N_d2:-1:2];
            //   phase (argument / arg) [using arg for maintaining consistency with
            //    modelica]
            tmp[:] := zeros(N_d2);
            fftArg[:] := zeros(N);
            tmp[1:size(arg, 1)] := arg[1:size(arg, 1)] .- Modelica.Constants.pi / 2;
            // populating first half of symmetric coefficients
            fftArg[1:N_d2] := tmp[:];
            // populating second half
            fftArg[(N - N_d2 + 2):1:end] := tmp[N_d2:-1:2];
            // generating fft coeficients |mag|/_angle -> x + iy
            //tmpC[:] := fftMag .* (cos(fftArg) + Modelica.ComplexMath.j*sin(fftArg));
            yRe[1:N] := fftMag .* cos(fftArg);
            yIm[1:N] := fftMag .* sin(fftArg);
            */
  /*    
            algorithm
            
              // magnitude --------------
              fftMag[:] := zeros(N);
              tmp := zeros(N_d2);
              tmp[1:size(mag, 1)] := mag[1:size(mag, 1)] .* ((sqrt(2) * N) / 2);
              // populating first half of symmetric coefficients
              fftMag[1:N_d2] := tmp[:];
              //  populating second half, reverse order, last element = 2nd element
              //  from beginning
              //  beginning coef or 2nd half would be: l - (N_d2 - 1)
              fftMag[(N - N_d2 + 2):1:end] := tmp[N_d2:-1:2];
              //   phase (argument / arg) [using arg for maintaining consistency with
              //    modelica]
              tmp[:] := zeros(N_d2);
              fftArg[:] := zeros(N);
              tmp[1:size(arg, 1)] := arg[1:size(arg, 1)] .- Modelica.Constants.pi / 2;
              // populating first half of symmetric coefficients
              fftArg[1:N_d2] := tmp[:];
              // populating second half
              fftArg[(N - N_d2 + 2):1:end] := tmp[N_d2:-1:2];
              // generating fft coeficients |mag|/_angle -> x + iy
              //tmpC[:] := fftMag .* (cos(fftArg) + Modelica.ComplexMath.j*sin(fftArg));
              yRe[1:N] := fftMag .* cos(fftArg);
              yIm[1:N] := fftMag .* sin(fftArg);
              */
  annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Utilities;