within HPF.Data.ConverterModels.SinglePhase;

package ParameterizedModels
  extends Modelica.Icons.RecordsPackage;

  record CustomModelData
    extends Modelica.Icons.Record;
    parameter Real V = 5.0 annotation (Dialog(group = "Converter characteristics"));
    /*
      Converter model stuff    
    */
    parameter Real alpha = 1.0 annotation (Dialog(group = "Converter efficiency model"));
    parameter Real beta = 1.0 annotation (Dialog(group = "Converter efficiency model"));
    parameter Real gamma = 1.0 annotation (Dialog(group = "Converter efficiency model"));
  end CustomModelData;
  annotation(
    Documentation(info = "<html><head></head><body>Model data (in the form of Modelica Records) for converter parameterized model. Please refer to [?] for more information on the model and parameter extraction.</body></html>"));
end ParameterizedModels;