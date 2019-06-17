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
    
  - 



*/

  annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Todo;