within HPF.PowerConverters.SinglePhase.GroupedConverters;

model EmpMdl
  extends HPF.PowerConverters.SinglePhase.ACDC_EmpMdl;
  
equation

annotation(
    Icon(graphics = {Rectangle(origin = {0.62, -0.53}, pattern = LinePattern.Dash, extent = {{-100, 180}, {100, -180}}), Text(origin = {0, 155}, extent = {{-160, 15}, {160, -15}}, textString = "Converters=%N")}));
end EmpMdl;