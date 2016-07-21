define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var common = require("$UI/OA/workTime/js/common");
	var IM = require("$UI/OA/meeting/js/boardroomMessage");
	require("css!$UI/oa/common/css/pub").load();

	var Model = function() {
		this.callParent();
	};

	Model.prototype.backBtnClick = function(event) {	
		justep.Portal.closeWindow();
	};

	Model.prototype.moreBtnClick = function(event) {
		this.comp("processMenu").show();
	};

	Model.prototype.mainDataSaveCommit = function(event) {
		justep.Util.hint("保存成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	};

	Model.prototype.modelLoad = function(event) {
		var data = this.comp("mainData");
		var sData1 = this.getContext().getData1();
		if (sData1 == '' || sData1 == undefined) {
			data.newData();
			this.init();
		} else {
			var confirmRefresh = data.confirmRefresh;
			try {
				data.confirmRefresh = false;
				data.refreshData();
			} finally {
				data.confirmRefresh = confirmRefresh;
			}
		}
		
			//加载之前的动画
		$("[xid=waitDiv]").hide();
		$("[xid=meetingContent]").show();
	};

	Model.prototype.init = function() {
		var context = this.getContext();
		var data = this.comp("mainData");
		var roomID = context.getRequestParameter("roomID");
		if (roomID != "" && roomID != null && roomID != undefined) {
			var dBoardroom = this.comp("dBoardroom");
			var rows = dBoardroom.find([ 'OA_MT_Boardroom' ], [ roomID ], true, true, true);

			if (rows.length > 0) {
				data.setValue("fBoardroomID", roomID);
				data.setValue("fBoardroom", rows[0].val("fName"));
			}
		}
		var date = context.getRequestParameter("date");
		var time = context.getRequestParameter('time');
		if (date && date != "" && time && time != "") {
			if (time < 10)
				time = "0" + time
			data.setValue("fBeginTime", date + "T" + this.setZero(time, 2) + ":00:00.000Z");
			data.setValue("fEndTime", date + "T" + this.setZero((time * 1 + 1), 2) + ":00:00.000Z");
		}
	};
	
	
	//打开参会人员对话框
	Model.prototype.button1Click = function(event) {
		this.comp("dialogMeetPsn").open();
	};
	
	//对话框返回
	Model.prototype.dialogMeetPsnReceive = function(event){
    
		var personCount = 0;
		var sNames = "";
		var sPersonIDs = "";
		var dPerson = this.comp('dUsePerson');
		var sPersonIDs = "";
		var rows = event.data;
		var len = rows.length;
		for ( var i = 0; i < len; i++) {
			var rowID = rows[i].getID();
			var sPersonId = rows[i].val("sPersonID");
			var sName = rows[i].val("sName");
			var fOrgKind = 'psn';
			var fOrgFullID = rows[i].val("sFID");
			var fOrgFullName = rows[i].val("sFName");
			
			if (sPersonIDs.indexOf(rowID + ",") != -1)

//				continue;
			sPersonIDs += rowID + ",";
			sNames += sName + ",";
			dPerson.newData({
				defaultValues : [ {
					'fOrgKind' : fOrgKind,
					'fOrgID' : sPersonId,
					'fOrgName' : sName,
					'fPersonID' : sPersonId,
					'fPersonName' : sName,
					'fRangeURL' : fOrgFullID,
					'fRangeURLName' : fOrgFullName,
					'version' : 0
				} ]
			});
		}

		if (sNames != "") {
			sNames = sNames.substring(0, sNames.length - 1);
			if (sNames.length > 1020) {
				sNames = sNames.substring(0, 1020) + "...";
			}
		}
		var outPsns = this.comp("mainData").getValue("fOutPsns");
		if (outPsns != "" && outPsns != null) {
			var psnArray = outPsns.split(",");
			var psnLen = psnArray[psnArray.length - 1] == "" ? psnArray.length - 1 : psnArray.length
			personCount = psnLen + len;
		} else {
			personCount = len;
		}
		this.comp("mainData").setValue("fMeetPsns", sNames);
		this.comp("mainData").setValue("fMeetPsnNum", personCount);
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