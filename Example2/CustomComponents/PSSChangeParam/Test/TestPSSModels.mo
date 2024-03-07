within Example2.CustomComponents.PSSChangeParam.Test;
model TestPSSModels "Tests the models PSS4Stages and PSS5Stages"
  extends Modelica.Icons.Example;
  PSS4Stages pSS4Units(
    t5=130,
    pss1_Kw=0.01,
    pss1_Tw=1,
    pss2_Kw=0.05,
    pss2_Tw=10,
    pss3_Kw=0.1,
    pss3_Tw=20,
    pss4_Kw=0.5,
    pss4_Tw=40)
    annotation (Placement(transformation(extent={{-20,20},{20,60}})));
  Modelica.Blocks.Sources.Sine sine(amplitude=0.01, f=0.5) annotation (Placement(transformation(extent={{-66,30},
            {-46,50}})));
  Modelica.Blocks.Interfaces.RealOutput vsPSS4 "PSS4Substructures Output"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  PSS5Stages pSS5Units(
    t6=140,
    pss1_Kw=0.01,
    pss1_Tw=1,
    pss2_Kw=0.05,
    pss2_Tw=10,
    pss3_Kw=0.1,
    pss3_Tw=20,
    pss4_Kw=0.5,
    pss4_Tw=40,
    pss5_Kw=0.1,
    pss5_Tw=20)
    annotation (Placement(transformation(extent={{-20,-60},{20,-20}})));
  Modelica.Blocks.Sources.Sine sine1(amplitude=0.01, f=0.75)
                                                           annotation (Placement(transformation(extent={{-68,-50},
            {-48,-30}})));
  Modelica.Blocks.Interfaces.RealOutput vsPSS5 "PSS4Substructures Output"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
equation
  connect(sine.y, pSS4Units.vSI) annotation (Line(points={{-45,40},{-24,40}},
                                                                            color={0,0,127}));
  connect(pSS4Units.vs, vsPSS4)
    annotation (Line(points={{22,40},{110,40}}, color={0,0,127}));
  connect(sine1.y, pSS5Units.vSI)
    annotation (Line(points={{-47,-40},{-24,-40}}, color={0,0,127}));
  connect(pSS5Units.vs, vsPSS5)
    annotation (Line(points={{22,-40},{110,-40}}, color={0,0,127}));
  annotation (experiment(
      StopTime=150),preferredView="diagram");
end TestPSSModels;
