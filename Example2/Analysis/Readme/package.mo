within Example2.Analysis;
package Readme "Recommended models for derivative work"
  extends Modelica.Icons.Information;
  annotation (Documentation(info="<html>
<p>The models in this layer of the package (i.e. <a href=\"modelica://Example2.Analysis\">Example2.Analysis</a>) are intended to reproduce the work in [1] and [2]. </p>
<p>However, for derivative works the models under the package <a href=\"modelica://Example2.Analysis.PFVariants\">Example2.Analysis.PFVariants</a> (and associated dependencies) are recommended, as they use OpenIPSL types which implement nominal attributes to help with the intialization process. See more information on this aspect under the information layer of <a href=\"modelica://Example2.PFData\">Example2.PFData</a>.</p>
<p>The main differences between the examples is:</p>
<ol>
<li>In the examples this layer of the package, <a href=\"
Example2.Analysis\">Example2.Analysis</a>, the power flow intial guess data is provided through the <b>records</b> in <a href=\"
Example2.Base.Systems.Basic.Data\">Example2.Base.Systems.Basic.Data</a>. To change the data, it is necessary to modify the base model in <a href=\"
Example2.Base.Systems.Basic.sys\">Example2.Base.Systems.Basic.sys</a> by changing the name of the record in the text layer. This is obviously inconvenient, but also as explained above, the types are generic and do not implement those of OpenIPSL.</li>
<li>In the examples within the sub-package, <a href=\"
Example2.Analysis.PFVariants\">Example2.Analysis.PFVariants</a>, the <b>hierarchical replaceable records</b> in <a href=\"
Example2.PFData\">Example2.PFData</a> are used. The data can then be modified at the top-layer of the model by selecting from the available data sets (and/or providing new ones in <a href=\"
Example2.PFData.Data\">Example2.PFData.Data</a>) by clicking on the &quot;Power Flow Scenario&quot; tab of the &quot;Plant&quot; (instantiation of <a href=\"modelica://Example2.Base.Systems.PFVariants.syspf\">syspf</a>), as the records have been propagated and configured for this purposes, as shown in the screenshot below.<br><img src=\"modelica://Example2/Resources/pfsys.png\"/></li>
</ol>
<p><br>It is important to note that even though the models in 1. and 2. above are identical in terms of their equations, the intialization will be different due to the use of the nominal attributes. Read more on this aspect under the information layer of <a href=\"modelica://Example2.PFData\">Example2.PFData</a>.</p>
</html>"),preferredView="info");
end Readme;
