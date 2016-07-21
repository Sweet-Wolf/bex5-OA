define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function() {
		this.callParent();
	};



	Model.prototype.modelModelConstructDone = function(event){
		var id = this.getContext().getRequestParameter("id");
		var data = this.comp('mainData');
		
			data.filters.setFilter("useApplyFilter", "OA_AS_UseApplyM='" + id + "'");
			data.refreshData();
			
			var taskData = this.comp("taskData");
			taskData.filters.setFilter("Filter1", "SA_Task.sData1='" + id + "'");
			taskData.refreshData();
		
	};



	return Model;
});