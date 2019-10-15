within HPF.Sensors;

model Ammeter_Freq2Time "Current sensor. Converts harmonics (freq domain) to time waveforms"
  extends HPF.SinglePhase.Interface.TwoPinBase;
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {-90, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    
// protected 
  Integer iTick;
algorithm
  when sample(0, 0.1) then 
    
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

end Ammeter_Freq2Time;