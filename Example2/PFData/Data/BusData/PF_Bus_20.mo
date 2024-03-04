within Example2.PFData.Data.BusData;
record PF_Bus_20
extends Example2.PFData.Data.BusData.Bus_Template(
    V1=1.0000000,
    A1=Modelica.Units.Conversions.from_deg(39.3384087),
    V2=0.9491233,
    A2=Modelica.Units.Conversions.from_deg(27.0196300),
    V3=1.0000000,
    A3=Modelica.Units.Conversions.from_deg(0.0000000),
    V4=0.9475370,
    A4=Modelica.Units.Conversions.from_deg(12.4180100));

// Bus: 'B1' (PV bus)

// Bus: 'B2' (PQ bus)

// Bus: 'B3' (slack bus)

// Bus: 'B4' (PQ bus)

end PF_Bus_20;
