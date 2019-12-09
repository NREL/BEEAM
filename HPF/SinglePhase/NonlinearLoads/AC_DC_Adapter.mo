within HPF.SinglePhase.NonlinearLoads;
model AC_DC_Adapter
  extends HPF.SinglePhase.Interface.TwoPinBase;
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  import Modelica.ComplexMath.j;
/*
  Nonlinear harmonic load workflow and implementation details:
  The workflow is as follows:
  1)  Run fundamental power flow and get voltage across the device (for h=1)
  2)  Use the voltage determined in step 1 and get a current harmonic injection spectrum
  3)  Using the harmonic spectrum, run a harmonic power flow and get losses in the system

  In the first step, the simulation is run only for the 1st harmonic. The user 
  would define the power consumed by the device only at the fundamental. The system 
  should automatically set the power of the higher harmonics to zero. Thus, when a 
  power flow analysis is run, one would only get results for the fundamental (system
  would get zero currents for higher harmonics).
  */
  outer SystemDef systemDef;

  parameter Real sReal(start = 0) = -1 "IMPORTANT: set real power to -ve";
  parameter Real sImag(start = 0) = 0;
  parameter Real iReal[:] = {1};
  parameter Real iImag[:] = {0};

  parameter Real sVect[systemDef.numHrm](each start = 0);
  parameter Real sVectIm[systemDef.numHrm](each start = 0);

  /*
    Modeled current harmonics.
  */
  parameter Real mdlCoefMag[:] = {1} "Modeled magnitude polynomial coefficients";
  parameter Real mdlCoefPhase[:] = {1} "Modeled magnitude polynomial coefficients";

protected
  Complex vPre(re( start = 0), im( start = 0));
equation
  /*
    Power sink for initial fundamental power flow analysis
  */
  if systemDef.modeSelect == false then


  /*
    current source at all the harmonics.
    * One must scale the currents.
    * Higher harmonics are in proportion to the fundamental.
    * The modeled harmonics are with respect to the fundamental voltage,
      with the fundamental voltage at zero degree phase shift.
      Thus, one must include a feature to compute the add the required
      phase shift.
    * The initial power flow analysis would also compute the phase shifts for
      the fundamental voltage.
  */
  else


  end if;

algorithm
  /*
    Event: save results from initial fundamental power flow run
  */
  when change(systemDef.eventWriteData) then
    HPF.SinglePhase.NonlinearLoads.DataIO.writeNodeVoltage(v[1], "testLoad");
  end when;
  /*
    Event: read saved results from event 1
  */
  when change(systemDef.eventReadData) then
    vPre := HPF.SinglePhase.NonlinearLoads.DataIO.readNodeVoltage("testLoad");
  end when;
equation
  connect(pin_p1, pin_p1) annotation (Line(
      points={{-10,86},{-10,86},{-10,86}},
      color={0,0,255},
      smooth=Smooth.Bezier));
annotation (
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={                                                                               Line(origin = {-26.2777, -25.5393}, points = {{-16, 0}, {16, 0}}), Line(origin = {-26.3361, -17.7472}, points = {{-6, 0}, {16, 0}}), Line(origin = {-26.3945, -9.46448}, points = {{-4, 0}, {16, 0}}), Line(origin = {-26.4529, -0.20046}, points = {{0, 0}, {16, 0}}), Line(origin = {-26.4123, 6.85561}, points = {{6, 0}, {16, 0}}), Line(origin = {-26.3765, 14.3552}, points = {{10, 0}, {16, 0}}), Line(origin = {-26.2367, 20.0855}, points = {{14, 0}, {16, 0}}), Line(origin = {5.79692, -27.4612}, points = {{-16, 0}, {-16, 56}}), Line(origin = {17, 0}, points = {{-21, 10}, {21, -10}}), Line(origin = {10, 21}, points = {{0, 9}, {0, -9}}), Line(origin = {21.369, 21.2213}, points = {{0, 9}, {0, -9}}), Line(origin = {13.99, -23.76}, points = {{7.85721, -16}, {-0.142787, -14}, {-6.14279, -12}, {-12.1428, -6}, {-12.1428, -2}, {-8.14279, -3.55271e-15}, {-0.142787, 2}, {7.85721, 4}, {9.85721, 6}, {11.8572, 10}, {9.85721, 12}, {5.85721, 14}, {-2.14279, 16}, {-2.14279, 16}}, smooth = Smooth.Bezier), Line(origin = {-75, 0}, points = {{-15, 0}, {15, 0}}), Line(origin = {75, 0}, points = {{-15, 0}, {15, 0}}),
        Text(
          extent={{-69,23},{69,-23}},
          lineColor={0,0,0},
          origin={-107,107},
          rotation=90,
          textString="%name")}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end AC_DC_Adapter;
