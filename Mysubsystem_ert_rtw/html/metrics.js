function CodeMetrics() {
	 this.metricsArray = {};
	 this.metricsArray.var = new Array();
	 this.metricsArray.fcn = new Array();
	 this.metricsArray.var["rtDW"] = {file: "F:\\3rd-CSE\\RST_PP_v2.fig\\Mysubsystem_ert_rtw\\Mysubsystem.c",
	size: 48};
	 this.metricsArray.var["rtM_"] = {file: "F:\\3rd-CSE\\RST_PP_v2.fig\\Mysubsystem_ert_rtw\\Mysubsystem.c",
	size: 4};
	 this.metricsArray.var["rtU"] = {file: "F:\\3rd-CSE\\RST_PP_v2.fig\\Mysubsystem_ert_rtw\\Mysubsystem.c",
	size: 16};
	 this.metricsArray.var["rtY"] = {file: "F:\\3rd-CSE\\RST_PP_v2.fig\\Mysubsystem_ert_rtw\\Mysubsystem.c",
	size: 8};
	 this.metricsArray.fcn["Mysubsystem_initialize"] = {file: "F:\\3rd-CSE\\RST_PP_v2.fig\\Mysubsystem_ert_rtw\\Mysubsystem.c",
	stack: 0,
	stackTotal: 0};
	 this.metricsArray.fcn["Mysubsystem_step"] = {file: "F:\\3rd-CSE\\RST_PP_v2.fig\\Mysubsystem_ert_rtw\\Mysubsystem.c",
	stack: 8,
	stackTotal: 8};
	 this.getMetrics = function(token) { 
		 var data;
		 data = this.metricsArray.var[token];
		 if (!data) {
			 data = this.metricsArray.fcn[token];
			 if (data) data.type = "fcn";
		 } else { 
			 data.type = "var";
		 }
	 return data; }; 
	 this.codeMetricsSummary = '<a href="Mysubsystem_metrics.html">Global Memory: 76(bytes) Maximum Stack: 8(bytes)</a>';
	}
CodeMetrics.instance = new CodeMetrics();
