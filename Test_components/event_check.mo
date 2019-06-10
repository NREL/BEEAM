within HPF.Test_components;
model event_check
outer SystemDef systemDef;
//outer Boolean modeSelect;
Integer x(start = 1);

equation

//x = pre(x)+1;

//x = systemDef.modeSelect ;

if systemDef.modeSelect == true then
  x = 10;
else
  x = 20;
end if;


annotation (
    Icon(coordinateSystem(grid = {0, 0}), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}})}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end event_check;
