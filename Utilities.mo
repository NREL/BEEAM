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
      final parameter Real magDataMat[:, :] = Modelica.Utilities.Streams.readRealMatrix(fileNameResource, "magV", 32, 1);         // Hardcoded dimensions.
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
  annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Utilities;