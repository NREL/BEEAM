within HPF.Test;
model SinglePhase_CurrentInjection
  inner SystemDef systemDef(hrms={1,3})
    annotation (Placement(transformation(extent={{-56,32},{-36,52}})));
  import Modelica.ComplexMath.j;
  SinglePhase.Sources.VoltageSource v(vMag={100,5}, vArg={0,0.5}) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,-10})));
  SinglePhase.Components.Impedance z "5 + 2*j"
    annotation (Placement(transformation(extent={{-20,10},{0,30}})));
  SinglePhase.Components.Impedance z1(z=2 + 1*j) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={10,-14})));
  SinglePhase.Components.Ground ground
    annotation (Placement(transformation(extent={{-50,-44},{-30,-24}})));
  SinglePhase.Sources.CurrentSource currentSource1(iReal={5,2}, iImag={0.25,0.5})
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-8})));
equation
  connect(z.pin_n, currentSource1.pin_p)
    annotation (Line(points={{0,20},{40,20},{40,2}}, color={117,80,123}));
  connect(ground.pin, currentSource1.pin_n)
    annotation (Line(points={{-40,-34},{40,-34},{40,-18}}, color={0,0,0}));
  connect(v.pin_p, z.pin_p)
    annotation (Line(points={{-40,0},{-40,20},{-20,20}}, color={0,0,0}));
  connect(v.pin_n, ground.pin)
    annotation (Line(points={{-40,-20},{-40,-34}}, color={117,80,123}));
  connect(z1.pin_p, currentSource1.pin_p) annotation (Line(points={{10,-4},{12,-4},
          {12,20},{40,20},{40,2}}, color={0,0,0}));
  connect(z1.pin_n, currentSource1.pin_n) annotation (Line(points={{10,-24},{10,
          -34},{40,-34},{40,-18}}, color={117,80,123}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SinglePhase_CurrentInjection;
