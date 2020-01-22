within HPF.Sensors;
model Ammeter_Freq2Time "Current sensor. Converts harmonics (freq domain) to time waveforms"
  extends HPF.SinglePhase.Interface.TwoPinBase;
  Modelica.Blocks.Interfaces.RealOutput y annotation (
    Placement(visible = true, transformation(origin = {-90, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  //protected
  //final output Real y_ifftRe[systemDef.N](each start = 0, each fixed = true);
  //final output Real y_ifftIm[systemDef.N](each start = 0, each fixed = true);
  //final output Real y_wv[systemDef.N](each start = 0) "Temporary waveform output storage buffer";

  Integer iTick(start = 1);
//protected
  // debugging
  final output Real y_wv_2[systemDef.N](each start = 0) "Temporary waveform output storage buffer";
  //Real y_2(start = 0);
  Integer k(start = 1);

algorithm
  /*
    Frequency domain to time.
    Using sample() and when 
  */
  when sample(2*(1/systemDef.N), 3*(1/systemDef.fs)) and k == 0 then
    y := y_wv_2[iTick];
    /*
      if k is < some increment k_1, the sensor would read the frequency domain 
      measurement from the port. This is assuming that the simulation 
      has reached the solution in the first increment k.
    */

    iTick := iTick + 1;
  end when;

  //if time > 1/systemDef.fs and time

  //when sample(1 / systemDef.fs, 2*(1 / systemDef.fs)) and k == 1 then
  when sample(0, 1 / systemDef.fs) and k == 1 then
      k := 0;
      y_wv_2 := HPF.Utilities.ifft_fromMagPhaseOddHrms(Modelica.ComplexMath.'abs'(i), Modelica.ComplexMath.arg(i), systemDef.N);
  end when;


equation
  /*
    System would reach to solution in time t0.
    The sensor would sense the electrical quantity and run an fft.
    
    The frequency to time section would run in the 
    algorithm section. One would perform the ifft in one go,
    but in order to display the correct result, one must step
    through the simulation at the sampling rate and pupulate the 
    output.
    Something like, (ifftRes contains the ifft of the frequency data)
    
    Integer iTick(start = 0);
    algorithm
      when sample(0, ts) then
        
        y = ifftRes[iTick]
        
        iTick = iTick + 1;
      end when;
      
      Also, one should either exit the block after we reach the end of the 
      buffer or we loop. The looping would require some extra coding.
  */

  /*
    Ammeter section.
    Current sensor is in series with zero voltage drop.
  */
  v = {Complex(0.0) for i in 1:systemDef.numHrm};

annotation (
    Icon(graphics={  Ellipse(origin = {-11, 0}, extent = {{-49, 60}, {71, -60}}, endAngle = 360), Line(origin = {-75, 0}, points = {{-15, 0}, {15, 0}}), Line(origin = {75, 0}, points = {{-15, 0}, {15, 0}}), Text(origin = {12, -60}, lineColor = {92, 53, 102},
            lineThickness =                                                                                                                                                                                                        1, extent = {{-36, 76}, {12, -6}}, textString = "A"), Text(origin = {46, -55}, extent = {{-168, -3}, {78, -35}}, textString = "%name"), Line(origin = {-0.18, 22.4}, points = {{-4.85355, -2.20711}, {5.14645, -2.20711}, {1.14645, 1.79289}}, color = {92, 53, 102}), Line(origin = {31.19, 19.07}, rotation = 180, points = {{-13.593, -0.947214}, {-11.593, 3.05279}, {-9.59296, 7.05279}, {-5.59296, 9.05279}, {-1.59296, 5.05279}, {0.407041, -0.947214}, {4.40704, -8.94721}, {10.407, -8.94721}, {14.407, -2.94721}, {14.407, -0.947214}, {14.407, -0.947214}}, color = {92, 53, 102}, smooth = Smooth.Bezier), Line(origin = {-19.0342, 25.5073}, points = {{0, -1}, {0, -11}}, color = {92, 53, 102}), Line(origin = {-28.6708, 25.4946}, points = {{0, 11}, {0, -11}}, color = {92, 53, 102}), Line(origin = {-23.7489, 25.4493}, points = {{0, 5}, {0, -11}}, color = {92, 53, 102}), Line(origin = {-14.2268, 25.4062}, points = {{0, -5}, {0, -11}}, color = {92, 53, 102}), Line(origin = {2.97, 18.19}, points = {{2, 2}, {-2, -2}}, color = {92, 53, 102}), Line(origin = {-42.1537, 21.4132}, points = {{10, -7}, {30, -7}}, color = {92, 53, 102})}, coordinateSystem(initialScale = 0.1)));
end Ammeter_Freq2Time;
