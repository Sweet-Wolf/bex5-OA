define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelModelConstructDone = function(event){
		var rowID = this.getContext().getRequestParameter("rowID");
		if (!rowID)
			return;
		var data = this.comp('mainData');
		data.filters.setFilter("LicenseApplyMFilter", "OA_LS_LicenseApplyM='" + rowID + "'");
		data.refreshData();
	};
	
	Model.prototype.showChart = function(){
		var process = this.comp("process");
		process.showChart("/OA/license/process/licenseApply/licenseApplyProcess", this.comp("mainData").getCurrentRowID(),null);
	};

	return Model;
});