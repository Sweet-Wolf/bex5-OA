define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.mainDataValueChanged = function(event){
		var data = this.comp("mainData");
	if (event.col == 'fAPPLYDEPTNAME') {
		data.setValue("fAPPLYPERSONID", "");
		data.setValue("fAPPLYPERSONNAME", "");
	}
	};

	Model.prototype.mainDataBeforeSave = function(event){
		var data = this.comp("mainData");
		var psnID = this.getContext().getCurrentPersonID();
		var psnName = this.getContext().getCurrentPersonName();
		var orgID = this.getContext().getCurrentOrgID();
		var orgName = this.getContext().getCurrentOrgName();
		var time = justep.Date.toString(new Date(),
				justep.Date.STANDART_FORMAT);
		//data.setValue("fBIZSTATE", "bsDaiBan");
		//data.setValue("fBIZSTATENAME", "代办中");
		data.setValue("fUPDATEDEPTID", orgID);
		data.setValue("fUPDATEDEPTNAME", orgName);
		data.setValue("fUPDATEPERID", psnID);
		data.setValue("fUPDATEPERNAME", psnName);
		data.setValue("fUPDATETIME", time);
	};

	Model.prototype.orgSelectPC3ShowOption = function(event){
		var data = this.comp("mainData");
		var deptID = data.getValue("fAPPLYDEPTID");
		var perData = this.comp("dPsm");
		perData.setFilter("filter0", "SA_OPOrg.sParent ='" + deptID + "'");
		perData.refreshData();
	};

	Model.prototype.orgSelectPC3HideOption = function(event){
//		var sFID = event.grid.fields.sFID.getValue();
		var sFID = this.comp('dPsm').val('sFID')
		var data = this.comp("mainData");
		data.setValue("fURL",sFID);
	};

	Model.prototype.processBeforeAdvance = function(event){
		var data = this.comp("mainData");
		var state = data.getValue("fBIZSTATE");
//		var state = data.getValue(col);
//		alert(state);
		if(state == 'bsDaiBan') {
			alert("sa");
			data.setValue("fBIZSTATE", "bsExecuting");
			data.setValue("fBIZSTATENAME", "处理中");
			data.saveData();
	}
	};

	Model.prototype.mainDataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	return Model;
});