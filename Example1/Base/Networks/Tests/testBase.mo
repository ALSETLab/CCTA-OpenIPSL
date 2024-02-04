within Example1.Base.Networks.Tests;
model testBase "Tes model for Base network"
  extends Modelica.Icons.Example;
  extends Base(SysData(S_b=2220000000, fn=60));
  Plants.inf infiniteBus1(
    P_0=100000000,
    Q_0=25000000,
    v_0=1.5,
    angle_0=0.26179938779915) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-98,0})));
equation
  connect(infiniteBus1.pwPin, B1.p)
    annotation (Line(points={{-87,0},{-80,0}}, color={0,0,255}));
annotation(preferredView = "diagram");
end testBase;
