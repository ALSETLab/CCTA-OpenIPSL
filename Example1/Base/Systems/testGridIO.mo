within Example1.Base.Systems;
model testGridIO "Test gridIO"
  extends Modelica.Icons.Example;
  gridIO gridIO1(
    t1=0.5,
    t2=Modelica.Constants.inf,
    opening=1,
    Kw=12.6924,
    Tw=0.5602)
    annotation (Placement(transformation(extent={{-40,-40},{30,40}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica.Blocks.Sources.Pulse    pulse(
    amplitude=0.00009,
    width=50,
    period=0.1,
    nperiod=1,
    startTime=5)
    annotation (Placement(transformation(extent={{-100,-16},{-80,4}})));
equation
  connect(const.y, gridIO1.uPSS) annotation (Line(points={{-79,30},{-66,30},{
          -66,32},{-45,32},{-45,35}}, color={0,0,127}));
  connect(gridIO1.uPm, const.y)
    annotation (Line(points={{-45,15},{-68,30},{-79,30}}, color={0,0,127}));
  connect(gridIO1.uvs, const.y)
    annotation (Line(points={{-44.5,-25},{-68,30},{-79,30}}, color={0,0,127}));
  connect(pulse.y, gridIO1.uPload) annotation (Line(points={{-79,-6},{-56,-6},{
          -56,-10},{-45,-10}}, color={0,0,127}));
  annotation (experiment(
      StopTime=60,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end testGridIO;
