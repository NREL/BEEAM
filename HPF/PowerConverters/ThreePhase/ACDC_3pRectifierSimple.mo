within HPF.PowerConverters.ThreePhase;

model ACDC_3pRectifierSimple
  extends HPF.PowerConverters.ThreePhase.ACDC_3pConverterBase;
  import Modelica.ComplexMath.j;
  
  // DC output: voltage controlled
  Modelica.Electrical.Analog.Sources.ConstantVoltage vDC(V = VDC_nom) annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

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
  Real P1(start = P_nom) "Real power at fundamental";
  Real Q1(start = 0) "Reactive power at fundamental";
  
  // Power at all harmonics
  Real PA_h[systemDef.numHrm] = phaseA.v[:].re .* phaseA.i[:].re + phaseA.v[:].im .* phaseA.i[:].im "Phase A real power at harmonics";
  Real PB_h[systemDef.numHrm] = phaseB.v[:].re .* phaseB.i[:].re + phaseB.v[:].im .* phaseB.i[:].im "Phase B real power at harmonics";
  Real PC_h[systemDef.numHrm] = phaseC.v[:].re .* phaseC.i[:].re + phaseC.v[:].im .* phaseC.i[:].im "Phase C real power at harmonics";
  
  // Total AC power input
  Real P_AC(start = P_nom) "Total AC power input";
  
  // DC power output
  Real P_DC = vDC.v * (-vDC.i) "Total DC power output";
  
  // Loss (internal use)
  Real P_Loss(start = 0);
  
equation  
  // Loss calculation
  P_Loss = 0.0 * P_DC; // TO IMPLEMENT LATER
  
  // Real/reactive power at fundamental
  P1 = P_AC - (sum(PA_h[2:systemDef.numHrm]) + sum(PB_h[2:systemDef.numHrm]) + sum(PC_h[2:systemDef.numHrm]));
  Q1 = 0; // PF = 1 in this simple model
  
  // Energy balance
  P_AC = sum(PA_h[:]) + sum(PB_h[:]) + sum(PC_h[:]);
  P_AC = P_DC + P_Loss;
  
  // Current injections: fundamental
  phaseA.i[1].re = ((P1/3) * phaseA.v[1].re + (Q1/3) * phaseA.v[1].im) / (phaseA.v[1].re ^ 2 + phaseA.v[1].im ^ 2);
  phaseA.i[1].im = ((P1/3) * phaseA.v[1].im - (Q1/3) * phaseA.v[1].re) / (phaseA.v[1].re ^ 2 + phaseA.v[1].im ^ 2);
  phaseB.i[1].re = ((P1/3) * phaseB.v[1].re + (Q1/3) * phaseB.v[1].im) / (phaseB.v[1].re ^ 2 + phaseB.v[1].im ^ 2);
  phaseB.i[1].im = ((P1/3) * phaseB.v[1].im - (Q1/3) * phaseB.v[1].re) / (phaseB.v[1].re ^ 2 + phaseB.v[1].im ^ 2);
  phaseC.i[1].re = ((P1/3) * phaseC.v[1].re + (Q1/3) * phaseC.v[1].im) / (phaseC.v[1].re ^ 2 + phaseC.v[1].im ^ 2);
  phaseC.i[1].im = ((P1/3) * phaseC.v[1].im - (Q1/3) * phaseC.v[1].re) / (phaseC.v[1].re ^ 2 + phaseC.v[1].im ^ 2);
  
  // Note: Power (not current) is assumed balanced across phases; this might not be accurate?
  
  // Current injections: harmonics h > 1
  phaseA.i[2:1:systemDef.numHrm] = {Complex(0,0) for i in 1:(systemDef.numHrm - 1)};
  phaseB.i[2:1:systemDef.numHrm] = {Complex(0,0) for i in 1:(systemDef.numHrm - 1)};
  phaseC.i[2:1:systemDef.numHrm] = {Complex(0,0) for i in 1:(systemDef.numHrm - 1)};
  
  // Loss output
  PLoss = P_Loss;
    
  // Connections
  connect(vDC.p, pin_p) annotation(
    Line(points = {{60, 10}, {60, 80}, {80, 80}}, color = {0, 0, 255}));
  connect(vDC.n, pin_n) annotation(
    Line(points = {{60, -10}, {60, -80}, {80, -80}}, color = {0, 0, 255}));
end ACDC_3pRectifierSimple;
