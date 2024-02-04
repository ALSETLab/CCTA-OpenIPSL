within Example2.MonitoringAndRedesign.Analysis.Study01.ControllerData;
record CntrlDataTemplate "Template for data for the PSS controller"
  parameter OpenIPSL.Types.PerUnit vsmax "Max stabilizer output signal";
  parameter OpenIPSL.Types.PerUnit vsmin "Min stabilizer output signal";
  parameter Real Kw "Stabilizer gain [pu/pu]";
  parameter OpenIPSL.Types.Time Tw "Wash-out time constant";
  parameter OpenIPSL.Types.Time T1 "First stabilizer time constant";
  parameter OpenIPSL.Types.Time T2 "Second stabilizer time constant";
  parameter OpenIPSL.Types.Time T3 "Third stabilizer time constant";
  parameter OpenIPSL.Types.Time T4 "Fourth stabilizer time constant";

annotation(preferredView="text",
              Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          origin={0,-20},
          lineColor={64,64,64},
          fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          extent={{-80,-60},{80,60}},
          radius=25.0),
        Rectangle(
          lineColor={200,200,200},
          fillColor={248,248,248},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-100,-100},{100,100}},
          radius=25.0),
        Rectangle(
          lineColor={64,64,64},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          extent={{-80,-80},{80,40}},
          radius=25.0),
        Line(
          origin={0,-5},
          points={{0,45},{0,-75}},
          color={64,64,64}),
        Line(
          points={{-80,0},{80,0}},
          color={64,64,64}),
        Line(
          origin={0,-40},
          points={{-80,0},{80,0}},
          color={64,64,64}),
        Text(
          extent={{-98,82},{100,40}},
          textColor={28,108,200},
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CntrlDataTemplate;
