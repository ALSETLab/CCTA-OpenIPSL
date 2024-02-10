within Example1.Base.Networks;
partial model BaseWithPF "Partial SMIB Model with power flow data, system data block and a load."
  extends Base(
    B2(v_0=pf.bus.V2, angle_0=pf.bus.A2),
    B1(v_0=pf.bus.V1, angle_0=pf.bus.A1),
    B3(v_0=pf.bus.V3, angle_0=pf.bus.A3),
    B4(v_0=pf.bus.V4, angle_0=pf.bus.A4));
  OpenIPSL.Electrical.Loads.PSSE.Load_ExtInput load(
    v_0=pf.bus.V4,
    angle_0=pf.bus.A4,
    P_0=pf.loads.PL1,
    Q_0=pf.loads.QL1,
    d_P=Modelica.Constants.eps,
    t1=Modelica.Constants.inf,
    d_t=Modelica.Constants.eps)
    annotation (Placement(transformation(extent={{16,-76},{28,-64}})));
  Plants.inf inf(
    P_0=pf.machines.PG2,
    Q_0=pf.machines.QG2,
    v_0=pf.bus.V3,
    angle_0=pf.bus.A3) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={104,0})));
  PFData.PFScenarios pf "Specify power flow data to derive star values"
    annotation (Placement(transformation(extent={{80,-58},{100,-38}})),
      choicesAllMatching=true);
equation
  connect(load.p, line_2.n)
    annotation (Line(points={{22,-64},{22,-40},{15.1,-40}}, color={0,0,255}));
  connect(inf.pwPin, B3.p)
    annotation (Line(points={{93,0},{82,0}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>Extended model that contains power flow data, SysData and a load.</p>
</html>", preferredView = "diagram"));
end BaseWithPF;
