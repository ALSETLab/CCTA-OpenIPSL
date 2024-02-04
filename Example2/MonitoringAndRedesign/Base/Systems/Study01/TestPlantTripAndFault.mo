within Example2.MonitoringAndRedesign.Base.Systems.Study01;
model TestPlantTripAndFault "11-bus 4-machine 2-area test system implemented with machine models from PSSE"
  extends Modelica.Icons.Example;
  extends
    Example2.MonitoringAndRedesign.Interfaces.OutputsInterfaceWEfdAndAVRout;
  parameter Real r=0.0001;
  parameter Real x=0.001;
  parameter Real b=0.00175*0.5;
  replaceable ReferenceSimulationModels.Data.PF2 PF_results constrainedby
    ReferenceSimulationModels.Support.PF_TwoAreas                                                                       annotation (Placement(transformation(extent={{0,-100},{20,-80}})));
  OpenIPSL.Electrical.Buses.Bus bus1
    annotation (Placement(transformation(extent={{-230,20},{-210,40}})));
  OpenIPSL.Electrical.Buses.Bus bus2
    annotation (Placement(transformation(extent={{-230,-10},{-210,10}})));
  OpenIPSL.Electrical.Buses.Bus bus3
    annotation (Placement(transformation(extent={{230,20},{250,40}})));
  OpenIPSL.Electrical.Buses.Bus bus4
    annotation (Placement(transformation(extent={{230,-20},{250,0}})));
  OpenIPSL.Electrical.Buses.Bus bus5
    annotation (Placement(transformation(extent={{-190,20},{-170,40}})));
  OpenIPSL.Electrical.Buses.Bus bus6
    annotation (Placement(transformation(extent={{-150,20},{-130,40}})));
  OpenIPSL.Electrical.Buses.Bus bus7
    annotation (Placement(transformation(extent={{-70,20},{-50,40}})));
  OpenIPSL.Electrical.Buses.Bus bus8
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  OpenIPSL.Electrical.Buses.Bus bus9
    annotation (Placement(transformation(extent={{50,20},{70,40}})));
  OpenIPSL.Electrical.Buses.Bus bus10
    annotation (Placement(transformation(extent={{150,20},{170,40}})));
  OpenIPSL.Electrical.Buses.Bus bus11
    annotation (Placement(transformation(extent={{190,20},{210,40}})));
  Plants.G1_AVRPSS_IO g1(
    v_0=PF_results.voltages.V1,
    angle_0=PF_results.voltages.A1,
    P_0=PF_results.machines.P1_1,
    Q_0=PF_results.machines.Q1_1,
    Kw=1,
    Tw=10,
    T1=0.05,
    T2=0.02,
    T3=3.0,
    T4=5.4) annotation (Placement(transformation(extent={{-254,26},{-242,38}})));
  ReferenceSimulationModels.Groups.PSSE.No_Controls.G2 g2(
    v_0=PF_results.voltages.V2,
    angle_0=PF_results.voltages.A2,
    P_0=PF_results.machines.P2_1,
    Q_0=PF_results.machines.Q2_1) annotation (Placement(transformation(extent={{-254,-6},{-242,6}})));
  ReferenceSimulationModels.Groups.PSSE.Tg.G3 g3(
    v_0=PF_results.voltages.V3,
    angle_0=PF_results.voltages.A3,
    P_0=PF_results.machines.P3_1,
    Q_0=PF_results.machines.Q3_1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={268,30})));
  ReferenceSimulationModels.Groups.PSSE.No_Controls.G4 g4(
    v_0=PF_results.voltages.V4,
    angle_0=PF_results.voltages.A4,
    P_0=PF_results.machines.P4_1,
    Q_0=PF_results.machines.Q4_1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={268,-10})));
  OpenIPSL.Electrical.Branches.PwLine Line5_6(
    R=r*25,
    X=x*25,
    G=0,
    B=b*25) annotation (Placement(transformation(extent={{-170,20},{-150,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line7_8_1(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  OpenIPSL.Electrical.Branches.PwLine Line7_8_2(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  OpenIPSL.Electrical.Branches.PwLine Line8_9_2(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{20,10},{40,30}})));
  OpenIPSL.Electrical.Branches.PwLine Line8_9_1(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{20,30},{40,50}})));
  OpenIPSL.Electrical.Branches.PwLine Line9_10_A(
    R=r*10,
    X=x*10*0.45,
    G=0,
    B=b*10) annotation (Placement(transformation(extent={{128,20},{148,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line10_11(
    R=r*25,
    X=x*25,
    G=0,
    B=b*25) annotation (Placement(transformation(extent={{170,20},{190,40}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    X=1e-5,
    R=0,
    t1=60,
    t2=60 + 3/60)
            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-22})));
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
    annotation (Placement(transformation(extent={{-78,-26},{-50,0}})));
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
    annotation (Placement(transformation(extent={{80,-26},{50,0}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_1(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{-210,20},{-190,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_2(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{-210,-10},{-190,10}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_3(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{210,20},{230,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_4(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{210,-20},{230,0}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60)
    annotation (Placement(transformation(extent={{-44,-100},{-4,-84}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-294,24},{-282,36}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-102,-22},{-90,-10}})));
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=180,
        origin={98,-30})));
  OpenIPSL.Electrical.Branches.PwLine Line9_10_B(
    R=0,
    X=0.007333333333333,
    G=0,
    B=0) annotation (Placement(transformation(extent={{90,30},{110,50}})));
  OpenIPSL.Electrical.Branches.PwLine Line9_10_C(
    R=0,
    X=0.022000000000000,
    G=0,
    B=0,
    t1=0.5)
         annotation (Placement(transformation(extent={{90,8},{110,28}})));
  OpenIPSL.Electrical.Branches.PwLine Line6_7_A2(
    R=0,
    X=0.02,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-98,10},{-78,30}})));
  OpenIPSL.Electrical.Branches.PwLine Line6_7_A1(
    R=0,
    X=0.00666666666666667,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-98,32},{-78,52}})));
  OpenIPSL.Electrical.Branches.PwLine Line6_7_A0(
    R=r*10,
    X=x*10*0.5,
    G=0,
    B=b*10) annotation (Placement(transformation(extent={{-128,20},{-108,40}})));
equation
  w = g1.g1.SPEED;
  delta = g1.g1.ANGLE;
  Vt = g1.g1.ETERM;
  P = g1.g1.P;
  Q = g1.g1.Q;
  AVRin = g1.AVRinput_meas; // AVR input, error signal to the avr
  AVRout = g1.AVRoutput_meas; // AVR output, Efd
  connect(g1.pwPin, bus1.p) annotation (Line(points={{-242,32},{-232,32},{-232,30},
          {-220,30}},
                color={0,0,255}));
  connect(g2.pwPin, bus2.p) annotation (Line(points={{-241.4,0},{-220,0}},
               color={0,0,255}));
  connect(Line5_6.n, bus6.p) annotation (Line(points={{-151,30},{-140,30}},
                color={0,0,255}));
  connect(Line5_6.p, bus5.p) annotation (Line(points={{-169,30},{-180,30}},
                color={0,0,255}));
  connect(Line8_9_2.n, bus9.p) annotation (Line(points={{39,20},{54,20},{54,30},
          {60,30}}, color={0,0,255}));
  connect(Line8_9_1.n, bus9.p) annotation (Line(points={{39,40},{54,40},{54,30},
          {60,30}}, color={0,0,255}));
  connect(Line8_9_2.p, bus8.p) annotation (Line(points={{21,20},{6,20},{6,30},{0,
          30}}, color={0,0,255}));
  connect(Line8_9_1.p, bus8.p) annotation (Line(points={{21,40},{6,40},{6,30},{0,
          30}}, color={0,0,255}));
  connect(Line7_8_2.n, bus8.p) annotation (Line(points={{-21,20},{-6,20},{-6,22},
          {-6,30},{0,30}}, color={0,0,255}));
  connect(Line7_8_1.n, bus8.p) annotation (Line(points={{-21,40},{-6,40},{-6,30},
          {0,30}}, color={0,0,255}));
  connect(Line7_8_1.p, bus7.p) annotation (Line(points={{-39,40},{-54,40},{-54,30},
          {-60,30}}, color={0,0,255}));
  connect(Line9_10_A.n, bus10.p)
    annotation (Line(points={{147,30},{160,30}}, color={0,0,255}));
  connect(bus10.p, Line10_11.p)
    annotation (Line(points={{160,30},{171,30}}, color={0,0,255}));
  connect(Line10_11.n, bus11.p) annotation (Line(points={{189,30},{200,30}},
                color={0,0,255}));
  connect(g4.pwPin, bus4.p) annotation (Line(points={{261.4,-10},{240,-10}},
                     color={0,0,255}));
  connect(g3.pwPin, bus3.p)
    annotation (Line(points={{261.4,30},{240,30}}, color={0,0,255}));
  connect(pwFault.p, bus8.p)
    annotation (Line(points={{2.22045e-15,-10.3333},{0,30},{0,30}},
                                                          color={0,0,255}));
  connect(bus1.p, Line5_1.p)
    annotation (Line(points={{-220,30},{-209,30}}, color={0,0,255}));
  connect(bus5.p, Line5_1.n)
    annotation (Line(points={{-180,30},{-191,30}}, color={0,0,255}));
  connect(bus2.p, Line5_2.p)
    annotation (Line(points={{-220,0},{-209,0}}, color={0,0,255}));
  connect(Line5_2.n, bus6.p) annotation (Line(points={{-191,0},{-144,0},{-144,
          30},{-140,30}},
                      color={0,0,255}));
  connect(bus11.p, Line5_3.p)
    annotation (Line(points={{200,30},{211,30}}, color={0,0,255}));
  connect(Line5_3.n, bus3.p) annotation (Line(points={{229,30},{240,30}},
                     color={0,0,255}));
  connect(bus4.p, Line5_4.n)
    annotation (Line(points={{240,-10},{229,-10}}, color={0,0,255}));
  connect(Line5_4.p, Line10_11.p) annotation (Line(points={{211,-10},{164,-10},
          {164,30},{171,30}},color={0,0,255}));
  connect(const.y, g1.uPm) annotation (Line(points={{-281.4,30},{-281.4,33.6},{-254.8,
          33.6}}, color={0,0,127}));
  connect(g1.uPSS, g1.uPm) annotation (Line(points={{-254.8,32},{-272,32},{-272,
          33.6},{-254.8,33.6}}, color={0,0,127}));
  connect(g1.uVsAVR, g1.uPm) annotation (Line(points={{-254.8,30.4},{-256,30.4},
          {-256,20},{-272,20},{-272,33.6},{-254.8,33.6}},
                                                    color={0,0,127}));
  connect(const1.y, Load7.u) annotation (Line(points={{-89.4,-16},{-84,-16},{-84,
          -5.85},{-75.34,-5.85}}, color={0,0,127}));
  connect(const2.y, Load9.u) annotation (Line(points={{91.4,-30},{86,-30},{86,-5.85},
          {77.15,-5.85}}, color={0,0,127}));
  connect(Load9.p, bus9.p)
    annotation (Line(points={{65,0},{65,30},{60,30}}, color={0,0,255}));
  connect(Line9_10_A.p, Line9_10_B.n) annotation (Line(points={{129,30},{116,30},
          {116,40},{109,40}}, color={0,0,255}));
  connect(Line9_10_C.n, Line9_10_B.n) annotation (Line(points={{109,18},{116,18},
          {116,40},{109,40}}, color={0,0,255}));
  connect(Line9_10_C.p, Line9_10_B.p) annotation (Line(points={{91,18},{80,18},
          {80,40},{91,40}}, color={0,0,255}));
  connect(bus9.p, Line9_10_B.p) annotation (Line(points={{60,30},{80,30},{80,40},
          {91,40}}, color={0,0,255}));
  connect(Line7_8_2.p, bus7.p) annotation (Line(points={{-39,20},{-54,20},{-54,30},
          {-60,30}}, color={0,0,255}));
  connect(Load7.p, bus7.p) annotation (Line(
      points={{-64,8.88178e-16},{-64,30},{-62,30},{-60,30}},
      color={0,0,255},
      smooth=Smooth.Bezier));
  connect(Line6_7_A0.n,Line6_7_A1. p) annotation (Line(points={{-109,30},{-104,30},
          {-104,42},{-97,42}},     color={0,0,255}));
  connect(Line6_7_A2.p,Line6_7_A1. p) annotation (Line(points={{-97,20},{-104,20},
          {-104,42},{-97,42}},     color={0,0,255}));
  connect(Line6_7_A0.p, bus6.p) annotation (Line(
      points={{-127,30},{-140,30}},
      color={0,0,255},
      smooth=Smooth.Bezier));
  connect(Line6_7_A1.n, bus7.p) annotation (Line(points={{-79,42},{-72,42},{-72,
          30},{-60,30}}, color={0,0,255}));
  connect(Line6_7_A2.n, bus7.p) annotation (Line(points={{-79,20},{-74,20},{-74,
          30},{-60,30}}, color={0,0,255}));
  annotation ( preferredView = diagram,
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-280,-140},{240,
            140}})),
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
      StopTime=1200,
      __Dymola_NumberOfIntervals=10000,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=1e-06,
      __Dymola_Algorithm="Dassl"));
end TestPlantTripAndFault;
