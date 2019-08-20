within HPF.MultiPhase;
package PhaseCoupling
  extends Modelica.Icons.Package;

  model PhaseSelect_N

    HPF.MultiPhase.Interface.MultiPhasePin_N multiPhasePin_N annotation (
      Placement(visible = true, transformation(origin = {-66, 54}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    HPF.SinglePhase.Interface.HPin_N hPin_N annotation (
      Placement(visible = true, transformation(origin = {8, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation


    annotation (
      Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1)),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, grid = {0, 0})));
  end PhaseSelect_N;

  model PhaseGroup3Ph_P "Creates a 3 Phase bus from individual phases"

    /*
      NOT IMPLEMENTED !!
    */
  equation

    annotation (
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end PhaseGroup3Ph_P;

  model PhaseSelect_P

    outer SystemDef systemDef;
    parameter Integer phSel(start = 1) = 1 "Select phase";
    HPF.MultiPhase.Interface.MultiPhasePin_P multiPhasePin_P(systemDef(
                                                             numPh))          annotation (
      Placement(visible = true, transformation(origin = {42, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-98, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    HPF.SinglePhase.Interface.HPin_P hPin_P(systemDef(
                                            numHrm))          annotation (
      Placement(visible = true, transformation(origin = {-86, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    /*
      Overconstrained type connect 
    */
    Connections.branch(multiPhasePin_P.reference, hPin_P.reference);
    multiPhasePin_P.reference.theta = hPin_P.reference.theta;

    hPin_P.v = multiPhasePin_P.pin[phSel].v;
    /*
      On the face of it, selecting a phase from a phase bus
      should be straight forward. Equating the voltage and currents
      from the selected element to the output.
      
      In the QuasiStationary library, the current selection is implemented
      by selecting the current matching the index (negative of it), and
      equating the rest to zero. 
      
      ---> |      |----->
    */
    for k in 1:systemDef.numPh loop
      if k == phSel then
        multiPhasePin_P.pin[k].iRe = hPin_P.iRe; // output is negative of input
        multiPhasePin_P.pin[k].iIm = hPin_P.iIm;
      else
        multiPhasePin_P.pin[k].iRe = {0.0 for i in 1:systemDef.numHrm};
        multiPhasePin_P.pin[k].iIm = {0.0 for i in 1:systemDef.numHrm};
      end if;
    end for;
    annotation (
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end PhaseSelect_P;
  annotation (
    Icon(coordinateSystem(grid = {0, 0}), graphics={  Line(points = {{-90, 3}, {-75, 47}, {-60, 79}, {-45, 90}, {-30, 77}, {-15, 45}, {0, 0}, {15, -45}, {30, -77}, {45, -90}, {60, -79}, {75, -47}, {90, -3}}, smooth = Smooth.Bezier), Line(points = {{-90, 79}, {-75, 90}, {-60, 77}, {-45, 44}, {-30, -1}, {-15, -45}, {0, -78}, {15, -90}, {30, -78}, {45, -46}, {60, -2}, {75, 43}, {90, 76}}, smooth = Smooth.Bezier), Line(points = {{-90, -76}, {-75, -43}, {-60, 2}, {-45, 46}, {-30, 78}, {-15, 90}, {0, 78}, {15, 45}, {30, 1}, {45, -44}, {60, -77}, {75, -90}, {90, -79}}, smooth = Smooth.Bezier)}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end PhaseCoupling;
