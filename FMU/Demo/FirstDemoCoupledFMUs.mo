within ;
model FirstDemoCoupledFMUs
  'in_fmu' 'in_fmu1'(fmi_StopTime=86400, fmi_NumberOfSteps=1440)
    annotation (Placement(transformation(extent={{12,20},{32,40}})));
  Demo_FMU_fmu demo_FMU_fmu(fmi_StopTime=86400, fmi_NumberOfSteps=1440)
    annotation (Placement(transformation(extent={{-44,20},{-24,40}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder
    annotation (Placement(transformation(extent={{2,56},{-18,76}})));
equation
  connect(demo_FMU_fmu.y, 'in_fmu1'.Q)
    annotation (Line(points={{-22,30},{11.6,30}}, color={0,0,127}));
  connect('in_fmu1'.electric_demand, firstOrder.u) annotation (Line(points={{34,
          35},{44,35},{44,66},{4,66}}, color={0,0,127}));
  connect(firstOrder.y, demo_FMU_fmu.u) annotation (Line(points={{-19,66},{-66,
          66},{-66,30},{-44.4,30}}, color={0,0,127}));
  annotation (uses(Modelica(version="3.2.2")));
end FirstDemoCoupledFMUs;
