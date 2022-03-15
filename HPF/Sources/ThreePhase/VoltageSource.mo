within HPF.Sources.ThreePhase;
model VoltageSource "Three phase voltage source. Specify parameters as a Modelica vector {x1, x2, ...}."
  outer SystemDef systemDef;
  HPF.SinglePhase.Interface.HPin_P pinP_phA(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin={100,80},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={100,80},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinP_phB(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={100,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinP_phC(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N pinN(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource vSrc_phA( vArg = vArg_phA[1:systemDef.numHrm],vMag = vMag_phA[1:systemDef.numHrm])  annotation (
     Placement(visible = true, transformation(origin = {-10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.SinglePhase.Sources.VoltageSource vSrc_phC(vMag = vMag_phC[1:systemDef.numHrm], vArg = vArg_phC[1:systemDef.numHrm]) annotation (
    Placement(visible = true, transformation(origin = {-10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.SinglePhase.Sources.VoltageSource vSrc_phB(vMag = vMag_phB[1:systemDef.numHrm], vArg = vArg_phB[1:systemDef.numHrm]) annotation (
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));

  parameter Modelica.SIunits.Voltage vMag_phA[:] = {1} "Phase A magnitude";
  parameter Real vArg_phA[:] = {1} "Phase A angle";
  parameter Modelica.SIunits.Voltage vMag_phB[:] = {1} "Phase B magnitude";
  parameter Real vArg_phB[:] = {1} "Phase B angle";
  parameter Modelica.SIunits.Voltage vMag_phC[:] = {1} "Phase C magnitude";
  parameter Real vArg_phC[:] = {1} "Phase C angle";
                    Modelica.Blocks.Interfaces.RealOutput P annotation(
    Placement(visible = true, transformation(origin = {-102, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));

  
//protected
equation
  P = sum(vSrc_phA.v[:].re .* vSrc_phA.i[:].re + vSrc_phA.v[:].im .* vSrc_phA.i[:].im) +
    sum(vSrc_phB.v[:].re .* vSrc_phB.i[:].re + vSrc_phB.v[:].im .* vSrc_phB.i[:].im) +
    sum(vSrc_phC.v[:].re .* vSrc_phC.i[:].re + vSrc_phC.v[:].im .* vSrc_phC.i[:].im);
  connect(vSrc_phA.pin_p, pinP_phA) annotation (
    Line(points={{0,60},{98,60},{98,80},{100,80}},          color = {92, 53, 102}));
  connect(vSrc_phA.pin_n, pinN) annotation (
    Line(points = {{-20, 60}, {-60, 60}, {-60, -80}, {100, -80}, {100, -80}}, color = {117, 80, 123}));
  connect(vSrc_phC.pin_p, pinP_phC) annotation (
    Line(points = {{0, -40}, {100, -40}, {100, -40}, {100, -40}}, color = {92, 53, 102}));
  connect(vSrc_phB.pin_p, pinP_phB) annotation (
    Line(points = {{0, 0}, {100, 0}, {100, 0}, {102, 0}}, color = {92, 53, 102}));
  connect(vSrc_phB.pin_n, pinN) annotation (
    Line(points = {{-20, 0}, {-60, 0}, {-60, -80}, {100, -80}, {100, -80}}, color = {117, 80, 123}));
  connect(vSrc_phC.pin_n, pinN) annotation (
    Line(points = {{-20, -40}, {-60, -40}, {-60, -80}, {100, -80}, {100, -80}}, color = {117, 80, 123}));

annotation (
    Icon(graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}), Ellipse(origin = {-15, 7}, extent = {{-45, 53}, {75, -67}}, endAngle = 360), Line(origin = {0.249088, 0.860912}, points = {{-40.0807, -1.02713}, {-36.0807, 10.9729}, {-32.0807, 20.9729}, {-26.0807, 28.9729}, {-18.0807, 32.9729}, {-8.08074, 24.9729}, {-4.08074, 12.9729}, {-0.0807397, -1.02713}, {3.91926, -13.0271}, {5.91926, -19.0271}, {11.9193, -29.0271}, {21.9193, -35.0271}, {29.9193, -25.0271}, {33.9193, -17.0271}, {37.9193, -7.02713}, {39.9193, -1.02713}, {39.9193, -1.02713}}, smooth = Smooth.Bezier), Text(origin = {105, -93}, extent = {{-11, 3}, {35, -37}}, textString = "C"), Text(origin = {109, -15}, extent = {{-11, 3}, {35, -37}}, textString = "B"), Text(origin = {109, 61}, extent = {{-11, 3}, {35, -37}}, textString = "A"), Text(origin = {-176, -200}, lineColor = {92, 53, 102}, extent = {{-150, 60}, {254, 100}}, textString = "%name"), Text(origin = {66, 58}, extent = {{-94, 70}, {12, 42}}, textString = "P")}, coordinateSystem(initialScale = 0.1, extent = {{-80, -80}, {80, 80}})),
    Documentation(info = "<html><head></head><body><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">Input data should be a Modelica or C/C++ style vector.</span><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><br></span></div><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">Voltage source with internal impedance.&nbsp;</span></div></body></html>"),
  Diagram(coordinateSystem(extent = {{-80, -80}, {80, 80}}, initialScale = 0.1)));
end VoltageSource;
