define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event){
		var archivalID=event.data.archivalID;
		var operator=event.data.operator;
		
		var aData = this.comp('archivalData');
		aData.filters.setFilter("archivalFilter", "OA_AM_Archival='" + archivalID+ "'");
		aData.refreshData();		
		if (operator == 'search'){
			//this.comp('attachmentEditor').setAttachmentPermission(1);
		}else if (operator == 'down'){
			//this.comp('attachmentEditor').setAttachmentPermission(7);
		}
	};

	return Model;
});