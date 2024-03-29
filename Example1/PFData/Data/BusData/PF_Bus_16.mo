within Example1.PFData.Data.BusData;
record PF_Bus_16
extends Example1.PFData.Data.BusData.Bus_Template(
    V1=1.0000000,
    A1=Modelica.Units.Conversions.from_deg(33.0127010),
    V2=0.9640158,
    A2=Modelica.Units.Conversions.from_deg(2.6093852),
    V3=1.0000000,
    A3=Modelica.Units.Conversions.from_deg(0.0000000),
    V4=0.9629037,
    A4=Modelica.Units.Conversions.from_deg(10.4847878));

// Bus: 'B1' (PV bus)

// Bus: 'B2' (PQ bus)

// Bus: 'B3' (slack bus)

// Bus: 'B4' (PQ bus)

end PF_Bus_16;
