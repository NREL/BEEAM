within HPF.SinglePhase.NonlinearLoads;

model Rectifier
  extends HPF.SinglePhase.Interface.TwoPortBaseAnalog;
equation

annotation(
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Rectangle(origin = {-1, 0}, extent = {{-89, 140}, {91, -140}}), Line(origin = {-40.3058, -20.4264}, points = {{-40.9518, -0.0403469}, {-36.9518, 15.9597}, {-30.9518, 31.9597}, {-20.9518, 39.9597}, {-12.9518, 35.9597}, {-6.95182, 19.9597}, {-2.95182, 1.95965}, {1.04818, -18.0403}, {9.04818, -34.0403}, {21.0482, -40.0403}, {31.0482, -30.0403}, {39.0482, -14.0403}, {41.0482, -0.04035}}, smooth = Smooth.Bezier), Line(origin = {-23.8557, 63.6406}, points = {{0, 24}, {0, -24}}), Line(origin = {-13.0842, 63.6959}, points = {{0, 14}, {0, -24}}), Line(origin = {-3.85568, 63.8354}, points = {{0, 4}, {0, -24}}), Line(origin = {25.1858, 63.9938}, points = {{0, -12}, {0, -24}}), Line(origin = {15.8502, 63.9612}, points = {{0, -4}, {0, -24}}), Line(origin = {5.18579, 63.2641}, points = {{0, 2}, {0, -24}}), Line(origin = {-5.08799, 39.4966}, rotation = -90, points = {{0, 36}, {0, -24}}), Line(origin = {55.026, -9.08678}, points = {{-25, 0}, {25, 0}}), Line(origin = {55.4112, -30.005}, points = {{-25, 0}, {-17, 0}}), Line(origin = {67.1079, -29.8083}, points = {{-25, 0}, {-17, 0}}), Line(origin = {90.8703, -29.6116}, points = {{-25, 0}, {-17, 0}}), Line(origin = {79.1736, -29.8083}, points = {{-25, 0}, {-17, 0}}), Line(origin = {102.567, -29.6035}, points = {{-25, 0}, {-21, 0}}), Line(origin = {13.8215, -23.0969}, points = {{21.8292, 43.5528}, {-22.1708, -44.4472}, {-22.1708, -42.4472}}), Text(origin = {-29, 171}, extent = {{-51, 33}, {97, -43}}, textString = "%name")}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));    
end Rectifier;