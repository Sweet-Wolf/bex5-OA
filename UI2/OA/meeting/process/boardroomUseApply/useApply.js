define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Model = function() {
		this.callParent();
		this.outPsnCount = 0;
	};
	Model.prototype.fMeetPsnsHideOption = function(event) {
		var data = this.getMainData();
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
	Model.prototype.getMainData = function() {
		return this.comp("mainData");
	}

	Model.prototype.showDetailClick = function(event) {
		var data = this.getMainData();
		var boardRoomInfoDlg = this.comp("boardRoomInfo");
		var fBoardRoomID = data.getValue("fBoardroomID");
		boardRoomInfoDlg.open({
			data : fBoardRoomID
		});
	};

	Model.prototype.wDlgMeetPsnReceive = function(event) {
		var personCount = 0;
		var sNames = "";
		var sPersonIDs = "";
		var dPerson = this.comp('dUsePerson');
		var sPersonIDs = "";
		var rows = event.data;
		var len = rows.length;
		for ( var i = 0; i < len; i++) {
			;
			var rowID = rows[i].getID();
			var sPersonId = rows[i].val("sPersonID");
			var sName = rows[i].val("sName");
			var fOrgKind = 'psn';
			var fOrgFullID = rows[i].val("sFID");
			var fOrgFullName = rows[i].val("sFName");
			if (sPersonIDs.indexOf(rowID + ",") != -1)
				continue;
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

	Model.prototype.btnSelectPsnClick = function(event) {
		this.comp("wDlgMeetPsn").open();
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

	Model.prototype.setZero = function(value, scope) {
		value = value + "";
		var len = scope - value.length;
		for ( var i = 0; i < len; i++)
			value = "0" + value;
		return value;
	};

	Model.prototype.button2Click = function(event) {
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var roomID = this.comp("mainData").getValue("fBoardroomID");
		var url = "$UI/OA/meeting/process/boardroomArrangeQuery/boardroomArrangeQuery.w?process=" + process + "&activity=" + activity + "&roomID=" + roomID;

		justep.Portal.openWindow(url, {
			title : "会议室安排查询"
		});
	};

	Model.prototype.mainDataValueChanged = function(event) {
		var data = this.comp('mainData');
		if (event.col == "fApplyDeptID") {
			data.setValue("fApplyPsnID", "");
			data.setValue("fApplyPsnName", "");
		}
	};

	Model.prototype.mainDataBeforeSave = function(event) {
		;
		var psnID = this.getContext().getCurrentPersonID();
		var psnName = this.getContext().getCurrentPersonName();

		var time = justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT);
		var data = this.comp('mainData');

		data.setValue("fUpdatePsnID", psnID);
		data.setValue("fUpdatePsnName", psnName);
		data.setValue("fUpdateTime", time);
		if ((data.getValue("fCreatePsnID") == "") || (data.getValue("fCreatePsnID") == null))
			data.setValue("fCreatePsnID", psnID);
		if ((data.getValue("fCreatePsnName") == "") || (data.getValue("fCreatePsnName") == null))
			data.setValue("fCreatePsnName", psnName);
		if ((data.getValue("fCreateTime") == "") || (data.getValue("fCreateTime") == null))
			data.setValue("fCreateTime", time);
	};

	return Model;
});
