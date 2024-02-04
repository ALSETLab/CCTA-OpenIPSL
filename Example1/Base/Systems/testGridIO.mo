within Example1.Base.Systems;
model testGridIO "Test gridIO"
  extends Modelica.Icons.Example;
  gridIO gridIO1(
    t1=0.5,
    t2=Modelica.Constants.inf,
    opening=1,
    Kw=12.6924,
    Tw=0.5602)
    annotation (Placement(transformation(extent={{-30,-40},{40,40}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-100,26},{-80,46}})));
  Modelica.Blocks.Sources.Pulse    pulse(
    amplitude=0.00009,
    width=50,
    period=0.1,
    nperiod=1,
    startTime=5)
    annotation (Placement(transformation(extent={{-100,-16},{-80,4}})));
equation
  connect(const.y, gridIO1.uPSS) annotation (Line(points={{-79,36},{-46,36},{
          -46,35},{-35,35}},          color={0,0,127}));
  connect(gridIO1.uPm, const.y)
    annotation (Line(points={{-35,15},{-70,15},{-70,36},{-79,36}},
                                                          color={0,0,127}));
  connect(pulse.y, gridIO1.uPload) annotation (Line(points={{-79,-6},{-46,-6},{
          -46,-10},{-35,-10}}, color={0,0,127}));

  annotation (experiment(
      StopTime=60,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"),
           preferredView = "diagram");
end testGridIO;
