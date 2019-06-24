within HPF.SinglePhase.NonlinearLoads;
package DataIO

function writeNodeVoltage
  /*
  Writing data to file.    
  Using write matrix from Modelia.Utilities
  */
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
