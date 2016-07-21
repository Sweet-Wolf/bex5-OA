define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!$UI/OA/config/pub").load();
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelModelConstructDone = function(event){
	    debugger;
		var taskid = this.getContext().getTask();
		var taskData = this.comp("taskData");
		taskData.filters.setFilter("Filter1", "SA_Task in (select a.sTaskID1 from SA_TaskRelation  a where a.sTaskID2 ='" + taskid + "')");
		taskData.refreshData();
	};

	Model.prototype.moreBtnClick = function(event){
		this.comp("processMenu").show();
	};

	Model.prototype.closeBtnClick = function(event){
		justep.Portal.closeWindow();
	};

	return Model;
});