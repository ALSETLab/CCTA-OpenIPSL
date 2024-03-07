within Example2.CustomComponents.PSSChangeParam;
model PSS4Stages
  "PSS Model with 4 different stages that have different parameters triggered at different times"
  OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pSS1(
    vsmax=pss1_vsmax,
    vsmin=pss1_vsmin,
    Kw=pss1_Kw,
    Tw=pss1_Tw,
    T1=pss1_T1,
    T2=pss1_T2,
    T3=pss1_T3,
    T4=pss1_T4) annotation (Placement(transformation(extent={{-60,60},{-42,78}})));
  // Turn on/off PSS outputs for each structure
  parameter Real t1 = 0 "Start time of the injection" annotation (Dialog(group="PSS 1 Output Timing "));
  parameter Real t2 = 30 "Start time of the injection" annotation (Dialog(group="PSS 2 Output Timing "));
  parameter Real t3 = 60 "Start time of the injection" annotation (Dialog(group="PSS 3 Output Timing "));
  parameter Real t4 = 90
                        "Stop time of the injection" annotation (Dialog(group="PSS 4 Output Timing"));
  parameter Real t5 = Modelica.Constants.inf "Stop time of the injection" annotation (Dialog(group="PSS 4 Output Timing"));
  // Define PSS parameters for propagation
  // PSS 1
  parameter OpenIPSL.Types.PerUnit pss1_vsmax=0.2 "Max stabilizer output signal" annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  parameter OpenIPSL.Types.PerUnit pss1_vsmin=-0.2 "Min stabilizer output signal"
                                                                                 annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  parameter Real pss1_Kw=5 "Stabilizer gain [pu/pu]"
                                                    annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  parameter OpenIPSL.Types.Time pss1_Tw=5 "Wash-out time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  parameter OpenIPSL.Types.Time pss1_T1=Modelica.Constants.small "First stabilizer time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  parameter OpenIPSL.Types.Time pss1_T2=Modelica.Constants.small "Second stabilizer time constant"
                                                                                                  annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  parameter OpenIPSL.Types.Time pss1_T3=Modelica.Constants.small "Third stabilizer time constant"
                                                                                                 annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  parameter OpenIPSL.Types.Time pss1_T4=Modelica.Constants.small "Fourth stabilizer time constant"
                                                                                                  annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  // PSS 2
  parameter OpenIPSL.Types.PerUnit pss2_vsmax=0.2 "Max stabilizer output signal" annotation (Dialog(tab="PSS Parameters", group="PSS 2"));
  parameter OpenIPSL.Types.PerUnit pss2_vsmin=-0.2 "Min stabilizer output signal"
                                                                                 annotation (Dialog(tab="PSS Parameters", group="PSS 2"));
  parameter Real pss2_Kw=5 "Stabilizer gain [pu/pu]"
                                                    annotation (Dialog(tab="PSS Parameters", group="PSS 2"));
  parameter OpenIPSL.Types.Time pss2_Tw=5 "Wash-out time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 2"));
  parameter OpenIPSL.Types.Time pss2_T1=Modelica.Constants.small "First stabilizer time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 2"));
  parameter OpenIPSL.Types.Time pss2_T2=Modelica.Constants.small "Second stabilizer time constant"
                                                                                                  annotation (Dialog(tab="PSS Parameters", group="PSS 2"));
  parameter OpenIPSL.Types.Time pss2_T3=Modelica.Constants.small "Third stabilizer time constant"
                                                                                                 annotation (Dialog(tab="PSS Parameters", group="PSS 2"));
  parameter OpenIPSL.Types.Time pss2_T4=Modelica.Constants.small "Fourth stabilizer time constant"
                                                                                                  annotation (Dialog(tab="PSS Parameters", group="PSS 2"));
  // PSS 3
  parameter OpenIPSL.Types.PerUnit pss3_vsmax=0.2 "Max stabilizer output signal" annotation (Dialog(tab="PSS Parameters", group="PSS 3"));
  parameter OpenIPSL.Types.PerUnit pss3_vsmin=-0.2 "Min stabilizer output signal"
                                                                                 annotation (Dialog(tab="PSS Parameters", group="PSS 3"));
  parameter Real pss3_Kw=5 "Stabilizer gain [pu/pu]"
                                                    annotation (Dialog(tab="PSS Parameters", group="PSS 3"));
  parameter OpenIPSL.Types.Time pss3_Tw=5 "Wash-out time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 3"));
  parameter OpenIPSL.Types.Time pss3_T1=Modelica.Constants.small "First stabilizer time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 3"));
  parameter OpenIPSL.Types.Time pss3_T2=Modelica.Constants.small "Second stabilizer time constant"
                                                                                                  annotation (Dialog(tab="PSS Parameters", group="PSS 3"));
  parameter OpenIPSL.Types.Time pss3_T3=Modelica.Constants.small "Third stabilizer time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 3"));
  parameter OpenIPSL.Types.Time pss3_T4=Modelica.Constants.small "Fourth stabilizer time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 3"));
  // PSS 4
  parameter OpenIPSL.Types.PerUnit pss4_vsmax=0.2 "Max stabilizer output signal" annotation (Dialog(tab="PSS Parameters", group="PSS 4"));
  parameter OpenIPSL.Types.PerUnit pss4_vsmin=-0.2 "Min stabilizer output signal"
                                                                                 annotation (Dialog(tab="PSS Parameters", group="PSS 4"));
  parameter Real pss4_Kw=5 "Stabilizer gain [pu/pu]"
                                                    annotation (Dialog(tab="PSS Parameters", group="PSS 4"));
  parameter OpenIPSL.Types.Time pss4_Tw=5 "Wash-out time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 4"));
  parameter OpenIPSL.Types.Time pss4_T1=Modelica.Constants.small "First stabilizer time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 4"));
  parameter OpenIPSL.Types.Time pss4_T2=Modelica.Constants.small "Second stabilizer time constant"
                                                                                                  annotation (Dialog(tab="PSS Parameters", group="PSS 4"));
  parameter OpenIPSL.Types.Time pss4_T3=Modelica.Constants.small "Third stabilizer time constant"
                                                                                                 annotation (Dialog(tab="PSS Parameters", group="PSS 4"));
  parameter OpenIPSL.Types.Time pss4_T4=Modelica.Constants.small "Fourth stabilizer time constant"
                                                                                                  annotation (Dialog(tab="PSS Parameters", group="PSS 4"));

  OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pSS2(
    vsmax=pss2_vsmax,
    vsmin=pss2_vsmin,
    Kw=pss2_Kw,
    Tw=pss2_Tw,
    T1=pss2_T1,
    T2=pss2_T2,
    T3=pss2_T3,
    T4=pss2_T4) annotation (Placement(transformation(extent={{-60,22},{-42,40}})));
  OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pSS3(
    vsmax=pss3_vsmax,
    vsmin=pss3_vsmin,
    Kw=pss3_Kw,
    Tw=pss3_Tw,
    T1=pss3_T1,
    T2=pss3_T2,
    T3=pss3_T3,
    T4=pss3_T4) annotation (Placement(transformation(extent={{-60,-28},{-40,-8}})));
  Example2.CustomComponents.TimedInputInjectionOnOff t1_t2(t_start=t1, t_stop=
        t2) annotation (Placement(transformation(extent={{-20,58},{0,78}})));
  OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pSS4(
    vsmax=pss4_vsmax,
    vsmin=pss4_vsmin,
    Kw=pss4_Kw,
    Tw=pss4_Tw,
    T1=pss4_T1,
    T2=pss4_T2,
    T3=pss4_T3,
    T4=pss4_T4) annotation (Placement(transformation(extent={{-60,-58},{-40,-38}})));
  Modelica.Blocks.Interfaces.RealInput vSI "PSS4Substructures input" annotation (Placement(transformation(extent={{-140,-20},{-100,20}}), iconTransformation(extent={{-140,-20},{-100,20}})));
  Example2.CustomComponents.TimedInputInjectionOnOff t2_t3(t_start=t2, t_stop=
        t3) annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Example2.CustomComponents.TimedInputInjectionOnOff t3_t4(t_start=t3, t_stop=
        t4) annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
  Example2.CustomComponents.TimedInputInjectionOnOff t4_t5(t_start=t4, t_stop=
        t5) annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Blocks.Math.Sum out(nin=4) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Interfaces.RealOutput vs "PSS4Substructures Output" annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(pSS2.vSI, vSI) annotation (Line(points={{-61.8,31},{-94,31},{-94,0},{-120,0}}, color={0,0,127}));
  connect(pSS1.vSI, vSI) annotation (Line(points={{-61.8,69},{-94,69},{-94,0},{-120,0}}, color={0,0,127}));
  connect(pSS3.vSI, vSI) annotation (Line(points={{-62,-18},{-94,-18},{-94,0},{-120,0}}, color={0,0,127}));
  connect(pSS4.vSI, vSI) annotation (Line(points={{-62,-48},{-94,-48},{-94,0},{-120,0}}, color={0,0,127}));
  connect(t1_t2.u, pSS1.vs) annotation (Line(points={{-22,68},{-32,68},{-32,69},
          {-41.1,69}}, color={0,0,127}));
  connect(pSS3.vs, t3_t4.u)
    annotation (Line(points={{-39,-18},{-38,-20},{-22,-20}}, color={0,0,127}));
  connect(pSS4.vs, t4_t5.u)
    annotation (Line(points={{-39,-48},{-38,-50},{-22,-50}}, color={0,0,127}));
  connect(pSS2.vs, t2_t3.u) annotation (Line(points={{-41.1,31},{-32,31},{-32,
          30},{-22,30}}, color={0,0,127}));
  connect(t1_t2.y, out.u[1]) annotation (Line(points={{1,68},{8,68},{8,-0.75},{18,-0.75}}, color={0,0,127}));
  connect(t2_t3.y, out.u[2]) annotation (Line(points={{1,30},{8,30},{8,-2},{18,-2},{18,-0.25}}, color={0,0,127}));
  connect(t3_t4.y, out.u[3]) annotation (Line(points={{1,-20},{6,-20},{6,-2},{8,-2},{8,0.25},{18,0.25}}, color={0,0,127}));
  connect(t4_t5.y, out.u[4]) annotation (Line(points={{1,-50},{6,-50},{6,2},{18,2},{18,0.75}}, color={0,0,127}));
  connect(out.y, vs) annotation (Line(points={{41,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={220,236,247},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-80,60},{20,0}},
          lineColor={28,108,200},
          fillColor={195,208,218},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,40},{40,-20}},
          lineColor={28,108,200},
          fillColor={211,225,236},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-40,20},{60,-40}},
          lineColor={28,108,200},
          fillColor={221,236,247},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-20,0},{80,-60}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-80,60},{-56,34}},
          textColor={28,108,200},
          textString="1",
          textStyle={TextStyle.Italic}),
        Text(
          extent={{-60,40},{-36,14}},
          textColor={28,108,200},
          textString="2",
          textStyle={TextStyle.Italic}),
        Text(
          extent={{-40,20},{-16,-6}},
          textColor={28,108,200},
          textString="3",
          textStyle={TextStyle.Italic}),
        Text(
          extent={{-20,0},{4,-26}},
          textColor={28,108,200},
          textString="4",
          textStyle={TextStyle.Italic}),
        Text(
          extent={{-100,-58},{100,-100}},
          textColor={28,108,200},
          textString="PSS",
          textStyle={TextStyle.Bold}),
        Text(
          extent={{-98,140},{100,100}},
          textColor={28,108,200},
          textString="%name")}),                                 Diagram(coordinateSystem(preserveAspectRatio=false)),preferredView="diagram",
    Documentation(info="<html>
<p>Specialized custom PSS model with Four Stages </p>
<p>This PSS is comprised of four different PSS models (PSSTypeII) internally. </p>
<p>The output of each of them is enabled or disabled through a <a href=\"Example2.CustomComponents.TimedInputInjectionOnOff\">Example2.CustomComponents.TimedInputInjectionOnOff</a> component such that only the output of one of them is injected. </p>
<p>This allows to &quot;emulate&quot; the change of parameters of a conventional PSS that would be represented by a single &quot;structure&quot;, i.e., the block diagram of PSSTypeII, for a user-specified time-period.</p>
</html>"));
end PSS4Stages;
