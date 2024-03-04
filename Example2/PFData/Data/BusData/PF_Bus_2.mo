within Example2.PFData.Data.BusData;
record PF_Bus_2
extends Example2.PFData.Data.BusData.Bus_Template(
    V1=1.0000000,
    A1=Modelica.Units.Conversions.from_deg(13.4957802),
    V2=0.9939719,
    A2=Modelica.Units.Conversions.from_deg(9.1914198),
    V3=1.0000000,
    A3=Modelica.Units.Conversions.from_deg(0.0000000),
    V4=0.9937861,
    A4=Modelica.Units.Conversions.from_deg(4.3364905));

// Bus: 'B1' (PV bus)

// Bus: 'B2' (PQ bus)

// Bus: 'B3' (slack bus)

// Bus: 'B4' (PQ bus)

end PF_Bus_2;
