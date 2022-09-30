within HPF.PowerConverters.ThreePhase;

model ACDC_3pInverterSimple
  extends HPF.PowerConverters.ThreePhase.ACDC_3pConverterBase;
  import Modelica.ComplexMath.j;
  
  // Loss model parameters
  parameter Real alpha = 0.0 "Loss model constant term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  parameter Real beta =  0.1 "Loss model linear term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  parameter Real gamma = 0.0 "Loss model quadratic term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  parameter Modelica.SIunits.Power P_stby = 0 "Standby (night tare) loss" annotation(Dialog(group="Converter Loss Model"));
  
  // Power factor parameters
  parameter Real PF = 1.0 "Operating power factor at fundamental frequency: + for lag, - for lead" annotation(Dialog(group="Control"));
  
  // AC measurements: Phases A, B, C
  Real IA_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseA.i);
  Real IB_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseB.i);
  Real IC_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseC.i);
  Real IA_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseA.i);
  Real IB_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseB.i);
  Real IC_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseC.i);
  Real VA_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseA.v);
  Real VB_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseB.v);
  Real VC_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseC.v);
  Real VA_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseA.v);
  Real VB_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseB.v);
  Real VC_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseC.v);
  
  // Power at fundamental
  Real P1(start = P_nom) "Real power supplied at fundamental";
  Real Q1(start = 0) "Reactive power supplied at fundamental";
  
  // Power at all harmonics
  Real PA_h[systemDef.numHrm] = phaseA.v[:].re .* phaseA.i[:].re + phaseA.v[:].im .* phaseA.i[:].im "Phase A real power at harmonics";
  Real PB_h[systemDef.numHrm] = phaseB.v[:].re .* phaseB.i[:].re + phaseB.v[:].im .* phaseB.i[:].im "Phase B real power at harmonics";
  Real PC_h[systemDef.numHrm] = phaseC.v[:].re .* phaseC.i[:].re + phaseC.v[:].im .* phaseC.i[:].im "Phase C real power at harmonics";
  
  // Total AC power input
  Real P_AC(start = P_nom) "Total AC power output";
  
  // DC power output
  Real P_DC = DC_Port.pwr "Total DC power input";
  
equation  
  // Loss calculation
  P_Loss = HPF.PowerConverters.HelperFunctions.homotopyTransition(P_AC, -P_stby, 0, P_stby, (P_nom * (alpha + beta * (P_AC/P_nom) + gamma * (P_AC/P_nom)^2)));
  
  // Real/reactive power at fundamental
  P1 = P_AC - (sum(PA_h[2:systemDef.numHrm]) + sum(PB_h[2:systemDef.numHrm]) + sum(PC_h[2:systemDef.numHrm]));
  Q1 = sign(PF) * P1 * sqrt(1/(PF^2) - 1);
  
  // Energy balance
  P_DC = P_AC + P_Loss;
  
  // Current injections: fundamental (negative sign to reverse power flow direction)
  phaseA.i[1].re = -((P1/3) * phaseA.v[1].re + (Q1/3) * phaseA.v[1].im) / (phaseA.v[1].re ^ 2 + phaseA.v[1].im ^ 2);
  phaseA.i[1].im = -((P1/3) * phaseA.v[1].im - (Q1/3) * phaseA.v[1].re) / (phaseA.v[1].re ^ 2 + phaseA.v[1].im ^ 2);
  phaseB.i[1].re = -((P1/3) * phaseB.v[1].re + (Q1/3) * phaseB.v[1].im) / (phaseB.v[1].re ^ 2 + phaseB.v[1].im ^ 2);
  phaseB.i[1].im = -((P1/3) * phaseB.v[1].im - (Q1/3) * phaseB.v[1].re) / (phaseB.v[1].re ^ 2 + phaseB.v[1].im ^ 2);
  phaseC.i[1].re = -((P1/3) * phaseC.v[1].re + (Q1/3) * phaseC.v[1].im) / (phaseC.v[1].re ^ 2 + phaseC.v[1].im ^ 2);
  phaseC.i[1].im = -((P1/3) * phaseC.v[1].im - (Q1/3) * phaseC.v[1].re) / (phaseC.v[1].re ^ 2 + phaseC.v[1].im ^ 2);
  
  // Note: Power (not current) is assumed balanced across phases; this might not be accurate?
  
  // Current injections: harmonics h > 1
  phaseA.i[2:1:systemDef.numHrm] = {Complex(0,0) for i in 1:(systemDef.numHrm - 1)};
  phaseB.i[2:1:systemDef.numHrm] = {Complex(0,0) for i in 1:(systemDef.numHrm - 1)};
  phaseC.i[2:1:systemDef.numHrm] = {Complex(0,0) for i in 1:(systemDef.numHrm - 1)};
  
annotation(
    Documentation(info = "<html><head></head><body>
<p>Simple 3-phase, grid-following DC/AC converter (inverter) model. Real and reactive power are balanced across the three AC phases. There is no voltage control of either input or output.</p><p></p><h3>Harmonics Model</h3><p></p><p>This device operates with zero harmonic distortion and fixed, user-specified power factor (default PF = 1). Harmonic currents are zero for all h &gt; 1.</p><h3>Efficiency Model</h3><p>This device uses a two-stage efficiency model:</p>
<p><img src=\"modelica://HPF/Resources/images/PowerConverters/eq_2stagelossmodel_inverter.png\"></p>
<p>For AC output power greater than zero, the loss is modeled as a quadratic function of inverter output. For AC output power less than or equal to zero, the loss is a fixed standby, or \"night tare\", value. (When AC output power is less than zero, it represents standby losses drawn from the AC grid.) A homotopy function is used to ensure a smooth transition between the quadratic loss model and the standby power loss. The homotopy function is implemented by the&nbsp;<a href=\"modelica://HPF.PowerConverters.HelperFunctions.homotopyTransition\">homotopyTransition</a> function.
</p>
<p>The loss model parameters (α, β, γ) are implemented in per-unit, that is, normalized relative to device nominal power. Therefore, the model can be scaled easily to arbitrary voltage and power ratings. However, the standby (night tare) loss parameter is in Watts.</p>
</body></html>"));
end ACDC_3pInverterSimple;
