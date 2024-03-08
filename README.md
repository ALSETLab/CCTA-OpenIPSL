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

Obtain a copy of Dymola from [Dassault Systems](https://discover.3ds.com/free-trial-version-of-dymola-for-windows). The trial version from Dassault Systems will not be sufficient to run the models. To obtain a standard license, contact Dassault Systems, or a reseller such as [Barcroft](https://www.3ds.com/partners/partner-details/200000000025397_BARCROFT_TECHNOLOGY_LLC). 

## Documentation 
The documentation for each of the models is embedded within the "info" layer of the modelica models. Using Dymola, the following documentation was automatically produced:

- Documentation for Example 1 can be found [here](https://alsetlab.github.io/CCTA-OpenIPSL/Example1/help/Example1.html)
- Documentation for Example 2 can be found [here](https://alsetlab.github.io/CCTA-OpenIPSL/Example2/help/Example2.html)

For further information on the models uses and applications, please refer to the following publications:

  1. L. Vanfretti and C.R. Laughman, “Power System Modeling for Identification and Control Applications using Modelica and OpenIPSL,” Invited Paper, submitted for review to the 2024 8th IEEE Conference on Control Technology and Applications (CCTA), Newcastle upon Tyne, UK, August 21-23, 2024. Pre-print: March 2024, DOI: [10.13140/RG.2.2.17471.11680](http://dx.doi.org/10.13140/RG.2.2.17471.11680).
  2. L. Vanfretti and X. Bombois, "Power System Oscillation Monitoring and Damping Control Re-Design under Ambient Conditions and Multiple Operating Points," manuscript submitted to 20th IFAC Symposium on System Identification. Nov. 10, 2023, pre-print of submitted article available at: https://hal.science/hal-04283210 
  3. Xavier Bombois, Luigi Vanfretti, “Performance monitoring and redesign of power system stabilizers based on system identification techniques,” Sustainable Energy, Grids and Networks, Volume 38, 2024, 101278, ISSN 2352-4677, https://doi.org/10.1016/j.segan.2024.101278 . Author’s Copy: https://hal.science/hal-04338856  

(c) 2024, Luigi Vanfretti, Rensselaer Polytechnic Institute, Troy, NY, USA and Chrisopher R. Laughman, Mitsubishi Electric Research Labs., Cambridge, MA, USA.