within HPF.Test;

model Function_Test_polyval

  Real coefMag[4] = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768};
  
  Real coefPhase[4] = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008};
  
  Integer hrms[4] = {1, 3, 5, 7};
  Real realVal[4] = {Utilities.polyval(coefMag, h) for h in hrms} .* Modelica.Math.cos({Utilities.polyval(coefPhase, h) for h in hrms});
  Real imagVal[4] = {Utilities.polyval(coefMag, h) for h in hrms} .* Modelica.Math.cos({Utilities.polyval(coefPhase, h) for h in hrms});
  
  Real a = Utilities.polyval(coefMag, 1) ;
  Real valMag[4] = {Utilities.polyval(coefMag, h) for h in hrms};
equation

annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));end Function_Test_polyval;