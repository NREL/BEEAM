within HPF;
package UsersGuide
extends Modelica.Icons.Information;

  model Overview
    extends Modelica.Icons.Information;
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false)),
      Diagram(coordinateSystem(preserveAspectRatio=false)),
      Documentation(info="<html>
<p>This library can be used for:</p>
<ul>
<li>Performing Harmonic power flow analysis;</li>
<li>Harmonic analysis for single, multiphase and unbalanced circuits;</li>
</ul>
<p><br>In a system containing nonsinusoidal waveforms, the current and voltage transformation from time domain to frequency domain is represented as:</p>
<p><img src=\"modelica://HPF/Resources/images/UsersGuide/eq_phasorsHrm.png\"/>,</p>
<p>where <i>h</i> is the harmonic number with respect to base frequency <i>&omega;</i>. </p>
<p>Figure 1 shows current harmonics in a circuit containing a nonlinear load such as an AC to DC converter. Current <i>I<sub>0</i></sub> through impedance <i>Z<sub>01</i></sub> is represented in Modelica as a vector of Complex type, example (system with three odd harmonics): <span style=\"font-family: Courier;\">Z01.i[1:numHrm].re = {1,0.5,0.3}</span> and <span style=\"font-family: Courier;\">Z01.i[1:numHrm].im = {-1,0.8,0.1}</span></p>
<p><br><img src=\"modelica://HPF/Resources/images/UsersGuide/fig_harmonicsDescription.png\"/></p>
<p><br>Figure 1. Current harmonics in a circuit containing nonlinear load.</p>
<p><br>Circuit example: <a href=\"modelica://HPF.Examples.Basics.AC2DC_Converter\">Examples/Basics/AC2DC_Converter</a> </p>
<h5>Info on library and component icons</h5>
<p>To the extent possible, the library and component icons adher to IEC 60617 specification on electrial symbols. </p>
</html>"));
  end Overview;

  package Usage
    extends Modelica.Icons.Information;

    model PathToFile
      extends Modelica.Icons.Information;
      annotation (Documentation(info="<html>
<p>Path to a data file is specified as:</p>
<p><span style=\"font-family: Courier;\">modelica://ExampleLib/Data/dataFile.mat</span></p>
</html>"));
    end PathToFile;

    model TransformerGround "Placing ground on transformer secondary"
      extends Modelica.Icons.Information;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        Documentation(info="<html>
<p><br>Transformer secondary is modeled as a source, therefore the internal Modelica loop breaking algorithm (for an overconstrained system containing multiple loops) requires the placement of atleast one ground element on the secondary side.</p>
<p><img src=\"modelica://HPF/Resources/images/UsersGuide/fig_transformerGround.png\" style=\"width:30px;height:30px;\"/></p>
</html>"));
    end TransformerGround;
    annotation (
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end Usage;

  class CommonProblems
    extends Modelica.Icons.Information;
    annotation (
      Documentation(info="<html>
<ul>
<li>Setting impedance value as a complex number: <span style=\"font-family: Courier;\">0.05 + 0.062*</span>j gives the following error: <i>Variable j not found in scope </i></li>
</ul>
<p style=\"margin-left: 30px;\"><u>Solution:</u></p>
<p style=\"margin-left: 30px;\">In the code, add the following line: <span style=\"font-family: Courier;\">import Modelica.ComplexMath.j;</span></p>
<ul>
<li>OpenModelica simulation fails with error: <i>Solving non-linear system failed at time=0</i></li>
</ul>
<p style=\"margin-left: 30px;\"><u>Solution:</u></p>
<p style=\"margin-left: 30px;\">Set the nonlinear solver (under Simulation Flags tab) to newton.</p>
</html>"));
  end CommonProblems;

  model ReleaseNotes
    extends Modelica.Icons.ReleaseNotes;
  equation

  end ReleaseNotes;

  model References
    extends Modelica.Icons.References;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      Documentation(info="<html>
<ul>
<li>D. Xia and G. T. Heydt, &ldquo;Harmonic Power Flow Studies - Part II Implementation and Practical Application,&rdquo; IEEE Transactions on Power Apparatus and Systems, vol. PAS-101, no. 6, pp. 1266&ndash;1270, Jun. 1982, doi: 10.1109/TPAS.1982.317172. </li>
<li>E. Fuchs and M. A. S. Masoum, Power Quality in Power Systems and Electrical Machines. Academic Press, 2015.</li>
<li>S. M. Frank and S. Rebennack, &ldquo;Optimal design of mixed AC&ndash;DC distribution systems for commercial buildings: A Nonconvex Generalized Benders Decomposition approach,&rdquo; European Journal of Operational Research, vol. 242, no. 3, pp. 710&ndash;729, May 2015, doi: 10.1016/j.ejor.2014.10.008.</li>
<li>A. Santos et al., &ldquo;Comparison of Load Models for Estimating Electrical Efficiency in DC Microgrids,&rdquo; presented at the IEEE International Conference on DC Microgrids, Matsue, Japan, 2019.</li>
</ul>
</html>"));
  end References;

  model License
    extends Modelica.Icons.Information;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end License;
  annotation (
    Icon(coordinateSystem(extent = {{-130, -100}, {100, 100}}, grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})),
  Documentation(info="<html>
<p>See the user&apos;s guide <a href=\"modelica://HPF.UsersGuide.Overview\">overview</a> and the <a href=\"modelica://HPF.Examples.Basics\">basic examples</a> to get started.</p>
</html>"));
end UsersGuide;
