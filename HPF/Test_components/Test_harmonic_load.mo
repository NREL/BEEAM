within HPF.Test_components;
model Test_harmonic_load
  outer SystemDef systemDef;
  import Modelica.ComplexMath.j;

  HPF.Utilities.ComponentProperties properties(ComponentType = "NonlinearLoad");

  extends HPF.SinglePhase.Interface.TwoPinBase;

  parameter Real P(start = 1, fixed = true);
  Real S(start = 1) "Apparent power at fundamental";
  Real Q(start = 1) "Imaginary power at fundamental";

  parameter Real argS(start = -1) = -1;

  Real vMag[systemDef.numHrm] = Modelica.ComplexMath.abs(v[:]);
  Real iMag[systemDef.numHrm] = Modelica.ComplexMath.abs(i[:]);
initial equation

equation
  P = S * cos(argS);
  Q = S * sin(argS);

  // power flow for the fundamental
  /*
     In complex notation,
    S = P + jQ = V*conj(I)
      = (Vre*Ire + Vim*Iim) + j(Vim*Ire - Vre*Iim)
  */
  //Complex(P, Q) = v[1] * Modelica.ComplexMath.conj(i[1]);


  //P = (v[1].re * i[1].re) + (v[1].im * i[1].im);
  //Q = (v[1].im * i[1].re) - (v[1].re * i[1].im);

  i[1].re = (P*v[1].re + Q*v[1].im) / (v[1].re^2 + v[1].im^2);
  i[1].im = (P*v[1].im - Q*v[1].re) / (v[1].re^2 + v[1].im^2);

  i[2:systemDef.numHrm].re = {0.8 for i in 1:systemDef.numHrm-1};
  i[2:systemDef.numHrm].im = {0.01 for i in 1:systemDef.numHrm-1};
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={  Rectangle(origin = {-1, 0}, extent = {{-79, 60}, {81, -60}}), Line(origin = {-19.9954, 4.22942}, points = {{0, 24}, {0, -24}}), Line(origin = {-9.22393, 4.28472}, points = {{0, 14}, {0, -24}}), Line(origin = {0.00458531, 4.42422}, points = {{0, 4}, {0, -24}}), Line(origin = {29.0461, 4.58262}, points = {{0, -12}, {0, -24}}), Line(origin = {19.7105, 4.55002}, points = {{0, -4}, {0, -24}}), Line(origin = {9.04607, 4.343}, points = {{0, 2}, {0, -24}}), Line(origin = {-1.22772, -19.9146}, rotation = -90, points = {{0, 36}, {0, -24}}), Text(origin={
              -101.391,-82.6579},                                                                                                                                                                                                        extent={{
              -222.609,28.6579},{423.391,-37.3421}},                                                                                                                                                                                                        textString = "%name"), Line(origin = {-85, 1}, points = {{-5, -1}, {5, -1}, {5, 1}}), Line(origin = {85, 0}, points = {{-5, 0}, {5, 0}, {5, 0}}),
        Text(
          extent={{-94,96},{74,60}},
          lineColor={28,108,200},
          textString="P = %P W")}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0}, initialScale = 0.1)),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=initialization",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end Test_harmonic_load;
