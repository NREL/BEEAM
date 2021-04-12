within HPF.PowerConverters.SinglePhase;

model ACDC_EmpMdl_Scaled
  extends HPF.PowerConverters.SinglePhase.ACDC_EmpMdl;
equation

annotation(
    Icon(graphics = {Rectangle(origin = {0, 10}, pattern = LinePattern.Dash, extent = {{-100, 170}, {100, -170}}), Text(origin = {4, -177}, extent = {{-54, 15}, {54, -15}}, textString = "Converters = N")}));
end ACDC_EmpMdl_Scaled;