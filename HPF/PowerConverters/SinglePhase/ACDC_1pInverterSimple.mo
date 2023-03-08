within HPF.PowerConverters.SinglePhase;

model ACDC_1pInverterSimple
  extends HPF.PowerConverters.SinglePhase.ACDC_1pConverterBase(phaseLN.start_i_im = cat(1, {-IAC_nom * sin(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), phaseLN.start_i_re = cat(1, {-IAC_nom * cos(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}));
  import Modelica.ComplexMath.j;
  
  // Loss model parameters
  parameter Real alpha = 0.0 "Loss model constant term (per-unit)" annotation(
    Dialog(group = "Converter Loss Model"));
  parameter Real beta = 0.1 "Loss model linear term (per-unit)" annotation(
    Dialog(group = "Converter Loss Model"));
  parameter Real gamma = 0.0 "Loss model quadratic term (per-unit)" annotation(
    Dialog(group = "Converter Loss Model"));
  parameter Modelica.Units.SI.Power P_stby = 0 "Standby (night tare) loss" annotation(
    Dialog(group = "Converter Loss Model"));
  
  // Power factor parameters
  parameter Real PF = 1.0 "Operating power factor at fundamental frequency: + for lag, - for lead" annotation(
    Dialog(group = "Control"));
  
  // AC measurements
  Real I_mag[systemDef.numHrm] = Modelica.ComplexMath.abs(phaseLN.i);
  Real I_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseLN.i);
  Real V_mag[systemDef.numHrm] = Modelica.ComplexMath.abs(phaseLN.v);
  Real V_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseLN.v);
  
  // Power at fundamental
  Real P1(start = P_nom) "Real power supplied at fundamental";
  Real Q1(start = 0) "Reactive power supplied at fundamental";
  
  // Power at all harmonics
  Real P_h[systemDef.numHrm] = phaseLN.v[:].re .* phaseLN.i[:].re + phaseLN.v[:].im .* phaseLN.i[:].im "AC real power at harmonics";
  
  // Total AC power input
  Real P_AC(start = P_nom) "Total AC power output";
  
  // DC power input
  Real P_DC = DC_Port.pwr "Total DC power input";
equation
  // Loss calculation
  P_Loss = HPF.PowerConverters.HelperFunctions.homotopyTransition(P_AC, -P_stby, 0, P_stby, P_nom * (alpha + beta * (P_AC / P_nom) + gamma * (P_AC / P_nom) ^ 2));
  
  // Real/reactive/apparent power at fundamental
  P1 = P_AC - sum(P_h[2:1:systemDef.numHrm]);
  Q1 = sign(PF) * P1 * sqrt(1 / PF ^ 2 - 1);
  
  // Energy balance
  P_DC = P_AC + P_Loss;
  
  // Current injections: fundamental (negative sign to reverse power flow direction)
  phaseLN.i[1].re = -(P1 * phaseLN.v[1].re + Q1 * phaseLN.v[1].im) / (phaseLN.v[1].re ^ 2 + phaseLN.v[1].im ^ 2);
  phaseLN.i[1].im = -(P1 * phaseLN.v[1].im - Q1 * phaseLN.v[1].re) / (phaseLN.v[1].re ^ 2 + phaseLN.v[1].im ^ 2);
  
  // Current injections: harmonics h > 1
  phaseLN.i[2:1:systemDef.numHrm] = {-1 * Complex(0, 0) for i in 1:systemDef.numHrm - 1};
  
  // Annotation
  annotation(
    Icon,
    Documentation(info = "<html><head></head><body>
<p>Simple single-phase, grid-following DC/AC converter (inverter) model. There is no voltage control of either input or output.</p><p></p><h3>Harmonics Model</h3><p></p><p>This device operates with zero harmonic distortion and fixed, user-specified power factor (default PF = 1). Harmonic currents are zero for all h &gt; 1.</p><h3>Efficiency Model</h3><p>This device uses a two-stage efficiency model:</p>
<p><img src=\"modelica://HPF/Resources/images/PowerConverters/eq_2stagelossmodel_inverter.png\"></p>
<p>For AC output power greater than zero, the loss is modeled as a quadratic function of inverter output. For AC output power less than or equal to zero, the loss is a fixed standby, or \"night tare\", value. (When AC output power is less than zero, it represents standby losses drawn from the AC grid.) A homotopy function is used to ensure a smooth transition between the quadratic loss model and the standby power loss. The homotopy function is implemented by the&nbsp;<a href=\"modelica://HPF.PowerConverters.HelperFunctions.homotopyTransition\">homotopyTransition</a> function.
</p>
<p>The loss model parameters (α, β, γ) are implemented in per-unit, that is, normalized relative to device nominal power. Therefore, the model can be scaled easily to arbitrary voltage and power ratings. However, the standby (night tare) loss parameter is in Watts.</p>
</body></html>"));
end ACDC_1pInverterSimple;
