within Example1.Base.Plants.Figures;
model GenIO
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
    Taa=0) annotation (Placement(transformation(extent={{22,-26},{74,26}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    vfmax=vfmax,
    vfmin=vfmin,
    K0=K0,
    T2=1,
    T1=1,
    Te=0.0001,
    Tr=0.015) annotation (Placement(transformation(extent={{-80,-4},{-10,36}})));
  OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(
    vsmax=0.2,
    vsmin=-0.2,
    Kw=Kw,
    Tw=Tw,
    T1=T1,
    T2=T2,
    T3=T3,
    T4=T4)
          annotation (Placement(transformation(extent={{-132,-4},{-112,16}})));
  Modelica.Blocks.Interfaces.RealInput uPSS annotation (Placement(
        transformation(extent={{-200,-14},{-160,26}}),iconTransformation(
          extent={{-200,-14},{-160,26}})));
  Modelica.Blocks.Math.Feedback intoPSS annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-148,6})));
  Modelica.Blocks.Math.Gain gain_uPSS(k=-1) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-3,59})));
  Modelica.Blocks.Math.Gain gain_pmInputGain(k=-1) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-30,-48})));
  Modelica.Blocks.Math.Feedback pm_fdbck annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-66,-28})));
  Modelica.Blocks.Interfaces.RealInput upm
    annotation (Placement(transformation(extent={{-200,-48},{-160,-8}}),
        iconTransformation(extent={{-200,-48},{-160,-8}})));
  Modelica.Blocks.Math.Feedback feedbackAVR annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-96,6})));
  Modelica.Blocks.Math.Gain gain_uAVR(k=-1) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-126,-80})));
  Modelica.Blocks.Interfaces.RealInput uvsAVR annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-184,-80})));
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
    annotation (Placement(transformation(extent={{100,-92},{122,-70}}),
        iconTransformation(extent={{100,-92},{122,-70}})));
  Modelica.Blocks.Interfaces.RealOutput AVRin
    annotation (Placement(transformation(extent={{100,-66},{122,-44}}),
        iconTransformation(extent={{100,-66},{122,-44}})));
  Modelica.Blocks.Sources.RealExpression fdbkAVR(y=feedbackAVR.y)
    annotation (Placement(transformation(extent={{54,-64},{92,-46}})));
  Modelica.Blocks.Sources.RealExpression vfAVR(y=AVR.y)
    annotation (Placement(transformation(extent={{68,-90},{94,-72}})));
equation
  connect(avr.vf, machine.vf) annotation (Line(points={{-7.08333,16},{6,16},{6,
          13},{16.8,13}},
                   color={0,0,127}));
  connect(machine.vf0, avr.vf0) annotation (Line(points={{27.2,28.6},{27.2,42},
          {-45,42},{-45,34.3333}}, color={0,0,127},
      pattern=LinePattern.Dash));
  connect(intoPSS.y, pss.vSI)
    annotation (Line(points={{-139,6},{-134,6}}, color={0,0,127}));
  connect(machine.w, gain_uPSS.u) annotation (Line(points={{76.6,23.4},{76.6,24},
          {96,24},{96,59},{3,59}},
                            color={0,0,127}));
  connect(pm_fdbck.y, machine.pm) annotation (Line(points={{-57,-28},{6,-28},{6,
          -13},{16.8,-13}},
                         color={0,0,127}));
  connect(gain_pmInputGain.y, pm_fdbck.u2) annotation (Line(
      points={{-36.6,-48},{-66,-48},{-66,-36}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(upm, pm_fdbck.u1) annotation (Line(points={{-180,-28},{-74,-28}},
                               color={0,0,127}));
  connect(gain_pmInputGain.u, machine.pm0) annotation (Line(
      points={{-22.8,-48},{27.2,-48},{27.2,-28.6}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(pss.vs, feedbackAVR.u1)
    annotation (Line(points={{-111,6},{-104,6}},
                                               color={0,0,127}));
  connect(avr.vs, feedbackAVR.y)
    annotation (Line(points={{-77.0833,6},{-87,6}}, color={0,0,127}));
  connect(avr.v, machine.v) annotation (Line(points={{-77.0833,26},{-98,26},{
          -98,50},{86,50},{86,7.8},{76.6,7.8}},
                                           color={0,0,127}));
  connect(gain_uPSS.y, intoPSS.u2)
    annotation (Line(points={{-8.5,59},{-148,59},{-148,14}}, color={0,0,127}));
  connect(uPSS, intoPSS.u1)
    annotation (Line(points={{-180,6},{-156,6}}, color={0,0,127}));
  connect(gain_uAVR.y, feedbackAVR.u2) annotation (Line(points={{-119.4,-80},{
          -96,-80},{-96,-2}},                   color={0,0,127}));
  connect(uvsAVR, gain_uAVR.u) annotation (Line(points={{-184,-80},{-133.2,-80}},
                 color={0,0,127}));
  connect(fdbkAVR.y, AVRin)
    annotation (Line(points={{93.9,-55},{111,-55}}, color={0,0,127}));
  connect(vfAVR.y, AVRout)
    annotation (Line(points={{95.3,-81},{111,-81}}, color={0,0,127}));
  connect(machine.p, pwPin)
    annotation (Line(points={{74,0},{110,0}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-100},{
            100,75}})),
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
end GenIO;
