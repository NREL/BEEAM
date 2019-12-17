within HPF;
package Types
  extends Modelica.Icons.TypesPackage;
  record Reference
  /*
  In a system containing lot components connected using connectors,
  one can get into a scenario with loops. This leads to an overconstrained 
  system (System would have more equations than variables). 
  
  
  From Modelica Reference:
  
  type Type // overdetermined type
    extends <base type>;
    function equalityConstraint // non-redundant equality
      input Type T1;
      input Type T2;
      output Real residue[ <n> ];
    algorithm
      residue := ...
    end equalityConstraint;
  end Type;
  record Record
  < declaration of record fields>
    function equalityConstraint // non-redundant equality
      input Record R1;
      input Record R2;
      output Real residue[ <n> ];
    algorithm
      residue := ...
   end equalityConstraint;
  end Record;
  */

    Modelica.SIunits.Angle theta(start = 0);

    function equalityConstraint "Eqauality constraint for reference angle"
      input Reference reference1;
      input Reference reference2;
      output Real residue[0];
    algorithm
      assert(abs(reference1.theta - reference2.theta) < 1E-6*2*Modelica.Constants.pi, "Reference angles should be equal!");
    end equalityConstraint;

    annotation (
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end Reference;
  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Types;