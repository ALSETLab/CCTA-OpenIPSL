within Example1.Base.Networks;
partial model Base
  "Partial model containing basic network elements and SysData component"
  import Modelica.Constants.pi;
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transf(
    Sn=2220000000,
    V_b=400000,
    Vn=400000,
    rT=0.0,
    xT=0.15,
    m=1.0) annotation (Placement(transformation(extent={{-68,-10},{-48,10}})));
  OpenIPSL.Electrical.Branches.PwLine line_1(
    R=Modelica.Constants.eps,
    G=Modelica.Constants.eps,
    B=Modelica.Constants.eps,
    X=0.5) annotation (Placement(transformation(extent={{22,14},{40,26}})));
  OpenIPSL.Electrical.Branches.PwLine line_2(
    R=Modelica.Constants.eps,
    G=Modelica.Constants.eps,
    B=Modelica.Constants.eps,
    X=0.93/2)
    annotation (Placement(transformation(extent={{-2,-46},{16,-34}})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=2220000000,
                                                         fn=60)
    annotation (Placement(transformation(extent={{46,-84},{100,-64}})));
  OpenIPSL.Electrical.Branches.PwLine line_3(
    R=Modelica.Constants.eps,
    G=Modelica.Constants.eps,
    B=Modelica.Constants.eps,
    X=0.93/2,
    opening=1)
    annotation (Placement(transformation(extent={{44,-46},{62,-34}})));
  OpenIPSL.Electrical.Buses.Bus    B1(V_b=400)
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  OpenIPSL.Electrical.Buses.Bus    B2(
    V_b=400)
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-30,0})));
  OpenIPSL.Electrical.Buses.Bus    B3(V_b=400)
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={82,0})));
  OpenIPSL.Electrical.Buses.Bus    B4(
    V_b=400)
          annotation (Placement(transformation(extent={{18,-50},{38,-30}})));
equation
  connect(line_2.p, line_1.p) annotation (Line(points={{-1.1,-40},{-10,-40},
          {-10,20},{22.9,20}},
                         color={0,0,255}));
  connect(transf.n, B2.p)
    annotation (Line(points={{-47,0},{-30,0}}, color={0,0,255}));
  connect(B2.p, line_1.p) annotation (Line(points={{-30,0},{-10,0},{-10,20},
          {22.9,20}}, color={0,0,255}));
  connect(line_1.n, B3.p) annotation (Line(points={{39.1,20},{70,20},{70,0},
          {82,0},{82,4.44089e-16}}, color={0,0,255}));
  connect(line_3.n, B3.p) annotation (Line(points={{61.1,-40},{70,-40},{70,
          4.44089e-16},{82,4.44089e-16}}, color={0,0,255}));
  connect(B4.p, line_3.p)
    annotation (Line(points={{28,-40},{44.9,-40}}, color={0,0,255}));
  connect(B4.p, line_2.n)
    annotation (Line(points={{28,-40},{15.1,-40}}, color={0,0,255}));
  connect(B1.p, transf.p)
    annotation (Line(points={{-80,0},{-69,0}}, color={0,0,255}));
  annotation ( preferredView = "diagram",
    Diagram(coordinateSystem(extent={{-140,-100},{120,100}},
          preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-140,-100},{120,100}})),
    experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-006),
    Documentation(info="<html>
<p><br>Base network <span style=\"font-family: Courier New;\">partial</span> model, it includes the network components and a <span style=\"font-family: Courier New;\">SysData</span> component.</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\" width=\"100%\"><tr>
<td><p>Reference</p></td>
<td><p>SMIB with Reference to PSAT, d_kundur2.mdl, PSAT</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2024/2/28</p></td>
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
</html>"),preferredView = "diagram");
end Base;
