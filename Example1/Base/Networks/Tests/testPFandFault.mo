within Example1.Base.Networks.Tests;
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
  Plants.inf infiniteBus2(
    P_0=pf.machines.PG1,
    Q_0=pf.machines.PG1,
    v_0=pf.bus.V1,
    angle_0=pf.bus.A1) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-102,0})));
equation
  connect(pulse.y, load.u) annotation (Line(points={{-3,-70},{8,-70},{8,-66.7},
          {17.14,-66.7}}, color={0,0,127}));
  connect(infiniteBus2.pwPin, B1.p)
    annotation (Line(points={{-91,0},{-80,0}}, color={0,0,255}));
annotation(preferredView = "diagram");
end testPFandFault;
