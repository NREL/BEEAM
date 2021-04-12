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
      p := 0;
    elseif P_stby == 0 then
      p := 0;
    else
      p := (P_DCmin - P_DC) ./ P_DCmin;
    end if;
// using efficiency relation
// using efficiency relation, standby power not specified
    annotation(
      Documentation(info = "<html>
<p>Helper function for standy power transition. Function returns a dimensionless coefficient that ranges from 0 to 1.</p>
<p><br>This ensures the converter has a smooth transition when going into standby mode.</p>
<p><br><img src=\"modelica://HPF/Resources/images/ConverterModels/HelperFunctions/eq_lambda.png\"/></p>
</html>"));
  end stbyPwrTransition;

  function harmonicMagnitudeModel
  extends Modelica.Icons.Function;
    input Real h "Harmonic number";
    input Real P_h1 "Real power at fundamental";
    input Real p[6] "Model parameters";
    output Real magI "Current magnitude";
  algorithm
    magI := (p[1].*h + p[2].*P_h1);
  end harmonicMagnitudeModel;

  function harmonicPhaseAngleModel
  extends Modelica.Icons.Function;
    input Real h "Harmonic number";
    input Real P_h1 "Real power at fundamental";
    input Real p[5] "Model parameters";
    output Real phAngleI[:] "Current magnitude";
  algorithm
    phAngleI[:] := p[1] + p[2].*h + p[3].*P_h1 + p[4].*h.*P_h1 + p[5].*P_h1.^2;
  end harmonicPhaseAngleModel;

end HelperFunctions;