define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var json = "";
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiver1Receive = function(event){
	    
	    json = event.data.noreaders;
		var data = this.comp("noreader");
		data.refreshData();
		data.loadData($.parseJSON(json));
	};

	Model.prototype.noreaderCustomRefresh = function(event){
		event.source.loadData($.parseJSON(json));	
	};

	return Model;
});