define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.orgSelectPC2ShowOption = function(event){
		;
		var data = this.comp("dSignature");
		var applyDeptID = data.getValue("fApplyDeptID");
	
		var personData = this.comp("dPsm");
		/*personData.filters.setFilter("psmFilter", "SA_OPOrg.sFID like '%/"
				+ applyDeptID + ".%'");*/
		personData.setFilter("psmFilter", "SA_OPOrg.sFID like '%/"
				+ applyDeptID + ".%'");
		personData.refreshData();
	};

	Model.prototype.orgSelectPC2HideOption = function(event){
		;
		var sFID = event.source.value;
		var sFName = event.source.label;
		var data = this.comp('dSignature');
		data.setValue("fApplyPsnFID",sFID);
		data.setValue("fApplyPsnFName",sFName);
		
	};

	Model.prototype.dSignatureValueChanged = function(event){
		;
		var data = this.comp('dSignature');
		if (event.col == "fApplyDeptID") {
			data.setValue("fApplyPsnID", '');
			data.setValue("fApplyPsnName", '');
		}
	};

	Model.prototype.dSignatureBeforeSave = function(event){
		;
		var data = this.comp('dSignature');
		var currentPsnID = this.getContext().getCurrentPersonID();
		var currentPsnName = this.getContext().getCurrentPersonName();
		var currentTime = justep.Date.toString(new Date(),
				justep.Date.STANDART_FORMAT);
		data.setValue("fUpdatePsnID", currentPsnID);
		data.setValue("fUpdatePsnName", currentPsnName);
		data.setValue("fUpdateTime", currentTime);
	};

	return Model;
});