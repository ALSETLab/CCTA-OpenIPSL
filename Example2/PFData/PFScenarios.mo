within Example2.PFData;
record PFScenarios "Drop-in component to select the power flow scenarios"

extends Modelica.Icons.Record;

replaceable record Bus = PFData.Data.BusData.PF_Bus_0 constrainedby
    Data.BusData.Bus_Template
annotation(choicesAllMatching);
Bus bus;

replaceable record Loads = PFData.Data.LoadData.PF_Loads_0 constrainedby
    Data.LoadData.Loads_Template
annotation(choicesAllMatching);
Loads loads;

replaceable record Trafos = PFData.Data.TrafoData.PF_Trafos_0 constrainedby
    Data.TrafoData.Trafos_Template
annotation(choicesAllMatching);
Trafos trafos;

replaceable record Machines = PFData.Data.MachineData.PF_Machines_0
    constrainedby Data.MachineData.Machines_Template
annotation(choicesAllMatching);
Machines machines;

end PFScenarios;
