define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event){
	    ;
		var docId = event.data.docID;
		if (docId && (docId != "")) {

			var processData = this.comp("dDocProcess");
			processData.filters.setFilter("docProcessFilter1", "V_OA_DC_ReadOpinion.fMasterID = '"
				+ docId + "'");
			
		
			processData.refreshData();
		}
	};

	return Model;
});