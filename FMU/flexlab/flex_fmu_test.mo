model flex_fmu_test
  'in_fmu' 'in_fmu1'(
    fmi_StartTime=26265000,
    fmi_StopTime=29029800,
    fmi_NumberOfSteps=46080)
    annotation (Placement(transformation(extent={{52,-24},{72,-4}})));
  Modelica.Blocks.Sources.Constant const
    annotation (Placement(transformation(extent={{-4,42},{16,62}})));
  Modelica.Blocks.Sources.Constant const1
    annotation (Placement(transformation(extent={{-6,8},{14,28}})));
  Modelica.Blocks.Sources.Constant const2
    annotation (Placement(transformation(extent={{-4,-22},{16,-2}})));
  Modelica.Blocks.Sources.Constant const3
    annotation (Placement(transformation(extent={{-2,-54},{18,-34}})));
  Modelica.Blocks.Sources.Constant const4
    annotation (Placement(transformation(extent={{-2,-80},{18,-60}})));
  Modelica.Blocks.Sources.Constant const5
    annotation (Placement(transformation(extent={{-32,-70},{-12,-50}})));
  Modelica.Blocks.Sources.Constant const6
    annotation (Placement(transformation(extent={{24,-88},{44,-68}})));
  Modelica.Blocks.Sources.Constant const7
    annotation (Placement(transformation(extent={{-46,-6},{-26,14}})));
equation
  connect(const.y, 'in_fmu1'.SchedulePlnmBLights) annotation (Line(points={{17,
          52},{38,52},{38,-6.2},{51.6,-6.2}}, color={0,0,127}));
  connect(const1.y, 'in_fmu1'.SchedulePlnmBFans) annotation (Line(points={{15,
          18},{34,18},{34,-10.6},{51.6,-10.6}}, color={0,0,127}));
  connect(const2.y, 'in_fmu1'.ScheduleZoneBLights) annotation (Line(points={{17,
          -12},{34,-12},{34,-12.8},{51.6,-12.8}}, color={0,0,127}));
  connect(const3.y, 'in_fmu1'.ScheduleZoneBFans) annotation (Line(points={{19,
          -44},{32,-44},{32,-15.1},{51.6,-15.1}}, color={0,0,127}));
  connect(const4.y, 'in_fmu1'.ScheduleZoneBMisc) annotation (Line(points={{19,
          -70},{36,-70},{36,-17.3},{51.6,-17.3}}, color={0,0,127}));
  connect(const5.y, 'in_fmu1'.ScheduleZoneBPlug) annotation (Line(points={{-11,
          -60},{44,-60},{44,-19.5},{51.6,-19.5}}, color={0,0,127}));
  connect(const6.y, 'in_fmu1'.ScheduleZoneBPlugDC) annotation (Line(points={{45,
          -78},{48,-78},{48,-21.7},{51.6,-21.7}}, color={0,0,127}));
  connect(const7.y, 'in_fmu1'.SchedulePlnmBDCHub) annotation (Line(points={{-25,
          4},{24,4},{24,-8.4},{51.6,-8.4}}, color={0,0,127}));
  annotation (
    uses(HPF(version = "0.1.0-beta"), Modelica(version = "3.2.3")),
    experiment(
      StartTime=26265000,
      StopTime=29029800,
      Interval=60,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=60,
      __Dymola_Algorithm="Euler"),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  version = "");
end flex_fmu_test;
