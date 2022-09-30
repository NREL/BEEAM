within HPF.PowerConverters.ThreePhase;

model ACDC_3pInverterSimpleGridForming
  extends HPF.PowerConverters.ThreePhase.ACDC_3pConverterBase;
  import Modelica.ComplexMath.j;
  // Voltage source parameters
  parameter Modelica.SIunits.Voltage vMag_ref = 120 "Output phase voltage magnitude";
  parameter Modelica.SIunits.Angle vArg_ref = 0 "Output phase voltage reference angle";
  
  final parameter Modelica.SIunits.Angle vAngle_ref_A = vArg_ref;
  final parameter Modelica.SIunits.Angle vAngle_ref_B = vArg_ref - Modelica.SIunits.Conversions.from_deg(120);
  final parameter Modelica.SIunits.Angle vAngle_ref_C = vArg_ref + Modelica.SIunits.Conversions.from_deg(120);
  // Loss model parameters
  parameter Real alpha = 0.0 "Loss model constant term (per-unit)" annotation(
    Dialog(group = "Converter Loss Model"));
  parameter Real beta = 0.1 "Loss model linear term (per-unit)" annotation(
    Dialog(group = "Converter Loss Model"));
  parameter Real gamma = 0.0 "Loss model quadratic term (per-unit)" annotation(
    Dialog(group = "Converter Loss Model"));
  parameter Modelica.SIunits.Power P_stby = 0 "Standby loss" annotation(
    Dialog(group = "Converter Loss Model"));
  parameter Modelica.SIunits.Power P_ACmin = 1 "Minimum output power (2-stage loss model)" annotation(Dialog(group="Converter Loss Model"));
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
  // Power at all harmonics
  Real PA_h[systemDef.numHrm] = phaseA.v[:].re .* phaseA.i[:].re + phaseA.v[:].im .* phaseA.i[:].im "Phase A real power at harmonics";
  Real PB_h[systemDef.numHrm] = phaseB.v[:].re .* phaseB.i[:].re + phaseB.v[:].im .* phaseB.i[:].im "Phase B real power at harmonics";
  Real PC_h[systemDef.numHrm] = phaseC.v[:].re .* phaseC.i[:].re + phaseC.v[:].im .* phaseC.i[:].im "Phase C real power at harmonics";
  // Total AC power input
  Real P_AC(start = P_nom) = -(sum(PA_h[:]) + sum(PB_h[:]) + sum(PC_h[:])) "Total AC power input";
  // DC power output
  Real P_DC = DC_Port.pwr "Total DC power output";
  
equation
// AC ouput voltage control: fundamental
  phaseA.v[1].re = vMag_ref * cos(vAngle_ref_A);
  phaseA.v[1].im = vMag_ref * sin(vAngle_ref_A);
  phaseB.v[1].re = vMag_ref * cos(vAngle_ref_B);
  phaseB.v[1].im = vMag_ref * sin(vAngle_ref_B);
  phaseC.v[1].re = vMag_ref * cos(vAngle_ref_C);
  phaseC.v[1].im = vMag_ref * sin(vAngle_ref_C);
// AC output voltage control: harmonics
  phaseA.v[2:1:systemDef.numHrm] = {Complex(0, 0) for i in 1:systemDef.numHrm - 1};
  phaseB.v[2:1:systemDef.numHrm] = {Complex(0,0) for i in 1:(systemDef.numHrm - 1)};
  phaseC.v[2:1:systemDef.numHrm] = {Complex(0,0) for i in 1:(systemDef.numHrm - 1)};
// Loss calculation
  P_Loss = HPF.PowerConverters.HelperFunctions.homotopyTransition(P_AC, 0, P_ACmin, P_stby, P_nom * (alpha + beta * (P_AC / P_nom) + gamma * (P_AC / P_nom) ^ 2));
// Energy balance
  P_DC = P_AC + P_Loss;
  annotation(
    Documentation(info = "<html><head></head><body>
<p>Simple 3-phase, grid-forming DC/AC converter (inverter) model. Output is voltage-controlled, with no voltage harmonics.</p><p></p><h3>Harmonics Model</h3><p></p><p>This device operates with zero harmonic voltage distortion and losslessly sinks all current harmonics.</p><h3>Efficiency Model</h3><p>This inverter uses a two-stage efficiency model:</p>
<p><img src=\"modelica://HPF/Resources/images/PowerConverters/eq_2stagelossmodel.png\"></p>
<p>The first (lower) stage models loss as a fixed standby power; the second (upper) stage models loss as a quadratic function of inverter AC power output. A homotopy function is used to ensure a smooth transition between the quadratic loss model and the standby power loss. The homotopy function is implemented by the&nbsp;<a href=\"modelica://HPF.PowerConverters.HelperFunctions.homotopyTransition\">homotopyTransition</a> function.</p>
<p>The loss model parameters (&alpha;, &beta;, &gamma;) are implemented in per-unit, that is, normalized relative to device nominal power. Therefore, the model can be scaled easily to arbitrary voltage and power ratings. However, the standby loss and minimum output power parameters are in Watts.</p>
</body></html>"));
end ACDC_3pInverterSimpleGridForming;
