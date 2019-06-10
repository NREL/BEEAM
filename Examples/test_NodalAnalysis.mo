within HPF.Examples;
model test_NodalAnalysis
  import Modelica.ComplexMath.j;
  inner SystemDef systemDef(hrms={1,3})
    annotation (Placement(transformation(extent={{-56,44},{-36,64}})));
  Components.Impedance z(z=1 + 1*j)
    annotation (Placement(transformation(extent={{-32,14},{-12,34}})));
  Components.VoltageSource voltageSource(vMag={10,5}, vArg={0,0.5})
                                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-4})));
  Components.Ground ground
    annotation (Placement(transformation(extent={{-60,-42},{-40,-22}})));
equation
  connect(voltageSource.pin_p, z.pin_p) annotation (Line(
      points={{-50,6.2},{-50,24},{-32.2,24}},
      color={117,80,123},
      thickness=2));
  connect(voltageSource.pin_n, ground.pin)
    annotation (Line(points={{-50,-14},{-50,-31.4}}, color={117,80,123}));
  connect(z.pin_n, ground.pin) annotation (Line(points={{-12,24},{0,24},{0,-31.4},
          {-50,-31.4}}, color={117,80,123}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end test_NodalAnalysis;
