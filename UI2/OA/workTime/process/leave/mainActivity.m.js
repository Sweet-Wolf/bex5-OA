define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var IM = require("$UI/OA/workTime/js/leaveMessage");
	var common = require("$UI/OA/workTime/js/common");
	require("css!$UI/oa/common/css/pub").load();
	
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.backBtnClick = function(){
		justep.Portal.closeWindow();
	};
	
	Model.prototype.moreBtnClick = function(event){
		this.comp("processMenu").show();
	};
	
	
	var mainData="",vacationData="";
	Model.prototype.modelModelConstructDone = function(event){
		mainData=this.comp("mainData");
		vacationData=this.comp("vacationData");
	};
	
	Model.prototype.modelLoad = function(event){
		if(mainData.getValue("fLeaveTypeName")=='年假'){
			this.dVacationrefreshData();
		}
	};
	
/*	//部门选择
	Model.prototype.deptUpdateValue = function(event){
		var deptID = mainData.getValue("fApplyDeptID");		
		var dPsm = this.comp('dPsm');
		//alert(deptID+" ; "+mainData.getValue('fApplyPersonID'));
		
		dPsm.filters.setFilter("psmFilter", "SA_OPOrg like '%@"+deptID+"%'");
		dPsm.refreshData();
	};
	
	//人员选择
	Model.prototype.orgSelectPC1UpdateValue = function(event){
		//var sFID = event.grid.fields.sFID.getValue();
		//var sFName = event.grid.fields.sFName.getValue();
		//mainData.setValue("fURL",sFID);
		var fApplyPersonID=mainData.getValue('fApplyPersonID').split("@")[0];
		mainData.setValue('fApplyPersonID',fApplyPersonID);		
		if (mainData.getValue('fLeaveTypeName') == '年假') {
			dVacationrefreshData();
		}
	};*/
	
	//类型
	Model.prototype.gridSelect1UpdateValue = function(event){
		if(mainData.getValue("fLeaveTypeName")=='年假'){
			this.dVacationrefreshData();
		}
	};

	//自定义函数－判断是否有年假
	Model.prototype.dVacationrefreshData = function(event){
		var personID = mainData.getValue("fApplyPersonID");
		var fLeaveTypeName = mainData.getValue("fLeaveTypeName");
		vacationData.setFilter("myFile", "fPersonID='" + personID + "' and fLeaveTypeName='" + fLeaveTypeName + "' and fHoliday>0 and fYear=" + mainData.getValue('fApplyDate').toString().split('-')[0]);
		vacationData.refreshData();
		//alert(vacationData.getCount());
		if (vacationData.getCount() == 0) {
			alert('此人没有年假');
			mainData.setValue("fLeaveTypeID", "");
			mainData.setValue("fLeaveTypeName", "");
		}
	}
	
	//保存前
	Model.prototype.mainDataBeforeSave = function(event){
	var vacationData=this.comp("vacationData");
		var fLeavingsDay = parseInt(vacationData.getValue("fLeavingsDay"));
		var fLeavingsHour = parseInt(vacationData.getValue("fLeavingsHour"));
		var fLeaveDays = parseInt(mainData.getValue("fLeaveDays"));
		var fLeaveHours = parseInt(mainData.getValue("fLeaveHours"));
		var fLeaveTypeName = mainData.getValue("fLeaveTypeName");
		if (fLeaveTypeName == "年假") {
			var hours = (fLeavingsDay * 8) + fLeavingsHour;
			var hours1 = (fLeaveDays * 8) + fLeaveHours;
			if (hours < hours1) {
				alert('保存失败，剩余年假天数不够！');
				event.cancel = true;
			}
		}
	};

	//数据改变，根据开始时间结束时间计算请假总时长
	Model.prototype.mainDataValueChanged = function(event){
	var mainData=this.comp("mainData");
		if (window._valueChanged != null && window._valueChanged == false) {
			return;
		}
		
		if (event.col == "fApplyDeptID") {
			mainData.setValue("fApplyPersonID", "");
			mainData.setValue("fApplyPersonName", "");
		}
	
		if (event.col == 'fStartTime' || event.col == 'fEndTime') {
			var starttime = mainData.getValue("fStartTime");
			var fEndTime = mainData.getValue("fEndTime");
			if (starttime != null && fEndTime != "" && starttime != "" && fEndTime != null) {
				//debugger;
				//var hour = calLeaveData(starttime.replace("T", " "), fEndTime.replace("T", " "));
				var hour = common.calLeaveData(starttime, fEndTime);				
				if (hour >= 0) {					
					mainData.setValue("fLeaveHours", (hour%8).toString());
					mainData.setValue("fFactHours", (hour%8).toString());
					mainData.setValue("fLeaveDays",	parseInt(hour / 8) > 0 ? parseInt(hour / 8) : '0');
					mainData.setValue("fFactDays",	parseInt(hour / 8) > 0 ? parseInt(hour / 8) : '0');
				} else {
					alert('填入的时间不合法！');
					mainData.setValue("fFactDays", '0');
					mainData.setValue("fLeaveHours", '0');
					mainData.setValue("fFactHours", '0');
					mainData.setValue("fLeaveDays", '0');
				}
			
			}
		}
		// 当请假天数或者请假小时修改时，实际天数和实际小时跟着更改
		if (event.col == 'fLeaveDays') {
			var factdays = mainData.getValue("fLeaveDays");
			mainData.setValue("fFactDays", factdays);
		}
	};
	
	
	Model.prototype.mainDataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	};
	
	
	Model.prototype.processAdvanceCommit = function(event){
		IM.sendMsg(this, "mainData", "申请");
	};
	
	
	Model.prototype.processBackCommit = function(event){
		IM.sendMsg(this, "mainData", "回退");
	};
	
	
	
	
	Model.prototype.processAbortCommit = function(event){
		IM.sendMsg(this, "mainData", "终止");
	};
	
	
	
	
	return Model;
});