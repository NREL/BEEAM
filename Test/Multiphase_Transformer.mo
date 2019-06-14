within HPF.Test;
model Multiphase_Transformer
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms={1}, modeSelPrev(fixed=true, start=true))
                                annotation (
    Placement(visible = true, transformation(origin = {-50, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Machines.Transformers_iPh.Test_DY test_DY1 annotation (
    Placement(visible = true, transformation(origin={-6,32},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z=10 + 2*j)
                                         annotation (
    Placement(visible = true, transformation(origin={58,38},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance     z1(z=10 + 2*j)
                                         annotation (
    Placement(visible = true, transformation(origin={58, 18},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance     z2(z=10 + 2*j)
                                         annotation (
    Placement(visible = true, transformation(origin={58, -4},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0}, vMag = {100})  annotation (Placement(visible = true, transformation(origin={-98,26},    extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  HPF.SinglePhase.Sources.VoltageSource v1(vArg = {3}, vMag = {100})  annotation (Placement(visible = true, transformation(origin={-76,14},    extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  HPF.SinglePhase.Sources.VoltageSource v2(vArg = {2.5}, vMag = {100})  annotation (Placement(visible = true, transformation(origin = {-52, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  HPF.SinglePhase.Components.Ground ground
    annotation (Placement(visible = true, transformation(extent = {{-102, -34}, {-82, -14}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1
    annotation (Placement(visible = true, transformation(extent = {{68, -26}, {88, -6}}, rotation = 0)));
equation

  connect(test_DY1.hPin_P1, z.pin_p)
    annotation (Line(points={{4,38},{22,38},{22,16},{34,16},{34,38},{48,38}},
                                               color={0,0,0}));
  connect(test_DY1.hPin_P2, z1.pin_p)
    annotation (Line(points={{4,34},{26,34},{26,18},{48,18}},  color={0,0,0}));
  connect(test_DY1.hPin_P3, z2.pin_p)
    annotation (Line(points={{4,30},{20,30},{20,-4},{48,-4}},  color={0,0,0}));
  connect(v.pin_n, test_DY1.pinPrim_A) annotation (Line(points={{-98,36},{-56,
          36},{-56,37},{-16,37}},
                              color={117,80,123}));
  connect(test_DY1.pinPrim_B, v1.pin_n) annotation (Line(points={{-16,32},{-46,
          32},{-46,24},{-76,24}},
                              color={0,0,0}));
  connect(v2.pin_n, test_DY1.pinPrim_C) annotation (Line(points={{-52,0},{-42,0},
          {-42,27},{-16,27}}, color={117,80,123}));
  connect(v.pin_p, ground.pin)
    annotation (Line(points={{-98,16},{-98,-2},{-94,-2},{-94,-24},{-92,-24}},
                                                   color={0,0,0}));
  connect(v1.pin_p, ground.pin) annotation (Line(points={{-76,4},{-90,4},{-90,
          -24},{-92,-24}},color={0,0,0}));
  connect(v2.pin_p, ground.pin) annotation (Line(points={{-52,-20},{-80,-20},{
          -80,-24},{-92,-24}},
                      color={0,0,0}));
  connect(z.pin_n, ground1.pin)
    annotation (Line(points={{68,38},{78,38},{78,-16}},
                                                      color={117,80,123}));
  connect(z2.pin_n, ground1.pin)
    annotation (Line(points={{68,-4},{78,-4},{78,-16}},
                                                      color={117,80,123}));
  connect(z1.pin_n, ground1.pin)
    annotation (Line(points={{68,18},{78,18},{78,-16}},
                                                      color={117,80,123}));
  connect(test_DY1.hPin_N, ground1.pin) annotation (Line(points={{4,26},{16,26},
          {16,8},{78,8},{78,-16}},
                                 color={117,80,123}));
annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent={{-120,-100},{120,100}})),
    Diagram(coordinateSystem(extent={{-120,-100},{120,100}},      grid = {0, 0})));
end Multiphase_Transformer;
