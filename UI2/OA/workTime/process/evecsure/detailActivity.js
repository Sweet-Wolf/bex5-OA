define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var common = require("$UI/OA/workTime/js/common");
	var x5Utils = require("$UI/OA/workTime/js/x5Utils");
	
	var Model = function(){
		this.callParent();
	};
	
	var mainData="";
	Model.prototype.modelLoad = function(event){
		mainData = this.comp("mainData");
		var data = this.getContext().getRequestParameter("data");
		if (data){
			var filter = "OA_WM_EvecApply='" + data + "'";
			mainData.setFilter("____dataFilter_", filter);
			mainData.refreshData(); 
			
			mainData.setValue("fFACTSTARTTIME",mainData.getValue("fSTARTTIME"));
			mainData.setValue("fFACTENDTIME",mainData.getValue("fENDTIME"));
			mainData.setValue("fCANCELHOLSDATE",justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT));		
		}
	};

	Model.prototype.mainDataValueChanged = function(event){
		var column = event.col;
		if (column == "fFACTSTARTTIME" || column == "fFACTENDTIME") {
			var begin = mainData.getValue("fFACTSTARTTIME");
			var end = mainData.getValue("fFACTENDTIME");
			if (begin !=undefined && end !=undefined) {	
				var i = 0;
				var flag = common.isHoliday1(begin);
				var flag1 = common.isHoliday1(end);
				if (flag == true) {
					i--;
				} else if (flag == false) {
					i++;
				}
				if (flag1 == true) {
					i--;
				} else if (flag1 == false) {
					i++;
				}
				var less = x5Utils.dateTimeLess(begin, end);
				var num = (less / 24) + 1;
				var week = common.removeWeek(begin, end);
				num = num - week;
	
				var reArray = common.getHolidays(num, begin, end);
				num = num + reArray["num1"] + i;
				if (less < 0) {
					alert("开始时间不能早于结束时间！");
					mainData.setValue("fFACTSTARTTIME", null);
					return;
				}
				mainData.setValue("fFACTDAYS", num);
			}
		}
	};

	Model.prototype.mainDataBeforeSave = function(event){
		mainData.setValue("fCANCELHOLSDEPTNAME",this.getContext().getCurrentDeptName() || this.getContext().getCurrentOgnName());
		mainData.setValue("fCANCELHOLSDEPTID",this.getContext().getCurrentDeptID() || this.getContext().getCurrentOgnID());		
		mainData.setValue("fCANCELHOLSPERSONID",this.getContext().getCurrentPersonID());
		mainData.setValue("fCANCELHOLSPERSONNAME",this.getContext().getCurrentPersonName());
		mainData.setValue("fCANCELHOLSDATE",justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT));
	};

	Model.prototype.mainDataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	return Model;
});