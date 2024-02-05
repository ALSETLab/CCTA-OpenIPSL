within Example1.Analysis;
package LinearAnalysis
  package CustomComponents
      extends Modelica.Icons.VariantsPackage;

  end CustomComponents;

  package CustomFunctions
    extends Modelica.Icons.FunctionsPackage;
    function LinearizeAndCompare
      "Linearizes the model at initialization and after a disturbance at a given time"
      // See the Documentation for an explanation of the goals.
      // IMPORTING FUNCTIONS
      // Import things needed for the calculations
      import Modelica_LinearSystems2.StateSpace; // to create and manipulate state space objects
      // OUTPUTS OF THEFUNCTION - FOR DISPLAY
      // Declare outputs to display
      output Real A[:,:] "A-matrix";
      output Real B[:,:] "B-matrix";
      output Real C[:,:] "C-matrix";
      output Real D[:,:] "D-matrix";
      output String inputNames[:] "Modelica names of inputs";
      output String outputNames[:] "Modelica names of outputs";
      output String stateNames[:] "Modelica names of states";
      output Real y0out[:] "Initial value of the output variables";
      // INPUTS TO THE FUNCTION
      // Declare reconfigurable simulation parameters
      input Modelica.Units.SI.Time tlin=30.5 "t for model linearization";
      input Modelica.Units.SI.Time tsim=40 "Simulation time";
      input Real numberOfIntervalsin=10000 "No. of intervals";
      // Use this for Case A
      //input String method = "Rkfix4" "Solver";
      input String methodin = "DASSL" "Solver";
      input Real fixedstepsizein= 1e-6 "Time step - needed only for fixed time step solvers";
      //
      // DEFINING THE NONLINEAR PLANT, NONLINEAR EXPERIMENT, AND LINEAR EXPERIMENT MODELS
      //
      // 1) NONLINEAR PLANT:
      // This is the model that will be linearized, i.e. the nonlinear plant model
       input String pathToNonlinearPlantModel = "Example1.Analysis.LinearAnalysis.NonlinModel_for_Linearization" "Nonlinear plant model";
      //
      //
      // 2) NONLINEAR EXPERIMENT: this is a model which applies a change to the input of the nonlinear model.
      // It must match the nonlinar plant above.
      // This model will be simulated, and the simulation results will be compared to the simulation of the corresponding linearized model.
      input String pathToNonlinearExperiment= "Example1.Analysis.LinearAnalysis.NonlinModel_for_NonlinExperiment" "Nonlinear experiment model";
      //
      //
      // 3) LINEAR EXPERIMENT: this is a template that can be used for all three cases, so it is not necessary to create other cases here
      input String pathToLinearExperiment = "Example1.Analysis.LinearAnalysis.LinearModelGeneral";

    algorithm
      // Make sure DAE mode is off!
      Advanced.Define.DAEsolver := false;
      Modelica.Utilities.Streams.print("DAE Mode is turned off.");
      Advanced.Define.GlobalOptimizations :=0;
      Modelica.Utilities.Streams.print("Global optimization is disabled.");
      Advanced.SparseActivate :=false;
      Advanced.Translation.SparseActivateIntegrator :=false;
      Advanced.Translation.SparseActivateSystems :=false;
      Modelica.Utilities.Streams.print("Sparse options disabled.");
      // Start the linearization process
      Modelica.Utilities.Streams.print("Linearization and Nonlinear Model Comparison is starting...");
      // Compute and display the ABCD matrices, etc
      (A,B,C,D,inputNames,outputNames,stateNames) :=
        Modelica_LinearSystems2.Utilities.Import.linearize(
        pathToNonlinearPlantModel,tlin);
      // LINEARIZE plant model at t_lin
      // This is the same as above, however, it stores it in a StateSpace object
      ss := Modelica_LinearSystems2.ModelAnalysis.Linearize(
        pathToNonlinearPlantModel, simulationSetup=
        Modelica_LinearSystems2.Records.SimulationOptionsForLinearization(
        linearizeAtInitial=false, t_linearize=tlin));
    //  // PRINT linear system
    //  Modelica.Utilities.Streams.print(String(ss));
      // SAVE the data in a mat file
      DataFiles.writeMATmatrix(
        "MyData.mat",
        "ABCD",
        [ss.A, ss.B; ss.C, ss.D],
        append=false);
      nx := size(ss.A, 1);
      DataFiles.writeMATmatrix(
        "MyData.mat",
        "nx",
        [nx],
        append=true);
      Modelica.Utilities.Streams.print("Simulating nonlinear model");
      simulateModel(
        pathToNonlinearExperiment,
        stopTime=tsim,
        numberOfIntervals=numberOfIntervalsin, method = methodin, fixedstepsize=fixedstepsizein,
        resultFile="res_nl");

       simulateModel(
         pathToNonlinearExperiment,
         stopTime=tlin,
         numberOfIntervals=numberOfIntervalsin, method = methodin, fixedstepsize=fixedstepsizein,
         resultFile="res_nl_beforedist");
        ny := size(ss.C, 1);
        ylen :=DymolaCommands.Trajectories.readTrajectorySize("res_nl_beforedist.mat");
        y0 := DymolaCommands.Trajectories.readTrajectory(
          "res_nl_beforedist.mat",
          {ss.yNames[i] for i in 1:ny},
          DymolaCommands.Trajectories.readTrajectorySize("res_nl_beforedist.mat"));
        DataFiles.writeMATmatrix(
          "MyData.mat",
          "y0_beforedist",
          [y0[1:ny,ylen-100]],
          append=true);

      // Print y0's first values which is needed for the linear response model
      y0out := y0[1:ny,ylen]; // we only want the elements at ylen
      Modelica.Utilities.Streams.print("y0 before disturbance =");
      Modelica.Math.Vectors.toString(y0out);
      //
      // We now simulate the linear model, which requires y0
      Modelica.Utilities.Streams.print("Simulating linear model");
      simulateModel(
        pathToLinearExperiment,
        stopTime=tsim,
        numberOfIntervals=numberOfIntervalsin, method = methodin, fixedstepsize=fixedstepsizein,
        resultFile="res_lin");
        // Plot
    removePlots(true);
    createPlot(id=1, position={-2, 1, 584, 782}, y={"Vt"}, range={0.0, 20.0, 0.998, 1.002}, grid=true, filename="res_nl.mat", colors={{28,108,200}}, displayUnits={"1"});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"Q"}, range={0.0, 20.0, 0.18, 0.21}, grid=true, subPlot=102, colors={{28,108,200}}, displayUnits={"1"});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"P"}, range={0.0, 20.0, 0.86, 0.94}, grid=true, subPlot=103, colors={{28,108,200}}, displayUnits={"1"});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"w"}, range={0.0, 20.0, 0.9996, 1.0004}, grid=true, subPlot=104, colors={{28,108,200}}, displayUnits={"1"});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"delta"}, range={0.0, 20.0, 1.27, 1.3}, grid=true, subPlot=105, colors={{28,108,200}}, displayUnits={"rad"});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"Vt"}, range={0.0, 20.0, 0.998, 1.002}, erase=false, grid=true, filename="res_lin.mat", colors={{238,46,47}});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"Q"}, range={0.0, 20.0, 0.18, 0.21}, erase=false, grid=true, subPlot=102, colors={{238,46,47}});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"P"}, range={0.0, 20.0, 0.86, 0.94}, erase=false, grid=true, subPlot=103, colors={{238,46,47}});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"w"}, range={0.0, 20.0, 0.9996, 1.0004}, erase=false, grid=true, subPlot=104, colors={{238,46,47}});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"delta"}, range={0.0, 20.0, 1.27, 1.3}, erase=false, grid=true, subPlot=105, colors={{238,46,47}});

      annotation(__Dymola_interactive=true, Documentation(info="<html>
<p>This function can linearize the model at two different times, initialization or at a user provided time.</p>
<p>Once the model is linearized, linear model and the nonlinear models are simulated.</p>
<p>The response of both models is compared to check the quality of the linear model.</p>
</html>"));
    end LinearizeAndCompare;

    function LinearizeSimple
      // Import things needed for the calculations
      import Modelica_LinearSystems2.StateSpace; // to create and manipulate state space objects
      // Declare outputs to display
      output Real A[:,:] "A-matrix";
      output Real B[:,:] "B-matrix";
      output Real C[:,:] "C-matrix";
      output Real D[:,:] "D-matrix";
      output String inputNames[:] "Modelica names of inputs";
      output String outputNames[:] "Modelica names of outputs";
      output String stateNames[:] "Modelica names of states";
      // Declare reconfigurable inputs
      input Modelica.Units.SI.Time tlin=40 "t for model linearization";
      input Modelica.Units.SI.Time tsim=40 "Simulation time";
      input String pathToNonlinearPlantModel = "Example1.Analysis.LinearAnalysis.NonlinModel_for_Linearization";
      input String pathToNonlinearExperiment = "Example1.Analysis.LinearAnalysis.NonlinModel_for_NonlinExperiment";
    algorithm
      // Make sure DAE mode is off!
      Advanced.Define.DAEsolver := false;
      Modelica.Utilities.Streams.print("DAE Mode is turned off.");
      Advanced.Define.GlobalOptimizations :=0;
      Modelica.Utilities.Streams.print("Global optimization is disabled.");
      Advanced.SparseActivate :=false;
      Advanced.Translation.SparseActivateIntegrator :=false;
      Advanced.Translation.SparseActivateSystems :=false;
      Modelica.Utilities.Streams.print("Sparse options disabled.");
      // Start the linearization process
      Modelica.Utilities.Streams.print("Linearization and Nonlinear Model Comparison is starting...");
      // Compute and display the ABCD matrices, etc
      Modelica.Utilities.Streams.print("Linearized Model");
      (A,B,C,D,inputNames,outputNames,stateNames) :=
        Modelica_LinearSystems2.Utilities.Import.linearize(
        pathToNonlinearPlantModel,tlin);
      nx := size(A, 1); //number of states
      Modelica.Utilities.Streams.print("Number of states: " + String(nx));
      // Now we want to extract the initial value of the outputs to use it in our
      // linear model response
      Modelica.Utilities.Streams.print("Simulating nonlinear model");
      simulateModel(
        pathToNonlinearExperiment,
        stopTime=tsim,
        numberOfIntervals=1000, tolerance = 1e-6,
        resultFile="res_nl");
       ylen :=DymolaCommands.Trajectories.readTrajectorySize("res_nl.mat");
       ny := size(C, 1);
       y0 := DymolaCommands.Trajectories.readTrajectory(
         "res_nl.mat",
         {outputNames[i] for i in 1:ny},
         DymolaCommands.Trajectories.readTrajectorySize("res_nl.mat"));
       DataFiles.writeMATmatrix(
         "MyData.mat",
         "y0",
         [y0[1:ny,ylen]],
         append=true);
      // Print y0's last values which is needed for the linear response model
      y0out := y0[:,ylen]; // we only want the last few elements
      Modelica.Utilities.Streams.print("y0 = ");
      Modelica.Math.Vectors.toString(y0out,name="y0 = ",significantDigits=24);
      annotation(__Dymola_interactive=true, Documentation(info="<html>
<p>This function linearizes the non-linear model and results are displayed in the Commands Window.</p>
</html>"));
    end LinearizeSimple;
  end CustomFunctions;

  model NonlinModel_for_Linearization
    extends Modelica.Icons.Example;
    Modelica.Blocks.Interfaces.RealOutput Vt
      annotation (Placement(transformation(extent={{100,70},{120,90}}),
          iconTransformation(extent={{100,70},{120,90}})));
  public
    Modelica.Blocks.Interfaces.RealOutput Q
      annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealOutput P
      annotation (Placement(transformation(extent={{100,30},{120,50}}),
          iconTransformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput w
      annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
          iconTransformation(extent={{100,-50},{120,-30}})));
    Modelica.Blocks.Interfaces.RealOutput delta
      annotation (Placement(transformation(extent={{100,-90},{120,-70}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealInput uPSS
      annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
    Modelica.Blocks.Interfaces.RealInput uPm
      annotation (Placement(transformation(extent={{-140,0},{-100,40}})));
    Modelica.Blocks.Interfaces.RealInput uPload annotation (Placement(
          transformation(extent={{-140,-40},{-100,0}})));
    Example1.Base.Systems.gridIO Plant(t1=0.5, opening=2)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));

    Modelica.Blocks.Interfaces.RealInput uvsAVR annotation (Placement(
          transformation(extent={{-140,-100},{-100,-60}})));
    Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
          transformation(extent={{100,-110},{120,-90}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
          transformation(extent={{100,-130},{120,-110}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
  equation
    connect(Plant.Vt, Vt) annotation (Line(points={{42,32},{72.4286,32},{
            72.4286,80},{110,80}},  color={0,0,127}));
    connect(Plant.P, P) annotation (Line(points={{42,24},{86,24},{86,40},{110,
            40}},      color={0,0,127}));
    connect(Q, Plant.Q) annotation (Line(points={{110,0},{76,0},{76,16},{42,16}},
                         color={0,0,127}));
    connect(w, Plant.w) annotation (Line(points={{110,-40},{84,-40},{84,0},{42,
            0}},          color={0,0,127}));
    connect(delta, Plant.delta) annotation (Line(points={{110,-80},{68,-80},{68,
            -16},{42,-16}},         color={0,0,127}));
    connect(Plant.uvs, uvsAVR) annotation (Line(points={{-44,-36},{-77.5714,-36},
            {-77.5714,-80},{-120,-80}},               color={0,0,127}));
    connect(Plant.uPload, uPload) annotation (Line(points={{-44,-12},{-78.8572,
            -12},{-78.8572,-20},{-120,-20}},          color={0,0,127}));
    connect(Plant.uPm, uPm) annotation (Line(points={{-44.4,12},{-77.8572,12},{
            -77.8572,20},{-120,20}},      color={0,0,127}));
    connect(Plant.uPSS, uPSS) annotation (Line(points={{-44,36},{-76.8572,36},{
            -76.8572,80},{-120,80}},               color={0,0,127}));
    connect(Plant.AVRin, AVRin) annotation (Line(points={{42,-24},{62,-24},{62,
            -100},{110,-100}},          color={0,0,127}));
    connect(AVRout, Plant.AVRout) annotation (Line(points={{110,-120},{50,-120},
            {50,-32},{42,-32}},                color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},
              {100,100}})));
  end NonlinModel_for_Linearization;

  model NonlinModel_for_NonlinExperiment
    extends Modelica.Icons.Example;
    Modelica.Blocks.Interfaces.RealOutput Vt
      annotation (Placement(transformation(extent={{100,70},{120,90}}),
          iconTransformation(extent={{100,70},{120,90}})));
  public
    Modelica.Blocks.Interfaces.RealOutput Q
      annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealOutput P
      annotation (Placement(transformation(extent={{100,30},{120,50}}),
          iconTransformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput w
      annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
          iconTransformation(extent={{100,-50},{120,-30}})));
    Modelica.Blocks.Interfaces.RealOutput delta
      annotation (Placement(transformation(extent={{100,-90},{120,-70}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Sources.Constant PSSchange(k=0)
      annotation (Placement(transformation(extent={{-100,36},{-80,56}})));
    Modelica.Blocks.Sources.Constant Pmchange(k=0)
      annotation (Placement(transformation(extent={{-100,6},{-80,26}})));
    Modelica.Blocks.Sources.Step     Ploadchange(
      height=0.1,
      offset=0,
      startTime=30.5)                                 annotation (Placement(
          transformation(extent={{-100,-26},{-80,-6}})));
    Example1.Base.Systems.gridIO Plant(t1=0.5, opening=1)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
    Modelica.Blocks.Sources.Constant AVRchange(k=0)
      annotation (Placement(transformation(extent={{-100,-64},{-80,-44}})));
    Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
          transformation(extent={{100,-110},{120,-90}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
          transformation(extent={{100,-130},{120,-110}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
  equation
    connect(Plant.uPSS, PSSchange.y) annotation (Line(points={{-44,36},{
            -62.8572,36},{-62.8572,46},{-79,46}}, color={0,0,127}));
    connect(Plant.uPm, Pmchange.y) annotation (Line(points={{-44.4,12},{-62,12},
            {-62,16},{-79,16}},         color={0,0,127}));
    connect(Plant.uPload, Ploadchange.y) annotation (Line(points={{-44,-12},{
            -62.8572,-12},{-62.8572,-16},{-79,-16}},       color={0,0,127}));
    connect(Plant.Vt, Vt) annotation (Line(points={{42,32},{72.4286,32},{
            72.4286,80},{110,80}},  color={0,0,127}));
    connect(Plant.P, P) annotation (Line(points={{42,24},{73.4286,24},{73.4286,
            40},{110,40}},         color={0,0,127}));
    connect(Plant.Q, Q) annotation (Line(points={{42,16},{76,16},{76,0},{110,0}},
                     color={0,0,127}));
    connect(Plant.w, w) annotation (Line(points={{42,0},{73.4286,0},{73.4286,
            -40},{110,-40}},         color={0,0,127}));
    connect(Plant.delta, delta) annotation (Line(points={{42,-16},{72.4286,-16},
            {72.4286,-80},{110,-80}},              color={0,0,127}));
    connect(AVRchange.y, Plant.uvs) annotation (Line(points={{-79,-54},{-64,-54},
            {-64,-36},{-44,-36}},           color={0,0,127}));
    connect(AVRin, Plant.AVRin) annotation (Line(points={{110,-100},{62,-100},{
            62,-24},{42,-24}},       color={0,0,127}));
    connect(AVRout, Plant.AVRout) annotation (Line(points={{110,-120},{52,-120},
            {52,-32},{42,-32}},                color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},
              {100,100}})),
      experiment(
        StopTime=40,
        __Dymola_NumberOfIntervals=10000,
        Tolerance=1e-06,
        __Dymola_fixedstepsize=0.01,
        __Dymola_Algorithm="Dassl"));
  end NonlinModel_for_NonlinExperiment;

  model LinearModelGeneral
    "Simulate the linearized model obtained by running the function \"LinearizeAndCompare\"."
    extends Example1.Utilities.Icons.FunctionDependentExample;
    extends Example1.Interfaces.OutputsInterfaceWEfdAndAVRout;
    // The following definitions are very important to couple the linear model
    // to the linearization of the nonlinear model and the simulation
    parameter Real[:] y0=vector(DataFiles.readMATmatrix("MyData.mat", "y0_beforedist")) annotation (Evaluate=false);
    // The following has to be imported in order to be able to interpret and manipulate the StateSpace types
    import Modelica_LinearSystems2.StateSpace;
    parameter StateSpace ss=StateSpace.Import.fromFile("MyData.mat", "ABCD");
    parameter Integer ny=size(ss.C, 1);
    inner Modelica_LinearSystems2.Controller.SampleClock sampleClock
      annotation (Placement(transformation(extent={{60,60},{80,80}})));
    Modelica.Blocks.Routing.Multiplex4 multiplex4_2(n1=1, n2=1)
      annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
    Example1.CustomComponents.DeMultiplex7 demultiplex2_2
      annotation (Placement(transformation(extent={{48,-20},{88,20}})));
    Modelica.Blocks.Math.Add addy[ny]
      annotation (Placement(transformation(extent={{6,-16},{26,4}})));
    Modelica.Blocks.Sources.Constant Pmchange(k=0)
      annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
    Modelica.Blocks.Sources.Constant y0_initial[ny](k=y0)      annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-32})));
    Modelica_LinearSystems2.Controller.StateSpace stateSpace(system=ss)
      annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
    Modelica.Blocks.Sources.Constant PSSchange(k=0)
      annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
    Modelica.Blocks.Sources.Step     Ploadchange(
      height=0.1,
      offset=0,
      startTime=30.5)                                 annotation (Placement(
          transformation(extent={{-120,-40},{-100,-20}})));
    Modelica.Blocks.Sources.Constant AVRchange(k=0) annotation (Placement(
          transformation(extent={{-120,-70},{-100,-50}})));
  equation
    connect(addy.y, demultiplex2_2.u)
      annotation (Line(points={{27,-6},{28,-6},{28,0},{44,0}}, color={0,0,127}));
    connect(Pmchange.y,multiplex4_2. u2[1]) annotation (Line(points={{-99,0},
            {-92,0},{-92,3},{-78,3}},color={0,0,127}));
    connect(y0_initial.y, addy.u2)
      annotation (Line(points={{0,-21},{0,-12},{4,-12}}, color={0,0,127}));
    connect(multiplex4_2.y, stateSpace.u)
      annotation (Line(points={{-55,0},{-42,0}}, color={0,0,127}));
    connect(stateSpace.y, addy.u1)
      annotation (Line(points={{-19,0},{4,0}}, color={0,0,127}));
    connect(PSSchange.y,multiplex4_2. u1[1]) annotation (Line(points={{-99,30},
            {-92,30},{-92,9},{-78,9}},         color={0,0,127}));
    connect(Ploadchange.y,multiplex4_2. u3[1]) annotation (Line(points={{-99,-30},
            {-94,-30},{-94,-3},{-78,-3}},          color={0,0,127}));
    connect(AVRchange.y, multiplex4_2.u4[1]) annotation (Line(points={{
            -99,-60},{-90,-60},{-90,-9},{-78,-9}}, color={0,0,127}));
    connect(demultiplex2_2.y1[1], Vt) annotation (Line(points={{90,18},{98,18},
            {98,160},{210,160}},
                               color={0,0,127}));
    connect(demultiplex2_2.y2[1], Q) annotation (Line(points={{90,10.8},{132,
            10.8},{132,80},{210,80}},
                                    color={0,0,127}));
    connect(P, demultiplex2_2.y3[1]) annotation (Line(points={{210,120},{120,
            120},{120,3.6},{90,3.6}},color={0,0,127}));
    connect(w, demultiplex2_2.y4[1]) annotation (Line(points={{210,0},{130,0},{
            130,-3.6},{90,-3.6}},       color={0,0,127}));
    connect(delta, demultiplex2_2.y5[1]) annotation (Line(points={{210,-80},{
            118,-80},{118,-10.8},{90,-10.8}}, color={0,0,127}));
    connect(AVRin, demultiplex2_2.y6[1]) annotation (Line(points={{210,-120},{
            106,-120},{106,-18},{90,-18}},  color={0,0,127}));
    connect(AVRout, demultiplex2_2.y7[1]) annotation (Line(points={{210,-160},{
            98,-160},{98,-23.6},{90,-23.6}},  color={0,0,127}));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-160},{
              180,100}})),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-160},
              {140,100}}),                                 graphics={
          Text(
            extent={{-58,34},{-44,14}},
            lineColor={238,46,47},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={255,0,0},
            textString="du",
            fontSize=24),
          Text(
            extent={{-12,20},{-2,4}},
            lineColor={238,46,47},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={255,0,0},
            textString="dy",
            fontSize=24),
          Text(
            extent={{-38,-18},{-22,-38}},
            lineColor={238,46,47},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={255,0,0},
            textString="y0",
            fontSize=24),
          Text(
            extent={{40,20},{50,4}},
            lineColor={238,46,47},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={255,0,0},
            fontSize=24,
            textString="y"),
          Text(
            extent={{-80,80},{0,60}},
            lineColor={85,170,255},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={28,108,200},
            horizontalAlignment=TextAlignment.Left,
            textString="Note: the addy[] and y0_initial[] blocks 
are defined with ny, where ny is 
an integer of the size of the output matrix. 
This is visible in the Text layer only."),
          Text(
            extent={{-82,-52},{78,-72}},
            lineColor={85,170,255},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={28,108,200},
            horizontalAlignment=TextAlignment.Left,
            textString="Notice the change in the order of the outputs w.r.t. the nonlinear model.
They have to be rearranged based on the order provided by the linearization function."),
          Line(
            points={{-4,68},{24,48},{18,18}},
            color={0,0,255},
            thickness=0.5,
            arrow={Arrow.None,Arrow.Filled},
            smooth=Smooth.Bezier),
          Text(
            extent={{-100,-100},{84,-160}},
            lineColor={238,46,47},
            textString="Note: This model can only be run by excecuting the function \"LinearizeAndCompare\"
")}), experiment(
        StopTime=15,
        __Dymola_NumberOfIntervals=1000,
        __Dymola_Algorithm="Dassl"),
      Documentation(info="<html>
<p>DO NOT try to run this model on it&apos;s own! </p>
<p>Models with this icon will not simulate on their own, instead they work together with a function that populates certain parameters in the model and perform other operations.</p>
<p><br>See the associated function to run: &quot;LinearizeAndCompare&quot;.</p>
</html>"));
  end LinearModelGeneral;
end LinearAnalysis;
