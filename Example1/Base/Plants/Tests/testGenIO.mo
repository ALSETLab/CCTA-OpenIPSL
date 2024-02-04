within Example1.Base.Plants.Tests;
model testGenIO
  extends Modelica.Icons.Example;
  extends Example1.Base.Networks.BasePFnFault(fault(t1=Modelica.Constants.inf,
        t2=Modelica.Constants.inf), pf(
      redeclare record Bus = Example1.PFData.Data.BusData.PF_Bus_10,
      redeclare record Loads = Example1.PFData.Data.LoadData.PF_Loads_10,
      redeclare record Trafos = Example1.PFData.Data.TrafoData.PF_Trafos_10,
      redeclare record Machines =
          Example1.PFData.Data.MachineData.PF_Machines_10));
  Modelica.Blocks.Sources.Pulse    pulse(
    amplitude=0.01,
    width=50,
    period=0.1,
    nperiod=1,
    startTime=5)
    annotation (Placement(transformation(extent={{-14,-70},{-2,-58}})));
  GenIO gen(
    P_0=pf.machines.PG1,
    Q_0=pf.machines.PG1,
    v_0=pf.bus.V1,
    angle_0=pf.bus.A1,
    Kw=0,
    Tw=0) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-98,0})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-140,-4},{-120,16}})));
equation
  connect(pulse.y, load.u) annotation (Line(points={{-1.4,-64},{-1.4,-66.7},{
          17.14,-66.7}}, color={0,0,127}));
  connect(gen.pwPin, B1.p)
    annotation (Line(points={{-87,0},{-80,0}}, color={0,0,255}));

  connect(const.y, gen.uPSS)
    annotation (Line(points={{-119,6},{-110,6}}, color={0,0,127}));
  connect(gen.upm, const.y) annotation (Line(points={{-110,-6},{-116,-6},{-116,
          6},{-119,6}}, color={0,0,127}));
  connect(gen.uvsAVR, const.y) annotation (Line(points={{-98,-12},{-98,-18},{
          -116,-18},{-116,6},{-119,6}}, color={0,0,127}));
  annotation (experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Dassl"),
           preferredView = "diagram",
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{
            120,100}})));
end testGenIO;
