within Example1.PFData.Data.BusData;
record PF_Bus_4
extends Example1.PFData.Data.BusData.Bus_Template(
    V1=1.0000000,
    A1=Modelica.Units.Conversions.from_deg(16.1293200),
    V2=0.9914180,
    A2=Modelica.Units.Conversions.from_deg(10.9900439),
    V3=1.0000000,
    A3=Modelica.Units.Conversions.from_deg(0.0000000),
    V4=0.9911549,
    A4=Modelica.Units.Conversions.from_deg(5.1779473));

// Bus: 'B1' (PV bus)

// Bus: 'B2' (PQ bus)

// Bus: 'B3' (slack bus)

// Bus: 'B4' (PQ bus)

end PF_Bus_4;
