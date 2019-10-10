within HPF.PowerElectronicsConverters;

model AC2DC_SinglePhase "AC to DC Converter Single Phase"
  outer SystemDef systemDef;
  // component properties for post processing
  HPF.Utilities.ComponentProperties properties(ComponentType = "NonlinearLoad");
  
  import Modelica.ComplexMath.j;
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
    Placement(visible = true, transformation(origin = {74, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
    Placement(visible = true, transformation(origin = {80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_P(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-94, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N hPin_N(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-96, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real V_Rect(start = 0) = 1 "Rectifier DC output";
  parameter Real efficiency(start = 1) = 0.9 "Rectifier efficiency (replace with efficiency model or curve)";
  parameter String modelFileName "Rectifier harmonic model mat file";
  final parameter String resourceRetValue = Modelica.Utilities.Files.loadResource("modelica://" + modelFileName);
  final parameter Integer matDim[2] = Modelica.Utilities.Streams.readMatrixSize(resourceRetValue, "mag");
  // assuming magnitude and angle vectors have same dimension
  final parameter Real magDataMat[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetValue, "mag", matDim[1], 1);
  final parameter Real argDataMat[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetValue, "arg", matDim[1], 1);
  
  parameter Real rectifierModel "Rectifier model (Other model parameters passed as a record?)";
  
  
  Modelica.Electrical.Analog.Sources.ConstantVoltage vDC(V = V_Rect) annotation(
    Placement(visible = true, transformation(origin = {16, -12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Interface.LoadBase loadBase annotation(
    Placement(visible = true, transformation(origin = {-32, -2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  
  /*
    Power should be negative (power sink)
  */
  Real P = efficiency * (vDC.v * vDC.i);  // DC output power
  Real S(start = 1) "Apparent power at fundamental";
  Real Q(start = 1) "Imaginary power at fundamental";
    
//protected
  Real argS "Phase angle for fundamental apparent power";
  Real magScale = 1 / Modelica.ComplexMath.'abs'(loadBase.i[1]);
  Real argAdj[systemDef.numHrm - 1] = argDataMat[2:(systemDef.numHrm), 1] - (Modelica.ComplexMath.arg(loadBase.v[1]) .* systemDef.hrms[2:end]);
  
  Complex a[systemDef.numHrm - 1] = Complex(cos(argAdj), sin(argAdj));
  Real c[systemDef.numHrm - 1] = magScale * magDataMat[2:systemDef.numHrm, 1];
  // reactive power (tmp)
  //Complex S_vect[systemDef.numHrm](each re(start = 0, nominal = 1), each im(start = 0, nominal = 1)) = cat(1, {Complex(P * efficiency, Q)}, {Complex(0.0) for i in 1:systemDef.numHrm - 1});

algorithm
  //argAdj := argDataMat[1:systemDef.numHrm - 1] - (Modelica.ComplexMath.arg(loadBase.v[1]) .* systemDef.hrms);
equation
  
  /*
    IMPORTANT: harmonic loads are power sinks.
    Set the real power to negative. Failing to do so would result in the 
    simulator not getting to a solution. 
  */
  
  /*
    Get imaginary power. 
  */
  argS = Modelica.ComplexMath.arg(loadBase.v[1]) - argDataMat[1, 1]; 
  P = S * cos(argS);
  Q = S * sin(argS);
  
  // power flow for the fundamental
  Complex(P, Q) = loadBase.v[1] * Modelica.ComplexMath.conj(loadBase.i[1]);
  
  /*
    current injection for the rest of the harmonics.
    One must also model the effect of error resulting from 
    the scaling. 
    
    Scale the current and phase shift the harmonic angles
  */
  loadBase.i[2:end] = {c[i]*a[i] for i in 1:systemDef.numHrm-1};
  
  
  connect(vDC.p, pin_p) annotation(
    Line(points = {{16, -2}, {16, 38}, {74, 38}}, color = {0, 0, 255}));
  connect(vDC.n, pin_n) annotation(
    Line(points = {{16, -22}, {16, -58}, {80, -58}, {80, -60}}, color = {0, 0, 255}));
  connect(loadBase.pin_p, hPin_P) annotation(
    Line(points = {{-32, 8}, {-32, 8}, {-32, 40}, {-94, 40}, {-94, 40}}));
  connect(loadBase.pin_n, hPin_N) annotation(
    Line(points = {{-32, -12}, {-34, -12}, {-34, -64}, {-92, -64}, {-92, -64}}, color = {117, 80, 123}));
  annotation(
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Rectangle(origin = {-1, 0}, extent = {{-99, 100}, {101, -100}}), Line(origin = {-47.0699, -5.4488}, points = {{-44.9518, 25.9597}, {-40.9518, 41.9597}, {-34.9518, 57.9597}, {-26.9518, 65.9597}, {-16.9518, 61.9597}, {-10.9518, 45.9597}, {-6.95182, 27.9597}, {-2.95182, 7.9597}, {5.04818, -8.0403}, {15.0482, -14.0403}, {27.0482, -4.0403}, {33.0482, 11.9597}, {37.0482, 25.9596}}, smooth = Smooth.Bezier), Line(origin = {-22.4063, 67.9889}, points = {{0, 24}, {0, -24}}), Line(origin = {-11.6348, 68.0442}, points = {{0, 14}, {0, -24}}), Line(origin = {-3.85568, 68.1837}, points = {{0, 4}, {0, -24}}), Line(origin = {25.1858, 68.3421}, points = {{0, -12}, {0, -24}}), Line(origin = {15.8502, 68.3095}, points = {{0, -4}, {0, -24}}), Line(origin = {5.18579, 67.6124}, points = {{0, 2}, {0, -24}}), Line(origin = {-3.63854, 43.8449}, rotation = -90, points = {{0, 36}, {0, -24}}), Line(origin = {48.7451, -24.5475}, points = {{-25, 0}, {25, 0}}), Text(origin = {-29, 131}, extent = {{-51, 33}, {97, -43}}, textString = "%name"), Line(origin = {49.1191, -47.2208}, points = {{-25, 0}, {25, 0}}, pattern = LinePattern.Dash), Line(origin = {1.9663, 2.85904e-05}, points = {{-101, -100}, {99, 100}})}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0}, initialScale = 0.1)),
    Documentation(info = "<html><head>
	
</head>
<body><h2>Rectifier model (model defined in a mat file)</h2><div><br></div>
Test documentation using a word processor.
<p>This is a mathematical formula.</p>
<p><img src=\"modelica://HPF/Resources/images/test_doc_html_c6b7700131d7b8e4.gif\" name=\"Object1\" hspace=\"8\" width=\"95\" height=\"38\">
</p>
<p><br>
<br>

</p>
<p><br>
<br>

</p>

</body></html>"));
end AC2DC_SinglePhase;