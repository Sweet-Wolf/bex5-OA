define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var docUtils = require("$UI/OA/doc/js/docUtils");
	
	var relevanceId = "";
	var docId = "";
	var Model = function(){
		this.callParent();
	};

	Model.prototype.okBtnClick = function(event){

	};

	Model.prototype.AddRelevanceBtnClick = function(event){
	  
	   var param = {
					"docId" : docId
			};
		
	   this.comp("dlgAddRelevance").open({data:param});
			
	   
	};

	Model.prototype.dlgAddRelevanceReceive = function(event){
        //
        ;
        relevanceId = event.data;
        var data = this.comp("dDoc");
        data.filters.setFilter("relevanceFilter", "fRelevanceID = '"
				+ relevanceId + "'");
		data.filters.setFilter("notSelfFilter", "OA_DC_Doc <> '" + docId + "'");
		data.refreshData();
	};



	Model.prototype.windowReceiverReceive = function(event){
	    ;
		 relevanceId = event.data.relevanceId;
        docId = event.data.docId;
        var data = this.comp("dDoc");
        data.filters.setFilter("relevanceFilter", "fRelevanceID = '"
				+ relevanceId + "'");
		data.filters.setFilter("notSelfFilter", "OA_DC_Doc <> '" + docId + "'");
		data.refreshData();
	};

	Model.prototype.DelRelevanceBtnClick = function(event){
	    ;
		var data = this.comp("dDoc");
		var row = data.getCurrentRow();
		
		var selRelevance = row.val("fRelevanceID");
		if (selRelevance != undefined && (selRelevance != "") && (selRelevance != null)) {
			row.val("fRelevanceID", "");
			row.val("fRelevanceName", "");
			data.saveData();
			var ctx = this.getContext();
			
			docUtils.deleteRelevance(ctx,selRelevance);
			data.filters.setFilter("relevanceFilter", "fRelevanceID = '"
				+ selRelevance + "'");
			data.filters.setFilter("notSelfFilter", "OA_DC_Doc <> '" + docId + "'");
			data.refreshData();
		}
	};

	Model.prototype.UpdateRelevanceBtnClick = function(event){
	   ;
	    var data = this.comp("dDoc");
	    var row = data.getCurrentRow();
	    var updateId = row.val("fRelevanceID");
	    var updateName = row.val("fRelevanceName");
	  
	    var param = {
					"updateId" : updateId,
	    		"updateName" : updateName
		};
		
		
		if (row)
			this.comp("dlgUpdateRelevance").open({data:param});
	};

	Model.prototype.dlgUpdateRelevanceReceive = function(event){
		var data = this.comp("dDoc");
		var updateId = event.data;

		data.filters.setFilter("relevanceFilter", "fRelevanceID = '" + updateId
				+ "'");
		data.filters.setFilter("notSelfFilter", "OA_DC_Doc <> '" + docId + "'");

		data.refreshData();
	};

	return Model;
});