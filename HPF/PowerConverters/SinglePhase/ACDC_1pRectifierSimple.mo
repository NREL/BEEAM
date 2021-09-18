within HPF.PowerConverters.SinglePhase;

model ACDC_1pRectifierSimple
  extends HPF.PowerConverters.SinglePhase.ACDC_1pConverterBase;
  import Modelica.ComplexMath.j;
  
  // AC measurements
  Real I_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseLN.i);
  Real I_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseLN.i);
  Real V_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseLN.v);
  Real V_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseLN.v);
  
  // Reactive power at fundamental
  Real P1(start = P_nom) "Real power at fundamental";
  Real S1(start = P_nom) "Apparent power at fundamental";
  Real Q1(start = 0) "Reactive power at fundamental";
  
  // Power at all harmonics
  Real P_h[systemDef.numHrm] = phaseLN.v[:].re .* phaseLN.i[:].re + phaseLN.v[:].im .* phaseLN.i[:].im "AC real power at harmonics";
  
  // Total AC power input
  Real P_AC(start = P_nom) "Total AC power input";
  
  // DC power output
  Real P_DC = -DC_Port.pwr "Total DC power output";
equation
  // Control DC output voltage
  DC_Port.v = VDC_nom;
  
  // Loss calculation
  P_Loss = 0.0 * P_DC; // TO IMPLEMENT LATER
  
  // Real/reactive/apparent power at fundamental
  P1 = P_AC - sum(P_h[2:1:systemDef.numHrm]);
  Q1 = 0; // PF = 1 in this simple model
  S1 ^ 2 = P1 ^ 2 + Q1 ^ 2;
  
  // Energy balance
  P_AC = P_DC + P_Loss;
  
  // Current injections: fundamental
  phaseLN.i[1].re = (P1 * phaseLN.v[1].re + Q1 * phaseLN.v[1].im) / (phaseLN.v[1].re ^ 2 + phaseLN.v[1].im ^ 2);
  phaseLN.i[1].im = (P1 * phaseLN.v[1].im - Q1 * phaseLN.v[1].re) / (phaseLN.v[1].re ^ 2 + phaseLN.v[1].im ^ 2);
  
  // Current injections: harmonics h > 1
  phaseLN.i[2:1:systemDef.numHrm] = {Complex(0, 0) for i in 1:systemDef.numHrm - 1};
  
  // Annotation
  annotation(
    Icon);
end ACDC_1pRectifierSimple;
