within Example2.MonitoringAndRedesign.Base.Plants;
model G1_AVRPSSGov_IO
  extends Example2.MonitoringAndRedesign.Base.Plants.G1_AVR_Base;
  Modelica.Blocks.Interfaces.RealInput uPSS annotation (Placement(
        transformation(extent={{-180,-10},{-160,10}}), iconTransformation(
          extent={{-180,-10},{-160,10}})));
  Modelica.Blocks.Interfaces.RealInput uPm annotation (Placement(transformation(
          extent={{-180,30},{-160,50}}),
                                       iconTransformation(extent={{-180,30},{
            -160,50}})));
  Modelica.Blocks.Math.Feedback feedbackInputPSS
    annotation (Placement(transformation(extent={{-140,-10},{-120,10}})));
  OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(
    vsmax=vsmax,
    vsmin=vsmin,
    Kw=Kw,
    Tw=Tw,
    T1=T1,
    T2=T2,
    T3=T3,
    T4=T4) annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Math.Gain pssInputGain(k=-1) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-130,-18})));
  Modelica.Blocks.Math.Gain pmInputGain(k=-1) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-116,60})));
  Modelica.Blocks.Math.Feedback sumPSSy_u_r annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  parameter OpenIPSL.Types.PerUnit vsmax=0.2 "Max stabilizer output signal" annotation (Dialog(group="PSS Parameters"));
  parameter OpenIPSL.Types.PerUnit vsmin=-0.2 "Min stabilizer output signal" annotation (Dialog(group="PSS Parameters"));
  parameter Real Kw=Kw "Stabilizer gain [pu/pu]" annotation (Dialog(group="PSS Parameters"));
  parameter OpenIPSL.Types.Time Tw=Tw "Wash-out time constant" annotation (Dialog(group="PSS Parameters"));
  parameter OpenIPSL.Types.Time T1=T1 "First stabilizer time constant" annotation (Dialog(group="PSS Parameters"));
  parameter OpenIPSL.Types.Time T2=T2 "Second stabilizer time constant" annotation (Dialog(group="PSS Parameters"));
  parameter OpenIPSL.Types.Time T3=T3 "Third stabilizer time constant" annotation (Dialog(group="PSS Parameters"));
  parameter OpenIPSL.Types.Time T4=T4 "Fourth stabilizer time constant" annotation (Dialog(group="PSS Parameters"));
  Modelica.Blocks.Interfaces.RealInput uVsAVR "Feedback input" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-170,-40}),
                          iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-170,-40})));
  Modelica.Blocks.Math.Feedback feedbackInputPm
    annotation (Placement(transformation(extent={{-140,50},{-120,30}})));
  Modelica.Blocks.Interfaces.RealOutput AVRinput_meas annotation (Placement(
        transformation(extent={{150,48},{170,68}}),  iconTransformation(extent={{150,48},
            {170,68}})));
  Modelica.Blocks.Interfaces.RealOutput AVRoutput_meas annotation (Placement(
        transformation(extent={{150,-110},{170,-90}}), iconTransformation(
          extent={{150,-110},{170,-90}})));
  Modelica.Blocks.Math.Gain avrInputGain(k=1)  annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-70,-26})));
  Modelica.Blocks.Sources.RealExpression realExpressionForAVRinput_meas(y=sumPSSy_u_r.y) annotation (Placement(transformation(extent={{60,52},{78,68}})));
  Modelica.Blocks.Sources.RealExpression realExpressionForPmech0(y=g1.PMECH0)
    annotation (Placement(transformation(
        extent={{-8,-6},{8,6}},
        rotation=180,
        origin={-92,60})));
  Modelica.Blocks.Sources.RealExpression realExpressionForAVRoutput_meas(y=sEXS.EFD)
    annotation (Placement(transformation(extent={{58,-98},{84,-82}})));
  Modelica.Blocks.Sources.RealExpression realExpressionForSPEED(y=g1.SPEED)
    annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={-110,-28})));
  parameter OpenIPSL.Types.PerUnit wref=0 "Reference speed"
    annotation (Dialog(group="Turbine and Governor Parameters"));
  parameter OpenIPSL.Types.PerUnit pmax0=1 "Maximum turbine output"
    annotation (Dialog(group="Turbine and Governor Parameters"));
  parameter OpenIPSL.Types.PerUnit pmin0=0 "Minimum turbine output"
    annotation (Dialog(group="Turbine and Governor Parameters"));
  parameter OpenIPSL.Types.Time Ts=2.0 "Governor Time constant"
    annotation (Dialog(group="Turbine and Governor Parameters"));
  parameter OpenIPSL.Types.Time T3g=6.0 "Transient gain time constant"
    annotation (Dialog(group="Turbine and Governor Parameters"));
  parameter OpenIPSL.Types.ApparentPower Snbgov=900000000 "Nominal power"
    annotation (Dialog(group="Turbine and Governor Parameters"));
  OpenIPSL.Electrical.Controls.PSAT.TG.TGTypeII tGTypeII(
    wref=wref,
    R=Rdroop,
    pmax0=pmax0,
    pmin0=pmin0,
    Ts=Ts,
    T3=T3gov,
    S_b=SysData.S_b,
    Sn=900000000)
    annotation (Placement(transformation(extent={{-42,10},{-22,30}})));
  Modelica.Blocks.Sources.RealExpression realExpressionForGovSpeed(y=g1.SPEED)
    annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={-70,20})));
  parameter OpenIPSL.Types.PerUnit Rdroop=0.025 "Droop"
                                                       annotation (Dialog(group="Turbine and Governor Parameters"));

  parameter OpenIPSL.Types.Time T3gov=6.0 "Transient gain time constant";
equation
  connect(feedbackInputPSS.y, pss.vSI) annotation (Line(points={{-121,0},{-112,0}}, color={0,0,127}));
  connect(feedbackInputPSS.u1, uPSS)
    annotation (Line(points={{-138,0},{-170,0}},     color={0,0,127}));
  connect(pss.vs, sumPSSy_u_r.u1) annotation (Line(points={{-89,0},{-78,0}}, color={0,0,127}));
  connect(pssInputGain.y, feedbackInputPSS.u2) annotation (Line(points={{-130,
          -13.6},{-130,-8}},      color={0,0,127}));
  connect(feedbackInputPm.u1, uPm)
    annotation (Line(points={{-138,40},{-170,40}}, color={0,0,127}));
  connect(pmInputGain.y, feedbackInputPm.u2) annotation (Line(points={{-122.6,
          60},{-130,60},{-130,48}}, color={0,0,127}));
  connect(avrInputGain.y, sumPSSy_u_r.u2) annotation (Line(points={{-70,-19.4},{-70,-8}}, color={0,0,127}));
  connect(avrInputGain.u, uVsAVR) annotation (Line(points={{-70,-33.2},{-70,-40},
          {-170,-40}},       color={0,0,127}));
  connect(sumPSSy_u_r.y, sEXS.VOTHSG) annotation (Line(points={{-61,0},{-34,0},{-34,-8},{-5,-8}}, color={0,0,127}));
  connect(realExpressionForAVRinput_meas.y, AVRinput_meas) annotation (Line(
        points={{78.9,60},{120,60},{120,58},{160,58}}, color={0,0,127}));
  connect(realExpressionForAVRoutput_meas.y, AVRoutput_meas) annotation (Line(
        points={{85.3,-90},{122,-90},{122,-100},{160,-100}}, color={0,0,127}));
  connect(realExpressionForPmech0.y, pmInputGain.u)
    annotation (Line(points={{-100.8,60},{-108.8,60}}, color={0,0,127}));
  connect(realExpressionForSPEED.y, pssInputGain.u) annotation (Line(points={{
          -118.8,-28},{-130,-28},{-130,-22.8}}, color={0,0,127}));
  connect(tGTypeII.pm, g1.PMECH)
    annotation (Line(points={{-21,20},{18,20},{18,12},{28,12}},
                                               color={0,0,127}));
  connect(tGTypeII.pm0, feedbackInputPm.y)
    annotation (Line(points={{-32,32},{-32,40},{-121,40}}, color={0,0,127}));
  connect(realExpressionForGovSpeed.y, tGTypeII.w) annotation (Line(
      points={{-61.2,20},{-44,20}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  annotation ( preferredView = diagram,Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(points={{-160,40},{-134,40}}, color={108,88,49}),
        Line(points={{-160,0},{-140,0}}, color={108,88,49}),
        Line(points={{-160,-40},{-134,-40}}, color={108,88,49})}),
                                                                 Diagram(
        coordinateSystem(extent={{-160,-100},{140,80}})));
end G1_AVRPSSGov_IO;
