within HPF.SinglePhase.Components;
model IdealTransformer
  extends HPF.SinglePhase.Interface.TwoPortBase;
  HPF.Utilities.ComponentProperties properties(ComponentType = "Transformer");
  parameter Real N = 1 "Turns ratio N1:N2 = N:1";
equation
/*
    Primary side voltage is reflected to the secondary winding 
    proportional to the turns ratio.
  */
//vSec = (1 / N) * vPrim;
  vSec.re = 1 / N * vPrim.re;
  vSec.im = 1 / N * vPrim.im;
//iSec = N * iPrim;
  iSec.re = -N * iPrim.re;
  iSec.im = -N * iPrim.im;
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={  Line(origin = {-24.79, 46.24}, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-54.85, 85.38}, points = {{-37, 14.5}, {15, 14.5}, {15, -17.5}, {15, -15.5}}, color = {92, 53, 102}), Line(origin = {-74.14, -81}, points = {{34.0302, 20.999}, {34.0302, -11.001}, {34.0302, -19.001}, {-15.9698, -19.001}}, color = {92, 53, 102}), Ellipse(origin = {-16, 84}, lineColor = {92, 53, 102}, extent = {{-6, 6}, {6, -6}}, endAngle = 360), Line(origin = {-24.9217, 4.38958}, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-25.0534, -37.4608}, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {24.3724, -37.6792}, rotation = 180, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {23.5864, 4.62968}, rotation = 180, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {24.4062, 46.7094}, rotation = 180, points = {{-14.9246, 21.0201}, {-2.9246, 19.0201}, {3.0754, 17.0201}, {9.0754, 13.0201}, {13.0754, 7.02012}, {15.0754, 3.02012}, {15.0754, -2.97988}, {13.0754, -6.97988}, {7.0754, -14.9799}, {-0.924604, -18.9799}, {-8.9246, -20.9799}, {-14.9246, -20.9799}, {-14.9246, -20.9799}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {70, 83}, points = {{-30, -15}, {-30, 17}, {30, 17}}, color = {92, 53, 102}), Line(origin = {69, -80}, points = {{-29, 20}, {-29, -20}, {29, -20}}, color = {92, 53, 102}), Text(origin = {-10, 132}, lineColor = {92, 53, 102}, extent = {{-316, 28}, {320, -22}}, textString = "%name"), Text(origin = {368, -4}, extent = {{-318, 24}, {-42, -16}}, textString = "Ideal",
            horizontalAlignment =                                                                                                                                                                                                        TextAlignment.Left), Text(origin = {0, -138}, lineColor = {92, 53, 102}, extent = {{-314, 18}, {320, -22}}, textString = "N = %N")}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})),
    Documentation(info="<html>
<p>The ideal transformer is a two-port circuit element</p>
<p>i2 = -i1*n;</p>
<p>v2 = v1/n;</p>
<p>where n is a real number called the turns ratio.</p>
<p><br>..</p>
<p><br>parameters</p>
<p><br>mention the use of ground on the secondary side.. (with a diagram)</p>
</html>"));
end IdealTransformer;
