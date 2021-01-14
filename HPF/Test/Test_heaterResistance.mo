within HPF.Test;

model Test_heaterResistance
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {119.823, 64.54, 114.2025, -5.6353, -55.0957, -4.1165, 266.0313, 117.8542, 124.655, 37.2016, 109.9162, 188.2248, 7.5692, 132.0204}, vMag = {121.9236, 1.0604, 0.76101, 0.32532, 0.4717, 0.46353, 0.090582, 0.24849, 0.031078, 0.063448, 0.043763, 0.065932, 0.062935, 0.02144})  annotation(
    Placement(visible = true, transformation(origin = {-46, 12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-46, -22}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 78.16760 + 8.87269 * j)  annotation(
    Placement(visible = true, transformation(origin = {-10, 12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:20})  annotation(
    Placement(visible = true, transformation(origin = {-74, 56}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
equation
  connect(v.pin_p, z.pin_p) annotation(
    Line(points = {{-46, 22}, {-46, 30}, {-10, 30}, {-10, 22}}, color = {92, 53, 102}));
  connect(v.pin_n, ground.pin) annotation(
    Line(points = {{-46, 2}, {-46, -14}}, color = {117, 80, 123}));
  connect(z.pin_n, ground.pin) annotation(
    Line(points = {{-10, 2}, {-10, -4}, {-46, -4}, {-46, -14}}, color = {117, 80, 123}));

annotation(
    Documentation(info = "<html><head></head><body>Testing heater resistance values obtatined using heater resistance uncertainity analysis.<div><br></div><div>Use heater resistance values from measurement. Use transformer secondary side measurements from scenario 3 or 4 and use it as voltage settings.</div><div><br></div><div><br></div><div>Measured power = 193.13 W</div><div>Simulation = 187.754 W</div></body></html>"));
end Test_heaterResistance;