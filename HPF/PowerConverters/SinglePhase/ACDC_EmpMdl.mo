within HPF.PowerConverters.SinglePhase;
model ACDC_EmpMdl "AC to DC converter empirical model"
  extends HPF.SinglePhase.Interface.ACDC_ConverterBase;
  extends HPF.PowerConverters.Partials.HarmonicModel_Interp;
  import Modelica.ComplexMath.j;
  
  // TODO: Document that a default value of zero sets the standby power as computed by efficiency relation.
  /*
          Fundamental power drawn on the AC harmonic side.
          Using converter efficiency model
          
          Pin = Pout + alpha + beta*Pout + gamma*Pout^2
        */
  Real P_DC = abs(vDC.v * vDC.i);
  /*
  Input output power relation (Total input AC Power (sum over all harmonics))
    P_AC = p*P_stby + (1 - p)*f_effi(P_DC)
  alpha, beta, and gamma are now normalized with respect to nominal power
  */
    Real P = P_DC + HPF.PowerConverters.HelperFunctions.homotopyTransition(P_DC, 0, P_DCmin, P_stby, (nomP * (alpha[1, 1] + beta[1, 1] * (P_DC/nomP) + gamma[1, 1] * (P_DC/nomP)^2))) "Real power on AC side";
  
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
  Modelica.Blocks.Interfaces.RealOutput PLoss annotation (
    Placement(visible = true, transformation(origin = {10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 110},extent = {{-10, -10}, {10, 10}}, rotation = 90)));

protected
    
    // Power axis lookup is now normalized to nominal power (nomP) and magnitude output must be scaled by nominal current (nomI)
    
    // Query arg interplation in 2D at harmonics h>1, at power level P
    Real arg_hh[systemDef.numHrm - 1] = {HPF.Utilities.interpolateBilinear(mdl_H, mdl_P_h1, mdl_Z_arg, systemDef.hrms[i], (P1/nomP)) for i in 2:1:systemDef.numHrm};
    
    // Query mag interplation in 2D at harmonics h>1, at power level P
    Real c[systemDef.numHrm - 1] = {HPF.Utilities.interpolateBilinear(mdl_H, mdl_P_h1, mdl_Z_mag, systemDef.hrms[i], (P1/nomP))*nomI for i in 2:1:systemDef.numHrm};
    Real argS1 = -HPF.Utilities.interpolateBilinear(mdl_H, mdl_P_h1, mdl_Z_arg, 1, (P1/nomP)) "Phase angle for fundamental apparent power";     // angle for S(@h=1) using harmonic current model
    
  // Apply phase correction
  Real argAdj[systemDef.numHrm - 1] = arg_hh[:] + Modelica.ComplexMath.arg(loadBase.v[1]) .* systemDef.hrms[2:end];
  
  // intermediary variables for higher current harmonics
  Complex a[systemDef.numHrm - 1] = {Complex(cos(argAdj[i]), sin(argAdj[i])) for i in 1:systemDef.numHrm - 1};
  
equation
  
  // Power draw at the fundamental
  P1 = P - sum(loadBase.v[2:systemDef.numHrm].re .* loadBase.i[2:systemDef.numHrm].re .+ loadBase.v[2:systemDef.numHrm].im .* loadBase.i[2:systemDef.numHrm].im); // Power at harmonics > 1.
  
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
  loadBase.i[1].re = (P1 * loadBase.v[1].re + Q1 * loadBase.v[1].im) / (loadBase.v[1].re ^ 2 + loadBase.v[1].im ^ 2);
  loadBase.i[1].im = (P1 * loadBase.v[1].im - Q1 * loadBase.v[1].re) / (loadBase.v[1].re ^ 2 + loadBase.v[1].im ^ 2);
/*
    current injection for the rest of the harmonics.
  */
  loadBase.i[2:1:systemDef.numHrm] = {c[i] * a[i] for i in 1:systemDef.numHrm - 1};
  PLoss = P - P_DC;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Text(origin = {4, 0}, lineColor = {92, 53, 102}, extent = {{-184, -120}, {176, -160}}, textString = "%name"), Text(origin = {70, 115}, extent = {{-54, 15}, {54, -15}}, textString = "Ploss")}),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info = "<html><head></head><body>
<h4>General Information</h4>
Parameters for both the converter harmonic model and converter loss model described below are stored in a <i>mat</i> file generated by a model-fitting script. The empirical models are stored normalized such that the model can be scaled easily to use arbitrary AC voltage and power ratings.
<h4>Converter Harmonic Model</h4>
<p>Coupled harmonic model for an AC to DC converter. The harmonic model is based on empirical data from laboratory measurements. The AC side harmonics are modeled using a surface function evaluated at a given harmonic and real power at <i>h=1</i> using 2D interpolation.</p>

<p><img src=\"modelica://HPF/Resources/images/PowerConverters/img_pwrConvModel_interpMag.png\" style=\"width:12.34cm;height:9cm;\"></p>
<p>Figure 1. Surface function representing harmonic current variation as a function of input power (@<i>h=1</i>).</p>

<p>Harmonic injection spectra is determined using the model. The model data is in the form of a mat file.</p><h4>Converter Loss Model</h4>
<p>The converter loss is modeled as a 2-stage loss model:</p>
<p><br><img src=\"modelica://HPF/Resources/images/ConverterModels/SinglePhase/ACDC_EmpMdl/eq_pLoss_2stage.png\">.</p>
<p>The lambda function is implemented in <a href=\"modelica://HPF.PowerConverters.HelperFunctions.stbyPwrTransition\">stbyPwrTransition</a> function.</p>
<p><img src=\"modelica://HPF/Resources/images/ConverterModels/SinglePhase/ACDC_EmpMdl/eq_ploss.png\"></p>
<p><br></p><h4>Converter Model Data Files</h4><p></p>
<p>Data files for the available converter models can be found in <span style=\"font-family: Courier;\">HPF/Data/ConverterModels/SinglePhase/ACDC/</span></p>
</body></html>"));
end ACDC_EmpMdl;
