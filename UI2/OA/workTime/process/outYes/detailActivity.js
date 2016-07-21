define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var common = require("$UI/OA/workTime/js/common");

	var Model = function() {
		this.callParent();
	};
	
	var mainData="";
	Model.prototype.modelModelConstructDone = function(event){		
		var data = this.getContext().getRequestParameter("data");
		mainData = this.comp('mainData');
		if(data){
			mainData.filters.setFilter("repairApplyFilter", "OA_WM_outApply='" + data + "'");
			mainData.refreshData();
			
			mainData.setValue("fFACTSTARTTIME", mainData.getValue("fSTARTTIME"));
			mainData.setValue("fFACTENDTIME", mainData.getValue("fENDTIME"));
			mainData.setValue("fCANCELHOLSDATE", justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT));
		}
	};

	//数据改变
	Model.prototype.mainDataValueChanged = function(event){
		var column = event.col;
		var starttime = mainData.getValue("fFACTSTARTTIME");
		var fEndTime = mainData.getValue("fFACTENDTIME");
		if (column == "fFACTSTARTTIME" || column == "fFACTENDTIME") {
			if (starttime != undefined &&  fEndTime != undefined) {
				var hour = common.calLeaveData(starttime, fEndTime);
				if (hour >= 0) {
					mainData.setValue("fFACTHOURS", (hour % 8).toString());
					mainData.setValue("fFACTDAYS", parseInt(hour / 8) > 0 ? parseInt(hour / 8) : '0');
				} else {
					alert('填入的时间不合法！');
					mainData.setValue("fFACTDAYS", '0');
					mainData.setValue("fFACTHOURS", '0');
				}
			}
		}
	};
	
	//保存前
	Model.prototype.mainDataBeforeSave = function(event){
		this.initDeptAndPerson();
	};
	
	Model.prototype.initDeptAndPerson = function(event){
		mainData.setValue('fCANCELHOLSPERSONID', this.getContext().getCurrentPersonID());
		mainData.setValue("fCANCELHOLSPERSONNAME", this.getContext().getCurrentPersonName());
		mainData.setValue("fCANCELHOLSDATE", justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT));
		mainData.setValue("fCANCELHOLSDEPTNAME", this.getContext().getCurrentDeptName() || this.getContext().getCurrentOgnName());
		mainData.setValue("fCANCELHOLSDEPTID", this.getContext().getCurrentDeptID() || this.getContext().getCurrentOgnID());

		var days = mainData.getValue("fFACTDAYS");
		var hours = mainData.getValue("fFACTHOURS");
		mainData.setValue("fFactTime", days * 8 + parseInt(hours));
	
	};

	return Model;
});