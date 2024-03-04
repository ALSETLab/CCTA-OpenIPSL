within Example2.PFData.Data.MachineData;
record PF_Machines_3
extends Example2.PFData.Data.MachineData.Machines_Template(
    PG1=1e06*1209.3157895,
    QG1=1e06*157.0960925,
    PG2=1e06*(-1164.9672741),
    QG2=1e06*152.2947754);

// MACHINE: 'gen_1'
// Bus: B1'

// MACHINE: 'Slack'
// Bus: B3'

end PF_Machines_3;
