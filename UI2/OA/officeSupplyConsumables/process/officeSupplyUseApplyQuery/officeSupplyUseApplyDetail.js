define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelModelConstructDone = function(event){
	    ;
		var rowID = this.getContext().getRequestParameter("rowID");
		if (!rowID)
			return;
		var data = this.comp('mainData');
		data.filters.setFilter("useApplyMFilter", "OA_OSC_UseApplyM='" + rowID + "'");
		data.refreshData();
		var taskData = this.comp("taskData");
		taskData.filters.setFilter("Filter1", "SA_Task.sData1='" + rowID + "'");
		taskData.refreshData();
	};

	// 打开流程图表
	Model.prototype.showChart = function() {
		var process = this.comp("process");
		process.showChart("/OA/officeSupplyConsumables/process/officeSupplyUseApply/officeSupplyUseApplyProcess", this.comp("mainData").getCurrentRowID(), null);
	};
	Model.prototype.chartBtnClick = function(event){
		this.showChart();
	};
	return Model;
});