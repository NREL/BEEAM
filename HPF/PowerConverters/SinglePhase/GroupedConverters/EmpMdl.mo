within HPF.PowerConverters.SinglePhase.GroupedConverters;

model EmpMdl
  extends HPF.SinglePhase.Interface.ACDC_ConverterBase;
  extends HPF.PowerConverters.Partials.HarmonicModel_Interp;
  import Modelica.ComplexMath.j;
  parameter Integer numConvs = 1 "Number of converters";
    /*
    Fundamental power drawn on the AC harmonic side.
    Using converter efficiency model
          
          Pin = Pout + alpha + beta*Pout + gamma*Pout^2
        */
  Real P_DC = (abs(vDC.v * vDC.i));
  Real P_DC_singleConv = P_DC / numConvs "Output power per converter";
  /* Input output power relation (Total input AC Power (sum over all harmonics))
        P_AC = p*P_stby + (1 - p)*f_effi(P_DC)
      */
  Real P = HPF.PowerConverters.HelperFunctions.stbyPwrTransition(P_DCmin, P_stby, P_DC_singleConv) * P_stby + (1 - HPF.PowerConverters.HelperFunctions.stbyPwrTransition(P_DCmin, P_stby, P_DC_singleConv)) * (P_DC_singleConv + alpha[1, 1] + beta[1, 1] * P_DC_singleConv + gamma[1, 1] * P_DC_singleConv ^ 2);
  /*
          Measurements
      */
  Real I_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(loadBase.i);
  Real I_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(loadBase.i);
  Real V_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(loadBase.v);
  Real V_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(loadBase.v);
  Real P_h[systemDef.numHrm] = loadBase.v[:].re .* loadBase.i[:].re + loadBase.v[:].im .* loadBase.i[:].im "Real power at harmonics";
  // intermediary variables
  Real P1(start = nomP) "Real power at fundamental (per converter)";
  Real S1(start = nomP) "Apparent power at fundamental";
  Real Q1(start = 1) "Imaginary power at fundamental";
  // diagnostics: Check if the computed h=1 current mag matches the input surface model
  Real diag_I_mag_h1 = HPF.Utilities.interpolateBilinear(mdl_H, mdl_P_h1, mdl_Z_mag, 1, P);
  Modelica.Blocks.Interfaces.RealOutput PLoss annotation (
    Placement(visible = true, transformation(origin = {10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {24, 142},extent = {{-10, -10}, {10, 10}}, rotation = 90)));

protected
  Real argS1 = -HPF.Utilities.interpolateBilinear(mdl_H, mdl_P_h1, mdl_Z_arg, 1, P)"Phase angle for fundamental apparent power";
  // Querry arg interplation in 2D at harmonics h>1, at power level P
  Real arg_hh[systemDef.numHrm - 1] = {HPF.Utilities.interpolateBilinear(mdl_H, mdl_P_h1, mdl_Z_arg, systemDef.hrms[i], P) for i in 2:1:systemDef.numHrm};
  // Querry mag interplation in 2D at harmonics h>1, at power level P
  Real c[systemDef.numHrm - 1] = {HPF.Utilities.interpolateBilinear(mdl_H, mdl_P_h1, mdl_Z_mag, systemDef.hrms[i], P1)*numConvs for i in 2:1:systemDef.numHrm};
  
  // Apply phase correction
  Real argAdj[systemDef.numHrm - 1] = arg_hh[:] + Modelica.ComplexMath.arg(loadBase.v[1]) .* systemDef.hrms[2:end];
  // intermediary variables for higher current harmonics
  Complex a[systemDef.numHrm - 1] = {Complex(cos(argAdj[i]), sin(argAdj[i])) for i in 1:systemDef.numHrm - 1};
  
  Real tmp_Ph[systemDef.numHrm - 1] "Real power at h > 1";
equation
/*
    Power draw at the fundamental
    Power at harmonics > 1.
  */
  tmp_Ph[:] = loadBase.v[2:systemDef.numHrm].re .* loadBase.i[2:systemDef.numHrm].re .+ loadBase.v[2:systemDef.numHrm].im .* loadBase.i[2:systemDef.numHrm].im;
  P1 = P - sum(tmp_Ph);
/*
    Solve for imaginary power Q_1 (fundamental). 
    power angle is negative of the model fundamental
  */
  P1 = S1 * cos(argS1);
  Q1 = S1 * sin(argS1);
/*
     In complex notation,
    S = P + jQ = V*conj(I)
      = (Vre*Ire + Vim*Iim) + j(Vim*Ire - Vre*Iim)

    //Complex(P, Q) = loadBase.v[1] * Modelica.ComplexMath.conj(loadBase.i[1]);
    P = (loadBase.v[1].re * loadBase.i[1].re) + (loadBase.v[1].im * loadBase.i[1].im);
    Q = (loadBase.v[1].im * loadBase.i[1].re) - (loadBase.v[1].re * loadBase.i[1].im);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    //rewriting the power relation
  */
  loadBase.i[1].re = ((P1 * loadBase.v[1].re + Q1 * loadBase.v[1].im) / (loadBase.v[1].re ^ 2 + loadBase.v[1].im ^ 2)).*numConvs;
  loadBase.i[1].im = ((P1 * loadBase.v[1].im - Q1 * loadBase.v[1].re) / (loadBase.v[1].re ^ 2 + loadBase.v[1].im ^ 2)).*numConvs;
/*
    current injection for the rest of the harmonics.
  */
  loadBase.i[2:1:systemDef.numHrm] = {c[i] * a[i] for i in 1:systemDef.numHrm - 1};
  PLoss = P*numConvs - P_DC;
  
annotation(
    Icon(graphics = {Text(origin = {63, -130}, extent = {{-143, 10}, {143, -10}}, textString = "Converters=%numConvs", horizontalAlignment = TextAlignment.Left), Rectangle(origin = {15.58, -0.75}, pattern = LinePattern.Dash, extent = {{-115, 180.22}, {115, -180.22}}), Line(origin = {14.8013, 15.2237}, points = {{-101, 85}, {-101, 101}, {101, 101}, {101, -101}, {87, -101}}), Line(origin = {29.8698, 31.5593}, points = {{-101, 85}, {-101, 101}, {101, 101}, {101, -101}, {87, -101}}), Text(origin = {87, 149}, extent = {{-73, 15}, {73, -15}}, textString = "Ploss"), Text(origin = {22, -60}, lineColor = {92, 53, 102}, extent = {{-184, -120}, {176, -160}}, textString = "%name")}, coordinateSystem(extent = {{-100, -180}, {130, 180}})),
    Diagram(coordinateSystem(extent = {{-100, -180}, {130, 180}})));
end EmpMdl;