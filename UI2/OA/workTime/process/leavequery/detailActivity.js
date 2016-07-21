define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
	var mainData="",vacationData="";
	Model.prototype.modelLoad = function(event){
		mainData = this.comp("mainData");
		vacationData=this.comp("vacationData");
		
		var data = this.getContext().getRequestParameter("data");
		if (data){
			var filter = "OA_WM_LeaveApply='" + data + "'";
			mainData.setFilter("____dataFilter_", filter);
			mainData.refreshData(); 
		}
	};

	Model.prototype.chartBtnClick = function(event){
		var process = this.comp("process");
		process.showChart("/OA/workTime/process/leave/leaveProcess", this.comp("mainData").getCurrentRowID(), null);
	};

	Model.prototype.processBtnClick = function(event){
		var id = mainData.getRowID();
        var process=this.comp("process");
        process.processRecord(null, null, id);
	};

	return Model;
});