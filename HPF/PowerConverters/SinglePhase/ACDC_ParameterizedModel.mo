within HPF.PowerConverters.SinglePhase;

model ACDC_ParameterizedModel "AC to DC converter parameterized harmonic model"
  extends HPF.SinglePhase.Interface.ACDC_ConverterBase;
  extends HPF.PowerConverters.Partials.HarmonicModel_Parameterized;
  import Modelica.ComplexMath.j;
  parameter Real magModelParams[6] = {0, 0, 0, 0, 0, 0} "Magnitude model parameters";
  parameter Real phAngModelParams[3] = {0, 0, 0} "Phase angle model parameters";
  parameter Modelica.SIunits.Voltage V_Rect(start = 0) = 1 "Rectifier DC output";
  parameter Modelica.SIunits.Power nomP = 50 "Rated nominal power";
  parameter Modelica.SIunits.Voltage nomV = 120 "Nominal operating voltage";
  parameter Modelica.SIunits.Power P_DCmin = 0.5 "P_DC minimum";
  parameter Modelica.SIunits.Power P_stby = 0 "Standby (no load) input AC power";
  parameter Modelica.SIunits.Angle vAngle = 0 "Nominal voltage angle for solver init";
  // TODO: Document that a default value of zero sets the stanby power as computed by efficiency relation.
  /*
          Fundamental power drawn on the AC harmonic side.
          Using converter efficiency model
          
          Pin = Pout + alpha + beta*Pout + gamma*Pout^2
        */
  Real P_DC = abs(vDC.v * vDC.i);
  /* Input output power relation (Total input AC Power (sum over all harmonics))
        P_AC = p*P_stby + (1 - p)*f_effi(P_DC)
      */
  Real P = HPF.PowerConverters.HelperFunctions.stbyPwrTransition(P_DCmin, P_stby, P_DC) * P_stby + (1 - HPF.PowerConverters.HelperFunctions.stbyPwrTransition(P_DCmin, P_stby, P_DC)) * (P_DC + alpha[1, 1] + beta[1, 1] * P_DC + gamma[1, 1] * P_DC ^ 2);
  /*
          Measurements
      */
  Real I_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(loadBase.i);
  Real I_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(loadBase.i);
  Real V_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(loadBase.v);
  Real V_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(loadBase.v);
  Real P_h[systemDef.numHrm] = loadBase.v[:].re .* loadBase.i[:].re + loadBase.v[:].im .* loadBase.i[:].im "Real power at harmonics";
  // intermediary variables
  Real P1(start = nomP) "Real power at fundamental";
  Real S1(start = nomP) "Apparent power at fundamental";
  Real Q1(start = 1) "Imaginary power at fundamental";
  // diagnostics: Check if the computed h=1 current mag matches the input surface model
  Real diag_I_mag_h1 = HPF.Utilities.interpolateBilinear(mdl_H, mdl_P_h1, mdl_Z_mag, 1, P);
  Modelica.Blocks.Interfaces.RealOutput PLoss annotation(
    Placement(visible = true, transformation(origin = {10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 110},extent = {{-10, -10}, {10, 10}}, rotation = 90)));
protected
  Real argS1 "Phase angle for fundamental apparent power";
  Real magScale = Modelica.ComplexMath.'abs'(loadBase.i[1]);
  /*  The time domain plots are correct suggesting that there is no need to add the 
            anticipated phase shift suggesting a reverse direction for the current. 
        */
  // Querry arg interplation in 2D at harmonics h>1, at power level P
  Real arg_hh[systemDef.numHrm - 1] = {HPF.Utilities.interpolateBilinear(mdl_H, mdl_P_h1, mdl_Z_arg, systemDef.hrms[i], P) for i in 2:1:systemDef.numHrm};
  // Apply phase correction
  Real argAdj[systemDef.numHrm - 1] = arg_hh[:] + Modelica.ComplexMath.arg(loadBase.v[1]) .* systemDef.hrms[2:end];
  // intermediary variables for higher current harmonics
  Complex a[systemDef.numHrm - 1] = {Complex(cos(argAdj[i]), sin(argAdj[i])) for i in 1:systemDef.numHrm - 1};
  // Querry mag interplation in 2D at harmonics h>1, at power level P
  Real c[systemDef.numHrm - 1] = {HPF.Utilities.interpolateBilinear(mdl_H, mdl_P_h1, mdl_Z_mag, systemDef.hrms[i], P1) for i in 2:1:systemDef.numHrm};
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
  argS1 = -HPF.Utilities.interpolateBilinear(mdl_H, mdl_P_h1, mdl_Z_arg, 1, P);
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
  loadBase.i[1].re = (P1 * loadBase.v[1].re + Q1 * loadBase.v[1].im) / (loadBase.v[1].re ^ 2 + loadBase.v[1].im ^ 2);
  loadBase.i[1].im = (P1 * loadBase.v[1].im - Q1 * loadBase.v[1].re) / (loadBase.v[1].re ^ 2 + loadBase.v[1].im ^ 2);
/*
    current injection for the rest of the harmonics.
  */
  loadBase.i[2:1:systemDef.numHrm] = {c[i] * a[i] for i in 1:systemDef.numHrm - 1};
  PLoss = P - P_DC;
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false), graphics = {Text(origin = {4, 0}, lineColor = {92, 53, 102}, extent = {{-184, -120}, {176, -160}}, textString = "%name"), Text(origin = {70, 115}, extent = {{-54, 15}, {54, -15}}, textString = "Ploss")}),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info = "<html><head></head><body><h4>Converter harmonic model</h4>
<p>...</p>
<h4>Converter loss model</h4>
<p>The converter loss is modeled as a 2-stage loss model:</p>
<p><br><img src=\"modelica://HPF/Resources/images/ConverterModels/SinglePhase/ACDC_EmpMdl/eq_pLoss_2stage.png\">.</p>
<p>The lambda function is implemented in <a href=\"modelica://HPF.PowerConverters.HelperFunctions.stbyPwrTransition\">stbyPwrTransition</a> function.</p>
<p><img src=\"modelica://HPF/Resources/images/ConverterModels/SinglePhase/ACDC_EmpMdl/eq_ploss.png\"></p>
<p><br></p><h4><br></h4>
</body></html>"));
end ACDC_ParameterizedModel;