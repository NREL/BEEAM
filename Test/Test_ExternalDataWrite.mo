within HPF.Test;
model Test_ExternalDataWrite
  import Modelica.ComplexMath.j;
  Real re = 45.3434;
  Real im = 24.563;

  Real A[2, 1] = {{re}, {im}};
  //Real tmp[:, :];
  String str1 = "test_matrix_name";
  String fileExtension = ".mat";
  //String strCat = str1 + str2;

  Complex readData(re(start = 0), im(start = 0));
algorithm

    Modelica.Utilities.Streams.writeRealMatrix(str1+".mat", "Matrix_A", A);

    // write to file

    //HPF.HarmonicSources.DataIO.writeNodeVoltage(33.56 + 34.56*j, "TEST");
    // read raw from file

    // tmp[:, :] :=Modelica.Utilities.Streams.readRealMatrix("TEST.mat", "data", 2, 1);
    readData :=HPF.HarmonicSources.DataIO.readNodeVoltage("TEST");
annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Test_ExternalDataWrite;
