define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelModelConstructDone = function(event){
		debugger;
		var rowID = this.getContext().getRequestParameter("rowID");
		if (!rowID)
			return;
		var data = this.comp('mainData');
		data.filters.setFilter("discardApplyFilter", "OA_AS_DiscardApply='" + rowID + "'");
		data.refreshData();
		
		var taskData = this.comp("taskData");
		taskData.filters.setFilter("Filter1", "SA_Task.sData1='" + rowID + "'");
		taskData.refreshData();
	};

	return Model;
});