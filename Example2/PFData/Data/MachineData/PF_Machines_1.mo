within Example2.PFData.Data.MachineData;
record PF_Machines_1
extends Example2.PFData.Data.MachineData.Machines_Template(
    PG1=1e06*999.0000000,
    QG1=1e06*106.8104363,
    PG2=1e06*(-962.4065592),
    QG2=1e06*103.4924391);

// MACHINE: 'gen_1'
// Bus: B1'

// MACHINE: 'Slack'
// Bus: B3'

end PF_Machines_1;
