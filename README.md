Building Electrical Efficiency Analysis Model (BEEAM)
=====================================================

This is the development site for the BEEAM library and documentation.

Description
-----------

The Building Electrical Efficiency Analysis Model (BEEAM) is a [Modelica] library that simulates the efficiency of building electrical distribution systems using harmonic power flow. BEEAM has the following features:

- Models a wide variety of building distribution topologies, including three-phase AC, single-phase AC, unipolar DC, bipolar DC, and hybrid networks
- Models both balanced and unbalanced load conditions
- Accurately represents power electronic converter losses, including at part load conditions
- Provides granular estimates of losses throughout the distribution system

BEEAM may be combined with other Modelica libraries to develop more complex models. Users can also package a BEEAM model within a functional mockup unit (FMU), enabling co-simulation with other modeling tools.

*Note: BEEAM is a working name/acronym and is subject to change.*

[Modelica]: https://www.modelica.org/ "Modelica"

Current Release
---------------

[BEEAM 0.2.1-beta](https://github.com/NREL/DC-Design/releases/v0.2.1-beta/) (2022-09-24)

Installation
------------

To install and use BEEAM with a graphical Modelica simulation environment (OpenModelica, Dymola, Wolfram System Modeler, MapleSim, etc.), follow these instructions:

1. Download BEEAM by cloning this repository or downloading a [release](https://github.com/NREL/DC-Design/releases/)
2. Extract the archive at a convenient location
3. Go to the *File* menu and select *Open*
4. Navigate to and select `HPF/package.mo` (relative to the respository root directory)

The library will load and the user should be able to *HPF* listed in the library viewer.

Workflow
--------

The primary way to use BEEAM is to create and simulate a model within a graphical Modelica environment. The `Scripts` directory provides scripts for simulation results post-processing, however, at present these scripts are not enabled for general use. Some scripts require data sources that are restricted to the development team, while others require modification for local use. The scripts will be updated prior to final release of the library. 

Executing BEEAM via co-simulation requires the following steps:

1. Create a model
2. Create the correct external interfaces within the model for co-simulation using the functional mockup interface (FMI)
3. Export a model as a functional mockup unit (FMU)
   1. [OpenModelica] is an open source Modelica environment with an FMU export option, but the FMU export is not very robust. The export FMU usually fails to load in FMU libraries.
   2. [Dymola], a commercial Modelica implementation, is an alternative with robust FMU export.
   3. Previously, the open source [jModelica] environment was also an alternative with robust FMU export. However, Modelon (the primary jModelica developer) has discontinued jModelica as an open source project.
4. Simulate the exported FMU together with other FMUs using [PyFMI], [FMPy], or a similar library. Both PyFMI and FMPy are open source. PyFMI has [Assimulo] as a dependency. FMPy includes both a simulator and a GUI.

[OpenModelica]: https://www.openmodelica.org/
[Dymola]: https://www.3ds.com/products-services/catia/products/dymola/
[jModelica]: https://jmodelica.org/
[PyFMI]: https://github.com/modelon-community/PyFMI
[Assimulo]: https://github.com/modelon-community/Assimulo
[FMPy]: https://github.com/CATIA-Systems/FMPy

The `FMU` directory contains examples for cosimulation of BEEAM with EnergyPlus.

Development Notes
-----------------

### Modelica Libraries ###

BEEAM has been tested with the following Modelica environments:

- [OpenModelica] 1.14
- [Dymola] 2020
- [jModelica] 2.4 (No longer publicly available)

OpenModelica is the primary development environment, but the library has also been tested with Dymola and jModelica.

### Library Organization ###

Library structure and organization is not final. The notes in this section represent working concepts for library organization.

1. Current development is being done in the root of the library. The components defined here are all single phase. This will continue until all bugs are removed and the system is functioning.
2. Eventually the components may be moved into their respective sublibraries e.g. *SinglePhase* and *MultiPhase*.

License
-------

BEEAM is licensed for use under the terms of the Berkeley Software Distribution 3-clause (BSD-3) license; see [LICENSE](LICENSE.md).

