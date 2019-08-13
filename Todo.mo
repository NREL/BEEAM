within HPF;
class Todo

/*
  Tasks:
  - Assign start up values (= 0.0) to v and i in 
    SinglePhase.Interface.TwoPinBase.
    (Remedy for Power flow analysis throwing an error:
    Matrix singular; "Iteration variables with default 
    zero start attribute in torn nonlinear system")
    
    This can either be achived by setting the start attribute
    or one can use the 'initial equation' block.
    
  - Nonlinear harmonic load read/write operation:
      The data file used to read write data (workaround for
      model switch from power flow to current injection),
      has a static name. One must assign a unique file name
      to the data (mat) file. 



*/

  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Todo;
