within Example2.Base.Plants;
model G4
  "900MVA generation unit, composed of machine and exciter, connected to bus 4"
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENSAL(
    Tpd0=8,
    Tppd0=0.03,
    Tppq0=0.05,
    H=6.175,
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
    V_b=V_b,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    Xpq=0.55,
    Tpq0=0.4,
    M_b=900000000) annotation (Placement(transformation(extent={{32,-20},{72,20}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS   sEXS(
    T_AT_B=0.1,
    T_B=10,
    K=200,
    T_E=0.1,
    E_MIN=0,
    E_MAX=4)
    annotation (Placement(transformation(extent={{-6,-22},{14,-2}})));
  Modelica.Blocks.Sources.Constant non_active_inputs(k=0)
    annotation (Placement(transformation(extent={{40,-60},{20,-40}})));
equation
  connect(gENSAL.p, pwPin)
    annotation (Line(points={{72,0},{110,0}}, color={0,0,255}));
  connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{28,12},{20,12},
          {20,30},{80,30},{80,10},{74,10}}, color={0,0,127}));
  connect(sEXS.EFD, gENSAL.EFD) annotation (Line(points={{15,-12},{28,-12}}, color={0,0,127}));
  connect(sEXS.EFD0, gENSAL.EFD0) annotation (Line(points={{-7,-16},{-18,-16},{-18,-68},{80,-68},{80,-10},{74,-10}}, color={0,0,127}));
  connect(non_active_inputs.y, sEXS.VUEL) annotation (Line(points={{19,-50},{0,-50},{0,-23}}, color={0,0,127}));
  connect(sEXS.VOEL, sEXS.VUEL) annotation (Line(points={{4,-23},{4,-50},{0,-50},{0,-23}}, color={0,0,127}));
  connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(points={{74,-6},{82,-6},{82,-70},{-20,-70},{-20,-12},{-7,-12}}, color={0,0,127}));
  connect(non_active_inputs.y, sEXS.VOTHSG) annotation (Line(points={{19,-50},{-12,-50},{-12,-8},{-7,-8}}, color={0,0,127}));
  connect(gENSAL.XADIFD, sEXS.XADIFD) annotation (Line(points={{74,-18},{78,-18},{78,-32},{12,-32},{12,-23}}, color={0,0,127}));
  annotation (
    Documentation(info="<html>
<p>900MVA generation unit connected to bus 4, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENROU, a round rotor synchronous generator model, from PSSE.</li>
<li><strong>Exciter</strong>: ESDC1A, a DC-type excitation system model, from PSSE.</li>
</ul>
</html>"));
end G4;
