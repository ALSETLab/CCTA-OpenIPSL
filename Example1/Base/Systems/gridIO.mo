within Example1.Base.Systems;
model gridIO
  "Power grid model with input/output interfaces and modifications for simulation and linearization"
  extends Base.Networks.BasePFnFault(
    pf(
      redeclare record Bus = Bus,
      redeclare record Loads = Loads,
      redeclare record Trafos = Trafos,
      redeclare record Machines = Machines),
    line_1(
      R=Modelica.Constants.eps,
           X=3.25,
      G=Modelica.Constants.eps,
      B=Modelica.Constants.eps),
    line_2(t1=Modelica.Constants.inf),
    fault(
      R=Rfault,
      X=Xfault,
      t1=t1fault,
      t2=t2fault));
  extends Example1.Interfaces.OutputsInterfaceWEfdAndAVRout;
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
  Modelica.Blocks.Interfaces.RealInput uPSS
    annotation (Placement(transformation(extent={{-240,160},{-200,200}}),
        iconTransformation(extent={{-240,160},{-200,200}})));
  Modelica.Blocks.Interfaces.RealInput uPm
    annotation (Placement(transformation(extent={{-242,40},{-202,80}}),
        iconTransformation(extent={{-242,40},{-202,80}})));
  Modelica.Blocks.Interfaces.RealInput uPload annotation (Placement(
        transformation(extent={{-240,-80},{-200,-40}}),
        iconTransformation(extent={{-240,-80},{-200,-40}})));

  OpenIPSL.Electrical.Branches.PwLine line_4(
    R=Modelica.Constants.eps,
    G=Modelica.Constants.eps,
    B=Modelica.Constants.eps,
    X=3.25/5.5,
    t1=t1,
    t2=t2,
    opening=opening)
           annotation (Placement(transformation(extent={{22,2},{40,14}})));
  parameter Modelica.Units.SI.Time t1=0.5
    "Time of line removal" annotation (Dialog(group="Line Removal Parameters"));
  parameter Modelica.Units.SI.Time t2=0.57
    "Line re-insertion time"
    annotation (Dialog(group="Line Removal Parameters"));
  parameter Integer opening=1
    "Type of opening (1: removes both ends at same time, 2: removes sending end, 3: removes receiving end)"     annotation (Dialog(group="Line Removal Parameters"));
  parameter OpenIPSL.Types.Time t1fault=Modelica.Constants.inf
    "Start time of the fault" annotation (Dialog(group="Fault Parameters"));
  parameter OpenIPSL.Types.Time t2fault=Modelica.Constants.inf
    "End time of the fault" annotation (Dialog(group="Fault Parameters"));
  parameter OpenIPSL.Types.PerUnit Rfault=Modelica.Constants.eps "Resistance"
    annotation (Dialog(group="Fault Parameters"));
  parameter OpenIPSL.Types.PerUnit Xfault=1e-5 "Reactance"
    annotation (Dialog(group="Fault Parameters"));
  parameter Real Kw=9.5 "Stabilizer gain (pu/pu)" annotation (Dialog(group="PSS"));
  parameter Real Tw=1.41 "Wash-out time constant (s)" annotation (Dialog(group="PSS"));
  Modelica.Blocks.Interfaces.RealInput uvs annotation (Placement(
        transformation(extent={{-240,-200},{-200,-160}}), iconTransformation(
          extent={{-240,-200},{-200,-160}})));
  parameter Real T1=0 "First stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real T2=0 "Second stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real T3=0 "Third stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real T4=0 "Fourth stabilizer time constant (s)" annotation (Dialog(group="PSS"));
  parameter Real vfmax=7.0 "max lim." annotation (Dialog(group="AVR"));
  parameter Real vfmin=-6.40 "min lim." annotation (Dialog(group="AVR"));
  parameter Real K0=200 "regulator gain" annotation (Dialog(group="AVR"));
  replaceable record Bus = PFData.Data.BusData.PF_Bus_10 constrainedby
    PFData.Data.BusData.Bus_Template annotation (choicesAllMatching=true, Dialog(group="Power Flow Data", tab="Power Flow Scenario"));
  replaceable record Loads = PFData.Data.LoadData.PF_Loads_10 constrainedby
    PFData.Data.LoadData.Loads_Template annotation (choicesAllMatching=true, Dialog(group="Power Flow Data", tab="Power Flow Scenario"));
  replaceable record Trafos = PFData.Data.TrafoData.PF_Trafos_10 constrainedby
    PFData.Data.TrafoData.Trafos_Template annotation (choicesAllMatching=true, Dialog(group="Power Flow Data", tab="Power Flow Scenario"));
  replaceable record Machines = PFData.Data.MachineData.PF_Machines_10
    constrainedby PFData.Data.MachineData.Machines_Template annotation (
      choicesAllMatching=true, Dialog(group="Power Flow Data", tab="Power Flow Scenario"));
equation
  w = G1.machine.w;
  delta = G1.machine.delta;
  Vt = G1.machine.v;
  P = G1.machine.P;
  Q = G1.machine.Q;
  AVRin = G1.feedbackAVR.y; // AVR input, error signal to the avr
  AVRout = G1.avr.vf; // AVR output, Efd
  connect(load.u, uPload) annotation (Line(points={{17.14,-66.7},{-22,-66.7},{-22,
          -60},{-220,-60}}, color={0,0,127}));
  connect(G1.uPSS, uPSS) annotation (Line(points={{-112,6},{-122,6},{-122,180},{
          -220,180}},
                color={0,0,127}));
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-89,0},{-80,0}}, color={0,0,255}));
  connect(line_4.n, line_1.n)
    annotation (Line(points={{39.1,8},{39.1,20}}, color={0,0,255}));
  connect(line_4.p, line_1.p)
    annotation (Line(points={{22.9,8},{22.9,20}}, color={0,0,255}));
  connect(G1.upm, uPm) annotation (Line(points={{-112,-6},{-136,-6},{-136,60},{-222,
          60}},           color={0,0,127}));
  connect(G1.uvsAVR, uvs) annotation (Line(points={{-100,-12},{-100,-180},{-220,
          -180}},       color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,200}}), graphics={
          Rectangle(
          extent={{12,28},{54,2}},
          lineColor={238,46,47},
          fillColor={244,125,35},
          fillPattern=FillPattern.None,
          lineThickness=1)}),
    Icon(coordinateSystem(extent={{-200,-200},{200,200}}), graphics={Rectangle(
          extent={{-200,-200},{200,200}},
          lineColor={28,108,200},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-200,82},{200,-80}},
          textColor={28,108,200},
          textString="%name")}),
    experiment(
      StopTime=20,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
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
end gridIO;
