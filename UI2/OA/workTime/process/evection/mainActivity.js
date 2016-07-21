define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var common = require("$UI/OA/workTime/js/common");
	var x5Utils = require("$UI/OA/workTime/js/x5Utils");
	
	var Model = function(){
		this.callParent();
	};
	
	var mainData="",childData="";
	Model.prototype.modelModelConstructDone = function(event){
		mainData=this.comp("mainData");
		childData=this.comp("childData");
	};
	
	//部门选择
	Model.prototype.deptUpdateValue = function(event){
		var deptID = mainData.getValue("fApplyDeptID");		
		var dPsm = this.comp('dPsm');	
		dPsm.filters.setFilter("psmFilter", "SA_OPOrg like '%@"+deptID+"%'");
		dPsm.refreshData();
	};
	
	//数据改变后
	Model.prototype.mainDataValueChanged = function(event){	
		var column = event.col;
		if (column == 'fAPPLYDEPTNAME') {
			mainData.setValue("fAPPLYPERSONID", "");
			mainData.setValue("fAPPLYPERSONNAME", "");
		} else if (column == 'fSTARTTIME' || column == 'fENDTIME') {			
			var begin = mainData.getValue("fSTARTTIME");
			var end = mainData.getValue("fENDTIME");
			if (begin !=undefined && end !=undefined) {			
				var i = 0;
				var flag = common.isHoliday1(begin);
				var flag1 = common.isHoliday1(end);
				if (begin != end) {
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
				} else {
					if (flag == true) {
						i--;
					} else if (flag == false) {
						i++;
					}
				}
				
				var less = x5Utils.dateTimeLess(begin, end);
				var num = (less / 24) + 1;
				var week = common.removeWeek(begin, end);
				num = num - week;
				var reArray = common.getHolidays(num, begin, end);
				num = num + reArray["num1"] + i;
				if (less < 0) {
					alert("开始时间不能早于结束时间！");
					mainData.setValue("fSTARTTIME", null);
					return;
				}
				mainData.setValue("fDAYS", num);
				mainData.setValue("fFACTDAYS", num);
			}
		}
	};

	//选择人员
	Model.prototype.seachBtnClick = function(event){
		childData.deleteData();
		mainData.setValue("fPERSONNEL", null);
		mainData.setValue("fNUMBER", 0);

		this.comp("orgDialogPC").open();
	};
		
	//选择人员返回值
	Model.prototype.orgDialogPCReceive = function(event){
		var rows = event.data;		
		var names="";
		var n=rows.length;
		var fID=mainData.getValue("OA_WM_EvecApply");
		for ( var i in rows) {
			childData.add({				
				fPersonName: rows[i].val('sName'),
				fPersonID: rows[i].val('sFID'),
				fMasterID: fID	
			});
			names+=rows[i].val('sName');
			if(i<n-1) names+=",";
		}
		mainData.setValue("fPERSONNEL", names);
		mainData.setValue("fNUMBER", n);
	};

	

	return Model;
});