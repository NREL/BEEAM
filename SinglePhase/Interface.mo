within HPF.SinglePhase;

package Interface
  connector HPin
    /*
      Specialized connector for the harmonic power flow. 
      HPin, where H is for harmonics. The name signifies the special nature of the connector and its intended usage.
                  
    h_max specifies the maximum harmonics to be simulated. The default value 
    (What should be a nominal value?) is used when user does not explicitly specify. 
    */
    
    /*
      potential variables
    */
    parameter Integer h(start = 1);
    Complex v[h] "Complex potential at the node";
    /*
                      flow variables
                    */
    flow Real iIm[h];
    // flow variable, imaginary part
    flow Real iRe[h];
    // Real part
    annotation(
      Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Rectangle(origin = {0, -1}, extent = {{-100, 101}, {100, -99}})}),
      Diagram(coordinateSystem(grid = {0, 0})),
      __OpenModelica_commandLineOptions = "");
  end HPin;

  connector HPin_P "Positive Terminal"
    /* positive pin
                      Redefinition of HPin.
                      This explicity defines the pin as a positive pin
                      making it easier for defining polarity sensitive 
                      components and devices.
                  */
    extends HPin;
    Types.Reference reference "Reference";
    annotation(
      Icon(coordinateSystem(grid = {0, 0}), graphics = {Rectangle(lineColor = {117, 80, 123}, fillColor = {117, 80, 123}, fillPattern = FillPattern.Solid, lineThickness = 2, extent = {{-100, 100}, {100, -100}})}),
      Diagram(coordinateSystem(grid = {0, 0})),
      __OpenModelica_commandLineOptions = "");
  end HPin_P;

  connector HPin_N "Negative Terminal"
    extends HPin;
    Types.Reference reference "Reference";
    annotation(
      Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Rectangle(lineColor = {117, 80, 123}, fillColor = {117, 80, 123}, extent = {{-100, 100}, {100, -100}})}),
      Diagram(coordinateSystem(grid = {0, 0})),
      __OpenModelica_commandLineOptions = "");
  end HPin_N;

  partial model TwoPinBase
    outer SystemDef systemDef;
    // instantiate systemDef as outer for global scope
    Complex v[systemDef.numHrm] "Complex voltage";
    Complex i[systemDef.numHrm] "Complex current";
    /*
                      Defining omega for the overconstrained system workaround.
                      omega would the derivative of alpha. ( additional constraint,
                      as defined in pin.reference.theta)
                    */
    Real omega;
    /* pin objects for the two pins
                        number of harmonics to be simulated is passed as a parameter.
                    */
    HPF.SinglePhase.Interface.HPin_P pin_p(h = systemDef.numHrm) "Positive pin" annotation(
      Placement(visible = true, transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0), iconTransformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
    HPF.SinglePhase.Interface.HPin_N pin_n(h = systemDef.numHrm) "Negative pin" annotation(
      Placement(visible = true, transformation(extent = {{90, -10}, {110, 10}}, rotation = 0), iconTransformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
  equation
/*
      Nonbreakable branch for the overterdetermined variable.
    */
    Connections.branch(pin_p.reference, pin_n.reference);
    pin_p.reference.theta = pin_n.reference.theta;
    omega = der(pin_p.reference.theta);
  /*
      voltage drop
    */
    v = pin_p.v - pin_n.v;
    i.re = pin_p.iRe;
    i.im = pin_p.iIm;
/*
      Conservation of charge (KCL).
    */
    pin_p.iRe + pin_n.iRe = {0.0 for i in 1:systemDef.numHrm};
    pin_p.iIm + pin_n.iIm = {0.0 for i in 1:systemDef.numHrm};
    annotation(
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(grid = {0, 0})),
      __OpenModelica_commandLineOptions = "");
  end TwoPinBase;

  partial model TwoPortBase
    /*
      Partial model for defining a transformer or other two port device.
      This partial model is different from TwoPinBase (used to define 
      a one port component such as resistance).
    */
    outer SystemDef systemDef;
    
    Complex vPrim[systemDef.numHrm] "Complex voltage primary winding";
    Complex iPrim[systemDef.numHrm] "Complex current primary winding";
    Complex vSec[systemDef.numHrm] "Complex voltage secondary winding";
    Complex iSec[systemDef.numHrm] "Complex current secondary winding";
    
    HPF.SinglePhase.Interface.HPin_P pinP_Prim(h = systemDef.numHrm)  annotation(
      Placement(visible = true, transformation(origin = {-100, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    HPF.SinglePhase.Interface.HPin_N pinN_Prim(h = systemDef.numHrm)  annotation(
        Placement(visible = true, transformation(origin = {-114, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    HPF.SinglePhase.Interface.HPin_P pinP_Sec(h = systemDef.numHrm)  annotation(
        Placement(visible = true, transformation(origin = {92, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    HPF.SinglePhase.Interface.HPin_N pinN_Sec(h = systemDef.numHrm)  annotation(
      Placement(visible = true, transformation(origin = {60, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  equation
    /*
      loop breaking connections.
      Taking a cue from 'IdealTransformer:QuasiStationary' library
      
      P1 ---- P2
      |
      |
      N1 ---- N2
    */
    
    Connections.branch(pinP_Prim.reference, pinN_Prim.reference); // Pos Prim and sec
    pinP_Prim.reference.theta = pinN_Prim.reference.theta;
    Connections.branch(pinP_Prim.reference, pinP_Sec.reference); // Pos Prim and pos sec
    pinP_Prim.reference.theta = pinP_Sec.reference.theta;
    Connections.branch(pinN_Prim.reference, pinN_Sec.reference);  // Neg prim and neg prim
    pinN_Prim.reference.theta = pinN_Sec.reference.theta;
    
    /*
      voltage drop & current measurement
    */
    vPrim = pinP_Prim.v - pinN_Prim.v;
    vSec = pinP_Sec.v - pinN_Sec.v;
    iPrim.re = pinP_Prim.iRe;
    iPrim.im = pinP_Prim.iIm;
    iSec.re = pinP_Sec.iRe;
    iSec.im = pinP_Sec.iIm;
    /*
      current balance
    */
    pinP_Prim.iRe + pinN_Prim.iRe = {0.0 for i in 1:systemDef.numHrm};
    pinP_Prim.iIm + pinN_Prim.iIm = {0.0 for i in 1:systemDef.numHrm};
    pinP_Sec.iRe + pinN_Sec.iRe = {0.0 for i in 1:systemDef.numHrm};
    pinP_Sec.iIm + pinN_Sec.iIm = {0.0 for i in 1:systemDef.numHrm};
    
    annotation(
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end TwoPortBase;
  annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Interface;