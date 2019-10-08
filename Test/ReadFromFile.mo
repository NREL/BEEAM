within HPF.Test;

model ReadFromFile
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1, 3, 5, 7}) annotation(
    Placement(visible = true, transformation(origin = {-26, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData v(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_A.mat") annotation(
    Placement(visible = true, transformation(origin = {-46, 4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Resistor r annotation(
    Placement(visible = true, transformation(origin = {-12, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-46, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(v.pin_p, r.pin_p) annotation(
    Line(points = {{-46, 14}, {-22, 14}}));
  connect(v.pin_n, ground.pin) annotation(
    Line(points = {{-46, -6}, {-46, -6}, {-46, -16}, {-46, -16}}, color = {117, 80, 123}));
  connect(v.pin_n, r.pin_n) annotation(
    Line(points = {{-46, -6}, {6, -6}, {6, 14}, {-2, 14}, {-2, 14}}, color = {117, 80, 123}));
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end ReadFromFile;