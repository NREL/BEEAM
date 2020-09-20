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
      Documentation(info = "<html><head></head><body>Helper function for standy power transition.<div><br></div><div>Function returns a dimensionless coefficient that ranges from 0 to 1.</div><div><br></div><div>This ensures the converter has a smooth transition when going into standby mode.</div><div><br></div></body></html>"));
  end stbyPwrTransition;

end HelperFunctions;
