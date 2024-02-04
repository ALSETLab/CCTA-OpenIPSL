within Example1.Base.Plants;
model Generator_AVR_PSS_w3Inputs
  "Generator with AVR and PSS and input/output interfaces for linearization"
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Machines.PSAT.Order6 machine(
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
    Tr=0.015) annotation (Placement(transformation(extent={{-52,-4},{-12,36}})));
  OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(
    vsmax=0.2,
    vsmin=-0.2,
    Kw=Kw,
    Tw=Tw,
    T1=T1,
    T2=T2,
    T3=T3,
    T4=T4)
          annotation (Placement(transformation(extent={{-114,-4},{-94,16}})));
  Modelica.Blocks.Interfaces.RealInput uPSS annotation (Placement(
        transformation(extent={{-140,40},{-100,80}}), iconTransformation(
          extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Math.Feedback feedbackPSS annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-130,6})));
  Modelica.Blocks.Math.Gain gain_uPSS(k=-1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={2,70})));
  Modelica.Blocks.Math.Gain pmInputGain(k=-1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-26,-44})));
  Modelica.Blocks.Math.Feedback pm_fdbck annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-66,-28})));
  Modelica.Blocks.Interfaces.RealInput upm
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}),
        iconTransformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Math.Feedback feedbackAVR annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-80,6})));
  Modelica.Blocks.Math.Gain gain_uAVR(k=-1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-44,-80})));
  Modelica.Blocks.Interfaces.RealInput uvsAVR annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  parameter Real Kw=9.5 "Stabilizer gain (pu/pu)" annotation (Dialog(group="PSS"));
  parameter Real Tw=1.41 "Wash-out time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real T1=0 "First stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real T2=0 "Second stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real T3=0 "Third stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real T4=0 "Fourth stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real vfmax=7.0 "max lim." annotation (Dialog(group="AVR"));
  parameter Real vfmin=-6.40 "min lim." annotation (Dialog(group="AVR"));
  parameter Real K0=200 "regulator gain" annotation (Dialog(group="AVR"));
  Modelica.Blocks.Interfaces.RealOutput AVRout
    annotation (Placement(transformation(extent={{100,-90},{120,-70}})));
  Modelica.Blocks.Interfaces.RealOutput AVRin
    annotation (Placement(transformation(extent={{100,70},{120,90}})));
equation
  connect(machine.p, pwPin) annotation (Line(points={{74,0},{110,0}},
                             color={0,0,255}));
  connect(avr.vf, machine.vf) annotation (Line(points={{-10.3333,16},{2,16},{2,
          15},{8,15}},
                   color={0,0,127}));
  connect(machine.vf0, avr.vf0) annotation (Line(points={{20,33},{20,48},{-32,
          48},{-32,34.3333}},      color={0,0,127}));
  connect(feedbackPSS.y, pss.vSI)
    annotation (Line(points={{-121,6},{-116,6}}, color={0,0,127}));
  connect(machine.w, gain_uPSS.u) annotation (Line(points={{77,27},{94,27},
          {94,70},{14,70}}, color={0,0,127}));
  connect(pm_fdbck.y, machine.pm) annotation (Line(points={{-57,-28},{8,-28},
          {8,-15}},      color={0,0,127}));
  connect(pmInputGain.y, pm_fdbck.u2) annotation (Line(points={{-37,-44},{
          -66,-44},{-66,-36}},            color={0,0,127}));
  connect(upm, pm_fdbck.u1) annotation (Line(points={{-120,-60},{-98,-60},{
          -98,-28},{-74,-28}}, color={0,0,127}));
  connect(pmInputGain.u, machine.pm0) annotation (Line(points={{-14,-44},{
          20,-44},{20,-33}},   color={0,0,127}));
  connect(pss.vs, feedbackAVR.u1)
    annotation (Line(points={{-93,6},{-88,6}}, color={0,0,127}));
  connect(avr.vs, feedbackAVR.y)
    annotation (Line(points={{-50.3333,6},{-71,6}}, color={0,0,127}));
  connect(avr.v, machine.v) annotation (Line(points={{-50.3333,26},{-60,26},{
          -60,54},{86,54},{86,9},{77,9}},  color={0,0,127}));
  connect(gain_uPSS.y, feedbackPSS.u2) annotation (Line(points={{-9,70},{
          -86,70},{-86,26},{-156,26},{-156,-18},{-130,-18},{-130,-2}},
        color={0,0,127}));
  connect(uPSS, feedbackPSS.u1) annotation (Line(points={{-120,60},{-160,60},
          {-160,6},{-138,6}},                    color={0,0,127}));
  connect(gain_uAVR.y, feedbackAVR.u2) annotation (Line(points={{-55,-80},{
          -80,-80},{-80,-2}},                   color={0,0,127}));
  connect(uvsAVR, gain_uAVR.u) annotation (Line(points={{0,-120},{0,-100},{
          -20,-100},{-20,-78},{-26,-78},{-26,-80},{-32,-80}},
                 color={0,0,127}));
  connect(AVRout, machine.vf) annotation (Line(
      points={{110,-80},{-6,-80},{-6,16},{2,16},{2,15},{8,15}},
      color={0,140,72},
      thickness=1));
  connect(AVRin, feedbackAVR.y) annotation (Line(
      points={{110,80},{58,80},{58,90},{-68,90},{-68,6},{-71,6}},
      color={217,67,180},
      thickness=1));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}),
                    graphics={Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
          color={0,0,0},
          smooth=Smooth.Bezier),Text(
          extent={{-52,-18},{56,-66}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-100},
            {100,100}})),
    Documentation(info="<html>
<p>Model includes inputs using interfaces using input blocks from Modelica.Blocks.Interfaces.RealInput and output interfaces using blocks from Modelica.Blocks.Interfaces.RealOuput.</p>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p><br><br>Reference</p></td>
<td><p>SMIB PSAT, d_kundur2.mdl, PSAT</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>June 24, 2022</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Luigi Vanfretti</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>luigi.vanfretti@gmail.com</p></td>
</tr>
</table>
</html>"));
end Generator_AVR_PSS_w3Inputs;
