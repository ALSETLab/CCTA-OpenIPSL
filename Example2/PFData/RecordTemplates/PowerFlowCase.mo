within Example2.PFData.RecordTemplates;
record PowerFlowCase

extends Modelica.Icons.Record;

replaceable record Bus = Example2.PFData.Data.BusData.Bus_Template
    constrainedby Data.BusData.Bus_Template
annotation(choicesAllMatching);
Bus bus;

replaceable record Loads = Example2.PFData.Data.LoadData.Loads_Template
    constrainedby Data.LoadData.Loads_Template
annotation(choicesAllMatching);
Loads loads;

replaceable record Machines =
      Example2.PFData.Data.MachineData.Machines_Template constrainedby
    Data.MachineData.Machines_Template
annotation(choicesAllMatching);
Machines machines;

end PowerFlowCase;
