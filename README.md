Installation Instructions:
--------------------------
Either pull the DC-Design repository into your local machine, or download the repository.

For graphical Modelica environements (example: Dymola, OpenModelica, Wolfram SystemModeler),
1. Goto File -> Open
2. Locate the DC-Design repository in your local machine and in the folder, open the file 'package.mo'.
3. The HPF library would appear in the library browser.


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