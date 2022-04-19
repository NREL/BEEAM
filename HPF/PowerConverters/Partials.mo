within HPF.PowerConverters;

package Partials
  extends Modelica.Icons.BasesPackage;

  partial model HarmonicModel_Interp
    parameter String modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/demoModel.mat" "Rectifier harmonic model mat file" annotation(
      Dialog(tab = "Converter Model"));
  
  protected
    final parameter String resourceRetValue = Modelica.Utilities.Files.loadResource("modelica://" + modelFileName);
    final parameter Integer matDim[2] = Modelica.Utilities.Streams.readMatrixSize(resourceRetValue, "X");
    // assuming matrices have same dimension
    final parameter Real mdl_H[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetValue, "X", matDim[1], matDim[2]);
    final parameter Real mdl_P_h1[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetValue, "Y", matDim[1], matDim[2]);
    final parameter Real mdl_Z_mag[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetValue, "Z_mag", matDim[1], matDim[2]);
    final parameter Real mdl_Z_arg[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetValue, "Z_arg", matDim[1], matDim[2]);
    // reading efficiency model
    final parameter Real alpha[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetValue, "alpha", 1, 1);
    final parameter Real beta[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetValue, "beta", 1, 1);
    final parameter Real gamma[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetValue, "gamma", 1, 1);
  equation

    annotation(
      Icon(graphics = {Polygon(origin = {-2, -73}, pattern = LinePattern.Dash, points = {{-14, 11}, {-54, -23}, {38, -23}, {58, 11}, {-14, 11}}), Line(origin = {3.68493, -72.4315}, points = {{-20, -23}, {10, 11}}, pattern = LinePattern.Dash), Line(origin = {7.69173, -71.3014}, points = {{38, -7}, {-42, -7}}, pattern = LinePattern.Dash), Line(origin = {24.5548, -76.4383}, points = {{-20, -19}, {-6, -1}}, color = {0, 0, 0}), Ellipse(origin = {12, -86}, fillPattern = FillPattern.Solid, extent = {{-1, 1}, {1, -1}}, endAngle = 360), Line(origin = {27.1233, -74.8287}, points = {{-34, -11}, {14, -11}}, color = {0, 0, 0})}),
      Documentation(info = "<html><head></head><body>Converter model using 2D interpolation</body></html>"));
  end HarmonicModel_Interp;

  partial model HarmonicModel_Parameterized
    parameter Real magModelParams[6] = {0, 0, 0, 0, 0, 0} "Magnitude model parameters" annotation(
      Dialog(tab = "Converter Model"));
    parameter Real phAngModelParams[5] = {0, 0, 0, 0, 0} "Phase angle model parameters" annotation(
      Dialog(tab = "Converter Model"));    
    parameter Real alpha = 1 "Converter loss model parameter" annotation(
      Dialog(tab = "Converter Model", group="Initialization"));
    parameter Real beta = 1 "Converter loss model parameter" annotation(
      Dialog(tab = "Converter Model", group="Initialization"));
    parameter Real gamma = 1 "Converter loss model parameter" annotation(
      Dialog(tab = "Converter Model", group="Initialization"));
  equation
  
    annotation(
      Icon(graphics = {Text(origin = {3, -79}, extent = {{-81, 13}, {81, -13}}, textString = "I = f(h, P, param)", textStyle = {TextStyle.Italic})}));
  end HarmonicModel_Parameterized;
  annotation(
    Documentation(info = "<html><head></head><body>Base class package containing models for converters.</body></html>"));
end Partials;