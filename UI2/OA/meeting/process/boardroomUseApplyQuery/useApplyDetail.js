define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.chartBtnClick = function(event) {
		this.showChart();
	};

	Model.prototype.showChart = function() {
		var process = this.comp("process");
		process.showChart("/OA/meeting/process/boardroomUseApply/boardroomUseApplyProcess", this.comp("mainData").getCurrentRowID());
	};
	
	Model.prototype.modelLoad = function(event){
		var fID = this.getContext().getRequestParameter("applyID");
		var data = this.comp("mainData");
		data.setFilter("mainFilter", "OA_MT_UseApply='" + fID + "'")
		data.refreshData();
	};
	
	Model.prototype.processRecordClick = function(event){
		this.comp("process").processRecord(null, "/OA/meeting/process/boardroomUseApply/boardroomUseApplyProcess", this.comp("mainData").getCurrentRowID());
	};
	
	return Model;
});