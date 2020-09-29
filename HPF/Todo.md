
1.	Consolidate all supplementary .mat data files in one “Data” section of the library. These are currently embedded in several locations inside ‘HPF’:
    a.	DC/DC2DC_Converters/EfficiencyCurves/
    b.	Test/TransformerAnalysis
    c.	PowerElectronicsConverters/AC2DC_ConverterModels/
    d.	Etc.
2.	Check *.bak-mo files and remove if these are backups or no longer needed. (Example: “DC2DC_Converters.bak-mo” under the HPF/DC directory
3.	Remove “backup”, “old”, and “deprecated” files (as indicated by their filenames). (Examples: several files in HPF/SinglePhase/NonlinearLoads)
4.	Remove unused .py scripts. Move used .py scripts elsewhere.
5.	Remove extraneous files that are internal use only, e.g. ‘HPF/Resources/Project Requirements/Comments from HPF demo.txt’.
a.	If you need to preserve the information in these files, such as “to do” items, create dedicated markdown (.md) files for those things and house elsewhere in the repo.
6.	Look up the recommended structure within a Modelica library for housing test models, and consolidate all test models into that structure. (Or, if no recommended structure, find a library that you like and copy its structure.)
7.	Except for a few illustrative examples (if any) that you want to distribute with the HPF package itself, move all other examples and test case models to an ‘Models’ folder at the top level of the repo (same level as the ‘HPF’ folder). This will let us keep the library itself clean while still being able to reference these models in papers and such.
    a.	Make subfolders within it for the different categories of models, such as ‘Validation Cases’, ‘Cosimulation Verification’, ‘MATLAB Verification’, ‘MELs Analysis’.
    b.	Each subfolder to have a README.md file.
c.	If you like, just move stuff over there and I’ll organize it.
8.	General purpose scripts should stay in ‘Scripts’; scripts specific to models or analysis that you ran (e.g. validation models) should get moved into individual ‘Scripts’ folders within the ‘Models/*’ directory structure as described above.
9.	Convert README.txt files to README.md (in markdown) so they are easy to read on Github.com
10.	In the top-level README.md on Github.com, provide the OpenModelica version (and Dymola version, if applicable) that was used to test the library. This will let users know what OpenModelica version they need to have installed.
11.	Provide a clear landing page when a user first opens the library, to give them a jumping off point. (Note: I couldn’t actually view this; see my question #4 above.)

Thanks!
