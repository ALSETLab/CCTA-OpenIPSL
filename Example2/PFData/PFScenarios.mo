within Example2.PFData;
record PFScenarios "Drop-in component to select the power flow scenarios"

extends Modelica.Icons.Record;

replaceable record Bus = Example2.PFData.Data.BusData.PF_Bus_0 constrainedby
  Data.BusData.Bus_Template
annotation(choicesAllMatching);
Bus bus;

replaceable record Loads = Example2.PFData.Data.LoadData.PF_Loads_0
  constrainedby Data.LoadData.Loads_Template
annotation(choicesAllMatching);
Loads loads;

replaceable record Machines = Example2.PFData.Data.MachineData.PF_Machines_0
  constrainedby Data.MachineData.Machines_Template
annotation(choicesAllMatching);
Machines machines;

end PFScenarios;
