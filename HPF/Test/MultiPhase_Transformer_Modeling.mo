within HPF.Test;
model MultiPhase_Transformer_Modeling
  inner HPF.SystemDef systemDef annotation (
    Placement(visible = true, transformation(origin = {-182, 186}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r(r = 150.1 * 2.30769 ^ 2)  annotation (
    Placement(visible = true, transformation(origin = {58, 156}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Inductor l(L = 0.00291932059447983014861995753715)  annotation (
    Placement(visible = true, transformation(origin = {-52, 176}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r1(r = 2.7672)  annotation (
    Placement(visible = true, transformation(origin = {-80, 176}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor R2(r = 3536.58)  annotation (
    Placement(visible = true, transformation(origin = {-28, 154}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Inductor L(L = 1.886275345010616)  annotation (
    Placement(visible = true, transformation(origin = {-6, 154}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Inductor L1(L = 0.0013269 * 2.30769 ^ 2)  annotation (
    Placement(visible = true, transformation(origin = {34, 176}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor R3(r = 0.2576 * 2.30769 ^ 2)  annotation (
    Placement(visible = true, transformation(origin = {6, 176}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0}, vMag = {277.2})  annotation (
    Placement(visible = true, transformation(origin = {-104, 158}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-104, 124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor resistor(r = 2.7672) annotation (
    Placement(visible = true, transformation(origin = {-88, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor resistor1(r = 150.1 * 2.30769 ^ 2) annotation (
    Placement(visible = true, transformation(origin = {100, 68}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Resistor resistor2(r = 3536.58) annotation (
    Placement(visible = true, transformation(origin = {-36, 66}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Resistor resistor3(r = 0.2576 * 2.30769 ^ 2) annotation (
    Placement(visible = true, transformation(origin = {56, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Inductor inductor(L = 0.00291932059447983014861995753715) annotation (
    Placement(visible = true, transformation(origin = {-60, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource voltageSource(vArg = {0}, vMag = {277.2}) annotation (
    Placement(visible = true, transformation(origin = {-112, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-112, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Inductor inductor1(L = 1.886275345010616) annotation (
    Placement(visible = true, transformation(origin = {-14, 66}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Inductor inductor2(L = 0.0013269 * 2.30769 ^ 2) annotation (
    Placement(visible = true, transformation(origin = {84, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.IdealTransformer idealTransformer(N = 3)  annotation (
    Placement(visible = true, transformation(origin = {20, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {44, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(l.pin_n, R2.pin_p) annotation (
    Line(points = {{-42, 176}, {-18, 176}, {-18, 164}, {-28, 164}}, color = {117, 80, 123}));
  connect(R2.pin_p, L.pin_p) annotation (
    Line(points = {{-28, 164}, {-6, 164}}));
  connect(R2.pin_n, L.pin_n) annotation (
    Line(points = {{-28, 144}, {-6, 144}}, color = {117, 80, 123}));
  connect(r1.pin_n, l.pin_p) annotation (
    Line(points = {{-70, 176}, {-62, 176}}, color = {117, 80, 123}));
  connect(R3.pin_p, l.pin_n) annotation (
    Line(points = {{-4, 176}, {-42, 176}}));
  connect(R3.pin_n, L1.pin_p) annotation (
    Line(points = {{16, 176}, {24, 176}}, color = {117, 80, 123}));
  connect(L1.pin_n, r.pin_p) annotation (
    Line(points = {{44, 176}, {58, 176}, {58, 166}}, color = {117, 80, 123}));
  connect(r.pin_n, L.pin_n) annotation (
    Line(points = {{58, 146}, {58, 132}, {-18, 132}, {-18, 144}, {-6, 144}}, color = {117, 80, 123}));
  connect(v.pin_p, r1.pin_p) annotation (
    Line(points = {{-104, 168}, {-104, 176}, {-90, 176}}));
  connect(v.pin_n, ground.pin) annotation (
    Line(points = {{-104, 148}, {-104, 124}}, color = {117, 80, 123}));
  connect(ground.pin, L.pin_n) annotation (
    Line(points = {{-104, 124}, {-104, 132}, {-18, 132}, {-18, 144}, {-6, 144}}));
  connect(resistor.pin_n, inductor.pin_p) annotation (
    Line(points = {{-78, 88}, {-70, 88}}, color = {117, 80, 123}));
  connect(voltageSource.pin_n, ground1.pin) annotation (
    Line(points = {{-112, 60}, {-112, 36}}, color = {117, 80, 123}));
  connect(resistor2.pin_n, inductor1.pin_n) annotation (
    Line(points = {{-36, 56}, {-14, 56}}, color = {117, 80, 123}));
  connect(resistor2.pin_p, inductor1.pin_p) annotation (
    Line(points = {{-36, 76}, {-14, 76}}));
  connect(resistor3.pin_n, inductor2.pin_p) annotation (
    Line(points = {{66, 88}, {74, 88}}, color = {117, 80, 123}));
  connect(inductor.pin_n, resistor2.pin_p) annotation (
    Line(points = {{-50, 88}, {-25, 88}, {-25, 76}, {-36, 76}}, color = {117, 80, 123}));
  connect(voltageSource.pin_p, resistor.pin_p) annotation (
    Line(points = {{-112, 80}, {-112, 88}, {-98, 88}}));
  connect(resistor1.pin_p, inductor2.pin_n) annotation (
    Line(points = {{100, 78}, {100, 88}, {94, 88}}));
  connect(resistor2.pin_n, ground1.pin) annotation (
    Line(points = {{-36, 56}, {-24, 56}, {-24, 44}, {-112, 44}, {-112, 36}}, color = {117, 80, 123}));
  connect(idealTransformer.pinP_Prim, inductor.pin_n) annotation (
    Line(points = {{10, 74}, {10, 75}, {4, 75}, {4, 88}, {-50, 88}}));
  connect(idealTransformer.pinN_Prim, resistor2.pin_n) annotation (
    Line(points = {{10, 54}, {10, 44}, {-24, 44}, {-24, 56}, {-36, 56}}, color = {117, 80, 123}));
  connect(idealTransformer.pinN_Sec, resistor1.pin_n) annotation (
    Line(points = {{30, 54}, {44, 54}, {44, 40}, {100, 40}, {100, 58}}, color = {117, 80, 123}));
  connect(idealTransformer.pinP_Sec, resistor3.pin_p) annotation (
    Line(points = {{30, 74}, {30, 81}, {32, 81}, {32, 88}, {46, 88}}));
  connect(ground2.pin, idealTransformer.pinN_Sec) annotation (
    Line(points = {{44, 34}, {44, 54}, {30, 54}}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, initialScale = 0.1), graphics = {Line(origin = {0, 112.003}, points = {{-200, 0}, {200, 0}}, pattern = LinePattern.Dash)}),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})));
end MultiPhase_Transformer_Modeling;