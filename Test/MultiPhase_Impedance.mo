within HPF.Test;
model MultiPhase_Impedance
  inner SystemDef systemDef annotation (
    Placement(visible = true, transformation(origin = {-130, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.MultiPhase.PhaseCoupling.PhaseSelect_P phaseSelect_P1(phSel = 2)  annotation (
    Placement(visible = true, transformation(origin={-56,90},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Terminate terminate
    annotation (Placement(transformation(extent={{-32,84},{-18,98}})));
equation

  connect(phaseSelect_P1.hPin_P, terminate.hPin_P)
    annotation (Line(points={{-46,90},{-27,90}}, color={0,0,0}));
annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end MultiPhase_Impedance;
