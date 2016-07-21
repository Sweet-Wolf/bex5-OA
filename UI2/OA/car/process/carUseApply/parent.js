define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var dValueChanging = false;
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelModelConstructDone = function(event) {
		var data = this.comp("dCarUseApply");
		var sData1 = this.getContext().getProcessData1();
		var sData = this.comp("dCarUseArrange");
		if (sData1 == null || sData1 == undefined || sData1 == '') {
			data.newData();
		} else {
			data.filters.setFilter("filter", "OA_CA_CarUseApply = '" + sData1
					+ "'");
			data.refreshData();
			sData.refreshData();

			if (this.getContext().getCurrentActivity() == "carArrangeActivity") {
				if (data.getValue("fIsArrange") == "0") {
					sData.newData();
					data.setValue("fIsArrange", "1");
				} else {
					sData.refreshData();
				}
			}
		}

	};

	Model.prototype.dlgSelectCarsReceive = function(event){
		var dCarUseArrange = this.comp("dCarUseArrange");
		if (event.data.action === "new") {
			var id = event.data.row[dCarUseArrange.idColumn];
			this.comp('dCarUseArrange').loadData({
				rows : [ event.data.row ]
			}, true);
			dCarUseArrange.to(id);
		} else {
			$.each(dCarUseArrange.defCols, function(col) {
				if (event.data.row[col]) {
					dCarUseArrange.setValue(col, event.data.row[col]);
				}
			});
		}
	};

/*	Model.prototype.printBtnClick = function(event){
		var dCarUseApply = this.comp("dCarUseApply")
		this.comp("carUseReportWindowDialog").open(rowId:dCarUseApply.getValue("OA_CA_CarUseApply"))
	};*/

	Model.prototype.printBtnClick = function(event){
		var dCarUseApply = this.comp("dCarUseApply")
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var id = dCarUseApply.getCurrentRowID();
		var url = "$UI/OA/car/process/carUseReport/carUseReport.w"
		 + "?process=" + process + "&activity=" + activity
		 + "&id="+ id;
		justep.Portal.openWindow(url,{title:'打印详细'});
	};

	Model.prototype.treeSltPsmShowOption = function(event){
		;
		var data = this.comp("dCarUseApply");
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
		/*var sFID = event.source.value;
		var sFName = event.source.label;
		var data = this.comp('dCarUseApply');
		data.setValue("fApplyPsnID",sFID);
		data.setValue("fApplyPsnName",sFName);*/
	};

	Model.prototype.dCarUseApplyValueChanged = function(event){
	
		if (!dValueChanging) {
		var data = this.comp("dCarUseApply");
		dValueChanging = true;

		if (event.col == "fApplyDeptID") {
		   
			data.setValue("fApplyPsnID", '');
			data.setValue("fApplyPsnName", '');
		}

		try {
			var psnID = this.getContext().getCurrentPersonID();
			var psnName = this.getContext().getCurrentPersonName();
			var time = justep.Date.toString(new Date(),
					justep.Date.STANDART_FORMAT);
			
			data.setValue("fUpdatePsnID", psnID);
			data.setValue("fUpdatePsnName", psnName);
			data.setValue("fUpdateTime", time);
		} finally {
			dValueChanging = false;
		}
	}
	};

	return Model;
});