within HPF.Test;

model sensors
  HPF.Sensors.Voltmeter_Freq2Time voltmeter_Freq2Time annotation(
    Placement(visible = true, transformation(origin = {-24, 16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.Ammeter_Freq2Time ammeter_Freq2Time annotation(
    Placement(visible = true, transformation(origin = {-16, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation

end sensors;