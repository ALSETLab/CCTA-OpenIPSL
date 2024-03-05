within Example2.Base.Groups.PSSE.AVR;
model G2_sexs "900MVA generation unit, composed of machine and exciter, connected to bus 2"
  extends Support.Generator;
  OpenIPSL.Electrical.Machines.PSSE.GENROU g2(
    Tpd0=8,
    Tppd0=0.03,
    Tppq0=0.05,
    H=6.5,
    Xd=1.8,
    Xq=1.7,
    Xpd=0.3,
    Xppd=0.25,
    Xppq=0.25,
    Xl=0.2,
    R_a=0.0025,
    D=0.02,
    S12=0.802,
    S10=0.18600,
    M_b=900000000,
    V_b=V_b,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    Xpq=0.55,
    Tpq0=0.4) annotation (Placement(transformation(extent={{32,-20},{72,20}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS   sEXS(
    T_AT_B=0.1,
    T_B=10,
    K=200,
    T_E=0.1,
    E_MIN=0,
    E_MAX=4)
    annotation (Placement(transformation(extent={{-4,-22},{16,-2}})));
  Modelica.Blocks.Sources.Constant non_active_inputs(k=0)
    annotation (Placement(transformation(extent={{40,-60},{20,-40}})));
equation
  connect(g2.PMECH, g2.PMECH0) annotation (Line(points={{28,12},{20,12},{20,30},
          {80,30},{80,10},{74,10}}, color={0,0,127}));
  connect(g2.p, pwPin)
    annotation (Line(points={{72,0},{100,0}}, color={0,0,255}));
  connect(g2.EFD, sEXS.EFD) annotation (Line(points={{28,-12},{17,-12}}, color={0,0,127}));
  connect(sEXS.EFD0, g2.EFD0) annotation (Line(points={{-5,-16},{-18,-16},{-18,-68},{80,-68},{80,-10},{74,-10}}, color={0,0,127}));
  connect(non_active_inputs.y, sEXS.VUEL) annotation (Line(points={{19,-50},{2,-50},{2,-23}}, color={0,0,127}));
  connect(g2.ETERM, sEXS.ECOMP) annotation (Line(points={{74,-6},{82,-6},{82,-70},{-20,-70},{-20,-12},{-5,-12}}, color={0,0,127}));
  connect(non_active_inputs.y, sEXS.VOEL) annotation (Line(points={{19,-50},{6,-50},{6,-23}}, color={0,0,127}));
  connect(non_active_inputs.y, sEXS.VOTHSG) annotation (Line(points={{19,-50},{-12,-50},{-12,-8},{-5,-8}}, color={0,0,127}));
  connect(g2.XADIFD, sEXS.XADIFD) annotation (Line(points={{74,-18},{78,-18},{78,-32},{14,-32},{14,-23}}, color={0,0,127}));
  annotation (
    Documentation(info="<html>
<p>900MVA generation unit connected to bus 2, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENROU, a round rotor synchronous generator model, from PSSE.</li>
<li><strong>Exciter</strong>: ESDC1A, a DC-type excitation system model, from PSSE.</li>
</ul>
</html>"));
end G2_sexs;
