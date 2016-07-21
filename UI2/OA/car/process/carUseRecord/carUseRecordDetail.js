define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	



	Model.prototype.selectCarUseApplyClick = function(event){
		this.comp("windowDialog").open();
	};

	Model.prototype.windowDialogReceive = function(event){
		this.action = event.data.action;
		var dCarUseRecord = this.comp('dCarUseRecord');
		if (event.data.action === "new"){
			dCarUseRecord.clear();
			dCarUseRecord.newData();
		}else{
			/*dCarUseRecord.loadData({rows: [event.data.row]}, false);
			dCarUseRecord.first();*/
			var row = dCarUseRecord.getCurrentRow();
			var newRow = event.data.row;
			dCarUseRecord.setValue("fNO", newRow.fNO, row);
			dCarUseRecord.setValue("fCode", newRow.fCode, row);
			dCarUseRecord.setValue("fName", newRow.fName, row);
			dCarUseRecord.setValue("fCarDriverName", newRow.fCarDriverName, row);
			dCarUseRecord.setValue("fApplyDeptID", newRow.fApplyDeptID, row);
			dCarUseRecord.setValue("fApplyDeptName", newRow.fApplyDeptName, row);
			dCarUseRecord.setValue("fApplyPsnID", newRow.fApplyDeptID, row);
			dCarUseRecord.setValue("fApplyPsnName", newRow.fApplyDeptName, row);
			dCarUseRecord.setValue("fBeginTime", newRow.fBeginTime, row);
			dCarUseRecord.setValue("fEndTime", newRow.fEndTime, row);

		}
	};

	Model.prototype.treeSltPsmShowOption = function(event){
		;
		var data = this.comp("dCarUseRecord");
		var applyDeptID = data.getValue("fApplyDeptID");
	
		var personData = this.comp("dPsm");
		/*personData.filters.setFilter("psmFilter", "SA_OPOrg.sFID like '%/"
				+ applyDeptID + ".%'");*/
		personData.setFilter("psmFilter", "SA_OPOrg.sFID like '%/"
				+ applyDeptID + ".%'");
		personData.refreshData();
	};

	Model.prototype.treeSltPsmHideOption = function(event){
		;
		var sFID = event.source.value;
		var sFName = event.source.label;
		var data = this.comp('dCarUseRecord');
		data.setValue("fApplyPsnID",sFID);
		data.setValue("fApplyPsnName",sFName);
		
	
	};

	Model.prototype.modelModelConstructDone = function(event){
	    var operator = this.getContext().getRequestParameter("operator");
		var id = this.getContext().getRequestParameter("id");

		var data = this.comp("dCarUseRecord");
	    if (operator == "new") {
			data.newData();
		}else{
			data.filters.setFilter("applyFilter", "OA_CA_CarRecord='" + id + "'");
			data.refreshData();	
		}
	};
	
	Model.prototype.getTotalCharge = function(){
		var totalCharge = 0;
		this.comp('dCarUseRecordFeeDetail').each(function(param){
			totalCharge += param.row.val('fAmount');
		});
		return totalCharge;
	};


	Model.prototype.btnSubmitDOMActivate = function(event){
		var data = this.comp('dCarUseRecord');
		data.setValue("fStatus", 1);
		data.setValue("fStatusName", '已提交');
		data.saveData();
		data.refreshData();
	};


	return Model;
});