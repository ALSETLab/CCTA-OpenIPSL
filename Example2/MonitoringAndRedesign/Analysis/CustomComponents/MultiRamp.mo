within Example2.MonitoringAndRedesign.Analysis.CustomComponents;
model MultiRamp

  Modelica.Blocks.Sources.Ramp rampA(
    height=rampA_height,
    duration=rampA_duration,
    startTime=rampA_startTime)
                  annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Discrete.FirstOrderHold firstOrderHold(samplePeriod=foh_samplePeriod)
                                                                         annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Discrete.Sampler sampler(samplePeriod=samplePeriod)
                                                             annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Sources.Ramp rampB(
    height=rampB_height,
    duration=rampB_duration,
    startTime=rampB_startTime)
                   annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Sources.Ramp rampC(
    height=rampC_height,
    duration=rampC_duration,
    startTime=rampC_startTime)
                    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Modelica.Blocks.Math.Sum sum(nin=4) annotation (Placement(transformation(extent={{-36,-10},{-16,10}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  parameter Real rampA_height=0.025 "Ramp A Height" annotation (Dialog(group="Ramp A Parameters"));
  parameter Modelica.Units.SI.Time rampA_duration=150 "Duration of Ramp A" annotation (Dialog(group="Ramp A Parameters"));
  parameter Modelica.Units.SI.Time rampA_startTime=150 "Start of output y of Ramp A" annotation (Dialog(group="Ramp A Parameters"));
  parameter Real rampB_height=0.025 "Height of Ramp B" annotation (Dialog(group="Ramp B Parameters"));
  parameter Modelica.Units.SI.Time rampB_duration=150 "Duration of Ramp B" annotation (Dialog(group="Ramp B Parameters"));
  parameter Modelica.Units.SI.Time rampB_startTime=1350 "Start of output y of Ramp B" annotation (Dialog(group="Ramp B Parameters"));
  parameter Real rampC_height=-0.015 "Height of Ramp C" annotation (Dialog(group="Ramp C Parameters"));
  parameter Modelica.Units.SI.Time rampC_duration=150 "Duration of Ramp C" annotation (Dialog(group="Ramp C Parameters"));
  parameter Modelica.Units.SI.Time rampC_startTime=2250 "Start of output y of Ramp C" annotation (Dialog(group="Ramp C Parameters"));
  parameter Real rampD_height=-0.015 "Height of Ramp D" annotation (Dialog(group="Ramp D Parameters"));
  parameter Modelica.Units.SI.Time rampD_duration=150 "Duration of Ramp D" annotation (Dialog(group="Ramp D Parameters"));
  parameter Modelica.Units.SI.Time rampD_startTime=3150 "Start of output y of Ramp D" annotation (Dialog(group="Ramp D Parameters"));
  parameter Modelica.Units.SI.Time samplePeriod=0.1 "Sample period of component" annotation (Dialog(group="Sampler Parameters"));
  parameter Modelica.Units.SI.Time foh_samplePeriod=5 "Sample period of component" annotation (Dialog(group="FOH Parameters"));
  Modelica.Blocks.Sources.Ramp rampD(
    height=rampD_height,
    duration=rampD_duration,
    startTime=rampD_startTime) annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
equation
  connect(sampler.y,firstOrderHold. u) annotation (Line(points={{41,0},{58,0}},     color={0,0,127}));
  connect(sum.y, sampler.u) annotation (Line(points={{-15,0},{18,0}}, color={0,0,127}));
  connect(rampA.y, sum.u[1]) annotation (Line(points={{-59,70},{-50,70},{-50,-0.75},{-38,-0.75}},       color={0,0,127}));
  connect(rampB.y, sum.u[2]) annotation (Line(points={{-59,30},{-50,30},{-50,-0.25},{-38,-0.25}},
                                                                        color={0,0,127}));
  connect(rampC.y, sum.u[3]) annotation (Line(points={{-59,-30},{-50,-30},{-50,0.25},{-38,0.25}},         color={0,0,127}));
  connect(y, firstOrderHold.y) annotation (Line(points={{110,0},{81,0}}, color={0,0,127}));
  connect(rampD.y, sum.u[4]) annotation (Line(points={{-59,-70},{-50,-70},{-50,0},{-38,0},{-38,0.75}}, color={0,0,127}));
  annotation (Icon(graphics={   Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
        Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
        Polygon(
          points={{90,-70},{68,-62},{68,-78},{90,-70}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,-70},{-60,-70},{-38,0}},
          thickness=1,
          color={238,46,47}),
        Line(points={{-39,0},{-20,0}},
          thickness=1,
          color={238,46,47}),
        Line(points={{-20,0},{0,0},{22,70}},
          thickness=1,
          color={28,108,200}),
        Line(points={{22,70},{42,70},{64,0}},
          thickness=1,
          color={0,140,72}),
        Line(points={{63,0},{82,0}},
          thickness=1,
          color={0,140,72}),
        Line(points={{21,70},{40,70}},
          thickness=1,
          color={28,108,200}),
        Text(
          extent={{-100,140},{100,100}},
          textColor={28,108,200},
          textString="%name")}));
end MultiRamp;
