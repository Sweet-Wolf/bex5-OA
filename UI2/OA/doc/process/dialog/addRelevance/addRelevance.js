define(function(require){
	var $ = require("jquery");
	var docUtils = require("$UI/OA/doc/js/docUtils");
	
	
	var Model = function(){
		this.callParent();
	};
	Model.prototype.windowReceiverReceive = function(event){
	    ;
		docId = event.data.docId;
		var data = this.comp("main");
		
		data.filters.setFilter("notSelfFilter", "OA_DC_Doc <> '" + docId + "'");
		data.refreshData();
	};
	
	Model.prototype.okBtnClick = function(event){
	    var rows = this.comp("mainDataTables").getCheckeds();
		if(rows.length == 0){
			alert("请勾选要关联的文件！");
			return;
		}
		;
		var  relevanceIDs = "";
		for(var i = 0;i<rows.length;i++){
			if(relevanceIDs == "")
				relevanceIDs = rows[i].getID();
			else
				relevanceIDs = relevanceIDs + ","+rows[i].getID();
		}
	    var ctx = this.getContext();
		if (relevanceIDs && (relevanceIDs != "")) {
			var relevance = docUtils.addRelevance(ctx,docId, relevanceIDs);
		}
		;
		this.comp("windowReceiver").windowEnsure(relevance);
	};
	return Model;
});