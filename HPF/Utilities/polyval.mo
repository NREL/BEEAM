within HPF.Utilities;

function polyval
  /*
                                          Polynomial evaluation of the form,
                                          y = a3*x^3 + a2*x^2 + a1*x^1 + a0
                                          
                                        */
  extends Modelica.Icons.Function;
  input Real a[:];
  input Real x;
  output Real y;
algorithm
  y := a[:] * {x ^ i for i in size(a[:], 1) - 1:(-1):0};
  annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})),
    Documentation(info = "<html>
  <h4>Syntax</h4>
  <blockquote><pre>
  Utilities.<b>polyval</b>(a, x);
  </pre></blockquote>
  <h4>Description</h4>
  <p>
  Function <b>polyval</b>(..) evaluates a polynomial described by coeficients a (vector) at value x. The polynomail is of the form, 
  
  <p>y = a3*x^3 + a2*x^2 + a1*x^1 + a0 </p>
  
  
  </p>
  </html>"));
end polyval;