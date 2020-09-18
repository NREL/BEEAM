within HPF;
package UsersGuide
extends Modelica.Icons.Information;

  annotation (
    Icon(coordinateSystem(extent = {{-130, -100}, {100, 100}}, grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})),
  Documentation(info= "<html><head></head><body><p>Harmonics in electrical distribution. </p>
<ul>
<li>Perform Harmonic power flow analysis </li>
<li>Harmonic analysis for single, multiphase and unbalanced circuits </li>
<li>Templates for creating custom harmonic models for various devices </li>
</ul>
<p><br>Figure 1 shows current harmonics in a circuit containing a nonlinear load such as an AC to DC converter. In a typical time domain simulation, the system is simulated at small time steps. This results in a simulation that uses large amount of computation resources and time. One can simulate a system, operating in steady state, with nonlinear loads in the frequency domain.</p>
<p><br><img src=\"modelica://HPF/Resources/images/UsersGuide/image001.png\"></p>
<p><i>Figure 1. Current harmonics in a circuit containing nonlinear load.</i></p><p>Circuit example: <a href=\"modelica://HPF.Examples.SimpleExample\"> Examples/SimpleExample</a> &nbsp;<br><br><b><span style=\"font-size: 14pt;\">Info on library and component icons</span></b></p>
<p>To the extent possible, the library and component icons adher to IEC&nbsp;60617 specification on electrial symbols. </p>
<p><br></p><h2>References</h2> <p></p>
<p>[1] D. Xia and G. T. Heydt, “Harmonic Power Flow Studies - Part II Implementation and Practical Application,” IEEE Transactions on Power Apparatus and Systems, vol. PAS-101, no. 6, pp. 1266–1270, Jun. 1982, doi: 10.1109/TPAS.1982.317172. </p>
</body></html>"));
end UsersGuide;
