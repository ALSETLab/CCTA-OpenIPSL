within Example1.PFData.Data.BusData;
record PF_Bus_12
extends Example1.PFData.Data.BusData.Bus_Template(
    V1=1.0000000,
    A1=Modelica.Units.Conversions.from_deg(27.1163388),
    V2=0.9756431,
    A2=Modelica.Units.Conversions.from_deg(18.5303174),
    V3=1.0000000,
    A3=Modelica.Units.Conversions.from_deg(0.0000000),
    V4=0.9748948,
    A4=Modelica.Units.Conversions.from_deg(8.6518882));

// Bus: 'B1' (PV bus)

// Bus: 'B2' (PQ bus)

// Bus: 'B3' (slack bus)

// Bus: 'B4' (PQ bus)

end PF_Bus_12;
