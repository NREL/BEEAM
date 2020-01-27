within HPF.Sources.ThreePhase;

model VoltageSrc_ReadFile
  HPF.SinglePhase.Interface.HPin_P pinP_phA annotation(
    Placement(visible = true, transformation(origin = {98, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinP_phB annotation(
    Placement(visible = true, transformation(origin = {102, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinP_phC annotation(
    Placement(visible = true, transformation(origin = {76, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N pinN annotation(
    Placement(visible = true, transformation(origin = {98, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

annotation(
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Ellipse(origin = {61, 1}, extent = {{-39, 39}, {39, -39}}, endAngle = 360), Line(origin = {-155.095, 0.481023}, points = {{-19, 24}, {11, 24}, {21, 14}, {21, -24}, {-19, -24}, {-19, 24}}), Line(origin = {-156.035, 14.611}, points = {{-12, 0}, {12, 0}}), Line(origin = {-155.824, 7.67872}, points = {{-12, 0}, {12, 0}}), Text(origin = {-187, -7}, extent = {{-11, 7}, {73, -9}}, textString = ".mat"), Polygon(origin = {-105, -2}, fillPattern = FillPattern.Solid, points = {{-9, 10}, {-9, -10}, {9, 0}, {-9, 10}}), Rectangle(origin = {-122, -2}, fillPattern = FillPattern.Solid, extent = {{-8, 2}, {8, -2}}), Line(origin = {-120.688, 4.7503}, points = {{-49.9999, 60}, {-49.9999, -60}, {50.0001, -60}, {50.0001, 40}, {30.0001, 60}, {-49.9999, 60}})}, coordinateSystem(initialScale = 0.1)));
end VoltageSrc_ReadFile;