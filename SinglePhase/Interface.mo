within HPF.SinglePhase;

package Interface
  extends Modelica.Icons.InterfacesPackage;

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
    parameter Integer h(start = 1) "Numbder of harmonics";
    Complex v[h] "Complex potential at the node";
    /*
          Flow variables.
          (It was necessary to define the flow variables separately
          (real and imaginart) as some of the modelica implementations
          donot resolve the Complex record when it is defined as a vector)
        */
    flow Real iIm[h];
    // Real part
    flow Real iRe[h];
    // Imaginary part
    annotation(
      Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}})}),
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
    HPF.Types.Reference reference "Reference";
    annotation(
      Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Rectangle(fillColor = {92, 53, 102}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}),
      __OpenModelica_commandLineOptions = "",
      Diagram(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Text(origin = {-81, 258}, extent = {{-45, 22}, {197, -260}}, textString = "%name"), Rectangle(extent = {{-100, 100}, {-100, 100}}), Rectangle(extent = {{100, -100}, {-100, 100}})}));
  end HPin_P;

  connector HPin_N "Negative Terminal"
    extends HPin;
    Types.Reference reference "Reference";
    annotation(
      Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Rectangle(lineColor = {117, 80, 123}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}),
      Diagram(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-99, 189}, extent = {{-47, 33}, {261, -123}}, textString = "%name")}),
      __OpenModelica_commandLineOptions = "");
  end HPin_N;

  partial model TwoPinBase
    outer SystemDef systemDef;
    // instantiate systemDef as outer for global scope
    /*
      Complex v(re(start = 0), im(start = 0));
      Note on start and nominal value:
      The power flow solution is a nonlinear problem solved using 
      any of the nonlinear solver techniques (Example Newton).
      Simulation fails if the initial values are off by a large 
      margin. It was observed that a nominal value of zero
      lead to solver failing to solve. Nominal value of one 
      seems to work! 
    */
    Complex v[systemDef.numHrm](each re(start = 0, nominal = 1), each im(start = 0, nominal = 1)) "Complex voltage";
    Complex i[systemDef.numHrm](each re(start = 0, nominal = 1), each im(start = 0, nominal = 1)) "Complex current";
    /*
          Defining omega for the overconstrained system workaround.
          omega would the derivative of alpha. ( additional constraint,
          as defined in pin.reference.theta)
        */
    Real omega;
    /*  pin objects for the two pins
            number of harmonics to be simulated is passed as a parameter.
        */
    HPF.SinglePhase.Interface.HPin_P pin_p(h = systemDef.numHrm) "Positive pin" annotation(
      Placement(visible = true, transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0), iconTransformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
    HPF.SinglePhase.Interface.HPin_N pin_n(h = systemDef.numHrm) "Negative pin" annotation(
      Placement(visible = true, transformation(extent = {{90, -10}, {110, 10}}, rotation = 0), iconTransformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
  initial equation

  equation
  /*
      Nonbreakable branch for the overdetermined variable.
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

  partial model Source
    /*
        Partial model class for voltage sources.
        This partial model extends the two pin base partial model
        to include the additional type used in the loop reduction
        algorithm (overconstrained connection based equation systems)
      */
    extends HPF.SinglePhase.Interface.TwoPinBase;
    /*
          Defining an additional type 
        */
    Modelica.SIunits.Angle theta(start = 0) = pin_p.reference.theta;
  equation
/*
      Defining root for the graph, root node in a virtual connection graph.
    */
    Connections.root(pin_p.reference);
    annotation(
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end Source;

  partial model TwoPortBase
      /*
        Partial model for defining a transformer or other two port (four pin)
        device. This partial model is different from TwoPinBase (used to define 
        a one port component such as resistance).
      */
      outer SystemDef systemDef;
  
      Complex vPrim[systemDef.numHrm] "Complex voltage primary winding";
      Complex iPrim[systemDef.numHrm] "Complex current primary winding";
      Complex vSec[systemDef.numHrm] "Complex voltage secondary winding";
      Complex iSec[systemDef.numHrm] "Complex current secondary winding";
  
      HPF.SinglePhase.Interface.HPin_P pinP_Prim(h = systemDef.numHrm)  annotation (
        Placement(visible = true, transformation(origin = {-100, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      HPF.SinglePhase.Interface.HPin_N pinN_Prim(h = systemDef.numHrm)  annotation (
          Placement(visible = true, transformation(origin = {-114, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      HPF.SinglePhase.Interface.HPin_P pinP_Sec(h = systemDef.numHrm)  annotation (
          Placement(visible = true, transformation(origin = {92, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      HPF.SinglePhase.Interface.HPin_N pinN_Sec(h = systemDef.numHrm)  annotation (
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
  
      annotation (
        Icon(coordinateSystem(grid = {0, 0})),
        Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
    end TwoPortBase;

  partial model TwoPortBaseAnalog
  /*
    Two port (two one port classes) partial class for a rectifier.
    AC side is the multi harmonic side. The DC side 
    consists of analog connector from Modelica std library,
    Modelica.Electrical.Analog
    
  */
    outer SystemDef systemDef;
    
    /*
      Harmonic (AC) side voltage and current.
    */
    Complex vHrm[systemDef.numHrm](each re(start = 0, nominal = 1), each im(start = 0, nominal = 1)) "Complex voltage";
    Complex iHrm[systemDef.numHrm](each re(start = 0, nominal = 1), each im(start = 0, nominal = 1)) "Complex current";
    // overdetermined variable
    Real omega;
    
    /*
      DC side voltage and current. (Redefining directly from Modelica.Electrical.Analog.Interfaces.OnePort)
    */
    Real vDC "DC voltage";
    Real iDC "DC current";
    
    HPF.SinglePhase.Interface.HPin_P hPin_P(h = systemDef.numHrm) annotation(
        Placement(visible = true, transformation(origin = {-90, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    HPF.SinglePhase.Interface.HPin_N hPin_N(h = systemDef.numHrm) annotation(
        Placement(visible = true, transformation(origin = {-90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100,-100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
        Placement(visible = true, transformation(origin = {120, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
      Placement(visible = true, transformation(origin = {122, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  initial equation 
  
  equation
    /*
      Harmonic (AC) side
    */
    Connections.branch(hPin_P.reference, hPin_N.reference);
    hPin_P.reference.theta = hPin_N.reference.theta;  
    omega = der(hPin_P.reference.theta);
    
    vHrm = hPin_P.v - hPin_N.v;
    hPin_P.iRe + hPin_N.iRe = {0.0 for i in 1:systemDef.numHrm};
    hPin_P.iIm + hPin_N.iIm = {0.0 for i in 1:systemDef.numHrm};
    iHrm.re = hPin_P.iRe;
    iHrm.im = hPin_P.iIm;
    
    /*
      DC side
    */
    vDC = pin_p.v - pin_n.v;
    0.0 = pin_p.i + pin_n.i;
    iDC = pin_p.i; 
    
    annotation(
      Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1)),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end TwoPortBaseAnalog;

  model LoadBase
    extends HPF.SinglePhase.Interface.TwoPinBase;
  equation

    annotation(
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end LoadBase;
  annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Interface;