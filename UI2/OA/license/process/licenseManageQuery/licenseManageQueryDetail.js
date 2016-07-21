define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Model = function(){
		this.callParent();
	};
	

	
	Model.prototype.modelModelConstructDone = function(event){
		var operator = this.getContext().getRequestParameter("operator");
		var id = this.getContext().getRequestParameter("rowID");

		var data = this.comp("dLicenseManage");
	    if (operator == "new") {
			data.newData();
		}else{
			data.filters.setFilter("licenseDataFilter", "OA_LS_LicenseManage='" + id + "'");
			data.refreshData();	
		}
	
	};
	
	return Model;
});