define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.kindSelectFocus = function(event){
		var data=this.comp("baseCodeData");
		var filter="fScope='固定资产类别'";
		data.filters.setFilter("RMFilter",filter);
		data.refreshData();
	};

	Model.prototype.unitSelectFocus = function(event){
		var data=this.comp("baseCodeData");
		var filter="fScope='办公用品计量单位'";
		data.filters.setFilter("RMFilter",filter);
		data.refreshData();
	};

	return Model;
});