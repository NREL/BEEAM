within HPF.PowerConverters;
package HelperFunctions
  extends Modelica.Icons.FunctionsPackage;

  function stbyPwrTransition
    extends Modelica.Icons.Function;
    input Real P_out_min "Minimum output power to start the transition";
    input Real P_in_stby "Standby input power";
    input Real P_out "Output power";
    output Real p "Output coefficient";
  algorithm
    if P_out > P_out_min then
      p := 0;
    elseif P_in_stby == 0 then
      p := 0;
    else
      p := (P_out_min - P_out) ./ P_out_min;
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
    input Real p[6] "Model parameters";
    input Real h "Harmonic number";
    input Real P_h1 "Real power at fundamental";
    output Real magI "Current magnitude";
  algorithm
    magI := (p[1].*P_h1 + p[2]) ./ (((p[1].*P_h1 + p[2]) ./ (p[3].*P_h1 + p[4])) - exp(-(p[5].*P_h1.^(p[6])).*h));
  annotation(
      Documentation(info = "<html><head></head><body>Converter harmonic current magnitude modeling using a 3D sigmoid function.<div>&nbsp;</div></body></html>"));end harmonicMagnitudeModel;

  function harmonicPhaseAngleModel
  extends Modelica.Icons.Function;
    input Real p[5] "Model parameters";
    input Real h "Harmonic number";
    input Real P_h1 "Real power at fundamental";
    output Real phAngleI "Current magnitude";
  algorithm
    phAngleI := p[1] + p[2].*h + p[3].*P_h1 + p[4].*h.*P_h1 + p[5].*P_h1.^2;
  annotation(
      Documentation(info = "<html><head></head><body>Phase angle modeling using a polynomial function in 2 variables.<div><br></div><div>z = p00 + p10*x + p01*y + p11*x*y + p02*y^2</div></body></html>"));
  end harmonicPhaseAngleModel;
  
  function homotopyTransition
    // TO DO: Move this helper function elsewhere more generic in the library.
    // (Leaving here for now because it was easiest to create here.)
    extends Modelica.Icons.Function;
    
    // Implemnents linear homotopy function H: (x,lambda) => (1-lambda)*F(x) + lambda*G(x)
    // Input x maps to t = 0 at the lower boundary and lambda = 1 at the upper boundary
    input Real x "Transition variable to map";
    input Real Lower "Lower transition point for x";
    input Real Upper "Upper transition point for x";
    input Real Fval "Value of function F(x)";
    input Real Gval "Value of function G(x)";
    output Real H "Value of H";
    protected Real lambda;
  algorithm
    // Compute lambda
    if (Upper == Lower) and (x >= Upper) then
      lambda := 1;
    elseif (Upper == Lower) and (x < Lower) then
      lambda := 0;
    else 
      lambda := min(max(0, (x - Lower) / (Upper - Lower)), 1);
    end if;
    
    // Value of H(x)
    H := (1-lambda)*Fval + lambda*Gval;
    annotation(
      Documentation(info = "<html>
  <p>Helper function to implement the <a href=\"https://en.wikipedia.org/wiki/Homotopy\">linear homotopy operation</a> with convenience scaling.</p>
  </html>"));
  end homotopyTransition;

end HelperFunctions;
