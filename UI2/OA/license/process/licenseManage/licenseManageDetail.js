define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelModelConstructDone = function(event){
	   ;
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

	Model.prototype.orgSelectPC2ShowOption = function(event){
		var data = this.comp("dLicenseManage");
		var fSafekeepDeptID = data.getValue("fSafekeepDeptID");
	
		var personData = this.comp("dPsm");
		personData.setFilter("psmFilter", "SA_OPOrg.sFID like '%/"
				+ fSafekeepDeptID + ".%'");
		personData.refreshData();
	
	};

	Model.prototype.orgSelectPC2HideOption = function(event){
		var sFID = event.source.value;
		var sFName = event.source.label;
		var data = this.comp('dLicenseManage');
		data.setValue("fKeeperID",sFID);
		data.setValue("fKeeperName",sFName);
		
	
	};

	Model.prototype.dLicenseManageSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	return Model;
});