within HPF.SinglePhase.Components;
model Terminate "Terminal connection for an unconnected phase"
  import Modelica.ComplexMath.j;
  outer SystemDef systemDef;
  /*
  This would be a one pin component. The ground would be 
  internally connected.
  
  This should represent an open circuit. The solver would 
  throw an error if one of the terminals in a multiphase system is
  left unconnected.
  
  This component would be a very high impedance resistance.
  */
  Ground ground
    annotation (Placement(transformation(extent={{-6,-4},{14,16}})));
  HPF.SinglePhase.Interface.HPin_P hPin_P(h = systemDef.numHrm)  annotation (Placement(visible = true,transformation(extent = {{-52, 14}, {-40, 26}}, rotation = 0), iconTransformation(extent = {{-40, -10}, {-20, 10}}, rotation = 0)));
  Impedance z(z = Complex(1e8, 1e8))  annotation (Placement(transformation(extent={{-20,10},{0,30}})));
equation

  connect(hPin_P, z.pin_p)
    annotation (Line(points = {{-46, 20}, {-20, 20}}));
  connect(z.pin_n, ground.pin)
    annotation (Line(points={{0,20},{4,20},{4,6}}, color={117,80,123}));
annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent={{-80,-60},{60,80}}, initialScale = 0.1), graphics={
        Line(
          points={{-22,0},{30,0}},
          color={238,46,47},
          thickness=0.5),
        Line(origin = {0, 0.32967}, points = {{0, 30}, {60, -30}}, color = {238, 46, 47}, thickness = 0.5),
        Line(
          points={{0,-30},{60,30}},
          color={238,46,47},
          thickness=0.5)}),
    Diagram(coordinateSystem(extent={{-80,-60},{60,80}},          grid = {0, 0})));
end Terminate;
