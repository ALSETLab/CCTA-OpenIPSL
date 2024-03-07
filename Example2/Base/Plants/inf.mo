within Example2.Base.Plants;
model inf
  "Infinite bus with generator interface to test the base network model under Example2.Base.Networks.Tests.TestBase"
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Buses.InfiniteBus infinite_bus(v_0=v_0, angle_0=angle_0)
                           annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-2,0})));
equation
  connect(infinite_bus.p, pwPin)
    annotation (Line(points={{8,0},{110,0}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>Infinite bus model containing the following components:</p>
<ul>
<li>Generator interface (wrapper): <span style=\"font-family: Courier New;\">OpenIPSL.Interfaces.Generator</span></li>
<li>Infinite bus model: <span style=\"font-family: Courier New;\">OpenIPSL.Electrical.Buses.InfiniteBus</span></li>
</ul>
<p><br><b>Note: </b>the model is not used in system simulations, but it is used for testing the base network using the example<span style=\"font-family: Courier New;\"> Example2.Base.Networks.Tests.TestBase </span></p>
</html>"));
end inf;
