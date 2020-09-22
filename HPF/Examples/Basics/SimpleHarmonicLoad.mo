within HPF.Examples.Basics;
model SimpleHarmonicLoad
  extends Modelica.Icons.Example;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef     systemDef(hrms={i for i in 1:2:11})    annotation (
    Placement(visible = true, transformation(origin={-56.1847,38.4921},     extent = {{-9.81534, -9.81533}, {9.81534, 7.01095}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance     Z01(z=0.8 + 0.008*j)     annotation (
    Placement(visible = true, transformation(origin={-4,44},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground     ground annotation (
    Placement(visible = true, transformation(origin={-28,-18},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource     V0(vArg={0 for i in 1:systemDef.numHrm},
      vMag=cat(
        1,
        {120},
        {0 for i in 2:systemDef.numHrm}))                                                                                                 annotation (
    Placement(visible = true, transformation(origin = {-28, 24}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.CurrentSource harmonicLoad(iMag={11.3802,6.6631,1.8123,1.3356,
        0.6466,0.5229}, iArg={0.351,-2.0293,2.4134,1.5971,-0.068,-0.7582})
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={26,24})));
equation
  connect(V0.pin_n,ground. pin) annotation (
    Line(points={{-28,14},{-28,-6.75}},  color = {117, 80, 123}));
  connect(Z01.pin_p,V0. pin_p) annotation (
    Line(points={{-14,44},{-28,44},{-28,34}}));
  connect(Z01.pin_n, harmonicLoad.pin_p)
    annotation (Line(points={{6,44},{26,44},{26,34}}, color={117,80,123}));
  connect(harmonicLoad.pin_n, ground.pin) annotation (Line(points={{26,14},{26,2},
          {-28,2},{-28,-6.75}}, color={117,80,123}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={                                                                                                                                                                                                        Text(origin = {-4, 79}, extent = {{-14, 9}, {98, -11}}, textString = "Required: This block sets the system parameters.\n(Not including this would throw an error.)",
            horizontalAlignment =                                                                                                                                                                                                        TextAlignment.Left),
                                                                             Ellipse(origin={
              -57,37},                                                                                   lineColor = {239, 41, 41}, pattern = LinePattern.Dash, extent={{
              -15,15},{15,-15}},                                                                                                                                                                 endAngle = 360),
        Line(
          points={{-20,74},{-42,52}},
          color={0,0,0},
          smooth=Smooth.Bezier),
        Polygon(
          points={{-42,54},{-46,48},{-40,52},{-42,54}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>Example demonstrating a simple harmonic load. The harmonic load is modeled as a harmonics injecting current source. The harmonic injection spectra is derived from a typical AC to DC converter. The load acts as a current sink at the fundamental harmonic and as a current source at higher harmonics.</p>
<p>Harmonic injection spectra for the harmonic load is shown in Figure 1.</p>
<p><img src=\"modelica://HPF/Resources/images/Examples/Basics/SimpleHarmonicLoad/fig_injectionSpectra.png\"/></p>
<p>Figure 1. Harmonic producing load injection spectra.</p>
</html>"));
end SimpleHarmonicLoad;
