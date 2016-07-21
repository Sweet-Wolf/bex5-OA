define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	/*Model.prototype.windowReceiverReceive = function(event){
		this.action = event.data.action;
		var data = this.comp("dSignature");
		data.loadData({rows: [event.data.row]}, false);
		data.first();
	};*/


	Model.prototype.modelModelConstructDone = function(event){
		;
	/*	var fID = this.getContext().getRequestParameter("applyID");
		var data = this.comp("dSignature");
		//data.setFilter("dSignatureFilter", "OA_SL_Signature='" + fID + "'")
		data.refreshData();
		*/
		var kwid = this.getContext().getRequestParameter("kwid");
		if (!kwid)
			return;
		var data = this.comp('dSignature');
		data.filters.setFilter("KWFilter", "OA_SL_Signature='" + kwid + "'");
		data.refreshData();
		
		var taskData = this.comp("taskData");
			taskData.filters.setFilter("Filter1", "SA_Task.sData1='" + kwid + "'");
			taskData.refreshData();
	};

	return Model;
});