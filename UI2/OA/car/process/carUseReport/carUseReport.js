define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelModelConstructDone = function(event){
		
		var rowid = this.getContext().getRequestParameter("id");
		if(rowid){
			this.comp('dReport').setStringVar("id", rowid);
			this.comp('dReportArr').setStringVar("masterId", rowid);
			this.comp('report').refresh();
		}
	};

	return Model;
});