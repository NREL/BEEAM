within HPF.PowerConverters.SinglePhase;

model ACDC_1pBidirectionalSimple
  extends HPF.PowerConverters.SinglePhase.ACDC_1pConverterBase;
  import Modelica.ComplexMath.j;
  
  // Loss model parameters
  parameter Real alpha_ACDC = 0.0 "AC/DC loss model constant term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  parameter Real beta_ACDC =  0.1 "AC/DC loss model linear term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  parameter Real gamma_ACDC = 0.0 "AC/DC loss model quadratic term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  parameter Real alpha_DCAC = 0.0 "DC/AC loss model constant term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  parameter Real beta_DCAC =  0.1 "DC/AC loss model linear term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  parameter Real gamma_DCAC = 0.0 "DC/AC loss model quadratic term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  
  // Power factor parameters
  parameter Real PF = 1.0 "Operating power factor at fundamental frequency: + for lag, - for lead" annotation(Dialog(group="Control"));
  
  // AC measurements
  Real I_mag[systemDef.numHrm] = Modelica.ComplexMath.abs(phaseLN.i);
  Real I_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseLN.i);
  Real V_mag[systemDef.numHrm] = Modelica.ComplexMath.abs(phaseLN.v);
  Real V_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseLN.v);
  
  // Power at fundamental
  Real P1(start = P_nom) "Real power at fundamental";
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
  
  // Loss calculation (with smooth transition across zero)
  P_Loss = HPF.PowerConverters.HelperFunctions.homotopyTransition(P_AC, 0, alpha_ACDC*P_nom,
    (P_nom * (alpha_DCAC + beta_DCAC * (-P_AC/P_nom) + gamma_DCAC * (-P_AC/P_nom)^2)),
    (P_nom * (alpha_ACDC + beta_ACDC * (P_DC/P_nom) + gamma_ACDC * (P_DC/P_nom)^2)));

  // Real/reactive power at fundamental
  P1 = P_AC - sum(P_h[2:1:systemDef.numHrm]);
  Q1 = sign(PF) * P1 * sqrt(1/(PF^2) - 1);
  
  // Energy balance
  P_AC = P_DC + P_Loss;
  

  // Current injections: fundamental
  phaseLN.i[1].re = (P1 * phaseLN.v[1].re + Q1 * phaseLN.v[1].im) / (phaseLN.v[1].re ^ 2 + phaseLN.v[1].im ^ 2);
  phaseLN.i[1].im = (P1 * phaseLN.v[1].im - Q1 * phaseLN.v[1].re) / (phaseLN.v[1].re ^ 2 + phaseLN.v[1].im ^ 2);
  
  // Current injections: harmonics h > 1
  phaseLN.i[2:1:systemDef.numHrm] = {Complex(0, 0) for i in 1:systemDef.numHrm - 1};

  annotation (
    Icon,
    Documentation(info = "<html><head></head><body>
<p>Simple single-phase AC/DC bidirectional converter model.</p><p><h3>Sign Convention</h3><p>AC power P<sub>AC</sub> is defined as&nbsp;<i>into</i>&nbsp;the AC terminal and DC power P<sub>DC</sub> is defined as <i>out of</i>&nbsp;the DC terminal. For positive P<sub>AC</sub>&nbsp;and P<sub>DC</sub>&nbsp;the device is importing power from the AC grid; for negative P<sub>AC</sub>&nbsp;and P<sub>DC</sub>&nbsp;the device is exporting power to the AC grid.</p><h3>Harmonics Model</h3></p><p>This device operates with zero harmonic distortion and fixed, user-specified power factor (default PF = 1). Harmonic currents are zero for all h &gt; 1.</p><h3>Efficiency Model</h3><p>The AC/DC (rectifier) and DC/AC (inverter) stages of the converter use separate loss models:</p>
<p><img src=\"modelica://HPF/Resources/images/PowerConverters/eq_2stagelossmodel_bidirectional.png\"></p>
<p>For power import (AC to DC power transfer), losses are modeled as a quadratic function of the DC output power P<sub>DC</sub>. For power export (DC to AC power transfer), losses are modeled as a quadratic function of the AC output power (negative of input power, <i>i.e.</i>,&nbsp;−P<sub>AC</sub>). A homotopy function is used to ensure a smooth transition between the two quadratic loss models. The homotopy function is implemented by the&nbsp;<a href=\"modelica://HPF.PowerConverters.HelperFunctions.homotopyTransition\">homotopyTransition</a> function.</p>
<p>The loss model parameters (&alpha;, &beta;, &gamma;) for both the AC/DC and DC/AC conversions are implemented in per-unit, that is, normalized relative to device nominal power. Therefore, the model can be scaled easily to arbitrary voltage and power ratings.</p>
</body></html>"));
end ACDC_1pBidirectionalSimple;
