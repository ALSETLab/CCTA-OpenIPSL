within Example2.MonitoringAndRedesign.Analysis.CustomComponents.PSSChangeParam;
model TestPSS4Substructures
  extends Modelica.Icons.Example;
  PSS4Substructures pSS4Units(
    pss1_Kw=0.01,
    pss1_Tw=1,
    pss2_Kw=0.05,
    pss2_Tw=10,
    pss3_Kw=0.1,
    pss3_Tw=20,
    pss4_Kw=0.5,
    pss4_Tw=40) annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Sine sine(amplitude=0.01, f=0.5) annotation (Placement(transformation(extent={{-66,-10},{-46,10}})));
equation
  connect(sine.y, pSS4Units.vSI) annotation (Line(points={{-45,0},{-24,0}}, color={0,0,127}));
  annotation (experiment(
      StopTime=120,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end TestPSS4Substructures;
