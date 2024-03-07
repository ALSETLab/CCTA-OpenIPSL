within Example1.Base.Plants;
model Gen "Generator with AVR and PSS"
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Machines.PSAT.Order6 machine(
    v_0=v_0,
    Vn=400000,
    V_b=V_b,
    ra=0.003,
    xd=1.81,
    xq=1.76,
    x1d=0.3,
    x1q=0.65,
    x2d=0.23,
    x2q=0.25,
    T1d0=8,
    T1q0=1,
    T2d0=0.03,
    T2q0=0.07,
    M=7,
    D=0,
    P_0=P_0,
    Q_0=Q_0,
    angle_0=angle_0,
    Sn=2220000000,
    Taa=0) annotation (Placement(transformation(extent={{14,-30},{74,30}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={
            {100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    vfmax=vfmax,
    vfmin=vfmin,
    K0=K0,
    T2=1,
    T1=1,
    Te=0.0001,
    Tr=0.015) annotation (Placement(transformation(extent={{-52,0},{-12,40}})));
  OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(
    vsmax=0.2,
    vsmin=-0.2,
    Kw=Kw,
    Tw=Tw,
    T1=T1,
    T2=T2,
    T3=T3,
    T4=T4)
          annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  parameter Real Kw=9.5 "Stabilizer gain (pu/pu)" annotation (Dialog(group="PSS"));
  parameter Real Tw=1.41 "Wash-out time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real T1=0 "First stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real T2=0 "Second stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real T3=0 "Third stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real T4=0 "Fourth stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real vfmax=7.0 "max lim." annotation (Dialog(group="AVR"));
  parameter Real vfmin=-6.40 "min lim." annotation (Dialog(group="AVR"));
  parameter Real K0=200 "regulator gain" annotation (Dialog(group="AVR"));
equation
  connect(machine.p, pwPin) annotation (Line(points={{74,0},{110,0}},
                             color={0,0,255}));
  connect(avr.vf, machine.vf) annotation (Line(points={{-10.3333,20},{2,20},{2,
          15},{8,15}},
                   color={0,0,127}));
  connect(machine.vf0, avr.vf0) annotation (Line(points={{20,33},{20,48},{-32,
          48},{-32,38.3333}},      color={0,0,127}));
  connect(avr.v, machine.v) annotation (Line(points={{-50.3333,30},{-60,30},{
          -60,60},{92,60},{92,9},{77,9}},  color={0,0,127}));
  connect(pss.vSI, machine.w) annotation (Line(points={{-82,10},{-92,10},{-92,
          54},{77,54},{77,27}}, color={0,0,127}));
  connect(machine.pm0, machine.pm) annotation (Line(points={{20,-33},{20,-36},{
          -6,-36},{-6,-15},{8,-15}}, color={0,0,127}));
  connect(pss.vs, avr.vs)
    annotation (Line(points={{-59,10},{-50.3333,10}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-100},
            {100,100}})),
    Documentation(info="<html>
<p>Generator model with exciter and PSS for simulation purposes. To be compared with: <span style=\"font-family: Courier New;\">Example1.Base.Plants.GenIO</span></p>
</html>"));
end Gen;
