Installation Instructions:
--------------------------
1) Download the library by either cloning the repository from Github or downloading the repository as a zip file.
2) Extract the library in a location of choice on user system.
3) Rename the extracted folder to ‘HPF’ such that the file ‘package.mo’ is at the root of the folder (This step will be removed in future releases).
4) For a graphical Modelica simulation environment such as, OpenModelica, Dymola, Wolfram System Modeler, MapleSim, etc., go to ‘File’ (in the menu bar) and open.
5) Locate the extracted folder and in the root of the folder, point to the file named, ‘package.mo’.
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
