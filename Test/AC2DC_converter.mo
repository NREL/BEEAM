within HPF.Test;

model AC2DC_converter

  import Modelica.ComplexMath.j;
  
  // dummy variables for systemDef
  final parameter Integer numHrm = 4;
  Real hrms[4] = {1, 3, 5, 7};
  
  parameter String modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_laptop.mat";
  final parameter String resourceRetValue = Modelica.Utilities.Files.loadResource("modelica://" + modelFileName);
  final parameter Integer matDim[2] = Modelica.Utilities.Streams.readMatrixSize(resourceRetValue, "mag");
  // assuming magnitude and angle vectors have same dimension
  final parameter Real magDataMat[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetValue, "mag", matDim[1], 1);
  final parameter Real argDataMat[:, :] = Modelica.Utilities.Streams.readRealMatrix(resourceRetValue, "arg", matDim[1], 1);
  parameter Real efficiency = 0.9;
 
  Real P = efficiency * (10 * 2);  // DC output power
  //Real S(start = 1) "Apparent power at fundamental";
  //Real Q(start = 1) "Imaginary power at fundamental";
  
  Real argI[numHrm] = {0.5, 0.2, 0.1, -0.3};
  Complex i[numHrm];
  //{0.5*Complex(cos(argI[1]), sin(argI[1])), 0.4*Complex(cos(argI[2]), sin(argI[2])), 0.3*Complex(cos(argI[3]), sin(argI[3])), 0.2*Complex(cos(argI[4]), sin(argI[4]))};
  Real argV[numHrm] = {0.1, -0.2, 0.5, 1.2};
  Complex v[numHrm] = {100*Complex(cos(argV[1]), sin(argV[1])), 1.5*Complex(cos(argV[2]), sin(argV[2])), 0.2*Complex(cos(argV[3]), sin(argV[3])), Complex(0.0)};
  
//protected
  Real S(start = 1) "Apparent power at fundamental";
  Real Q(start = 1) "Imaginary power at fundamental";
  Real argS "Phase angle for fundamental apparent power";
  Real magScale = 1 / Modelica.ComplexMath.'abs'(i[1]);
  Real argAdj[numHrm - 1] = argDataMat[2:(numHrm), 1] - (Modelica.ComplexMath.arg(v[1]) .* hrms[2:end]);
  
  //Complex a[3] = {Complex(cos(k), sin(k)) for k in 1:3};
  Complex a[3] = Complex(cos(argAdj), sin(argAdj));
  Complex b[3] = 0.5 * Complex(cos(argAdj), sin(argAdj));
  Real c[3] = magScale * magDataMat[2:numHrm, 1];
  //Complex d[3] = {c[k]*b[k] for k in 1:3};
algorithm 
  
  
equation
  argS = Modelica.ComplexMath.arg(v[1]) - argDataMat[1, 1]; 
  P = S * cos(argS);
  Q = S * sin(argS);
  
  i[1] = Complex(1.0);
  i[2:end] = {c[i]*a[i] for i in 1:numHrm-1};

end AC2DC_converter;