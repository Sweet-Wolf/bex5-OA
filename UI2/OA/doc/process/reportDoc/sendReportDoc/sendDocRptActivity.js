define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event){
		
	};

	Model.prototype.modelModelConstructDone = function(event){
		;
		var rowid = this.getContext().getRequestParameter("rowid");
		if(rowid){
			var rptDoc = this.comp('rptDoc');
			rptDoc.setStringVar("rowid", rowid);
			var rptDoc = this.comp('rptDocDetail');
			rptDoc.setStringVar("rowid", rowid);
			this.comp('report').refresh();
		}
	};

	return Model;
});