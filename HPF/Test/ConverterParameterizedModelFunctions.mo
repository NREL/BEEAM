within HPF.Test;

model ConverterParameterizedModelFunctions
  Real iMag[2] = HPF.PowerConverters.HelperFunctions.harmonicMagnitudeModel({-0.16171, -0.00299, 0.00888, -0.00097, -0.19875, 0.12419}, {1, 3}, 30);
  Real iArg[2] = HPF.PowerConverters.HelperFunctions.harmonicPhaseAngleModel({2.09601, -1.56828, -0.01429, 0.00152, 0.00009}, {1, 3}, 30);
equation

end ConverterParameterizedModelFunctions;