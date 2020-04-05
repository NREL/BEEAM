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
  
    external "C" func_FFT(uRe, size(uRe, 1), uIm, size(uIm, 1), yRe, yIm, 0) annotation(
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
    //output Integer retInfo;
    //return info from c function (for diagnostics)
    output Real yRe[size(uRe, 1)] "Output complex vector, real part";
    output Real yIm[size(uRe, 1)] "Output complex vector, imaginary part";
    /*
          int func_FFT(double *uRe, size_t uRe_sz, double *uIm, size_t uIm_sz, double *yRe, double *yIm, int fftModeSel)
        
          In kiss_fft_alloc(), the 2nd argument sets the mode.
          Modes:
            * FFT = 0
            * IFFT = 1
        */
  
    external "C" func_FFT(uRe, size(uRe, 1), uIm, size(uIm, 1), yRe, yIm, 1) annotation(
      Include = "#include \"func_FFT.c\"",
      IncludeDirectory = "modelica://HPF/Resources/source");
    annotation(
      Documentation(info = "<html><head></head><body>Using kiss_fft library. (https://github.com/mborgerding/kissfft)</body></html>"));
  end ifft;

  function fft_fromMagPhase "Get FFT (complex) from magnitudes and phase"
    extends Modelica.Icons.Function;
    input Real mag[:] "Magnitude data of the harmonics";
    input Real arg[:] "Phase data of the harmonics";
    input Integer N "Size of the FFT";
    output Real yRe[N] "FFT coefficients, real part";
    output Real yIm[N] "FFT coefficients, real part";
    /*
          Using the symmetric property of an fft.
        */
    /*
        int func_fft_getCmplxMagArg(double *mag, size_t szMag, double *arg, size_t szArg, int N, double *fftRe, double *fftIm)
       */
  
    external "C" func_fft_getCmplxMagArg(mag, size(mag, 1), arg, size(arg, 1), N, yRe, yIm) annotation(
      Include = "#include \"fft_utils.c\"",
      IncludeDirectory = "modelica://HPF/Resources/source");
    annotation(
      Documentation(info = "<html><head></head><body>This function computes an FFT from magnitude and phase information. Inputs are magnitude, phase and the sampling frequency.&nbsp;<div><br></div><div>Most of the relevant information of a Fourier transform of a time series waveform is present in the the first few harmonics. The rest of the higher harmonics are small in magnitude and hence can be set to zero. Given the sampling frequency, the function reconstructs the fft (complex form) of the given magnitude and phase data.</div><div><br></div><div>User would then use the output complex FFT values to run an IFFT and get a time domain waveform.</div><div><br></div><div>The input data is of the form,</div><div><br></div><div>Harmonic number <span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>| Input vector index</div><div>0 (DC, 0th harmonic)<span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>| 1</div><div>1 (fundamental)<span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>| 2</div><div>2<span class=\"Apple-tab-span\" style=\"white-space:pre\">			</span>| 3</div><div>.</div><div>..</div><div>...</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span></div><div>(Modelica implementation of the function from matlab (Avpreet Othee, Colorado State University)</div><div>)</div></body></html>"));
  end fft_fromMagPhase;

  function ifft_fromMagPhase "Get IFFT from magnitudes and phase"
    extends Modelica.Icons.Function;
    input Real mag[:] "Magnitude data of the harmonics";
    input Real arg[:] "Phase data of the harmonics";
    input Integer N "Size of the FFT";
    output Real y[N];
    /*
          Using the symmetric property of an fft.
        */
  protected
    Real y_fftRe[N](each start = 0);
    Real y_fftIm[N](each start = 0);
  algorithm
/*
      reconstruct FFT complex data.
    */
    (y_fftRe, y_fftIm) := fft_fromMagPhase(mag, arg, N);
/*
      Run an IFFT and return time domain waveform. 
    */
    y := ifft(y_fftRe, y_fftIm);
    annotation(
      Documentation(info = "<html><head></head><body>This function returns a time domain waveform from magnitude and phase information. Inputs are magnitude, phase and the sampling frequency.&nbsp;<div><br></div><div>The workflow is as follows:</div><div><br></div><div><b>1) </b>Reconstruct FFT complex representation from magnitude and phase information.</div><div><b>2)</b>&nbsp;Run an IFFT on the the data from step 1.</div><div><b>3)</b>&nbsp;Return only the real part, or the time domain waveform.</div><div><br></div><div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">The input data is of the form,</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><br></div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">Harmonic number&nbsp;<span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>| Input vector index</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">0 (DC, 0th harmonic)<span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>| 1</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">1 (fundamental)<span class=\"Apple-tab-span\" style=\"white-space: pre;\">		</span>| 2</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">2<span class=\"Apple-tab-span\" style=\"white-space: pre;\">			</span>| 3</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">.</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">..</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">...</div></div><div><br></div><div>(Modelica implementation of the function from matlab (Avpreet Othee, Colorado State University)</div><div>)</div></body></html>"));
  end ifft_fromMagPhase;

  function ifft_fromMagPhaseOddHrms "Get IFFT from magnitudes and phase for only odd harmonics"
    extends Modelica.Icons.Function;
    input Real magOdd[:] "Magnitude data (odd harmonics)";
    input Real argOdd[:] "Phase data (odd harmonics)";
    input Integer N "Size of the FFT";
    output Real y[N];
  protected
    Real y_fftRe[N];
    Real y_fftIm[N];
  algorithm
/*
      reconstruct FFT complex data.
    */
    (y_fftRe, y_fftIm) := fft_fromMagPhaseOddHrms(magOdd, argOdd, N);
/*
      Run an IFFT and return time domain waveform. 
    */
    y := ifft(y_fftRe, y_fftIm);
    annotation(
      Documentation(info = "<html><head></head><body>Wrapper function for ifft_fromMagPhaseOddHrms. Input is magnitude and phase for only odd harmonics. The function zero pads all the even harmonics and then run call the function, ifft_fromMagPhase.<div><br></div><div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">The input data is of the form,</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><br></div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">Harmonic number&nbsp;<span class=\"Apple-tab-span\" style=\"white-space: pre;\">        </span>| Input vector index</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">1 (fundamental)<span class=\"Apple-tab-span\" style=\"white-space: pre;\">                </span>| 1</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">3<span class=\"Apple-tab-span\" style=\"white-space: pre;\">                        </span>| 2</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">5<span class=\"Apple-tab-span\" style=\"white-space:pre\">                        </span>| 3</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">.</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">..</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">...</div></div></body></html>"));
  end ifft_fromMagPhaseOddHrms;

  function fft_fromMagPhaseOddHrms "Get FFT (complex) from magnitudes and phase (Odd harmonics)"
    extends Modelica.Icons.Function;
    input Real mag[:] "Magnitude data of the harmonics (Odd: h=1,3,5)";
    input Real arg[:] "Phase data of the harmonics (Odd)";
    input Integer N "Size of the FFT";
    output Real yRe[N] "FFT coefficients, real part";
    output Real yIm[N] "FFT coefficients, real part";
    /*
        int func_fft_getCmplxMagArg_OddHrms(double *mag, size_t szMag, double *arg, size_t szArg, int N, double *fftRe, double *fftIm)
       */
  
    external "C" func_fft_getCmplxMagArg_OddHrms(mag, size(mag, 1), arg, size(arg, 1), N, yRe, yIm) annotation(
      Include = "#include \"fft_utils.c\"",
      IncludeDirectory = "modelica://HPF/Resources/source");
    annotation(
      Documentation(info = "<html><head></head><body>This function computes an FFT from magnitude and phase information (odd harmonics only). Inputs are magnitude, phase and the sampling frequency.&nbsp;<div><br></div><div>Most of the relevant information of a Fourier transform of a time series waveform is present in the the first few harmonics. The rest of the higher harmonics are small in magnitude and hence can be set to zero. Given the sampling frequency, the function reconstructs the fft (complex form) of the given magnitude and phase data.</div><div><br></div><div>User would then use the output complex FFT values to run an IFFT and get a time domain waveform.</div><div><br></div><div>The input data is of the form,</div><div><br></div><div>Harmonic number <span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>| Input vector index</div><div>1 (fundamental)<span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>| 1</div><div>3 <span class=\"Apple-tab-span\" style=\"white-space:pre\">			</span>| 2</div><div>5<span class=\"Apple-tab-span\" style=\"white-space:pre\">			</span>| 3</div><div>.</div><div>..</div><div>...</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span></div><div>(Modelica implementation of the function from matlab (Avpreet Othee, Colorado State University)</div><div>)</div></body></html>"));
  end fft_fromMagPhaseOddHrms;

  function phaseShift
    extends Modelica.Icons.Function;
  algorithm

  end phaseShift;

  function interpolateBilinear
    extends Modelica.Icons.Function;
    /*
      Using a MATLAB/Octave style syntax.
      zq = interpolateBilinear(X, Y, Z, xq, yq)
      zq : output 
      xq, yq : query points 
      X, Y, Z : Input data in meshgrid format 
    */
    input Real X[:, :] "X axis input meshgrid data";
    input Real Y[:, :] "Y axis input meshgrid data";
    input Real Z[:, :] "Z axis input meshgrid data";
    input Real x_q "query value @x";
    input Real y_q "query value @y";
    output Real z_q "Interpolated value";
  protected
    // get input dimensions
    final parameter Integer dim_X = size(X, 2);
    final parameter Integer dim_Y = size(Y, 1);
    // values evaluated at the selected grid
    Real f_xi_yi "f(x_i, y_i)";
    Real f_xin_yi "f(x_i+1, y_i)";
    Real f_xi_yin "f(x_i, y_i+1)";
    Real f_xin_yin "f(x_i+1, y_i+1)";
    // indices
    Integer i "index for y";
    Integer j "index for x";
    Integer iLast=1 "Index used in last search";
    Real x1;
    Real x2;
    Real y1;
    Real y2;
  algorithm
    // search X | search in 2nd dim --------------
    i := min(max(iLast, 1), dim_X - 1);
    if x_q >= X[1, i] then
      // search forward
      while i < dim_X and x_q >= X[1, i] loop
        i := i + 1;
      end while;
      i := i - 1;
    else
      // search backward
      while i > 1 and x_q < X[1, i] loop
        i := i - 1;
      end while;
    end if;
    
    // search y | search in 1st dim --------------
    j := min(max(iLast, 1), dim_Y - 1);
    if y_q >= Y[j, 1] then
      // search forward
      while j < dim_Y and y_q >= Y[j, 1] loop
        j := j + 1;
      end while;
      j := j - 1;
    else
      // search backward
      while j > 1 and y_q < Y[j, 1] loop
        j := j - 1;
      end while;
    end if;
    
    /*
      NOTE !! :
      i is the index for y direction
      j is the index for x direction
    */
  
    // Get interpolation data
    f_xi_yi := Z[j, i];
    f_xin_yi := Z[j, i+1];
    f_xi_yin := Z[j+1, i];
    f_xin_yin := Z[j+1, i+1];
    
    /* perform interpolation
      Interpolating in x direction.
      Then interpolating in y direction.
      Source: Wikipedia, https://en.wikipedia.org/wiki/Bilinear_interpolation
    */
    x1 := X[j, i];
    x2 := X[j, i+1];
    y1 := Y[j, i];
    y2 := Y[j+1, i];
    
    z_q := ((f_xi_yi*(x2-x_q)*(y2-y_q)) + (f_xin_yi*(x_q-x1)*(y2-y_q)) + (f_xi_yin*(x2-x_q)*(y_q-y1)) + (f_xin_yin*(x_q-x1)*(y_q-y1))) / ((x2-x1)*(y2-y1));
    
    
    annotation(
      Documentation(info = "<html><head></head><body>Perform 2D interpolation.<div><br></div><div>Ouput is a single interpolated point corresponding to the x and y query values.</div><div><br></div><div>Input data is in MATLAB/Octave meshgrid format.</div></body></html>"));
  end interpolateBilinear;
  annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Utilities;