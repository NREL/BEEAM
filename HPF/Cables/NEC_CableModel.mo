within HPF.Cables;

model NEC_CableModel "AC (HPF) cable model using NEC table data"
  extends HPF.SinglePhase.Interface.TwoPinBase;
  extends HPF.Utilities.WireGaugeValues;
  parameter HPF.Types.WireGaugeAC wireGaugeAC = HPF.Types.WireGaugeAC.gauge_1;
  parameter Real length = 1 "Length of wire";
  Modelica.Blocks.Interfaces.RealOutput PLoss annotation(
    Placement(visible = true, transformation(origin = {10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  final parameter Real r = length * gaugeResistanceAC[Integer(wireGaugeAC)] / 1000;
equation
  v[:].re = r .* i[:].re - 0 .* i[:].im;
  v[:].im = r .* i[:].im + 0 .* i[:].re;
  PLoss = sum(i[1:systemDef.numHrm].re.^2 .* r);
annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}), graphics = {Text(origin = {-4, -120}, lineColor = {92, 53, 102}, extent = {{-150, 60}, {150, 100}}, textString = "%name"), Text(origin = {-36, 3.2}, lineColor = {92, 53, 102}, extent = {{-24, 12.8}, {96, -19.2}}, textString = "NEC"), Ellipse(origin = {-60, 0}, extent = {{-4, 20}, {4, -20}}, endAngle = 360), Line(origin = {0, 20}, points = {{-60, 0}, {60, 0}}), Line(origin = {-0.165289, -20.0826}, points = {{-60, 0}, {60, 0}}), Ellipse(origin = {60, 0}, extent = {{-4, 20}, {4, -20}}, endAngle = 360), Line(origin = {-75, 0}, points = {{-15, 0}, {15, 0}}), Line(origin = {77, 0}, points = {{-13, 0}, {13, 0}}), Text(origin = {70, 47}, extent = {{-54, 15}, {54, -15}}, textString = "PLoss"), Line(origin = {0, 26}, points = {{0, 6}, {0, -6}})}),
    Documentation(info = "<html><head></head><body><div><br></div><div><br></div><div>Gauge values such as \"1/0\" are referred to as \"gauge_1_0\".</div></body></html>"));
end NEC_CableModel;