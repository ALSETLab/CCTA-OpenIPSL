within Example2.MonitoringAndRedesign.Analysis.Study01.ControllerData.DataSets;
record PSSParamCase3_Kw0Tw0
  "Case 3, Kw=0 and Tw=0, a zero controller"
  extends CntrlDataTemplate(
  vsmax = 0.2,
  vsmin = -0.2,
  Kw = Modelica.Constants.small,
  Tw = Modelica.Constants.small,
  T1 = 0.0,
  T2 = 0.0,
  T3 = 0.0,
  T4 = 0.0);
annotation(preferredView="text");

end PSSParamCase3_Kw0Tw0;
