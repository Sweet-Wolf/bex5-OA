define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Request = require("$UI/system/lib/base/request");
	var biz = require('$UI/system/lib/biz');
	var XML = require("$UI/system/lib/base/xml");
	var dlgOperator = "";
	
	var Model = function() {
		this.callParent();
		this.outPsnCount = 0;
		this.haveMeetPsns = false;
	};

	Model.prototype.OKBtnClick = function(event) {
	   ;
		var data = this.comp("dArrange");
		var checkResult = this.checkBoardroomUsed(data);
		if (checkResult == "false") {
			data.saveData();
			var fMeetPsns = data.getValue("fMeetPsns");
			if ((fMeetPsns != null) && (fMeetPsns != ""))// 有参会人员
			{
				// TODO 调用接口，生成日程
				var scheduleInfo = this.setScheduleInfo();
				this.callAddSchedule(scheduleInfo);

			} else if (this.haveMeetPsns == true)// 修改前有参会人员，修改后没有
			{
				this.callDeleteScheduleByBiz();// 删除日程
			}
			var row = data.getCurrentRow();
			this.comp('wReceiver').windowEnsure(row);
		}
	};

	Model.prototype.wReceiverReceive = function(event) {
		var operator = event.data.operator;
		var dataArrange = this.comp('dArrange');
		var sData1 = this.getContext().getProcessData1();
		if (operator == 'new') {
			dataArrange.newData();
			var row = event.data.boardRoom;
			dataArrange.setValue("fBoardroomID",row.val('fBoardroomID'));
			dataArrange.setValue("fBoardroom",row.val('fBoardroom'));
		} else {
			var fID = event.data.arrangeID;
			dataArrange.filters.setFilter("arrangeFilter", "OA_MT_RoomArrange ='" + fID + "'");
			dataArrange.refreshConfirm = false;
			dataArrange.refreshData();
			var fMeetPsns = dataArrange.getValue("fMeetPsnNum");
			if ((fMeetPsns != null) && (fMeetPsns != ""))
				haveMeetPsns = true;
		}
	};

	Model.prototype.checkBoardroomUsed = function(data) {
		var options = {};
		var process = this.getContext().getProcess();
		var activity = this.getContext().getActivity();
		var param = new biz.Request.ActionParam();
		param.setString('fBoardroomID', data.getValue("fBoardroomID"));
		param.setString('fBeginTime', data.getValue("fBeginTime"));
		param.setString('fEndTime', data.getValue("fEndTime"));
		param.setString('fArrangeID', data.getCurrentRowID());
		options.process = process;
		options.activity = activity;
		options.parameters = param;
		options.context = this.getContext();
		options.action = "checkBoardroomUsedAction";
		var r = biz.Request.sendBizRequest(options);
		if (!biz.Request.isBizSuccess(r.responseJSON)) {
			throw new Error(biz.Request.getServerError(r, "会议室占用检查失败!"));
		}
		var dVal = r.responseJSON.data.value;
		 if (dVal == "true")
		 alert("会议室在该时段已经被占用!");
		 return dVal;
	}

	Model.prototype.callDeleteScheduleByBiz = function() {
		var instance = this.comp("dArrange");
		var fBizID = instance.getValue("rowid");
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var action = "deleteScheduleByBizAction";
		var param = new Request.ActionParam();
		param.setString('fBizID', fBizID);
		param.setString('fBizType', "会议安排");

		var r = biz.Request.sendBizRequest(process, activity, action, param);
		if (!biz.Request.isBizSuccess(r)) {
			throw new Error(biz.Request.getServerError(r, "删除日程失败!"));
		}
		return true;
	}

	Model.prototype.callAddSchedule = function(scheduleInfo) {
	    ;
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var action = "newScheduleByMeetingAction";
		var xmlStr = '<jscheme:xml xmlns:jscheme="http://www.justep.com/xbiz#">' + "<root>" + scheduleInfo + "</root>" + "</jscheme:xml>";
		var doc = "<input name=\"instance\">" + action + "</input><output name=\"data\"/>";
		var param = new biz.Request.ActionParam;
		var xmlParam = new biz.Request.XMLParam(xmlStr);
		param.setXml('cmd', xmlParam);
		
		
	    var options = {};
			
			options.contentType = 'application/json';
			options.process = this.getContext().getProcess();
			options.activity = this.getContext().getActivity();
			options.dataType = "json";
			options.parameters = param;
			options.action = "newScheduleByMeetingAction";
			options.context = this.getContext();
			
			var r = biz.Request.sendBizRequest(options).responseJSON;
			if (!biz.Request.isBizSuccess(r)) {
				throw new Error(biz.Request.getServerError(r, "新建日程失败!"));
	     }
			
	/*	var r = biz.Request.sendBizRequest(process, activity, action, param);
		if (!biz.Request.isBizSuccess(r)) {
			throw new Error(biz.Request.getServerError(r, "新建日程失败!"));
		}*/
	}

	Model.prototype.setScheduleInfo = function() {
	  
		var ins = this.comp("dArrange");
		var operator = dlgOperator;
		var conventionInstance = this.comp("dPerson");
		conventionInstance.refreshData();
		var scheduleInfo = "";
		scheduleInfo += "<schedule>" + "<fTitle>" + ins.getValue("fMeetName") + "</fTitle>" + "<fBeginTime>" + ins.getValue("fBeginTime") + "</fBeginTime>" + "<fEndTime>" + ins.getValue("fEndTime")
				+ "</fEndTime>" + "<fContent>" + ins.getValue("fRemark") + "</fContent>" + "<Executors>";
		var len = conventionInstance.getCount();
		if (len > 0) {
			conventionInstance.each(function(param) {
				var row = param.row;
				scheduleInfo += "<Executor>" + "<fExecutorID>" + conventionInstance.getValue("fPersonID", row) + "</fExecutorID>" + "<fExecutorName>" + conventionInstance.getValue("fPersonName", row)
						+ "</fExecutorName>" + "</Executor>";
			})
		} else {
			scheduleInfo += "<Executor>" + "<ExecutorID>" + "" + "</ExecutorID>" + "<ExecutorName>" + "" + "</ExecutorName>" + "</Executor>";
		}
		scheduleInfo += "</Executors>" + "<fIsShared>" + "1" + "</fIsShared>" + "<fIsRemind>" + "1" + "</fIsRemind>" + "<fRemindTime>" + ins.getValue("fBeginTime") + "</fRemindTime>"
				+ "<fCreatePsnID>" + ins.getValue("fArrPsnID") + "</fCreatePsnID>" + "<fCreatePsnName>" + ins.getValue("fArrPsnName") + "</fCreatePsnName>" + "<fCreateTime>"
				+ ins.getValue("fArrTime") + "</fCreateTime>" + "<fCreateURL>" + ins.getValue("fArrPsnFID") + "</fCreateURL>";
		if (operator != "new") {
			scheduleInfo += "<fBizID>" + ins.getRowID() + "</fBizID>" + "<fBizType>" + "会议安排" + "</fBizType>";
		} else {
			scheduleInfo += "<fBizID>" + ins.getRowID() + "</fBizID>" + "<fBizType>" + "会议安排" + "</fBizType>";
		}
		scheduleInfo += "</schedule>";
		return scheduleInfo;
	}

	Model.prototype.dArrangeValueChanged = function(event) {
		if (event.col == "fUseOgnId") {
			var data = this.comp("dArrange");
			data.setValue("fUsePsnID", "");
			data.setValue("fUsePsnName", "");
		}
	};
	
	Model.prototype.showBoardRoomInfoClick = function(event){
		var data = this.comp('dArrange');
		var fBoardroomID = data.getValue('fBoardroomID');
		this.comp('dlgBoardRoom').open({data:fBoardroomID});
	};
	
	Model.prototype.dlgSelectPersonReceive = function(event){
		var rows = event.data;
		var personCount = 0;
		var len = rows.length;
		var meetPsns = [];
		$.each(rows,function(i,row){
			meetPsns.push(row.val('sName'));
		})
		meetPsns = meetPsns.join(',');
		this.comp('dArrange').setValue('fMeetPsns',meetPsns);
		var outPsns = this.comp("dArrange").getValue("fOutPsns");
		if (outPsns != "" && outPsns != null) {
			var psnArray = outPsns.split(",");
			var psnLen = psnArray[psnArray.length - 1] == "" ? psnArray.length - 1 : psnArray.length
			personCount = psnLen + len;
		} else {
			personCount = len;
		}
		this.comp("dArrange").setValue("fMeetPsnNum", personCount);
	};
	
	Model.prototype.selectMeetPsnsClick = function(event){
		this.comp('dlgSelectPerson').open()
	};
	
	Model.prototype.dArrangeDataChange = function(event){
		var data = this.comp("dArrange");
		var outPsns = data.getValue("fOutPsns");
		var psnNum = Number(data.getValue("fMeetPsnNum") ? data.getValue("fMeetPsnNum") : 0);
		if (outPsns != "" && outPsns != null) {
			var psnArray = outPsns.split(",");
			var len = psnArray[psnArray.length - 1] == "" ? psnArray.length - 1 : psnArray.length
			psnNum = len + psnNum - this.outPsnCount;
			this.outPsnCount = len;
			if (outPsns.length > 1020) {
				outPsns = outPsns.substring(0, 1020) + "...";
				data.setValue("fOutPsns", outPsns);
			}
		} else {
			psnNum = psnNum - this.outPsnCount;
			this.outPsnCount = 0;
		}
		data.setValue("fMeetPsnNum", psnNum);
	};
	
	Model.prototype.fApplyDeptNameLHideOption = function(event){
		this.comp('dArrange').setValue('fUsePsnID','');
		this.comp('dArrange').setValue('fUsePsnName','');
	};
	
	Model.prototype.orgSelectPC1ShowOption = function(event){
		var ognId = this.comp('dArrange').getValue('fUseOgnId');
		var personData = this.comp('dPsn');
		personData.setFilter("_filter_dept_","SA_OPOrg.sFID LIKE '%" + ognId + "%'");
		personData.refreshData();
	};
	
	return Model;
});