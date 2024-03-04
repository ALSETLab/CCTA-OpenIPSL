within Example2.PFData.Data.MachineData;
record PF_Machines_16
extends Example2.PFData.Data.MachineData.Machines_Template(
    PG1=1e06*2576.3684211,
    QG1=1e06*767.1084549,
    PG2=1e06*(-2482.0723829),
    QG2=1e06*742.5786511);

// MACHINE: 'gen_1'
// Bus: B1'

// MACHINE: 'Slack'
// Bus: B3'

end PF_Machines_16;
