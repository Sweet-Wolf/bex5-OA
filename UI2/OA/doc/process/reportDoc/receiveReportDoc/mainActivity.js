define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelModelConstructDone = function(event){
	    ;
	    var rowid = this.getContext().getRequestParameter("rowid");
	
		var data = this.comp("rptDoc");
		data.setStringVar("docID",rowid);
		var detaildata = this.comp("rptDocDetail");
		detaildata.setStringVar("docID",rowid);
		this.comp("report").refresh();
	};

	return Model;
});