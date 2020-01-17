within HPF.Test;
model sensors
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0, 0, 0}, vMag = {100, 0.5, 0.2})  annotation (
    Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Resistor r(r = 10)  annotation (
    Placement(visible = true, transformation(origin = {40, 12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Resistor r1 annotation (
    Placement(visible = true, transformation(origin={-10,34},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(hrms = {1, 3, 5})  annotation (
    Placement(visible = true, transformation(origin = {-58, 64}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor currentSensor annotation (
    Placement(visible = true, transformation(origin = {24, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-40, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor voltageSensor1 annotation (
    Placement(visible = true, transformation(origin = {72, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(v.pin_p, r1.pin_p) annotation (
    Line(points = {{-40, 20}, {-40, 34}, {-20, 34}}));
  connect(v.pin_n, r.pin_n) annotation (
    Line(points = {{-40, 0}, {-40, -10}, {40, -10}, {40, 2}}, color = {117, 80, 123}));
  connect(r1.pin_n, currentSensor.pin_p) annotation (
    Line(points = {{0, 34}, {14, 34}}, color = {117, 80, 123}));
  connect(currentSensor.pin_n, r.pin_p) annotation (
    Line(points = {{34, 34}, {40, 34}, {40, 22}}, color = {117, 80, 123}));
  connect(ground.pin, v.pin_n) annotation (
    Line(points = {{-40, -16}, {-40, -16}, {-40, 0}, {-40, 0}}));
  connect(voltageSensor1.pin_p, currentSensor.pin_n) annotation (
    Line(points = {{62, 34}, {36, 34}, {36, 34}, {34, 34}, {34, 34}}));
  connect(voltageSensor1.pin_n, r.pin_n) annotation (
    Line(points = {{82, 34}, {90, 34}, {90, -10}, {40, -10}, {40, 2}}, color = {117, 80, 123}));
end sensors;
