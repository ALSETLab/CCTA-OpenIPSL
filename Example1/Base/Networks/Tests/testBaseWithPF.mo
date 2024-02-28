within Example1.Base.Networks.Tests;
model testBaseWithPF "Tes model for BaseWithPF network"
  extends Modelica.Icons.Example;
  extends BaseWithPF(inf(
      P_0=pf.machines.PG2,
      Q_0=pf.machines.QG2,
      v_0=pf.bus.V3,
      angle_0=pf.bus.A3), pf(
      redeclare record Bus = Example1.PFData.Data.BusData.PF_Bus_5,
      redeclare record Loads = Example1.PFData.Data.LoadData.PF_Loads_5,
      redeclare record Trafos = Example1.PFData.Data.TrafoData.PF_Trafos_5,
      redeclare record Machines =
          Example1.PFData.Data.MachineData.PF_Machines_5));
  Plants.inf infiniteBus1(
    P_0=pf.machines.PG1,
    Q_0=pf.machines.PG1,
    v_0=pf.bus.V1,
    angle_0=pf.bus.A1) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-98,0})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
equation
  connect(infiniteBus1.pwPin, B1.p)
    annotation (Line(points={{-87,0},{-80,0}}, color={0,0,255}));
  connect(const.y, load.u) annotation (Line(points={{1,-70},{12,-70},{12,-66.7},
          {17.14,-66.7}}, color={0,0,127}));
annotation(preferredView = "diagram", Documentation(info="<html>
<p>Tests <span style=\"font-family: Courier New;\">Example1.Base.Networks.BaseWithPF</span></p>
</html>"));
end testBaseWithPF;
