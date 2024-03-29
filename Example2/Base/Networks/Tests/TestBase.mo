within Example2.Base.Networks.Tests;
model TestBase "Tests the base network model"
  extends Modelica.Icons.Example;
  extends Example2.Base.Networks.Base;
  Plants.inf          g1(
    v_0=PF_results.voltages.V1,
    angle_0=PF_results.voltages.A1,
    P_0=PF_results.machines.P1_1,
    Q_0=PF_results.machines.Q1_1)       annotation (Placement(transformation(extent={{-248,6},
            {-228,26}})));
  Plants.inf g2(
    v_0=PF_results.voltages.V2,
    angle_0=PF_results.voltages.A2,
    P_0=PF_results.machines.P2_1,
    Q_0=PF_results.machines.Q2_1)
    annotation (Placement(transformation(extent={{-248,-20},{-236,-8}})));
  Plants.inf g3(
    v_0=PF_results.voltages.V3,
    angle_0=PF_results.voltages.A3,
    P_0=PF_results.machines.P3_1,
    Q_0=PF_results.machines.Q3_1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={256,16})));
  Plants.inf g4(
    v_0=PF_results.voltages.V4,
    angle_0=PF_results.voltages.A4,
    P_0=PF_results.machines.P4_1,
    Q_0=PF_results.machines.Q4_1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={252,-24})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-114,-32},{-94,-12}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{96,-50},{116,-30}})));
equation
  connect(g1.pwPin, bus1.p)
    annotation (Line(points={{-227,16},{-220,16}}, color={0,0,255}));
  connect(g2.pwPin, bus2.p) annotation (Line(points={{-235.4,-14},{-220,-14}},
                            color={0,0,255}));
  connect(g3.pwPin, bus3.p)
    annotation (Line(points={{249.4,16},{240,16}}, color={0,0,255}));
  connect(bus4.p, g4.pwPin)
    annotation (Line(points={{240,-24},{245.4,-24}}, color={0,0,255}));
  connect(const.y, Load7.u) annotation (Line(points={{-93,-22},{-84,-22},{-84,-19.85},
          {-75.34,-19.85}}, color={0,0,127}));
  connect(const1.y, Load9.u) annotation (Line(points={{117,-40},{138,-40},{138,-19.85},
          {77.15,-19.85}}, color={0,0,127}));
  annotation (experiment(StopTime=10),preferredView="diagram",
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-280,-140},{280,
            140}})));
end TestBase;
