within HPF.Test_components;
model HarmonicSource_MATLAB_Implementation_Cmplx "Harmonic source"
  extends HPF.SinglePhase.Interface.TwoPinBase;
  parameter Real P = 1000 "Real power drawn by DC side";
  parameter Real phi = 0.3 "angle";
  parameter Real alpha = 3e-2;
  parameter Real beta = 3e-4;
  parameter Real gamma = 0.09544;
  parameter Real nu = 10.7;
  parameter Real m = 0.1 "Phase model coef 1";
  parameter Real c = 0.1 "Phase model coef 2";

  Real vMag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(v[:]);
  Real iMag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(i[:]);
  Real tmp1[systemDef.numHrm - 1] = nu .* exp(-gamma .* i[1].re .* systemDef.hrms[2:systemDef.numHrm]);
  Real tmp2[systemDef.numHrm - 1] = alpha .* v[2:systemDef.numHrm].re + beta .* v[2:systemDef.numHrm].re .^ 2;

  //Real magS(start = 1);
  //Real Q(start = 1);
equation
/*
    for h = 1
    ---------
    g_1_out = (P/v) + alpha*v + beta*v^2;
    Rearranging equation
    Also, in complex notation,
    S = P + jQ = V*conj(I)
      = (Vre*Ire + Vim*Iim) + j(Vim*Ire - Vre*Iim)
  */
  
  P = v[:].re * i[:].re + v[:].im * i[:].im;
  P * tan(phi) = v[:].im * i[:].re - v[:].re * i[:].im;
  //Complex(P, Q) = v[1] * Modelica.ComplexMath.conj(i[1]);
/*
    for h > 1
    ---------
    g_h_out = nu*exp(-gamma*i1_1) + alpha*v1_h + beta*v1_h^2;
    
    Complex(g_h_out, 0)
  */


  i[2:systemDef.numHrm].re = (nu*exp(-gamma*Modelica.ComplexMath.'abs'(i[1])).*systemDef.hrms[2:systemDef.numHrm]) .* cos((m.*systemDef.hrms[2:systemDef.numHrm]) + Modelica.ComplexMath.arg(i[1]) .* systemDef.hrms[2:systemDef.numHrm] .+ c);
  
  i[2:systemDef.numHrm].im = (nu*exp(-gamma*Modelica.ComplexMath.'abs'(i[1])).*systemDef.hrms[2:systemDef.numHrm]).*sin((m.*systemDef.hrms[2:systemDef.numHrm]) + Modelica.ComplexMath.arg(i[1]) .* systemDef.hrms[2:systemDef.numHrm] .+ c);
  
  //i[2:systemDef.numHrm].im = {0 for i in 1:systemDef.numHrm-1};
  
  annotation (
    Icon(graphics={  Rectangle(extent = {{-80, 80}, {80, -80}}), Line(origin = {-90, 0}, points = {{-10, 0}, {10, 0}}), Line(origin = {90, 0}, points = {{10, 0}, {-10, 0}}), Text(origin = {-20, -47}, rotation = 90, extent = {{-20, 15}, {112, -45}}, textString = "g(.)", textStyle = {TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold}), Text(origin = {20, 138}, rotation = 90, extent = {{-46, 50}, {192, -8}}, textString = "%name",
            horizontalAlignment =                                                                                                                                                                                                        TextAlignment.Left)}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end HarmonicSource_MATLAB_Implementation_Cmplx;
