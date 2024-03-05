within Example2.Base.Groups.PSSE.Tg;
model G4 "900MVA generation unit, composed only of a machine model, connected to bus 4"
  extends Support.Generator;
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
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
    M_b=900000000,
    V_b=V_b,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0)
    annotation (Placement(transformation(extent={{32,-20},{72,20}})));
  OpenIPSL.Electrical.Controls.PSAT.TG.TGTypeII tGTypeII(
    wref=0,
    R=0.015,
    Ts=2.0,
    T3=6.0,
    S_b=SysData.S_b,
    Sn=900000000)
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
equation
  connect(gENSAL.p, pwPin)
    annotation (Line(points={{72,0},{100,0}}, color={0,0,255}));
  connect(gENSAL.EFD0, gENSAL.EFD) annotation (Line(points={{74,-10},{80,-10},
          {80,-30},{20,-30},{20,-12},{28,-12}}, color={0,0,127}));
  connect(gENSAL.PMECH0, tGTypeII.pm0) annotation (Line(points={{74,10},{80,10},
          {80,30},{-10,30},{-10,22}}, color={0,0,127}));
  connect(tGTypeII.pm, gENSAL.PMECH) annotation (Line(points={{1,10},{10,10},{
          10,12},{28,12}}, color={0,0,127}));
  connect(gENSAL.SPEED, tGTypeII.w) annotation (Line(points={{74,14},{88,14},{
          88,36},{-28,36},{-28,10},{-22,10}}, color={0,0,127}));
  annotation (
    Documentation(info="<html>
<p>900MVA generation unit connected to bus 4, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous generator model, from PSSE.</li>
</ul>
</html>"));
end G4;
