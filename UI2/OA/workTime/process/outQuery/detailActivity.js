define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function() {
		this.callParent();
	};


	var mainData="";
	Model.prototype.modelModelConstructDone = function(event){
		var id = this.getContext().getRequestParameter("id");
		mainData = this.comp('mainData');
		if(id){
			mainData.filters.setFilter("repairApplyFilter", "OA_WM_outApply='" + id + "'");
			mainData.refreshData();
			/*
			var taskData = this.comp("taskData");
			taskData.filters.setFilter("Filter1", "SA_Task.sData1='" + id + "'");
			taskData.refreshData();
*/
		}
	};



	Model.prototype.processRecBtnClick = function(event){		
		var id = mainData.getRowID();
        var process=this.comp("process");
        process.processRecord(null, null, id);
	};



	Model.prototype.chartBtnClick = function(event){
		var process = this.comp("process");
		process.showChart("/OA/workTime/process/outApply/outApplyProcess", this.comp("mainData").getCurrentRowID(), null);
	};



	return Model;
});