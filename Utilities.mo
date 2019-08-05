within HPF;
package Utilities
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
    y := a[:] * {x^i for i in (size(a[:], 1)-1):-1:0};

  annotation (
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
    String ComponentType  "Type of the component"; 
    
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
    Modelica.Utilities.Streams.writeRealMatrix(name+".mat", "data", dataMatrix);
    annotation (
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
      readMatrix := Modelica.Utilities.Streams.readRealMatrix(name+".mat", "data", 2, 1);
      v.re := readMatrix[1, 1];
      v.im := readMatrix[2, 1];
      annotation (
        Icon(coordinateSystem(grid = {0, 0})),
        Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
    end readNodeVoltage;
    annotation (
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end DataIO;
  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Utilities;