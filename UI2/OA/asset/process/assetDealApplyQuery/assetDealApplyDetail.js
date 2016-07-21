define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelModelConstructDone = function(event){
		var rowID = this.getContext().getRequestParameter("rowID");
		if (!rowID){
			return;
		}else{
			var data = this.comp('mainData');
			data.filters.setFilter("DealApplyFilter", "OA_AS_DealApply='" + rowID + "'");
			data.refreshData();
			
			var taskData = this.comp("taskData");
			taskData.filters.setFilter("Filter1", "SA_Task.sData1='" + rowID + "'");
			taskData.refreshData();
			
		}
	};

		
	
	Model.prototype.chartBtnClick = function(event){
		var process = this.comp("process");
		process.showChart("/OA/asset/process/assetDealApplyQuery/assetDealApplyQueryProcess", this.comp("mainData").getCurrentRowID(), null);
	};
		
	
	Model.prototype.button2Click = function(event){
		var data=this.comp("mainData");
		var process = this.comp("process");
		var id = data.getRowID();		
		process.processRecord(null, null, id);
	};
	
	
	return Model;
});