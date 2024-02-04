within Example1.PFData.RecordTemplates;
record PowerFlow
  "Instantiable record containing the replaceable record with power flow results"
  extends Modelica.Icons.Record;

  replaceable record PowerFlow =
      Example1.PFData.RecordTemplates.PowerFlowTemplate constrainedby
    Example1.PFData.RecordTemplates.PowerFlowTemplate
    "Replaceable power flow record"
  annotation(choicesAllMatching=true);

PowerFlow powerflow;

end PowerFlow;
