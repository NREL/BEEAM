within HPF;
package Utilities
    extends Modelica.Icons.UtilitiesPackage;

  partial model WireGaugeValues
    final parameter Real gaugeResistanceAC[19] = {10.2, 6.6, 3.9,  2.56, 1.61, 1.02, 0.82, 0.66, 0.52, 0.43, 0.33, 0.269,  0.220, 0.187, 0.161, 0.141, 0.125, 0.0853, 0.0689} "AC gauge to resistance in ohms per 1000 meters";
    final parameter Real gaugeResistanceDC[22] = {26.1, 16.4, 10.3, 6.5, 4.07, 2.551, 1.608, 1.01, 0.802, 0.634, 0.505, 0.399, 0.317, 0.2512, 0.1996, 0.1687, 0.1409, 0.1205, 0.1053, 0.0845, 0.0704,93.8}  "DC gauge to resistance in ohms per 1000 meters";
    annotation (
      Icon(coordinateSystem(grid = {0.1, 0.1})));
  end WireGaugeValues;

end Utilities;
