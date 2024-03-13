within Example2.PFData.RecordTemplates;
record PowerFlowCase

extends Modelica.Icons.Record;

replaceable record Bus = PFData.Data.BusData.Bus_Template constrainedby
    Data.BusData.Bus_Template
annotation(choicesAllMatching);
Bus bus;

replaceable record Loads = PFData.Data.LoadData.Loads_Template constrainedby
    Data.LoadData.Loads_Template
annotation(choicesAllMatching);
Loads loads;

replaceable record Trafos = PFData.Data.TrafoData.Trafos_Template
    constrainedby Data.TrafoData.Trafos_Template
annotation(choicesAllMatching);
Trafos trafos;

replaceable record Machines =
      PFData.Data.MachineData.Machines_Template constrainedby
    Data.MachineData.Machines_Template
annotation(choicesAllMatching);
Machines machines;

end PowerFlowCase;
