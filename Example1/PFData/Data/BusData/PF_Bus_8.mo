within Example1.PFData.Data.BusData;
record PF_Bus_8
extends Example1.PFData.Data.BusData.Bus_Template(
    V1=1.0000000,
    A1=Modelica.Units.Conversions.from_deg(21.5193529),
    V2=0.9846224,
    A2=Modelica.Units.Conversions.from_deg(14.6810465),
    V3=1.0000000,
    A3=Modelica.Units.Conversions.from_deg(0.0000000),
    V4=0.9841510,
    A4=Modelica.Units.Conversions.from_deg(6.8899644));

// Bus: 'B1' (PV bus)

// Bus: 'B2' (PQ bus)

// Bus: 'B3' (slack bus)

// Bus: 'B4' (PQ bus)

end PF_Bus_8;
