within HPF.SinglePhase.Sources;

model VoltageSrcLoadData "Harmonic Voltage Source (Load input data from a mat file, Example: \"Input/Directory/FileName\")"
  /*
    
    */
  extends HPF.SinglePhase.Interface.Source;
  HPF.Utilities.ComponentProperties properties(ComponentType = "VoltageSource");
  import Modelica.ComplexMath.j;
  parameter String fileName "Specify file path (String: Unix style path in the library.)";
  /*
      The user can either enter the name of the variable in the file or not.
      Case 1: User specifies the name of the variable.
        This puts the work on the user to enter the variable name. This would require accessing the 
        mat file.
      Case 2: The matfile has a standard format. 
        In this case, user need not pass any variable name, thus, streamlining the simulation
        setup. A downside, this puts the onus on the library designer to specify a file format
        standard and create auxillary tools to generate the input file.
    */
  final parameter String resourceRetVal = Modelica.Utilities.Files.loadResource("modelica://" + fileName);
  /*
      The readRealMatrix function needs to know the size of the matrix being read. 
      Passing a size greater than the actual size would lead to runtime error. 
      Therefore, first get the size (dimensions) of the matrix and then read the matrix.
      
      ISSUE: There is a bug in OpenModelica. The readRealMatrix throws an error if a variable is
      passed as the dimension. 
      Todo: On OpenModelica bug tracker, create a bug ticket.
    */
  /*
      Only reading magnitude size, assuming argument matrix is of the same size.
      Setting matrix variable names as:
        * mag
        * arg
    */
  final parameter Integer matDim[2] = Modelica.Utilities.Streams.readMatrixSize(resourceRetVal, "mag");
  /*
      OpenModelica bug workaround;
        Setting matrix as a constant = 32
    */
  final parameter Real magDataMat[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetVal, "mag", 32, 1);
  final parameter Real argDataMat[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetVal, "arg", 32, 1);
  /*
      Misc quatity calculations.
    */
  //Real P = (v[:].re * i[:].re) + (v[:].im * i[:].im) "Real Power";
equation
/*
    extra constraint definition for loop breaking.
  */
  omega = 2 * Modelica.Constants.pi * systemDef.fFund;
  v[:].re = magDataMat[1:systemDef.numHrm, 1] .* cos(argDataMat[1:systemDef.numHrm, 1]);
//v[:].im = magDataMat[1:systemDef.numHrm, 1] .* sin(argDataMat[1:systemDef.numHrm, 1]);
  annotation(
    defaultComponentName = "v",
    Icon(graphics = {Ellipse(extent = {{-48, 50}, {48, -50}}, endAngle = 360), Line(origin = {-69, 0}, points = {{-21, 0}, {21, 0}}), Line(origin = {69, 0}, points = {{-21, 0}, {21, 0}}), Line(origin = {-8.2246, 18.6487}, points = {{8.50128, 21.0747}, {2.50128, 19.0747}, {-5.49872, 13.0747}, {-9.49872, 7.07465}, {-11.4987, -0.925349}, {-9.49872, -6.92535}, {-5.49872, -10.9253}, {0.501285, -14.9253}, {6.50128, -18.9253}, {8.50128, -18.9253}, {8.5013, -18.9253}}), Line(origin = {7.309, -18.9402}, rotation = 180, points = {{8.50128, 21.0747}, {2.50128, 19.0747}, {-5.49872, 13.0747}, {-9.49872, 7.07465}, {-11.4987, -0.925349}, {-9.49872, -6.92535}, {-5.49872, -10.9253}, {0.501285, -14.9253}, {6.50128, -18.9253}, {8.50128, -18.9253}, {8.5013, -18.9253}}), Text(origin = {-84, 47}, rotation = 90, extent = {{-14, 23}, {56, -19}}, textString = "%name"), Line(origin = {-0.240082, -69.5198}, rotation = 180, points = {{0, 2}, {0, -20}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 7), Rectangle(origin = {2, -101}, extent = {{-30, 29}, {26, -19}}), Text(origin = {-7, -105}, rotation = 90, extent = {{-9, 17}, {25, -29}}, textString = "File", textStyle = {TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold})}, coordinateSystem(initialScale = 0.1)));
end VoltageSrcLoadData;