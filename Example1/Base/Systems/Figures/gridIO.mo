within Example1.Base.Systems.Figures;
model gridIO "For figure only"
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
public
  Modelica.Blocks.Interfaces.RealOutput Vt
    annotation (Placement(transformation(extent={{-120,-60},{-100,-40}}),
        iconTransformation(extent={{200,150},{220,170}})));
  Modelica.Blocks.Interfaces.RealOutput P
    annotation (Placement(transformation(extent={{-100,-60},{-80,-40}}),
        iconTransformation(extent={{200,110},{220,130}})));
  Modelica.Blocks.Interfaces.RealOutput Q
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}}),
        iconTransformation(extent={{200,70},{220,90}})));
  Modelica.Blocks.Interfaces.RealOutput w
    annotation (Placement(transformation(extent={{-120,-80},{-100,-60}}),
        iconTransformation(extent={{200,-10},{220,10}})));
  Modelica.Blocks.Interfaces.RealOutput delta
    annotation (Placement(transformation(extent={{-100,-80},{-80,-60}}),
        iconTransformation(extent={{200,-90},{220,-70}})));
  Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
        transformation(extent={{-80,-80},{-60,-60}}),
        iconTransformation(extent={{200,-130},{220,-110}})));
  Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
        transformation(extent={{-60,-80},{-40,-60}}),
        iconTransformation(extent={{200,-170},{220,-150}})));
protected
  parameter Real S_b=SysData.S_b;
equation
  w = G1.machine.w;
  delta = G1.machine.delta;
  Vt = G1.machine.v;
  P = G1.machine.P;
  Q = G1.machine.Q;
  AVRin = G1.feedbackAVR.y; // AVR input, error signal to the avr
  AVRout = G1.avr.vf; // AVR output, Efd
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-89,0},{-80,0}}, color={0,0,255}));
  connect(line_4.n, line_1.n)
    annotation (Line(points={{39.1,8},{39.1,20}}, color={0,0,255}));
  connect(line_4.p, line_1.p)
    annotation (Line(points={{22.9,8},{22.9,20}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-140,-100},{120,50}}),  graphics={
          Rectangle(
          extent={{12,26},{54,0}},
          lineColor={238,46,47},
          fillColor={244,125,35},
          fillPattern=FillPattern.None,
          lineThickness=1),
                         Text(
          extent={{-132,-2},{-114,-8}},
          lineColor={0,0,117},
          textString="uPm"),
                         Text(
          extent={{-132,10},{-114,4}},
          lineColor={0,0,117},
          textString="uPSS"),
                         Text(
          extent={{-110,-14},{-92,-20}},
          lineColor={0,0,117},
          textString="uvs"),
                         Text(
          extent={{-4,-64},{14,-70}},
          lineColor={0,0,117},
          textString="uPload"),
        Rectangle(
          extent={{-126,-36},{-34,-80}},
          lineColor={28,108,200},
          fillColor={170,213,255},
          fillPattern=FillPattern.None),
                         Text(
          extent={{-58,-42},{-40,-48}},
          lineColor={129,174,225},
          textString="Outputs",
          textStyle={TextStyle.Bold}),
        Rectangle(
          extent={{-6,-62},{18,-72}},
          lineColor={0,140,72},
          fillColor={170,213,255},
          fillPattern=FillPattern.None),
                         Text(
          extent={{-4,-54},{14,-60}},
          lineColor={0,140,72},
          textStyle={TextStyle.Bold},
          textString="Input"),
        Rectangle(
          extent={{-132,12},{-110,-10}},
          lineColor={0,140,72},
          fillColor={170,213,255},
          fillPattern=FillPattern.None),
        Rectangle(
          extent={{-108,-10},{-92,-22}},
          lineColor={0,140,72},
          fillColor={170,213,255},
          fillPattern=FillPattern.None),
                         Text(
          extent={{-130,20},{-112,14}},
          lineColor={0,140,72},
          textStyle={TextStyle.Bold},
          textString="Inputs"),
                         Text(
          extent={{-108,-24},{-90,-30}},
          lineColor={0,140,72},
          textStyle={TextStyle.Bold},
          textString="Input"),
                         Text(
          extent={{-8,28},{10,22}},
          lineColor={238,46,47},
          textStyle={TextStyle.Bold},
          textString="Line Trip")}),
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
