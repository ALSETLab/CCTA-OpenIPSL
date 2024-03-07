within Example2.CustomComponents;
model TimedMultiRamp
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(rotation=0, extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  CustomComponents.MultiRamp multiRamp(
    rampA_height=rampA_height,
    rampA_duration=rampA_duration,
    rampA_startTime=rampA_startTime,
    rampB_height=rampB_height,
    rampB_duration=rampB_duration,
    rampB_startTime=rampB_startTime,
    rampC_height=rampC_height,
    rampC_duration=rampC_duration,
    rampC_startTime=rampC_startTime,
    rampD_height=rampD_height,
    rampD_duration=rampD_duration,
    rampD_startTime=rampD_startTime,
    samplePeriod=samplePeriod,
    foh_samplePeriod=foh_samplePeriod)
    annotation (Placement(transformation(extent={{-80,-20},{-40,20}})));
  CustomComponents.TimedInjection timedInjection(timedinjection_threshold=
        timedinjection_threshold)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  parameter Real rampA_height=0.025 "Ramp A Height" annotation (Dialog(group="Ramp A Parameters"));
  parameter Modelica.Units.SI.Time rampA_duration = 150 "Duration of Ramp A" annotation (Dialog(group="Ramp A Parameters"));
  parameter Modelica.Units.SI.Time rampA_startTime= 300 "Start of output y of Ramp A" annotation (Dialog(group="Ramp A Parameters"));
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
  parameter Real timedinjection_threshold=0 "Time threshold to inject the signal" annotation (Dialog(group="Timed Injection Parameters"));

equation
  connect(multiRamp.y, timedInjection.u) annotation (Line(points={{-38,0},{-22.8,0}}, color={0,0,127}));
  connect(timedInjection.y, y) annotation (Line(points={{23.2,0},{110,0}}, color={0,0,127}));
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
          textString="%name")}), experiment(
      StopTime=3900),preferredView="diagram");
end TimedMultiRamp;
