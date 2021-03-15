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
<p><br>In a system containing nonsinusoidal waveforms, the current and voltage transformation from time domain to frequency domain (phasor notation) is represented as:</p>
<p><img src=\"modelica://HPF/Resources/images/UsersGuide/eq_phasorsHrm.png\"/>,</p>
<p>where <i>f</i> can represent voltage or current, <i>h</i> is the harmonic number with respect to base frequency <i>&omega;</i>. The voltage and current is modeled as vectors of complex numbers (Re +<i>j</i>Im). Elements of vectors correspond to the value of the electrical quantity for a harmonic defined in the system level harmonics vector <span style=\"font-family: Courier;\">hrms</span>.</p>
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
        Documentation(info= "<html>
<p><br>Transformer secondary is modeled as a source, therefore the internal Modelica loop breaking algorithm (for an overconstrained system containing multiple loops) requires the placement of atleast one ground element on the secondary side.</p>
<p><img src=\"modelica://HPF/Resources/images/UsersGuide/fig_transformerGround.png\" style=\"width:11.325cm;height:5cm;\"/></p>
</html>"));
    end TransformerGround;
    annotation (
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end Usage;

  class CommonProblems
    extends Modelica.Icons.Information;
    annotation (
      Documentation(info= "<html><head></head><body><ul>
<li>Setting impedance value as a complex number: <span style=\"font-family: Courier;\">0.05 + 0.062*</span>j gives the following error: <i>Variable j not found in scope </i></li>
</ul>
<p style=\"margin-left: 30px;\"><u>Solution:</u></p>
<p style=\"margin-left: 30px;\">In the code, add the following line: <span style=\"font-family: Courier;\">import Modelica.ComplexMath.j;</span></p>
<ul>
<li>OpenModelica simulation fails with error: <i>Solving non-linear system failed at time=0</i></li>
</ul>
<p style=\"margin-left: 30px;\"><u>Solution:</u></p>
<p style=\"margin-left: 30px;\">Set the nonlinear solver (under Simulation Flags tab) to Newton.</p><ul><li>OpenModelica simulation gives erroneous voltage and current values in a power flow simulation (Solve for voltage and current given load power draw).</li></ul><p style=\"margin-left: 30px;\"><u>Solution:</u></p><p style=\"margin-left: 30px;\">Set the nonlinear solver (under Simulation Flags tab) to Newton.</p><p style=\"margin-left: 30px;\">Or: Set the correct initialization values by setting the 'nominal' values in the parameters.</p>
</body></html>"));
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
          coordinateSystem(preserveAspectRatio=false)),
          Documentation(info="<html>
<p><strong>Copyright (c) 2020</strong> Colorado State University, Alliance for Sustainable Energy, LLC, and contributors. All rights reserved.</p>
<p>This Modelica library is <u>free</u> software. It may be modified and/or redistributed under the terms of the 3-Clause BSD license, reproduced below.</p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:</p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions, and the following disclaimer.</li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions, and the following disclaimer in the documentation and/or other materials provided with the distribution.</li>
<li>The name of the copyright holder(s), any contributors, the United States Government, the United States Department of Energy, or any of their employees may not be used to endorse or promote products derived from this software without specific prior written permission from the respective party.</li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER(S) AND ANY CONTRIBUTORS \"AS IS\" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER(S), ANY CONTRIBUTORS, THE UNITED STATES GOVERNMENT, OR THE UNITED STATES DEPARTMENT OF ENERGY, NOR ANY OF THEIR EMPLOYEES, BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>"));
  end License;
  annotation (
    Icon(coordinateSystem(extent = {{-130, -100}, {100, 100}}, grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})),
  Documentation(info="<html>
<p>See the user&apos;s guide <a href=\"modelica://HPF.UsersGuide.Overview\">overview</a> and <a href=\"modelica://HPF.Examples.Basics\">basic examples</a> to get started.</p>
</html>"));
end UsersGuide;