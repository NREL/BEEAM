within HPF.Test_components;
model HarmonicSource_MATLAB_Implementation_Cmplx "Harmonic source"
  extends HPF.SinglePhase.Interface.TwoPinBase;
  parameter Real P = 1000 "Real power drawn by DC side";
  parameter Real phi = (-0.4261) "angle";
  parameter Real alpha = 3e-2;
  parameter Real beta = 3e-4;
  parameter Real gamma = -0.2627;
  parameter Real nu = 14.35;
  parameter Real m = -0.67059 "Phase model coef 1";
  parameter Real c = -0.18722 "Phase model coef 2";
  Real vMag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(v[:]);
  Real iMag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(i[:]);

  // temp variables
  //Real tmp1[systemDef.numHrm - 1] = nu .* exp(gamma .* systemDef.hrms[2:systemDef.numHrm]);
  //Real tmp2[systemDef.numHrm - 1] = (m .* systemDef.hrms[2:systemDef.numHrm] + c) + (angle(i[1]) .* systemDef.hrms[2:systemDef.numHrm]);

equation
  /*
    for h = 1
    ---------
    In complex notation,
    S = P + jQ = V*conj(I)
      = (Vre*Ire + Vim*Iim) + j(Vim*Ire - Vre*Iim)
  */
  P = (v[1].re * i[1].re) + (v[1].im * i[1].im);
  P * tan(phi) = (v[1].im * i[1].re) - (v[1].re * i[1].im);

  /*
    for h > 1
    ---------
    Complex(g_h_out, 0)
  */
  i[2:systemDef.numHrm].re = nu .* exp(gamma .* systemDef.hrms[2:systemDef.numHrm]) .* cos((m .* systemDef.hrms[2:systemDef.numHrm] .+ c) .+ (Modelica.ComplexMath.arg(i[1]) .* systemDef.hrms[2:systemDef.numHrm]));
  i[2:systemDef.numHrm].im = nu .* exp(gamma .* systemDef.hrms[2:systemDef.numHrm]) .* sin((m .* systemDef.hrms[2:systemDef.numHrm] .+ c) .+ (Modelica.ComplexMath.arg(i[1]) .* systemDef.hrms[2:systemDef.numHrm]));
  //i[2:systemDef.numHrm].re = {0 for i in 1:systemDef.numHrm-1};
  //i[2:systemDef.numHrm].im = {0 for i in 1:systemDef.numHrm-1};


  annotation (
    Icon(graphics={  Rectangle(extent = {{-80, 80}, {80, -80}}), Line(origin = {-90, 0}, points = {{-10, 0}, {10, 0}}), Line(origin = {90, 0}, points = {{10, 0}, {-10, 0}}), Text(origin={
              -25,-69.6977},                                                                                                                                                                            rotation = 90, extent={{
              -30.3023,15},{169.698,-45}},                                                                                                                                                                                                        textString = "g(.)", textStyle = {TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold}), Text(origin={18,
              146},                                                                                                                                                                                                        rotation = 90, extent = {{-46, 50}, {260, -6}}, textString = "%name",
            horizontalAlignment =                                                                                                                                                                                                        TextAlignment.Left)}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end HarmonicSource_MATLAB_Implementation_Cmplx;
