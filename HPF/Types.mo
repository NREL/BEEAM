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
  
  type WireGaugeAC = enumeration(
    gauge_14 "14",
    gauge_12 "12",
    gauge_10 "10",
    gauge_8 "8",
    gauge_6 "6",
    gauge_4 "4",
    gauge_3 "3",
    gauge_2 "2",
    gauge_1 "1",
    gauge_1_0 "1/0",
    gauge_2_0 "2/0",
    gauge_3_0 "3/0",
    gauge_4_0 "4/0",
    gauge_250 "250",
    gauge_300 "300",
    gauge_350 "350",
    gauge_400 "400",
    gauge_500 "500",
    gauge_600 "600")
  "Wire gauges" annotation (
  Evaluate=true);
  
  type WireGaugeDC = enumeration(
    gauge_18 "18",
    gauge_16 "16",
    gauge_14 "14",
    gauge_12 "12",
    gauge_10 "10",
    gauge_8 "8",
    gauge_6 "6",
    gauge_4 "4",
    gauge_3 "3",
    gauge_2 "2",
    gauge_1 "1",
    gauge_1_0 "1/0",
    gauge_2_0 "2/0",
    gauge_3_0 "3/0",
    gauge_4_0 "4/0",
    gauge_250 "250",
    gauge_300 "300",
    gauge_350 "350",
    gauge_400 "400",
    gauge_500 "500",
    gauge_600 "600")
  "Wire gauges" annotation (
  Evaluate=true);

  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Types;