within Example1.Base.Systems.Tests;
model testgridIO
  "gridIO special test model, made by stripping the interfaces manually after the model was verified to work with the interfaces."
  extends Base.Networks.BasePFnFault(
    pf(
      redeclare record Bus = PFData.Data.BusData.PF_Bus_10,
      redeclare record Loads = PFData.Data.LoadData.PF_Loads_10,
      redeclare record Trafos = PFData.Data.TrafoData.PF_Trafos_10,
      redeclare record Machines = PFData.Data.MachineData.PF_Machines_10),
    line_1(
      R=Modelica.Constants.eps,
           X=3.25,
      G=Modelica.Constants.eps,
      B=Modelica.Constants.eps),
    line_2(t1=Modelica.Constants.inf),
    fault(
      R=Modelica.Constants.eps,
          t1=Modelica.Constants.inf, t2=Modelica.Constants.inf));
  import Modelica.Constants.pi;
  Plants.GenIO G1(
    P_0=pf.machines.PG1,
    Q_0=pf.machines.QG1,
    v_0=pf.bus.V1,
    angle_0=pf.bus.A1,
    Kw=Kw,
    Tw=Tw,
    T1=T1,
    T2=T2,
    T3=T3,
    T4=T4,
    vfmax=vfmax,
    vfmin=vfmin,
    K0=K0) annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

  OpenIPSL.Electrical.Branches.PwLine line_4(
    R=Modelica.Constants.eps,
    G=Modelica.Constants.eps,
    B=Modelica.Constants.eps,
    X=3.25/5.5,
    t1=t1,
    t2=t2,
    opening=opening)
           annotation (Placement(transformation(extent={{22,2},{40,14}})));
  parameter Modelica.Units.SI.Time t1=Modelica.Constants.inf
    "Time of line removal" annotation (Dialog(group="Line Removal Parameters"));
  parameter Modelica.Units.SI.Time t2=Modelica.Constants.inf
    "Line re-insertion time"
    annotation (Dialog(group="Line Removal Parameters"));
  parameter Integer opening=1
    "Type of opening (1: removes both ends at same time, 2: removes sending end, 3: removes receiving end)"     annotation (Dialog(group="Line Removal Parameters"));
  parameter Real Kw=9.5 "Stabilizer gain (pu/pu)" annotation (Dialog(group="PSS"));
  parameter Real Tw=1.41 "Wash-out time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real T1=0 "First stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real T2=0 "Second stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real T3=0 "Third stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real T4=0 "Fourth stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real vfmax=7.0 "max lim." annotation (Dialog(group="AVR"));
  parameter Real vfmin=-6.40 "min lim." annotation (Dialog(group="AVR"));
  parameter Real K0=200 "regulator gain" annotation (Dialog(group="AVR"));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-152,-8},{-132,12}})));
  extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.Pulse    pulse(
    amplitude=0.01,
    width=50,
    period=0.1,
    nperiod=1,
    startTime=5)
    annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
protected
  parameter Real S_b=SysData.S_b;
equation
//   w = G1.machine.w;
//   delta = G1.machine.delta;
//   Vt = G1.machine.v;
//   P = G1.machine.P;
//   Q = G1.machine.Q;
//   AVRin = G1.feedbackAVR.y; // AVR input, error signal to the avr
//   AVRout = G1.avr.vf; // AVR output, Efd
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-89,0},{-80,0}}, color={0,0,255}));
  connect(line_4.n, line_1.n)
    annotation (Line(points={{39.1,8},{39.1,20}}, color={0,0,255}));
  connect(line_4.p, line_1.p)
    annotation (Line(points={{22.9,8},{22.9,20}}, color={0,0,255}));
  connect(const.y, G1.uPSS) annotation (Line(points={{-131,2},{-120,2},{-120,6},
          {-112,6}}, color={0,0,127}));
  connect(G1.upm, const.y) annotation (Line(points={{-112,-6},{-118,-6},{-118,2},
          {-131,2}}, color={0,0,127}));
  connect(G1.uvsAVR, const.y) annotation (Line(points={{-100,-12},{-110,-12},{-110,
          -2},{-131,-2},{-131,2}}, color={0,0,127}));
  connect(pulse.y, load.u) annotation (Line(points={{1,-70},{12,-70},{12,-66.7},
          {17.14,-66.7}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,200}}), graphics={
          Rectangle(
          extent={{12,28},{54,2}},
          lineColor={238,46,47},
          fillColor={244,125,35},
          fillPattern=FillPattern.None,
          lineThickness=1)}),
    Icon(coordinateSystem(extent={{-200,-200},{200,200}}), graphics={Rectangle(
          extent={{-200,200},{200,100}},
          lineColor={28,108,200},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-200,200},{200,100}},
          textColor={28,108,200},
          textString="gridIO")}),
              experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end testgridIO;
