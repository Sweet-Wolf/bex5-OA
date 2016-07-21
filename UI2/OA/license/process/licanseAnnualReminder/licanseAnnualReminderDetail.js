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
		data.filters.setFilter("licenseManageFilter", "OA_LS_LicenseManage='" + rowID + "'");
		data.refreshData();
	};
	
	return Model;
});