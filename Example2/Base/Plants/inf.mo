within Example2.Base.Plants;
model inf "Infinite bus wrapper"
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Buses.InfiniteBus infinite_bus(v_0=v_0, angle_0=angle_0)
                           annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-2,0})));
equation
  connect(infinite_bus.p, pwPin)
    annotation (Line(points={{8,0},{110,0}}, color={0,0,255}));
end inf;
