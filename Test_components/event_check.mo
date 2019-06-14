within HPF.Test_components;
model event_check
outer SystemDef systemDef;
//outer Boolean modeSelect;
Integer x(start = 1);
Integer y(start = 0);
equation

//x = pre(x)+1;

//x = systemDef.modeSelect ;

if systemDef.modeSelect == false then
  x = 10;
  y = x;
else
  x = 20;
  y = pre(x);
end if;


annotation (
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {-28, 171}, extent = {{-70, 25}, {138, -115}}, textString = "%name")}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end event_check;
