within HPF.Data.ConverterModels.SinglePhase.ACDC;
model DataFormat "Converter model data format description"
  extends Modelica.Icons.Information;
  annotation (Documentation(info="<html>
<h4>ACDC single phase converter model data file</h4>
<p>The mat file has the following data entries:</p>
<p><b><span style=\"font-size: 10pt;\">3D harmonic surface interpolation data (generated using <span style=\"font-family: Courier;\">mesh</span> function (MATLAB/Octave))</b></p>
<ul>
<li><span style=\"font-family: Courier;\">X</span> - Harmonics</li>
<li><span style=\"font-family: Courier;\">Y</span> - Real power at fundamental (<i>h=1</i>)</li>
<li><span style=\"font-family: Courier;\">Z_arg</span> - unwrapped phase angle values (rad)</li>
<li><span style=\"font-family: Courier;\">Z_mag</span> - Current magnitude values (A rms)</li>
</ul>
<h5>Converter loss function </h5>
<ul>
<li><span style=\"font-family: Courier;\">alpha</span></li>
<li><span style=\"font-family: Courier;\">beta</span></li>
<li><span style=\"font-family: Courier;\">gamma</span></li>
</ul>
<h4>Mat file summary:</h4>
<p><br>A mat file can be generated using a variety of tools. A description on the mat file format can be found <a href=\"https://www.mathworks.com/help/pdf_doc/matlab/matfile_format.pdf\">here</a>.</p>
<p>Some of the tools that can be used to generate a mat file;</p>
<ul>
<li>MATLAB</li>
<li>Octave</li>
<li>Python Scipy library, <span style=\"font-family: Courier;\">scipy.io.savemat</span></li>
</ul>
</html>"));
end DataFormat;
