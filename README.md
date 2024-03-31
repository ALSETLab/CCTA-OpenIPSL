# CCTA-OpenIPSL
Models used in the paper "Power System Modeling for Identification and Control Applications using Modelica and OpenIPSL" by L. Vanfretti and C.R. Laughman.

## General Information
This repository contains the power system models used in the paper "Power System Modeling for Identification and Control Applications using Modelica and OpenIPSL" by Luigi Vanfretti and Chrisopher R. Laughman, submitted for review to the IEEE CCTA 2024, March 2024, DOI: 10.13140/RG.2.2.17471.11680

You can find a pre-print of the paper on ResearchGate, [here](http://dx.doi.org/10.13140/RG.2.2.17471.11680).

The models were developed and tested with [Dymola 2024X](https://www.3ds.com/products/catia/dymola) under MS Windows 11.

The models have the following dependencies:
- [OpenIPSL v.3.0.1](https://github.com/OpenIPSL/OpenIPSL), please download it from this version's library release, [here](https://github.com/OpenIPSL/OpenIPSL/releases/tag/v3.0.1) 
- [Modelica Standard Library v.4.0.0](https://doc.modelica.org/) (shipped with Dymola 2024X)
- [Modelica_LinearSystems2 v2.4.0](https://github.com/modelica/Modelica_LinearSystems2) (shipped with Dymola 2024X)
- DataFiles v1.1.0 (shipped with Dymola 2024X)
- DymolaCommands v1.16 (shipped with Dymola 2024X),
- LinearAnalysis v1.0.1 (Shipped with Dymola 2024X),

### Quickstart Guide - Dymola
See the quickstart guide to use the packages in Dymola [here](./QuickstartGuides/Quickstart-Dymola.md).

Obtain a copy of Dymola from [Dassault Systems](https://discover.3ds.com/free-trial-version-of-dymola-for-windows). The trial version from Dassault Systems will not be sufficient to run the models. To obtain a standard license, contact Dassault Systems, or a reseller such as [Barcroft](https://www.3ds.com/partners/partner-details/200000000025397_BARCROFT_TECHNOLOGY_LLC).

### Other Modelica Tools
Some non-rigurous testing was carried out and it was found that time-simulation models can be run with in [OpenModelica](https://openmodelica.org/), [Wolfram SystemModeler](https://www.wolfram.com/system-modeler/), and [Modelon Impact](https://modelon.com/modelon-impact/) too. 

#### Limitations
However, the automation functions provided with the packages in this repository are not compatible with those tools. In addition, the linearization functions are different in all of them, requiring scripting tools for each, as the [Modelica Linear Systems 2](https://github.com/modelica/Modelica_LinearSystems2) is yet to be fully compliant with the language specification and to be supported by other tools (see [this issue](https://github.com/modelica/Modelica_LinearSystems2/issues/131)). 

Additional support scripts maybe developed in the future to support these tools, if you are interested in them please open an issue [here](https://github.com/ALSETLab/CCTA-OpenIPSL/issues). Support may be added based-on demand for a specific tool and/or time availability.

#### Quickstart Guides for other Modelica tools and limitations
- Wolfram System Modeler: Similarly, Quickstart for WSM can be found [here](https://alsetlab.github.io/CCTA-OpenIPSL/QuickstartGuides/Quickstart-WSM.html). Note that although WSM can be used in conjunction with other Wolfram tools to perform linearization, this failed with the developed models due to a bug that the developers of WSM are investigating.
- OpenModelica: A limited guide to load the models and run a limited number of simulations with OpenModelica can be found [here](https://alsetlab.github.io/CCTA-OpenIPSL/QuickstartGuides/Quickstart-OpenModelica.html). Due to tool limitations, some simulations cannot be executed successfully to their full extent.

## Documentation 
The documentation for each of the models is embedded within the "info" layer of the Modelica models. Using Dymola, you can browse the documentation. Alternatively, the following documentation for each of the examples was generated from Dymola:

- Documentation for Example 1 can be found [here](https://alsetlab.github.io/CCTA-OpenIPSL/Example1/help/Example1.html)
- Documentation for Example 2 can be found [here](https://alsetlab.github.io/CCTA-OpenIPSL/Example2/help/Example2.html)

For further information on the models uses and applications, please refer to the following publications:

  1. L. Vanfretti and C.R. Laughman, “Power System Modeling for Identification and Control Applications using Modelica and OpenIPSL,” Invited Paper, submitted for review to the 2024 8th IEEE Conference on Control Technology and Applications (CCTA), Newcastle upon Tyne, UK, August 21-23, 2024. Pre-print: March 2024, DOI: [10.13140/RG.2.2.17471.11680](http://dx.doi.org/10.13140/RG.2.2.17471.11680).
  2. L. Vanfretti and X. Bombois, "Power System Oscillation Monitoring and Damping Control Re-Design under Ambient Conditions and Multiple Operating Points," manuscript submitted to 20th IFAC Symposium on System Identification. Nov. 10, 2023. Pre-print: March 2024, DOI: [10.13140/RG.2.2.22504.28166](http://dx.doi.org/10.13140/RG.2.2.22504.28166) 
  3. X. Bombois and L. Vanfretti, “Performance monitoring and redesign of power system stabilizers based on system identification techniques,” Sustainable Energy, Grids and Networks, Volume 38, 2024, 101278, ISSN 2352-4677, [https://doi.org/10.1016/j.segan.2024.101278](https://doi.org/10.1016/j.segan.2024.101278). Author’s Copy: [https://hal.science/hal-04338856](https://hal.science/hal-04338856)  

## Quickstart Guides
- Dymola: go [here](./QuickstartGuides/Quickstart-Dymola.md).
- Wolfram SystemModeler: go [here](https://alsetlab.github.io/CCTA-OpenIPSL/QuickstartGuides/Quickstart-WSM.html)
- OpenModelica: the following guide shows how to load the models and run a limited number of simulations with OpenModelica, click [here](.https://alsetlab.github.io/CCTA-OpenIPSL/QuickstartGuides/Quickstart-OpenModelica.html). 
- Modelon Impact: TBD.
  - if you are interested in them please open an issue [here](https://github.com/ALSETLab/CCTA-OpenIPSL/issues). Support may be added based-on demand for a specific tool and/or time availability.

(c) 2024, Luigi Vanfretti, Rensselaer Polytechnic Institute, Troy, NY, USA and Chrisopher R. Laughman, Mitsubishi Electric Research Labs., Cambridge, MA, USA.