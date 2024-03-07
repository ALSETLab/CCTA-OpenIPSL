within Example2.CustomComponents;
model TimedInjection
  "Outputs \"y\", the same as the input signal \"u\" at a user-specified time, otherwise it outputs zero."
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Modelica.Blocks.Sources.ContinuousClock clock annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold gEThreshold(threshold=timedinjection_threshold)
                                                                          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Logical.Switch applySignal annotation (Placement(transformation(extent={{34,-10},{54,10}})));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(rotation=0, extent={{-129,-10},{-99,10}}), iconTransformation(extent={{-129,-10},{-99,10}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(rotation=0, extent={{99,-10},{129,10}}), iconTransformation(extent={{101,-10},{131,10}})));
  parameter Real timedinjection_threshold=60 "Time threshold to inject the signal" annotation (Dialog(group="Timed Injection Parameters"));
equation
  connect(clock.y, gEThreshold.u) annotation (Line(points={{-19,0},{-12,0}}, color={0,0,127}));
  connect(gEThreshold.y, applySignal.u2) annotation (Line(points={{11,0},{32,0}}, color={255,0,255}));
  connect(const.y, applySignal.u3) annotation (Line(points={{21,-30},{26,-30},{26,-8},{32,-8}}, color={0,0,127}));
  connect(applySignal.y, y) annotation (Line(points={{55,0},{114,0}}, color={0,0,127}));
  connect(u, applySignal.u1) annotation (Line(points={{-114,0},{-76,0},{-76,40},{20,40},{20,8},{32,8}}, color={0,0,127}));
  annotation (Icon(graphics={   Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
        Line(points={{80,0},{60,0}}, color={160,160,164}),
        Line(
          points={{0,0},{40,0}},
          thickness=0.5),
        Line(
          points={{0,0},{0,50}},
          thickness=0.5),
        Line(points={{0,80},{0,60}}, color={160,160,164}),
        Line(points={{37,70},{26,50}}, color={160,160,164}),
        Line(points={{70,38},{49,26}}, color={160,160,164}),
                          Line(
          points={{80,-0.1},{68.7,-34.3},{61.5,-53.2},{55.1,-66.5},{49.4,-74.7},{43.8,-79.2},{38.2,-79.9},{32.6,-76.7},{26.9,-69.8},{21.3,-59.5},{14.9,-44.2},{6.83,-21.3},{-10.1,30.7},{-17.3,50.1},{-23.7,64.1},{-29.3,73},{-35,78.3},{-40.6,79.9},{-46.2,77.5},{-51.9,71.4},{-57.5,61.8},{-63.9,47.1},{-72,24.7},{-80,-0.1}},
          color={28,108,200},
          smooth=Smooth.Bezier,
          origin={-10,-2.1},
          rotation=0,
          thickness=1),
        Text(
          extent={{-100,140},{100,100}},
          textColor={28,108,200},
          textString="%name")}));
end TimedInjection;
