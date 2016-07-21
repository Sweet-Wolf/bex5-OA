define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
		this.row;
	};
	
	Model.prototype.getRequest = function(action,dataStr) {
		var params = new biz.Request.ActionParam();
		var ctx = this.getContext();
		var self = this;
		params.setParam('personID', "1");
		biz.Request.sendBizRequest({
			contentType : 'application/json',
			dataType : "json",
			"context" : ctx,
			"action" : action,
			"parameters":params,
			"callback" : function(data) {
				if (data.state) {
					var resultData = data.response[dataStr];
					if (resultData) {
						self.comp(dataStr).clear();
						self.comp(dataStr).loadData(resultData);
					}
				}
			}
		});

	}
	
	Model.prototype.modelParamsReceive = function(event){
		this.getRequest("queryOA_AttendanceGroupAction", "AttendanceInfo");
	};
	
	Model.prototype.addAttenGroupClick = function(event){
		var url = "$UI/OA/attendance/process/attendance/newAttendanceActivity.m.w?process=/OA/attendance/process/attendance/attendanceProcess&Activity=newAttendanceActivity";
		justep.Shell.showPage(url)
	};
	
	Model.prototype.deleteBtnClick = function(event){
		this.row = event.bindingContext.$object;
		this.comp("delMessageDialog").show();
	};
	
	Model.prototype.delMessageDialogOK = function(event){
		var self = this;
		if(this.row){
			var id = this.row.val("fAttendanceID");
			var params = new biz.Request.ActionParam();
			var ctx = this.getContext();
			params.setParam('deleteAll', id);
			biz.Request.sendBizRequest({
				contentType : 'application/json',
				dataType : "json",
				"context" : ctx,
				"action" : "deleteAttendanceAction",
				"parameters" : params,
				"callback" : function(data) {
				}
			});
			this.comp("AttendanceInfo").deleteData(this.row);
		}
	};
	
	Model.prototype.modelActive = function(event){
		this.getRequest("queryOA_AttendanceGroupAction", "AttendanceInfo");
	};
	
	Model.prototype.undataPersonClick = function(event){
		var url = "$UI/OA/attendance/process/attendance/SetAttendancePeopleActivity.m.w?process=/OA/attendance/process/attendance/attendanceProcess&Activity=SetAttendancePeopleActivity";
		var id = event.bindingContext.$object.val("fAttendanceID");
		justep.Shell.showPage(url,{"rowID":id})
	};
	
	Model.prototype.updataRuleClick = function(event){
		var url = "$UI/OA/attendance/process/attendance/SetAttendanceActivity.m.w?process=/OA/attendance/process/attendance/attendanceProcess&Activity=SetAttendanceActivity";
		var id = event.bindingContext.$object.val("fAttendanceID");
		justep.Shell.showPage(url,{"rowID":id})
	};
	
	Model.prototype.advancedSettingClick = function(event){
		var url ="$UI/OA/attendance/process/attendance/settingActivity.m.w?process=/OA/attendance/process/attendance/attendanceProcess&Activity=settingActivity";
		justep.Shell.showPage(url);
	};
	
	return Model;
});