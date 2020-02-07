within HPF.Test;
model SinglePhase_Transformer
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Components.IdealTransformer T_HPF(N = 480 / 208)  annotation (
    Placement(visible = true, transformation(origin={-12, 60},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(hrms = {1, 3})  annotation (
    Placement(visible = true, transformation(origin={-50,90},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={-68, 30},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 10 + 5 * j)  annotation (
    Placement(visible = true, transformation(origin={28, 70},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource vSrc_HPF(theta(fixed = true, start = 0),vArg = {0, -0.1}, vMag = {480, 0.5})  annotation (
    Placement(visible = true, transformation(origin={-68, 60},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z1(z = 1 + 0 * j) annotation (
    Placement(visible = true, transformation(origin={-44, 70},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={-2, 30},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.SinglePhase.Simplified simplified(N = 480 / 120, Rc = 1e10, Rp = 0, Rs = 0, Xm = 1e10, Xp = 0, Xs = 0,fEC = 0.1, fOSL = 0.1, fW = 0.1) 
    annotation (Placement(visible = true, transformation(extent = {{-10, -6}, {10, 14}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance     z2(z=1 + 0*j)     annotation (
    Placement(visible = true, transformation(origin={-46, 14},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground     ground3 annotation (
    Placement(visible = true, transformation(origin={-76, -18},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource     v1(
    theta(fixed=true, start=0),
    vArg={0, -0.1},
    vMag={480.13, 0.5})                                                                                     annotation (
    Placement(visible = true, transformation(origin={-76, 4},  extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground     ground4 annotation (
    Placement(visible = true, transformation(origin={16, -18},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance     z3(z=10 + 5*j)     annotation (
    Placement(visible = true, transformation(origin={56, 14},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Ideal.IdealTransformer T_Quasi(n = 480 / 208)  annotation(
    Placement(visible = true, transformation(origin = {-4, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource vSrc_Quasi(V = 480, f = 60, phi = 0)  annotation(
    Placement(visible = true, transformation(origin = {-62, -64}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-62, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Impedance impedance(Z_ref = 1 + 0 * j)  annotation(
    Placement(visible = true, transformation(origin = {-38, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Impedance impedance1(Z_ref = 10 + 5 * j)  annotation(
    Placement(visible = true, transformation(origin = {34, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground5 annotation(
    Placement(visible = true, transformation(origin = {8, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.Voltmeter_Freq2Time voltmeter_Freq2Time annotation(
    Placement(visible = true, transformation(origin = {-28, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.Voltmeter_Freq2Time voltmeter_Freq2Time1 annotation(
    Placement(visible = true, transformation(origin = {34, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(vSrc_HPF.pin_n, ground1.pin) annotation(
    Line(points = {{-68, 50}, {-68, 30}}, color = {117, 80, 123}));
  connect(vSrc_HPF.pin_n, T_HPF.pinN_Prim) annotation(
    Line(points = {{-68, 50}, {-46, 50}, {-46, 50.2}, {-32, 50.2}, {-32, 50}, {-22, 50}}, color = {117, 80, 123}));
  connect(z.pin_n, T_HPF.pinN_Sec) annotation(
    Line(points = {{38, 70}, {44, 70}, {44, 50}, {-2, 50}}, color = {117, 80, 123}));
  connect(T_HPF.pinP_Sec, z.pin_p) annotation(
    Line(points = {{-2, 70}, {18, 70}}));
  connect(z1.pin_n, T_HPF.pinP_Prim) annotation(
    Line(points = {{-34, 70}, {-22, 70}}, color = {117, 80, 123}));
  connect(vSrc_HPF.pin_p, z1.pin_p) annotation(
    Line(points = {{-68, 70}, {-54, 70}}));
  connect(ground2.pin, T_HPF.pinN_Sec) annotation(
    Line(points = {{-2, 30}, {-2, 50}}));
  connect(z2.pin_n, simplified.pinP_prim) annotation(
    Line(points = {{-36, 14}, {-10, 14}}, color = {117, 80, 123}));
  connect(v1.pin_p, z2.pin_p) annotation(
    Line(points = {{-76, 14}, {-56, 14}}));
  connect(v1.pin_n, ground3.pin) annotation(
    Line(points = {{-76, -6}, {-76, -18}}, color = {117, 80, 123}));
  connect(v1.pin_n, simplified.pinN_prim) annotation(
    Line(points = {{-76, -6}, {-10, -6}}, color = {117, 80, 123}));
  connect(simplified.pinN_sec, ground4.pin) annotation(
    Line(points = {{10, -6}, {16, -6}, {16, -18}}, color = {117, 80, 123}));
  connect(simplified.pinP_sec, z3.pin_p) annotation(
    Line(points = {{10, 14}, {46, 14}}));
  connect(z3.pin_n, simplified.pinN_sec) annotation(
    Line(points = {{66, 14}, {70, 14}, {70, 10}, {78, 10}, {78, -4}, {42, -4}, {42, -6}, {10, -6}}, color = {117, 80, 123}));
  connect(vSrc_Quasi.pin_n, ground.pin) annotation(
    Line(points = {{-62, -74}, {-62, -82}}, color = {85, 170, 255}));
  connect(vSrc_Quasi.pin_n, T_Quasi.pin_n1) annotation(
    Line(points = {{-62, -74}, {-37, -74}, {-37, -69}, {-14, -69}}, color = {85, 170, 255}));
  connect(vSrc_Quasi.pin_p, impedance.pin_p) annotation(
    Line(points = {{-62, -54}, {-48, -54}}, color = {85, 170, 255}));
  connect(impedance.pin_n, T_Quasi.pin_p1) annotation(
    Line(points = {{-28, -54}, {3, -54}, {3, -59}, {-14, -59}}, color = {85, 170, 255}));
  connect(impedance1.pin_p, T_Quasi.pin_p2) annotation(
    Line(points = {{24, -54}, {6, -54}, {6, -59}}, color = {85, 170, 255}));
  connect(T_Quasi.pin_n2, impedance1.pin_n) annotation(
    Line(points = {{6, -69}, {26, -69}, {26, -71}, {48, -71}, {48, -54}, {44, -54}}, color = {85, 170, 255}));
  connect(T_Quasi.pin_n2, ground5.pin) annotation(
    Line(points = {{6, -69}, {21, -69}, {21, -70}, {8, -70}, {8, -82}}, color = {85, 170, 255}));
  connect(voltmeter_Freq2Time.pin_p, simplified.pinP_prim) annotation(
    Line(points = {{-28, 0}, {-26, 0}, {-26, 14}, {-10, 14}, {-10, 14}}, color = {92, 53, 102}));
  connect(voltmeter_Freq2Time.pin_n, simplified.pinN_prim) annotation(
    Line(points = {{-28, -20}, {-20, -20}, {-20, -20}, {-10, -20}, {-10, -6}, {-10, -6}}, color = {117, 80, 123}));
  connect(voltmeter_Freq2Time1.pin_p, simplified.pinP_sec) annotation(
    Line(points = {{34, 2}, {34, 2}, {34, 14}, {10, 14}, {10, 14}}, color = {92, 53, 102}));
  connect(voltmeter_Freq2Time1.pin_n, ground4.pin) annotation(
    Line(points = {{34, -18}, {16, -18}, {16, -18}, {16, -18}}, color = {117, 80, 123}));

annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, grid = {0, 0})));
end SinglePhase_Transformer;