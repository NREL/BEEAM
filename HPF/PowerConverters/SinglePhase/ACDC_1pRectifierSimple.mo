within HPF.PowerConverters.SinglePhase;

model ACDC_1pRectifierSimple
  extends HPF.PowerConverters.SinglePhase.ACDC_1pConverterBase;
  import Modelica.ComplexMath.j;
  
  // Loss model parameters
  parameter Real alpha = 0.0 "Loss model constant term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  parameter Real beta =  0.1 "Loss model linear term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  parameter Real gamma = 0.0 "Loss model quadratic term (per-unit)" annotation (Dialog(group = "Converter Loss Model"));
  parameter Modelica.SIunits.Power P_stby = 0 "Standby (no load) loss" annotation(Dialog(group="Converter Loss Model"));
  parameter Modelica.SIunits.Power P_DCmin = 0.5 "Minimum output power (2-stage loss model)" annotation(Dialog(group="Converter Loss Model"));
  
  // AC measurements
  Real I_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseLN.i);
  Real I_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseLN.i);
  Real V_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseLN.v);
  Real V_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseLN.v);
  
  // Reactive power at fundamental
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
  
  // Loss calculation
  P_Loss = HPF.PowerConverters.HelperFunctions.homotopyTransition(P_DC, 0, P_DCmin, P_stby, (P_nom * (alpha + beta * (P_DC/P_nom) + gamma * (P_DC/P_nom)^2)));
  
  // Real/reactive/apparent power at fundamental
  P1 = P_AC - sum(P_h[2:1:systemDef.numHrm]);
  Q1 = 0; // PF = 1 in this simple model
  
  // Energy balance
  P_AC = P_DC + P_Loss;
  
  // Current injections: fundamental
  phaseLN.i[1].re = (P1 * phaseLN.v[1].re + Q1 * phaseLN.v[1].im) / (phaseLN.v[1].re ^ 2 + phaseLN.v[1].im ^ 2);
  phaseLN.i[1].im = (P1 * phaseLN.v[1].im - Q1 * phaseLN.v[1].re) / (phaseLN.v[1].re ^ 2 + phaseLN.v[1].im ^ 2);
  
  // Current injections: harmonics h > 1
  phaseLN.i[2:1:systemDef.numHrm] = {Complex(0, 0) for i in 1:systemDef.numHrm - 1};
  
  // Annotation
  annotation(
    Icon,
    Documentation(info = "<html><head></head><body>
<div>Simple single-phase AC/DC converter (rectifier) model.</div><div><h3>Harmonics Model</h3></div><div>This device operates with zero harmonic distortion and unity power factor. Harmonic currents are zero for all h &gt; 1.</div><h3>Efficiency Model</h3><div>This device uses a two-stage efficiency model:</div>
<div><img src=\"modelica://HPF/Resources/images/PowerConverters/eq_2stagelossmodel.png\"></div>
<div>The first (lower) stage models loss as a fixed standby power; the second (upper) stage models loss as a quadratic function of converter output. A homotopy function is used to ensure a smooth transition between the quadratic loss model and the standby power loss. The homotopy function is implemented by the&nbsp;<a href=\"modelica://HPF.PowerConverters.HelperFunctions.homotopyTransition\">homotopyTransition</a> function.<p></p>
</div></body></html>"));
end ACDC_1pRectifierSimple;
