within Example1.Base.Plants.Tests;
model testPFandFault
  extends Modelica.Icons.Example;
  extends Example1.Base.Networks.BasePFnFault;
  Modelica.Blocks.Sources.Pulse    pulse(
    amplitude=0.01,
    width=50,
    period=0.1,
    nperiod=1,
    startTime=5)
    annotation (Placement(transformation(extent={{-24,-80},{-4,-60}})));
  Generator_AVR_PSS_w3Inputs gen(
    P_0=pf.machines.PG1,
    Q_0=pf.machines.PG1,
    v_0=pf.bus.V1,
    angle_0=pf.bus.A1,
    Kw=12.6924,
    Tw=0.5602) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-102,0})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-152,-4},{-132,16}})));
equation
  connect(pulse.y, load_ExtInput.u) annotation (Line(points={{-3,-70},{8,-70},{
          8,-66.7},{17.14,-66.7}}, color={0,0,127}));
  connect(gen.pwPin, B1.p)
    annotation (Line(points={{-91,0},{-80,0}}, color={0,0,255}));
  connect(const.y, gen.uPSS)
    annotation (Line(points={{-131,6},{-114,6}}, color={0,0,127}));
  connect(gen.upm, const.y) annotation (Line(points={{-114,-6},{-124,-6},{-124,
          6},{-131,6}}, color={0,0,127}));
  connect(gen.uvsAVR, const.y) annotation (Line(points={{-102,-12},{-102,-22},{
          -124,-22},{-124,6},{-131,6}}, color={0,0,127}));
  annotation (experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Dassl"));
end testPFandFault;
