within Example2.Base.Plants;
model G3
  "Generator unit model for g3 - 900MVA generation unit, composed of machine, exciter, pss and turbine & governor system"
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Machines.PSSE.GENROU g3(
    Tpd0=8,
    Tppd0=0.03,
    Tppq0=0.05,
    D=0,
    Xd=1.8,
    Xq=1.7,
    Xpd=0.3,
    Xppd=0.25,
    Xppq=0.25,
    Xl=0.2,
    H=6.175,
    R_a=0.0025,
    S12=0.802,
    S10=0.18600,
    M_b=900000000,
    V_b=V_b,
    v_0=v_0,
    P_0=P_0,
    Q_0=Q_0,
    angle_0=angle_0,
    Xpq=0.55,
    Tpq0=0.4) annotation (Placement(transformation(extent={{32,-20},{72,20}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
    T_AT_B=0.1,
    T_B=10,
    K=200,
    T_E=0.1,
    E_MIN=0,
    E_MAX=4) annotation (Placement(transformation(extent={{-4,-22},{16,-2}})));
  Modelica.Blocks.Sources.Constant non_active_inputs(k=0)
    annotation (Placement(transformation(extent={{40,-60},{20,-40}})));
  OpenIPSL.Electrical.Controls.PSAT.TG.TGTypeII tGTypeII(
    wref=0,
    R=Rdroop,
    pmax0=10.0,
    pmin0=0.0,
    Ts=2.0,
    T3=6.0,
    S_b=SysData.S_b,
    Sn=900000000)
    annotation (Placement(transformation(extent={{-10,16},{10,36}})));
  parameter OpenIPSL.Types.PerUnit Rdroop=0.1 "Droop";
  OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(
    vsmax=0.2,
    vsmin=-0.2,
    Kw=135,
    Tw=10,
    T1=0.05,
    T2=0.02,
    T3=3.0,
    T4=5.4)
           annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
equation
  connect(g3.p, pwPin) annotation (Line(points={{72,0},{110,0}},
               color={0,0,255}));
  connect(sEXS.EFD, g3.EFD) annotation (Line(points={{17,-12},{28,-12}},
                              color={0,0,127}));
  connect(sEXS.EFD0, g3.EFD0) annotation (Line(points={{-5,-16},{-18,-16},{-18,
          -68},{80,-68},{80,-10},{74,-10}}, color={0,0,127}));
  connect(sEXS.VUEL, non_active_inputs.y)
    annotation (Line(points={{2,-23},{2,-50},{19,-50}}, color={0,0,127}));
  connect(g3.ETERM, sEXS.ECOMP) annotation (Line(points={{74,-6},{82,-6},{82,
          -70},{-20,-70},{-20,-12},{-5,-12}}, color={0,0,127}));
  connect(non_active_inputs.y, sEXS.VOEL)
    annotation (Line(points={{19,-50},{6,-50},{6,-23}}, color={0,0,127}));
  connect(g3.XADIFD, sEXS.XADIFD) annotation (Line(points={{74,-18},{78,-18},{
          78,-32},{14,-32},{14,-23}}, color={0,0,127}));
  connect(g3.PMECH0, tGTypeII.pm0) annotation (Line(points={{74,10},{86,10},{86,52},{0,52},{0,38}}, color={0,0,127}));
  connect(tGTypeII.pm, g3.PMECH) annotation (Line(points={{11,26},{16,26},{16,12},{28,12}}, color={0,0,127}));
  connect(g3.SPEED, tGTypeII.w) annotation (Line(points={{74,14},{78,14},{78,44},{-28,44},{-28,26},{-12,26}}, color={0,0,127}));
  connect(pss.vs, sEXS.VOTHSG) annotation (Line(points={{-39,-10},{-10,-10},{-10,-8},{-5,-8}}, color={0,0,127}));
  connect(pss.vSI, g3.SPEED) annotation (Line(points={{-62,-10},{-78,-10},{-78,42},{84,42},{84,14},{74,14}}, color={0,0,127}));
  annotation (
    Documentation(info="<html>

<p>900MVA generation unit composed of the following component models:</p>
<ul>
<li>Machine: GENROU, a round rotor synchronous generator model, <span style=\"font-family: Courier New;\">OpenIPSL.Electrical.Machines.PSSE.GENROU</span></li>
<li>Exciter: SEXS, a simplified excitation system model, <span style=\"font-family: Courier New;\">OpenIPSL.Electrical.Controls.PSSE.ES.SEXS</span></li>
<li>Turbine and governor system: TGTypeII - simplified model including transient grain, <span style=\"font-family: Courier New;\">OpenIPSL.Electrical.Controls.PSAT.TG.TGTypeII</span></li>
<li>Power System Stabilizer: PSSTypeII - single input stabilizer, <span style=\"font-family: Courier New;\">OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII</span></li>
</ul>
</html>"));
end G3;
