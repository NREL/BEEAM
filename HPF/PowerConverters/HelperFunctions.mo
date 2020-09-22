within HPF.PowerConverters;
package HelperFunctions
  extends Modelica.Icons.FunctionsPackage;

  function stbyPwrTransition
    extends Modelica.Icons.Function;
    input Real P_DCmin "Minimum DC power to start the transition";
    input Real P_stby "Standby AC input power";
    input Real P_DC "DC power";
    output Real p "Output coefficient";
  algorithm
    if P_DC > P_DCmin then
      p := 0; // using efficiency relation
    elseif P_stby == 0 then
      p := 0;   // using efficiency relation, standby power not specified
    else
      p := (P_DCmin - P_DC) ./ P_DCmin;
    end if;

  annotation (
      Documentation(info="<html>
<p>Helper function for standy power transition. Function returns a dimensionless coefficient that ranges from 0 to 1.</p>
<p><br>This ensures the converter has a smooth transition when going into standby mode.</p>
<p><br><img src=\"modelica://HPF/Resources/images/ConverterModels/HelperFunctions/eq_lambda.png\"/></p>
</html>"));
  end stbyPwrTransition;

end HelperFunctions;
