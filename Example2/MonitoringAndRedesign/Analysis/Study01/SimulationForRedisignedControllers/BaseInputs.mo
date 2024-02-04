within Example2.MonitoringAndRedesign.Analysis.Study01.SimulationForRedisignedControllers;
partial model BaseInputs
  "Interface with inputs to drive the nonlinear simulation"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant PSSchange(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={10,70})));
  Modelica.Blocks.Sources.Constant Pmchange(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,70})));
  Modelica.Blocks.Sources.Constant     uL7_timedNoiseInjection(k=0)
    annotation (Placement(transformation(extent={{-80,-8},{-60,8}})));
  Modelica.Blocks.Sources.Constant     const(k=0)
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-42,-40},{-22,-20}})));
  Modelica.Blocks.Sources.Pulse pulse(
    amplitude=3,
    width=100,
    period=8/60,
    nperiod=1,
    offset=0,
    startTime=60)
    annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
  Modelica.Blocks.Sources.Constant     uL9_timedNoiseInjection1(k=0)
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  replaceable Study01.LinearizationForRedisgnedControllers.Case0 nonlinModel(t1=0.1) constrainedby
    Study01.LinearizationForRedisgnedControllers.Base                                                                                                annotation (Placement(transformation(extent={{20,-40},{100,38}})));
equation
  connect(pulse.y,add. u2) annotation (Line(points={{-59,-60},{-44,-60},{-44,-36}},
                 color={0,0,127}));
  connect(uL9_timedNoiseInjection1.y,add. u1) annotation (Line(
      points={{-59,-30},{-56,-30},{-56,-26},{-52,-26},{-44,-26},{-44,-24}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(PSSchange.y, nonlinModel.uPm) annotation (Line(points={{10,59},{10,44.6},
          {10.4,44.6},{10.4,30.2}}, color={0,0,127}));
  connect(Pmchange.y, nonlinModel.uPSS)
    annotation (Line(points={{-30,59},{-30,14.6},{12,14.6}}, color={0,0,127}));
  connect(const.y, nonlinModel.uVsAVR) annotation (Line(points={{-59,40},{-32,40},
          {-32,-1},{12,-1}}, color={0,0,127}));
  connect(uL7_timedNoiseInjection.y, nonlinModel.uLoadB7) annotation (Line(
        points={{-59,0},{-34,0},{-34,-16.6},{12,-16.6}}, color={0,0,127}));
  connect(add.y, nonlinModel.uLoadB9) annotation (Line(points={{-21,-30},{0,-30},
          {0,-32.2},{12.8,-32.2}}, color={0,0,127}));
annotation(experiment(
      StopTime=120,
      __Dymola_NumberOfIntervals=5000,
      Tolerance=0.001,
      __Dymola_Algorithm="Dassl"));
end BaseInputs;
