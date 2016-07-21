define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event){
		var kwid = event.data.kwid;
		var data = this.comp('dReaded');
		data.filters.setFilter("readerFilter", "OA_KM_READERS.fKWID='" + kwid + "'");
		data.refreshData();
	};

	return Model;
});