define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var docUtils = require("$UI/OA/doc/js/docUtils");
	
	var updateId = "";
	var updateName = "";
	var Model = function(){
		this.callParent();
	};

	Model.prototype.okBtnClick = function(event){
	   ;
		var row = this.comp("dRelevance").getCurrentRow();//.getValue("relevanceName");
		sResult = row.val("relevanceName");
		if (sResult != null && sResult != updateName) {
		   
			docUtils.updateRelevance(this.getContext(),updateId, sResult);
		}
		this.comp("windowReceiver").windowEnsure(updateId);
	};

	Model.prototype.windowReceiverReceive = function(event){
	    ;
		updateId = event.data.updateId;
		updateName = event.data.updateName;
		var data = this.comp("dRelevance");
		data.newData({
			index : 0,
			defaultValues : [ {
				"id" : justep.UUID.createUUID()
			   
			} ]
		});
		
	};

	return Model;
});