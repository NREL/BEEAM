within HPF.Data.ConverterModels;
package DC2DC_StepDown "DC to DC step down converter model data record"
  extends Modelica.Icons.RecordsPackage;
  record ModelData
    extends Modelica.Icons.Record;

    /*(create dialog sections using annotation)
      Converter characteristics
        - output voltage
    */
    parameter Modelica.SIunits.Voltage V = 5.0 annotation (Dialog(group = "Converter characteristics"));
    /*
      Converter model stuff    
    */
    parameter Real alpha = 1.0 annotation (Dialog(group = "Converter efficiency model"));
    parameter Real beta = 1.0 annotation (Dialog(group = "Converter efficiency model"));
    parameter Real gamma = 1.0 annotation (Dialog(group = "Converter efficiency model"));
    annotation(defaultComponentPrefixes = "parameter");
  end ModelData;

  record Laptop_18V_90W
    extends HPF.Data.ConverterModels.DC2DC_StepDown.ModelData;
    annotation (
      Documentation(info = "<html><head></head><body>BiXPower DD90X DC/DC laptop charger.&nbsp;</body></html>"));

  end Laptop_18V_90W;
end DC2DC_StepDown;
