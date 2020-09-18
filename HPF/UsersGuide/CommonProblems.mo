within HPF.UsersGuide;
class CommonProblems
  extends Modelica.Icons.Information;
  annotation (
    Documentation(info="<html>
<ul>
<li>Error message showing: </li>
<li>Setting impedance value as a complex number: <span style=\"font-family: Courier;\">0.05 + 0.062*</span>j gives the error, ... </li>
</ul>
<p style=\"margin-left: 30px;\"><h4>Solution:</h4></p>
<p style=\"margin-left: 30px;\">In the code, add the following line: <span style=\"font-family: Courier;\">import Modelica.ComplexMath.j;</span></p>
</html>"));
end CommonProblems;
