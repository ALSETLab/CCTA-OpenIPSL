within Example1.Base.Plants.Tests;
model testGen
  extends Modelica.Icons.Example;
  extends Example1.Base.Networks.BasePFnFault(
    fault(t1=Modelica.Constants.inf, t2=Modelica.Constants.inf),
    pf(
      redeclare record Bus = Example1.PFData.Data.BusData.PF_Bus_10,
      redeclare record Loads = Example1.PFData.Data.LoadData.PF_Loads_10,
      redeclare record Trafos = Example1.PFData.Data.TrafoData.PF_Trafos_10,
      redeclare record Machines =
          Example1.PFData.Data.MachineData.PF_Machines_10),
    line_1(X=3.25));
  Modelica.Blocks.Sources.Pulse    pulse(
    amplitude=0.01,
    width=50,
    period=0.1,
    nperiod=1,
    startTime=5)
    annotation (Placement(transformation(extent={{-14,-70},{-2,-58}})));
  Gen gen(
    P_0=pf.machines.PG1,
    Q_0=pf.machines.PG1,
    v_0=pf.bus.V1,
    angle_0=pf.bus.A1,
    Kw=12.6924,
    Tw=0.5602) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-98,0})));
  OpenIPSL.Electrical.Branches.PwLine line_4(
    R=Modelica.Constants.eps,
    G=Modelica.Constants.eps,
    B=Modelica.Constants.eps,
    X=3.25/5.5,
    t1=Modelica.Constants.inf,
    t2=Modelica.Constants.inf,
    opening=1)
           annotation (Placement(transformation(extent={{22,0},{40,12}})));
equation
  connect(pulse.y, load.u) annotation (Line(points={{-1.4,-64},{-1.4,-66.7},{
          17.14,-66.7}}, color={0,0,127}));
  connect(gen.pwPin, B1.p)
    annotation (Line(points={{-87,0},{-80,0}}, color={0,0,255}));

  connect(line_4.p, line_1.p) annotation (Line(points={{22.9,6},{14,6},{14,20},
          {22.9,20}}, color={0,0,255}));
  connect(line_4.n, B3.p) annotation (Line(points={{39.1,6},{46,6},{46,20},{70,
          20},{70,0},{82,0}}, color={0,0,255}));
  annotation (experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Dassl"),
           preferredView = "diagram",
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{
            120,100}})));
end testGen;
