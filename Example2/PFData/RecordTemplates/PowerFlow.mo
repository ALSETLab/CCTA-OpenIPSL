within Example2.PFData.RecordTemplates;
record PowerFlow
  "Instantiable record containing the replaceable record with power flow results"
  extends Modelica.Icons.Record;

  replaceable record PowerFlow =
      PFData.RecordTemplates.PowerFlowTemplate constrainedby
    PFData.RecordTemplates.PowerFlowTemplate
    "Replaceable power flow record"
  annotation(choicesAllMatching=true);

PowerFlow powerflow;

end PowerFlow;
