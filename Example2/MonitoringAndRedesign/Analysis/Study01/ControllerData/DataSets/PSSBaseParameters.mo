within Example2.MonitoringAndRedesign.Analysis.Study01.ControllerData.DataSets;
record PSSBaseParameters "Default parameters from Kundur's book"
  extends CntrlDataTemplate(
  vsmax = 0.2,
  vsmin = -0.2,
  Kw = 200,
  Tw = 10,
  T1 = 0.05,
  T2 = 0.02,
  T3 = 3.0,
  T4 = 5.4);
annotation(preferredView="text");

end PSSBaseParameters;
