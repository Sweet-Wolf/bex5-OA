define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var common = require("$UI/OA/workTime/js/common");
	var biz = require("$UI/system/lib/biz");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	
	var mainData="",vacationData="";
	Model.prototype.modelLoad = function(event){
		mainData = this.comp("mainData");
		vacationData=this.comp("vacationData");
		
		var data = this.getContext().getRequestParameter("data");
		if (data){
			var filter = "OA_WM_LeaveApply='" + data + "'";
			mainData.setFilter("____dataFilter_", filter);
			mainData.refreshData(); 
		
			mainData.setValue("fFactStartTime", mainData.getValue("fStartTime"));
			mainData.setValue("fFactEndTime", mainData.getValue("fEndTime"));
			mainData.setValue("fCancelHolsDate", justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT));
			
			var fIsReducHoliday="";
			if(mainData.getValue("fIsReducHoliday"==1)){
				fIsReducHoliday="是";
			}else{
				fIsReducHoliday="否";
			}		
			$("#fIsReducHoliday").text(fIsReducHoliday);
			
			var personID = mainData.getValue("fApplyPersonID");
			var fLeaveTypeName = mainData.getValue("fLeaveTypeName");
			vacationData.setFilter("myFile", "fPersonID='" + personID + "' and fLeaveTypeName='" + fLeaveTypeName + "' and fHoliday>0 and fYear=" + mainData.getValue('fApplyDate').toString().split('-')[0]);
			vacationData.refreshData();
			
			if (mainData.getValue('fLeaveTypeName') == '年假') {
				this.dVacationrefreshData();
			}
		}
	};
	
	Model.prototype.dVacationrefreshData = function(event){
		var mainData = this.comp("mainData");
		var personID = mainData.getValue("fApplyPersonID");
		var vacationData=this.comp("vacationData");
		var fLeaveTypeName = mainData.getValue("fLeaveTypeName");
		vacationData.setFilter("myFile", "fPersonID='" + personID + "' and fLeaveTypeName='" + fLeaveTypeName + "' and fHoliday>0 and fYear=" + mainData.getValue('fApplyDate').split('-')[0]);
		vacationData.refreshData();
	}
/*
	Model.prototype.mainDataBeforeSave = function(event){
		var mainData = this.comp("mainData");
		mainData.setValue("fCancelHolsDeptName", this.getContext().getCurrentDeptName() || this.getContext().getCurrentOgnName());
		mainData.setValue("fCancelHolsPersonName", this.getContext().getCurrentPersonName());
	};	*/

	//数据改变，根据开始时间结束时间计算请假总时长
	Model.prototype.mainDataValueChanged = function(event){
		if (window._valueChanged != null && window._valueChanged == false) {
			return;
		}
		
		if (event.col == 'fFactStartTime' || event.col == 'fFactEndTime') {
			var starttime = mainData.getValue("fFactStartTime");
			var fEndTime = mainData.getValue("fFactEndTime");
			if (starttime != null && fEndTime != "" && starttime != "" && fEndTime != null) {
				var hour = common.calLeaveData(starttime, fEndTime);				
				if (hour >= 0) {					
					mainData.setValue("fFactDays",	parseInt(hour / 8) > 0 ? parseInt(hour / 8) : '0');
					mainData.setValue("fFactHours", (hour%8).toString());
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
	
	//销假确认
	Model.prototype.trgSureClick = function(event){
		var sjxs = parseFloat(mainData.getValue("fFactDays")) * 8 + parseFloat(mainData.getValue("fFactHours"));
		var sqxs = parseFloat(mainData.getValue("fLeaveDays")) * 8 + parseFloat(mainData.getValue("fLeaveHours"));
		if (sjxs > sqxs) {
			alert("销假失败!");
			alert('由于此人多休了' + Math.floor((sjxs - sqxs) / 8) + "天" + ((sjxs - sqxs) % 8).toString() + "小时,请提醒他另外申请一个假单！");
			mainData.setValue("fFactStartTime", '');
			mainData.setValue('fFactEndTime', '');
			event.cancel = true;
			return;
		} else {
			mainData.saveData();
			var code="";
			var params = new biz.Request.ActionParam();
			params.setParam("bizID", mainData.getCurrentRowID());
			var ctx = this.getContext();
			var options = {
				context : ctx,
				process : ctx.getCurrentProcess(),
				activity : ctx.getCurrentActivity(),
				action : "leaveSureFinishAction",
				parameters : params
			};		
			var r=biz.Request.sendBizRequest(options);
			if (!biz.Request.sendBizRequest(options)) {
				throw new Error(biz.Request.getServerError(r, "销假确认失败!"));
			} else {
				mainData.refreshData();
				alert("销假成功!");	
			}
		}
	};

	return Model;
});