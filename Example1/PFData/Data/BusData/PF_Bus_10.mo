within Example1.PFData.Data.BusData;
record PF_Bus_10
extends Example1.PFData.Data.BusData.Bus_Template(
    V1=1.0000000,
    A1=Modelica.Units.Conversions.from_deg(24.2866773),
    V2=0.9804355,
    A2=Modelica.Units.Conversions.from_deg(16.5818114),
    V3=1.0000000,
    A3=Modelica.Units.Conversions.from_deg(0.0000000),
    V4=0.9798354,
    A4=Modelica.Units.Conversions.from_deg(7.7634865));

// Bus: 'B1' (PV bus)

// Bus: 'B2' (PQ bus)

// Bus: 'B3' (slack bus)

// Bus: 'B4' (PQ bus)

end PF_Bus_10;
