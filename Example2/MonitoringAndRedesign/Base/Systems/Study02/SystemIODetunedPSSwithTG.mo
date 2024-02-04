within Example2.MonitoringAndRedesign.Base.Systems.Study02;
model SystemIODetunedPSSwithTG "Detuned PSS on Machine 1 variant of the 11-bus 4-machine 2-area test system implemented with machine models from PSSE"
  extends Example2.Utilities.Icons.ModelForLinearization;
  extends
    Example2.MonitoringAndRedesign.Interfaces.OutputsInterfaceWEfdAndAVRoutSmall;
  parameter Real r=0.0001;
  parameter Real x=0.001;
  parameter Real b=0.00175*0.5;
  parameter Real percent = 0.75;
  Modelica.Blocks.Interfaces.RealInput uPm
    annotation (Placement(transformation(extent={{-318,100},{-278,140}}), iconTransformation(extent={{-180,100},{-140,140}})));
  Modelica.Blocks.Interfaces.RealInput uPSS
    annotation (Placement(transformation(extent={{-320,40},{-280,80}}), iconTransformation(extent={{-182,40},{-142,80}})));
  Modelica.Blocks.Interfaces.RealInput uAVRin "Feedback input"
    annotation (Placement(transformation(extent={{-320,-20},{-280,20}}), iconTransformation(extent={{-182,-20},{-142,20}})));
  Modelica.Blocks.Interfaces.RealInput uLoad7
    annotation (Placement(transformation(extent={{-320,-80},{-280,-40}}), iconTransformation(extent={{-182,-80},{-142,-40}})));
  Modelica.Blocks.Interfaces.RealInput uLoad9
    annotation (Placement(transformation(extent={{-320,-140},{-280,-100}}), iconTransformation(extent={{-182,-140},{-142,-100}})));
  replaceable ReferenceSimulationModels.Data.PF2 PF_results constrainedby
    ReferenceSimulationModels.Data.PF2                                                                       annotation (Placement(transformation(extent={{0,-114},{20,-94}})));
  OpenIPSL.Electrical.Buses.Bus bus1
    annotation (Placement(transformation(extent={{-230,6},{-210,26}})));
  OpenIPSL.Electrical.Buses.Bus bus2
    annotation (Placement(transformation(extent={{-230,-24},{-210,-4}})));
  OpenIPSL.Electrical.Buses.Bus bus3
    annotation (Placement(transformation(extent={{230,6},{250,26}})));
  OpenIPSL.Electrical.Buses.Bus bus4
    annotation (Placement(transformation(extent={{230,-34},{250,-14}})));
  OpenIPSL.Electrical.Buses.Bus bus5
    annotation (Placement(transformation(extent={{-190,6},{-170,26}})));
  OpenIPSL.Electrical.Buses.Bus bus6
    annotation (Placement(transformation(extent={{-150,6},{-130,26}})));
  OpenIPSL.Electrical.Buses.Bus bus7
    annotation (Placement(transformation(extent={{-70,6},{-50,26}})));
  OpenIPSL.Electrical.Buses.Bus bus8
    annotation (Placement(transformation(extent={{-10,6},{10,26}})));
  OpenIPSL.Electrical.Buses.Bus bus9
    annotation (Placement(transformation(extent={{50,6},{70,26}})));
  OpenIPSL.Electrical.Buses.Bus bus10
    annotation (Placement(transformation(extent={{150,6},{170,26}})));
  OpenIPSL.Electrical.Buses.Bus bus11
    annotation (Placement(transformation(extent={{190,6},{210,26}})));
  Plants.G1_AVRPSSGov_IO
                      g1(
    v_0=PF_results.voltages.V1,
    angle_0=PF_results.voltages.A1,
    P_0=PF_results.machines.P1_1,
    Q_0=PF_results.machines.Q1_1,
    vsmax=vsmax,
    vsmin=vsmin,
    Kw=Kw,
    Tw=Tw,
    T1=T1,
    T2=T2,
    T3=T3,
    T4=T4)  annotation (Placement(transformation(extent={{-268,8},{-234,138}})));
  ReferenceSimulationModels.Groups.PSSE.No_Controls.G2 g2(
    v_0=PF_results.voltages.V2,
    angle_0=PF_results.voltages.A2,
    P_0=PF_results.machines.P2_1,
    Q_0=PF_results.machines.Q2_1) annotation (Placement(transformation(extent={{-254,-20},{-242,-8}})));
  ReferenceSimulationModels.Groups.PSSE.Tg.G3 g3(
    v_0=PF_results.voltages.V3,
    angle_0=PF_results.voltages.A3,
    P_0=PF_results.machines.P3_1,
    Q_0=PF_results.machines.Q3_1,
    R=0.1)                        annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={268,16})));
  ReferenceSimulationModels.Groups.PSSE.No_Controls.G4 g4(
    v_0=PF_results.voltages.V4,
    angle_0=PF_results.voltages.A4,
    P_0=PF_results.machines.P4_1,
    Q_0=PF_results.machines.Q4_1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={268,-24})));
  OpenIPSL.Electrical.Branches.PwLine Line5_6(
    R=r*25,
    X=x*25,
    G=0,
    B=b*25) annotation (Placement(transformation(extent={{-170,6},{-150,26}})));
  OpenIPSL.Electrical.Branches.PwLine Line7_8_1(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{-40,16},{-20,36}})));
  OpenIPSL.Electrical.Branches.PwLine Line7_8_2(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{-40,-4},{-20,16}})));
  OpenIPSL.Electrical.Branches.PwLine Line8_9_2(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{20,-4},{40,16}})));
  OpenIPSL.Electrical.Branches.PwLine Line8_9_1(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{20,16},{40,36}})));
  OpenIPSL.Electrical.Branches.PwLine Line9_10_A0(
    R=r*10,
    X=x*10,
    G=0,
    B=b*10) annotation (Placement(transformation(extent={{128,6},{148,26}})));
  OpenIPSL.Electrical.Branches.PwLine Line10_11(
    R=r*25,
    X=x*25,
    G=0,
    B=b*25) annotation (Placement(transformation(extent={{170,6},{190,26}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    X=X,
    R=R,
    t1=t1busfault,
    t2=t2busfault)
            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-34})));
  OpenIPSL.Electrical.Loads.PSSE.Load_ExtInput
                                      Load7(
    PQBRAK=0.7,
    v_0=PF_results.voltages.V7,
    angle_0=PF_results.voltages.A7,
    P_0=PF_results.loads.PL7_1,
    Q_0=PF_results.loads.QL7_1,
    d_P=0,
    t1=Modelica.Constants.inf,
    d_t=Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-78,-40},{-50,-14}})));
  OpenIPSL.Electrical.Loads.PSSE.Load_ExtInput
                                      Load9(
    PQBRAK=0.7,
    v_0=PF_results.voltages.V9,
    angle_0=PF_results.voltages.A9,
    P_0=PF_results.loads.PL9_1,
    Q_0=PF_results.loads.QL9_1,
    d_P=0,
    t1=Modelica.Constants.inf,
    d_t=Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{80,-40},{50,-14}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_1(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{-210,6},{-190,26}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_2(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{-210,-24},{-190,-4}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_3(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{210,6},{230,26}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_4(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{210,-34},{230,-14}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60)
    annotation (Placement(transformation(extent={{-44,-114},{-4,-98}})));
  OpenIPSL.Electrical.Branches.PwLine Line6_7_A2(
    R=0,
    X=(5)*x*10*percent,
    G=0,
    B=0,
    t1=t1)
         annotation (Placement(transformation(extent={{-98,-4},{-78,16}})));
  OpenIPSL.Electrical.Branches.PwLine Line6_7_A1(
    R=0,
    X=(5/4)*x*10*percent,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-98,18},{-78,38}})));
  OpenIPSL.Electrical.Branches.PwLine Line6_7_A0(
    R=r*10,
    X=x*10*(1 - percent),
    G=0,
    B=b*10) annotation (Placement(transformation(extent={{-128,6},{-108,26}})));
  parameter OpenIPSL.Types.Time t1=Modelica.Constants.inf;
  parameter OpenIPSL.Types.PerUnit vsmax=0.2 "Max stabilizer output signal"
    annotation (Dialog(group="PSS Parameters"));
  parameter OpenIPSL.Types.PerUnit vsmin=-0.2 "Min stabilizer output signal"
    annotation (Dialog(group="PSS Parameters"));
  parameter Real Kw=5 "Stabilizer gain [pu/pu]"
    annotation (Dialog(group="PSS Parameters"));
  parameter OpenIPSL.Types.Time Tw=5 "Wash-out time constant"
    annotation (Dialog(group="PSS Parameters"));
  parameter OpenIPSL.Types.Time T1=Modelica.Constants.small "First stabilizer time constant"
    annotation (Dialog(group="PSS Parameters"));
  parameter OpenIPSL.Types.Time T2=Modelica.Constants.small "Second stabilizer time constant"
    annotation (Dialog(group="PSS Parameters"));
  parameter OpenIPSL.Types.Time T3=Modelica.Constants.small "Third stabilizer time constant"
    annotation (Dialog(group="PSS Parameters"));
  parameter OpenIPSL.Types.Time T4=Modelica.Constants.small "Fourth stabilizer time constant"
    annotation (Dialog(group="PSS Parameters"));
  parameter OpenIPSL.Types.PerUnit R=0 "Resistance"
    annotation (Dialog(group="Bus Fault Parameters"));
  parameter OpenIPSL.Types.PerUnit X=1e-5 "Reactance"
    annotation (Dialog(group="Bus Fault Parameters"));
  parameter OpenIPSL.Types.Time t1busfault=Modelica.Constants.inf
    "Start time of the fault" annotation (Dialog(group="Bus Fault Parameters"));
  parameter OpenIPSL.Types.Time t2busfault=Modelica.Constants.inf
    "End time of the fault" annotation (Dialog(group="Bus Fault Parameters"));
equation
  w = g1.g1.SPEED;
  delta = g1.g1.ANGLE;
  Vt = g1.g1.ETERM;
  P = g1.g1.P;
  Q = g1.g1.Q;
  AVRin = g1.AVRinput_meas; // AVR input, error signal to the avr
  AVRout = g1.AVRoutput_meas; // AVR output, Efd
  connect(g1.pwPin,bus1. p) annotation (Line(points={{-234,73},{-230,73},{-230,
          16},{-220,16}},
                color={0,0,255}));
  connect(g2.pwPin,bus2. p) annotation (Line(points={{-241.4,-14},{-220,-14}},
               color={0,0,255}));
  connect(Line5_6.n,bus6. p) annotation (Line(points={{-151,16},{-140,16}},
                color={0,0,255}));
  connect(Line5_6.p,bus5. p) annotation (Line(points={{-169,16},{-180,16}},
                color={0,0,255}));
  connect(Line8_9_2.n,bus9. p) annotation (Line(points={{39,6},{54,6},{54,16},{
          60,16}},  color={0,0,255}));
  connect(Line8_9_1.n,bus9. p) annotation (Line(points={{39,26},{54,26},{54,16},
          {60,16}}, color={0,0,255}));
  connect(Line8_9_2.p,bus8. p) annotation (Line(points={{21,6},{6,6},{6,16},{0,
          16}}, color={0,0,255}));
  connect(Line8_9_1.p,bus8. p) annotation (Line(points={{21,26},{6,26},{6,16},{
          0,16}},
                color={0,0,255}));
  connect(Line7_8_2.n,bus8. p) annotation (Line(points={{-21,6},{-6,6},{-6,16},
          {0,16}},         color={0,0,255}));
  connect(Line7_8_1.n,bus8. p) annotation (Line(points={{-21,26},{-6,26},{-6,16},
          {0,16}}, color={0,0,255}));
  connect(Line7_8_1.p,bus7. p) annotation (Line(points={{-39,26},{-54,26},{-54,
          16},{-60,16}},
                     color={0,0,255}));
  connect(Line9_10_A0.n, bus10.p) annotation (Line(points={{147,16},{160,16}}, color={0,0,255}));
  connect(bus10.p,Line10_11. p)
    annotation (Line(points={{160,16},{171,16}}, color={0,0,255}));
  connect(Line10_11.n,bus11. p) annotation (Line(points={{189,16},{200,16}},
                color={0,0,255}));
  connect(g4.pwPin,bus4. p) annotation (Line(points={{261.4,-24},{240,-24}},
                     color={0,0,255}));
  connect(g3.pwPin,bus3. p)
    annotation (Line(points={{261.4,16},{240,16}}, color={0,0,255}));
  connect(pwFault.p,bus8. p)
    annotation (Line(points={{0,-22.3333},{0,16}},        color={0,0,255}));
  connect(bus1.p,Line5_1. p)
    annotation (Line(points={{-220,16},{-209,16}}, color={0,0,255}));
  connect(bus5.p,Line5_1. n)
    annotation (Line(points={{-180,16},{-191,16}}, color={0,0,255}));
  connect(bus2.p,Line5_2. p)
    annotation (Line(points={{-220,-14},{-209,-14}},
                                                 color={0,0,255}));
  connect(Line5_2.n,bus6. p) annotation (Line(points={{-191,-14},{-144,-14},{
          -144,16},{-140,16}},
                      color={0,0,255}));
  connect(bus11.p,Line5_3. p)
    annotation (Line(points={{200,16},{211,16}}, color={0,0,255}));
  connect(Line5_3.n,bus3. p) annotation (Line(points={{229,16},{240,16}},
                     color={0,0,255}));
  connect(bus4.p,Line5_4. n)
    annotation (Line(points={{240,-24},{229,-24}}, color={0,0,255}));
  connect(Line5_4.p,Line10_11. p) annotation (Line(points={{211,-24},{164,-24},
          {164,16},{171,16}},color={0,0,255}));
  connect(Load9.p,bus9. p)
    annotation (Line(points={{65,-14},{65,16},{60,16}},
                                                      color={0,0,255}));
  connect(Line7_8_2.p, bus7.p) annotation (Line(points={{-39,6},{-54,6},{-54,16},
          {-60,16}}, color={0,0,255}));
  connect(Load7.p, bus7.p) annotation (Line(
      points={{-64,-14},{-64,16},{-62,16},{-60,16}},
      color={0,0,255},
      smooth=Smooth.Bezier));
  connect(Line6_7_A0.n,Line6_7_A1. p) annotation (Line(points={{-109,16},{-104,
          16},{-104,28},{-97,28}}, color={0,0,255}));
  connect(Line6_7_A2.p,Line6_7_A1. p) annotation (Line(points={{-97,6},{-104,6},
          {-104,28},{-97,28}},     color={0,0,255}));
  connect(Line6_7_A0.p, bus6.p) annotation (Line(
      points={{-127,16},{-140,16}},
      color={0,0,255},
      smooth=Smooth.Bezier));
  connect(Line6_7_A1.n, bus7.p) annotation (Line(points={{-79,28},{-72,28},{-72,
          16},{-60,16}}, color={0,0,255}));
  connect(Line6_7_A2.n, bus7.p) annotation (Line(points={{-79,6},{-74,6},{-74,
          16},{-60,16}}, color={0,0,255}));
  connect(g1.uPm, uPm) annotation (Line(
      points={{-270.267,90.3333},{-276,90.3333},{-276,120},{-298,120}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(g1.uPSS, uPSS) annotation (Line(
      points={{-270.267,73},{-270.267,72},{-274,72},{-274,60},{-300,60}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(g1.uVsAVR, uAVRin) annotation (Line(
      points={{-270.267,55.6667},{-270.267,54},{-274,54},{-274,0},{-300,0}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uLoad7, Load7.u) annotation (Line(
      points={{-300,-60},{-84,-60},{-84,-19.85},{-75.34,-19.85}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uLoad9, Load9.u) annotation (Line(
      points={{-300,-120},{-104,-120},{-104,-76},{77.15,-76},{77.15,-19.85}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(Line9_10_A0.p, bus9.p) annotation (Line(points={{129,16},{60,16}}, color={0,0,255}));
    annotation (Dialog(group="Line Trip Parameters"),
               preferredView = diagram,
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-280,-140},{280,140}}),
                    graphics={Text(
          extent={{-58,130},{222,96}},
          textColor={238,46,47},
          textString="In this setup, this line is removed"), Line(
          points={{-58,96},{-86,10}},
          color={238,46,47},
          thickness=1,
          arrow={Arrow.None,Arrow.Filled})}),
    Documentation(info="<html>
<p>This example is composed by the 11-bus 4-machine 2-area system, where these two areas are connected via weak tie lines. This test system is ideal for studying dynamic stability, power interchange, oscillation damping, etc.</p>
<p>The four generation units are composed only of machines, differently from the system <strong>Two_Areas_PSSE_AVR</strong>, where excitation systems are also represented.</p>
<p>The system undergoes a three-phase-to-ground fault on Bus 8 at 3s, lasting for 200ms. Simulate the system for 10 seconds. Variables of interest are the ones related to inter-area modes. For example:</p>
<ul>
<li><code>g1.gENSAL.SPEED</code></li>
<li><code>g2.gENSAL.SPEED</code></li>
<li><code>g3.gENSAL.SPEED</code></li>
<li><code>g4.gENSAL.SPEED</code></li>
</ul>
<p>which are variables that represent the generator's deviation from nominal speed, in per unit. Note that generators 1 and 2 swing together, while swinging against generators 3 and 4. This is due to coherency between the area's group of generators.</p>
<p>Compare these results with the ones from <strong>Two_Areas_PSSE_AVR</strong>.</p>
</html>"),
    experiment(
      StopTime=600,
      __Dymola_NumberOfIntervals=10000,
      __Dymola_Algorithm="Dassl"),
    Icon(graphics={Text(
          extent={{-100,100},{100,60}},
          textColor={0,140,72},
          textString="Detuned"),
                   Text(
          extent={{-98,20},{102,-20}},
          textColor={217,67,180},
          textString="with TG")}));
end SystemIODetunedPSSwithTG;
