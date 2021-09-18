within HPF.PowerConverters.SinglePhase;

model ACDC_1pInverterSimple
  extends HPF.PowerConverters.SinglePhase.ACDC_1pConverterBase(phaseLN.start_i_im = cat(1, {-IAC_nom * sin(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), phaseLN.start_i_re = cat(1, {-IAC_nom * cos(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}));
  import Modelica.ComplexMath.j;

  // AC measurements
  Real I_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseLN.i);
  Real I_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseLN.i);
  Real V_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseLN.v);
  Real V_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseLN.v);
  
  // Power at fundamental
  Real P1(start = P_nom) "Real power at fundamental";
  Real S1(start = P_nom) "Apparent power at fundamental";
  Real Q1(start = 0) "Reactive power at fundamental";
  
  // Power at all harmonics
  Real P_h[systemDef.numHrm] = phaseLN.v[:].re .* phaseLN.i[:].re + phaseLN.v[:].im .* phaseLN.i[:].im "AC real power at harmonics";
  
  // Total AC power input
  Real P_AC(start = P_nom) "Total AC power output";
  
  // DC power input
  Real P_DC = DC_Port.pwr "Total DC power input";
  
equation
  // Loss calculation
  P_Loss = 0.0 * P_AC; // TO IMPLEMENT LATER
  
  // Real/reactive/apparent power at fundamental
  P1 = P_AC - sum(P_h[2:1:systemDef.numHrm]);
  Q1 = 0; // PF = 1 in this simple model
  S1 ^ 2 = P1 ^ 2 + Q1 ^ 2;
  
  // Energy balance
  P_DC = P_AC + P_Loss;
  
  // Current injections: fundamental (negative sign to reverse power flow direction)
  phaseLN.i[1].re = -(P1 * phaseLN.v[1].re + Q1 * phaseLN.v[1].im) / (phaseLN.v[1].re ^ 2 + phaseLN.v[1].im ^ 2);
  phaseLN.i[1].im = -(P1 * phaseLN.v[1].im - Q1 * phaseLN.v[1].re) / (phaseLN.v[1].re ^ 2 + phaseLN.v[1].im ^ 2);
  
  // Current injections: harmonics h > 1
  phaseLN.i[2:1:systemDef.numHrm] = {-1*Complex(0, 0) for i in 1:systemDef.numHrm - 1};
  
  // Annotation
  annotation(
    Icon);
end ACDC_1pInverterSimple;
