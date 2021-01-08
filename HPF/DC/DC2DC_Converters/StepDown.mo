within HPF.DC.DC2DC_Converters;
model StepDown
  /*
    This model builds upon the Analog sublubrary from the Modelica Std Library.
    A two port (for pins) partial model is extended to model a DC-DC converter.
    
    Input port: v1, i1 
    Output port: v2, i2
  */
  extends Modelica.Electrical.Analog.Interfaces.TwoPort;
  // One can pass the name of the object, here the object is of the class (or record)
  // ModelData. The object name will have the appropriate fields.
  parameter HPF.Data.ConverterModels.DC2DC_StepDown.ModelData modelData "Converter model data record";

  //parameter Real effi = 0.95;
  //Real D(start = 0.5);
  // Real Pout(start = 0);
  
  Modelica.Blocks.Interfaces.RealOutput P_loss = abs(v1*i1) - abs(v2*i2); annotation (Placement(
        transformation(extent={{-200,200},{-180,220}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,148})));
equation
  /*
  Converter output voltage will be dependent on the input voltage?
  In an uncontrolled DC/DC converter, the output voltage is a function of the
  duty cycle. To maintain a user defined output voltage, one must use a closed
  loop control scheme.
  Here, the unknown is the duty cycle.
  Avg buck converter voltage current relations
   i2 = -i1 / D;
  //v1 = D*v2;
  v2 = D * v1;
  The unknown D is computed and used to set the currents.
  
  The efficiency can be modeled by setting the current based on the loss model.
  Pout = effi*Pin;
  Pin = v1*i1;
  Pout = v2*i2;
  v2 = known
  we got to set the i2, i2 = -i1 / D;
  
  */
  v2 = modelData.V;
// D is the unknown
//D = v2 / v1;
/*
  Efficiency modeling
  Pin = Pout + alpha + beta*Pout + gamma*Pout^2
  effi = Pout / Pin
  */
//i2 = -(i1 / D) * ((v2*i2) / (v2*i2 + modelData.alpha + v2*i2*modelData.beta + modelData.gamma*(v2*i2)^2));
//i1 = -(((i2*D) / (v2*i2)) * (v2*i2 + modelData.alpha + v2*i2*modelData.beta + modelData.gamma*(v2*i2)^2));
  v1*i1 = (v2*abs(i2) + modelData.alpha + (v2*abs(i2))*modelData.beta + modelData.gamma*((v2*i2)^2));

annotation (
    Icon(coordinateSystem(initialScale = 0.1), graphics={  Rectangle(origin = {0, -1}, extent = {{-90, 139}, {90, -139}}), Line(origin = {-56.3552, 13.1638}, points = {{-13, 0}, {27, 0}}), Line(origin = {-56.6, -11.5877}, points = {{-13, 0}, {27, 0}}, pattern = LinePattern.Dash), Line(origin = {7.77913, 28.8419}, points = {{-49, -90}, {35, 34}}), Line(origin = {42.1208, 13.1638}, points = {{-13, 0}, {27, 0}}), Line(origin = {41.876, -11.5877}, points = {{-13, 0}, {27, 0}}, pattern = LinePattern.Dash), Text(origin={0,
              -240},                                                                                                                                                                                                        lineColor = {92, 53, 102}, extent = {{-180, 60}, {180, 100}}, textString = "%name")}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})),
    Documentation(info="<html>
<p>DC to DC step down (buck) converter. Converter efficiency is modeled using a quadratic loss model. </p>
</html>"));
end StepDown;
