within HPF.SinglePhase;

package Interface
  extends Modelica.Icons.InterfacesPackage;

  connector HPin
  
    parameter Integer h(start = 1) "Numbder of harmonics";
    Complex v[h] "Complex potential at the node"; // potential variable
    /*
      Flow variables.
      (It was necessary to define the flow variables separately
      (real and imaginart) as some of the modelica implementations
      donot resolve the Complex record when it is defined as a vector)
    */
    flow Real iIm[h]; // Imaginary part
    flow Real iRe[h]; // Real part
    annotation(
      Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Rectangle(extent = {{-100, 100}, {100, -100}})}),
      Diagram(coordinateSystem(grid = {0, 0})),
      __OpenModelica_commandLineOptions = "",
  Documentation(info = "<html><head></head><body>Specialized connector for the harmonic power flow. HPin, where H is for harmonics. The name signifies the special nature of the connector and its intended usage. <i>h</i> specifies the maximum harmonics to be simulated. The default value is used when user does not explicitly specify.&nbsp;</body></html>"));
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
      Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Rectangle(lineColor = {92, 53, 102}, fillColor = {92, 53, 102}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}),
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
    outer SystemDef systemDef; // instantiate systemDef as outer for global scope
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
    parameter Real start_v_re[systemDef.numHrm] = {0.0 for i in 1:systemDef.numHrm} "Start value for voltage real part" annotation(
      Dialog(tab = "Initialization"));
    parameter Real start_v_im[systemDef.numHrm] = {0.0 for i in 1:systemDef.numHrm} "Start value for voltage imag part" annotation(
      Dialog(tab = "Initialization"));
    parameter Real start_i_re[systemDef.numHrm] = {0.0 for i in 1:systemDef.numHrm} "Start value for current real part" annotation(
      Dialog(tab = "Initialization"));
    parameter Real start_i_im[systemDef.numHrm] = {0.0 for i in 1:systemDef.numHrm} "Start value for current imag part" annotation(
      Dialog(tab = "Initialization"));
    Complex v[systemDef.numHrm](re(start = start_v_re, each fixed = false), im(start = start_v_im)) "Complex voltage";
    Complex i[systemDef.numHrm](re(start = start_i_re, each fixed = false), im(start = start_i_im)) "Complex current";
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
    /* Port power computations */
    // Real S = v[:] .* Modelica.ComplexMath.conj(i[:]);
    // Real P = Modelica.ComplexMath.real(S);
    // Real Q = Modelica.ComplexMath.imag(S);
  initial equation
  
  equation
    Connections.branch(pin_p.reference, pin_n.reference); // Nonbreakable branch for the overdetermined variable.
    pin_p.reference.theta = pin_n.reference.theta;
    omega = der(pin_p.reference.theta);
  
    v = pin_p.v - pin_n.v; //voltage drop
    i.re = pin_p.iRe;
    i.im = pin_p.iIm;
    
    pin_p.iRe + pin_n.iRe = {0.0 for i in 1:systemDef.numHrm}; // Conservation of charge (KCL).
    pin_p.iIm + pin_n.iIm = {0.0 for i in 1:systemDef.numHrm};
    annotation(
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(grid = {0, 0})),
      __OpenModelica_commandLineOptions = "",
      Documentation(info = "<html><head></head><body>Partial model for a two pin element. Defines the voltage and current relation for the input and output pin.&nbsp;<div><br></div><div>Used as a building block to construct all two pin elements such as voltage source, impedance, etc.</div></body></html>"));
  end TwoPinBase;

  partial model Source
  
    extends HPF.SinglePhase.Interface.TwoPinBase;
  
  equation
    Connections.root(pin_p.reference); //Defining root for the graph, root node in a virtual connection graph.
    annotation(
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})),
  Documentation(info = "<html><head></head><body>Partial model class for voltage sources. This partial model extends the two pin base partial model to include the additional type used in the loop reduction algorithm (overconstrained connection based equation systems)</body></html>"));
  end Source;

  partial model TwoPortBase
    /*
      Partial model for defining a transformer or other two port (four pin)
      device. This partial model is different from TwoPinBase (used to define 
      a one port component such as resistance).
    */
    outer SystemDef systemDef;
    parameter Real start_v_re_prim[systemDef.numHrm] = {0.0 for i in 1:systemDef.numHrm} "Start value for voltage real part (primary)";
    parameter Real start_v_im_prim[systemDef.numHrm] = {0.0 for i in 1:systemDef.numHrm} "Start value for voltage imag part (primary)";
    parameter Real start_i_re_prim[systemDef.numHrm] = {0.0 for i in 1:systemDef.numHrm} "Start value for current real part (primary)";
    parameter Real start_i_im_prim[systemDef.numHrm] = {0.0 for i in 1:systemDef.numHrm} "Start value for current imag part (primary)";
    parameter Real start_v_re_sec[systemDef.numHrm] = {0.0 for i in 1:systemDef.numHrm} "Start value for voltage real part (secondary)";
    parameter Real start_v_im_sec[systemDef.numHrm] = {0.0 for i in 1:systemDef.numHrm} "Start value for voltage imag part (secondary)";
    parameter Real start_i_re_sec[systemDef.numHrm] = {0.0 for i in 1:systemDef.numHrm} "Start value for current real part (secondary)";
    parameter Real start_i_im_sec[systemDef.numHrm] = {0.0 for i in 1:systemDef.numHrm} "Start value for current imag part (secondary)";
    Complex vPrim[systemDef.numHrm](re(start = start_v_re_prim, each fixed = false), im(start = start_v_im_prim, each fixed = false)) "Complex voltage primary winding";
    Complex iPrim[systemDef.numHrm](re(start = start_i_re_prim), im(start = start_i_im_prim)) "Complex current primary winding";
    Complex vSec[systemDef.numHrm](re(start = start_i_re_sec, each fixed = false), im(start = start_i_im_sec, each fixed = false)) "Complex voltage secondary winding";
    Complex iSec[systemDef.numHrm](re(start = start_i_re_sec), im(start = start_i_im_sec)) "Complex current secondary winding";
    HPF.SinglePhase.Interface.HPin_P pinP_Prim(h = systemDef.numHrm) annotation(
      Placement(visible = true, transformation(origin = {-100, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    HPF.SinglePhase.Interface.HPin_N pinN_Prim(h = systemDef.numHrm) annotation(
      Placement(visible = true, transformation(origin = {-114, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    HPF.SinglePhase.Interface.HPin_P pinP_Sec(h = systemDef.numHrm) annotation(
      Placement(visible = true, transformation(origin = {92, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    HPF.SinglePhase.Interface.HPin_N pinN_Sec(h = systemDef.numHrm) annotation(
      Placement(visible = true, transformation(origin = {60, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  /*
        loop breaking connections.
        Taking a cue from 'IdealTransformer:QuasiStationary' library
        
        P1 ---- P2
        |
        |
        N1 ---- N2
      */
    Connections.branch(pinP_Prim.reference, pinN_Prim.reference);
    pinP_Prim.reference.theta = pinN_Prim.reference.theta; // Pos Prim and sec
    Connections.branch(pinP_Prim.reference, pinP_Sec.reference);
    pinP_Prim.reference.theta = pinP_Sec.reference.theta; // Pos Prim and pos sec
    Connections.branch(pinN_Prim.reference, pinN_Sec.reference);
    pinN_Prim.reference.theta = pinN_Sec.reference.theta; // Neg prim and neg prim
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

  model LoadBase
    extends HPF.SinglePhase.Interface.TwoPinBase;
  equation

    annotation(
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end LoadBase;

  partial model ACDC_ConverterBase
    outer SystemDef systemDef;
    
    // Ratings
    parameter Modelica.SIunits.Voltage V_Rect(start = 0) = 1 "Rectifier DC output" annotation(Dialog(group="Device Ratings"));
    parameter Modelica.SIunits.Power nomP = 50 "Rated nominal power" annotation(Dialog(group="Device Ratings"));
    parameter Modelica.SIunits.Voltage nomV = 120 "Nominal AC operating voltage" annotation(Dialog(group="Device Ratings"));
    final parameter Modelica.SIunits.Current nomI = nomP / nomV "Nominal AC operating current";
    
    // Initialization
    parameter Modelica.SIunits.Angle vAngle = 0 "Nominal voltage angle for solver init" annotation(Dialog(group="Initialization"));
    
    // Loss Model
    parameter Modelica.SIunits.Power P_stby = 0 "Standby (no load) input AC power" annotation(Dialog(group="Converter Loss Model"));
    parameter Modelica.SIunits.Power P_DCmin = 0.5 "Minimum converter power (2-stage loss model)" annotation(Dialog(group="Converter Loss Model"));
    
    HPF.SinglePhase.Interface.HPin_P hPin_P(h = systemDef.numHrm) annotation(
      Placement(visible = true, transformation(origin = {-84, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, 70}, {-90, 90}}, rotation = 0)));
    HPF.SinglePhase.Interface.HPin_N hPin_N(h = systemDef.numHrm) annotation(
      Placement(visible = true, transformation(origin = {-80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, -90}, {-90, -70}}, rotation = 0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
      Placement(visible = true, transformation(origin = {80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{90, 70}, {110, 90}}, rotation = 0)));
    
    Modelica.Electrical.Analog.Sources.ConstantVoltage vDC(V = V_Rect) annotation(
      Placement(visible = true, transformation(origin = {20, -12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    LoadBase loadBase(start_i_im = cat(1, {nomP / nomV * sin(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_i_re = cat(1, {nomP / nomV * cos(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_im = cat(1, {nomV * sin(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_re = cat(1, {nomV * cos(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1})) annotation(
      Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
      Placement(visible = true, transformation(origin = {80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{90, -90}, {110, -70}}, rotation = 0)));
    equation
    connect(vDC.p, pin_p) annotation(
      Line(points = {{20, -2}, {20, 40}, {80, 40}}, color = {0, 0, 255}));
    connect(hPin_P, loadBase.pin_p) annotation(
      Line(points = {{-84, 42}, {-20, 42}, {-20, 0}}));
    connect(loadBase.pin_n, hPin_N) annotation(
      Line(points = {{-20, -20}, {-20, -60}, {-80, -60}}, color = {117, 80, 123}));
    connect(vDC.n, pin_n) annotation(
      Line(points = {{20, -22}, {20, -60}, {80, -60}}, color = {0, 0, 255}));
    annotation(
      Icon(graphics = {Line(origin = {-47.7858, -4.01698}, points = {{-44.9518, 25.9597}, {-40.9518, 41.9597}, {-34.9518, 57.9597}, {-26.9518, 65.9597}, {-16.9518, 61.9597}, {-10.9518, 45.9597}, {-6.95182, 27.9597}, {-2.95182, 7.9597}, {5.04818, -8.0403}, {15.0482, -14.0403}, {27.0482, -4.0403}, {33.0482, 11.9597}, {37.0482, 25.9596}}, smooth = Smooth.Bezier), Line(origin = {-4, 68}, points = {{0, 4}, {0, -24}}), Line(origin = {23, 68}, points = {{0, -10}, {0, -24}}), Line(origin = {57.1355, -5.36942}, points = {{-25, 0}, {25, 0}}), Line(origin = {-3.63854, 43.8449}, rotation = -90, points = {{0, 36}, {0, -24}}), Line(origin = {1.01175, 2.8636e-05}, points = {{-101, -100}, {99, 100}}), Line(origin = {14, 68}, points = {{0, -6}, {0, -24}}), Line(origin = {-22.41, 68}, points = {{0, 24}, {0, -24}}), Line(origin = {5, 68}, points = {{0, -2}, {0, -24}}), Line(origin = {-13, 68}, points = {{0, 14}, {0, -24}}), Line(origin = {57.5095, -28.0427}, points = {{-25, 0}, {25, 0}}, pattern = LinePattern.Dash), Rectangle(origin = {-1, 0}, extent = {{-99, 100}, {101, -100}})}));
  end ACDC_ConverterBase;
  annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Interface;
