Roadmap
-------
The workflow would be as follows,
1) User would create the simulation in a graphical Modelica environment.
2) To run the simulation in standalone mode, user would simulate the system in the above mentioned Modelica environment.
3) For a co-simulation run or detailed post processing, one must export the simulation to an FMU. OpenModelica, an open source Modelica environment has an FMU export option but it is not very robust. The exported FMU usually fails to load in FMU libraries. The other open source Modelica implementation, jModelica, has a robust FMU export option. The downside is that it lacks a GUI. A potential side project would be to create a GUI that loads the simulation file generated in Step 1 and export an FMU.
4) There are a few open source FMU loading and simulation libraries. Two of the popular libraries are, PyFMI from Modellon (jModelica, https://github.com/modelon/PyFMI) and FMPy from CATIA (https://github.com/CATIA-Systems/FMPy). PyFMI has additional dependencies (Assimulo https://jmodelica.org/assimulo/) for FMU simulation. FMPy comes with a simulator and a GUI.

Installation Instructions:
--------------------------
1) Download the library by either cloning the repository from Github or downloading the repository as a zip file.
2) Extract the library in a location of choice on user system.
4) For a graphical Modelica simulation environment such as, OpenModelica, Dymola, Wolfram System Modeler, MapleSim, etc., go to ‘File’ (in the menu bar) and open.
5) Locate the extracted folder and in the root of the folder named HPF, point and open the file named, ‘package.mo’.
6) The library should load, and the user can see the library ‘HPF’ in the library viewer.


A note on Modelica environments:
-------------------------------
Primary development environement: OpenModelica (current version (as of 06/10/2019): 1.14; Binary repository: Stable)

Validation and testing environments: Dymola 2020, jModelica 2.4


A note on component libraries:
------------------------------
Current development is being done in the root of the library. The components defined here are all single phase.
This would continue until all bugs are removed and the system is functioning. Eventually the components
will be moved into their respective sublibries i.e. 'SinglePhase' and 'MultiPhase'.

Packages are defined in a directory and not in a single file. In other library implementations, I don't find this
to be the case and until now I havn't found any downside to this approach. If someone has an objection or suggestion, 
please do so.
