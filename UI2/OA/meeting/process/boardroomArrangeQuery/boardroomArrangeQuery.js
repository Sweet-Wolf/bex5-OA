define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	// require("http://www.bejson.com/xml2json/xj/js/ObjTree.js");
	// require("http://www.bejson.com/xml2json/xj/js/jkl-dumper.js");
	// var util = require("$UI/luzs/common");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.setDefaultDate = function(dCondition) {
		dCondition = dCondition || this.comp("dCondition");
		now = new Date();
		var nowDayOfWeek = now.getDay();
		nowDayOfWeek -= 1;
		var nowDay = now.getDate();
		var nowMonth = now.getMonth();
		var nowYear = now.getYear();
		nowYear += (nowYear < 2000) ? 1900 : 0;
		var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
		var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
		dCondition.setValue("dateBegin", justep.Date.toString(weekStartDate, "yyyy-MM-dd"));
		dCondition.setValue("dateEnd", justep.Date.toString(weekEndDate, "yyyy-MM-dd"));
		dCondition.setValue("listBegin", justep.Date.toString(weekStartDate, "yyyy-MM-dd"));
		dCondition.setValue("listEnd", justep.Date.toString(weekEndDate, "yyyy-MM-dd"));
		dCondition.setValue("roomDate", justep.Date.toString(now, "yyyy-MM-dd"));
	};

	Model.prototype.modelLoad = function(event) {
		var roomID = this.getContext().getRequestParameter('roomID') || this.comp("dBoardroom").getCurrentRowID();
		var dCondition = this.comp("dCondition");
		var dArrange = this.comp("dArrange");
		var dRoom = this.comp("dBoardroom");
		// var reportData = this.comp('dReport');
		var now = new Date();
		var nowTime = justep.Date.toString(now, "yyyy-MM-dd");
		dCondition.setValue("weekDate", nowTime);
		this.setDefaultDate(dCondition);
		var rows = dRoom.find([ 'OA_MT_Boardroom' ], [ roomID ], true, true, true);
		if (rows.length === 1) {
			dCondition.setValue("dateRoomID", roomID);
			dCondition.setValue("roomIDs", roomID);
			dCondition.setValue("dateRoomName", rows[0].val('fName'));
			dCondition.setValue("roomNames", rows[0].val('fName'));
		}
		dCondition.setValue("listRoomID", roomID);

		if (roomID != "" && roomID != null) {
			dArrange.setFilter("roomFilterSchedule", "fBoardroomID='" + roomID + "'");
		}
		var dateFilterStr = "(:toDate('" + justep.Date.toString(dCondition.getValue("dateBegin"), "yyyy-MM-dd") + "')<OA_MT_RoomArrange.fArrTime) AND (:toDate('"
				+ justep.Date.toString(dCondition.getValue("dateEnd"), "yyyy-MM-dd") + "')>OA_MT_RoomArrange.fArrTime)";
		dArrange.setFilter("dateFilterSchedule", dateFilterStr);
		dArrange.setFilter("effectFilter", "OA_MT_RoomArrange.fEffect=1");
		dArrange.refreshData();
		this.drawTable();
		this.init();
	};

	Model.prototype.drawTable = function() {
		var dCondition = this.comp("dCondition");
		var url = require.toUrl('$UI/OA/meeting/process/boardroomArrangeQuery/dateQuery/dateURL.j');
		var iframeID = "dateIframe";
		var roomID = this.comp("dCondition").getValue('dateRoomID');
		var param = "<form>" + "<date-begin>" + justep.Date.toString(dCondition.getValue("dateBegin"), "yyyy-MM-dd") + "</date-begin>" + "<date-end>"
				+ justep.Date.toString(dCondition.getValue("dateEnd"), "yyyy-MM-dd") + "</date-end>" + "<date-roomid>" + roomID + "</date-roomid>" + "<date-roomname/>" + "<room-date/>" + "<roomids/>"
				+ "<room-IDs/>" + "<room-names/>" + "</form>";
		biz.Request.callURL(url, iframeID, param);
	}

	// 根据日期来确定当前周
	Model.prototype.getWeekDate = function(dateTime) {
	    debugger;
	    if(dateTime == undefined)
	    	return;
		var times = dateTime.split("-");
		var year = times[0];
		var month = times[1] - 1;
		var nowDate = new Date(year, month, times[2]);
		var day = nowDate.getDay();
		var date = nowDate.getDate();
		switch (day) {
		case 0:
			date -= 6;
			break;
		case 1:
			break;
		case 2:
			date -= 1;
			break;
		case 3:
			date -= 2;
			break;
		case 4:
			date -= 3;
			break;
		case 5:
			date -= 4;
			break;
		case 6:
			date -= 5;
			break;
		}
		var startDate = new Date(year, month, date);
		var endDate = new Date(year, month, date + 6);
		var weekBeginDate = justep.Date.toString(startDate, "yyyy-MM-dd");
		var weekEndDate = justep.Date.toString(endDate, "yyyy-MM-dd");
		return weekBeginDate + "," + weekEndDate;
	}

	Model.prototype.dConditionValueChanged = function(event) {
		var colname = event.col;
		if (this.contains('dateBegin,dateEnd,dateRoomID', colname)) {
			this.refreshScheduleData();
		}
		if (this.contains('roomDate,roomIDs', colname)) {
			this.refreshRoomData();
		}
	};

	Model.prototype.contains = function(val, containVal) {
		val = val.split(',');
		var flag = false;
		$.each(val, function(i, n) {
			if (n === containVal) {
				flag = true;
				return false;
			}
		})
		return flag;
	}

	Model.prototype.btnApply = function(event) {
		var fID = this.comp("dCondition").getValue("dateRoomID");
		var process = "/OA/meeting/process/boardroomUseApply/boardroomUseApplyProcess";
		var activity = "useApply";
		var url = new justep.URL(require.toUrl("$UI/OA/meeting/process/boardroomUseApply/useApply.w"));
		url.setParam({
			'process' : process
		});
		url.setParam({
			'activity' : activity
		});
		url.setParam({
			'roomID' : fID
		});
		justep.Portal.openWindow(url.toString(), {
			title : '会议室申请'
		});
	};

	Model.prototype.meetingApply = function(date, time, roomID, roomName, state) {
		roomID = roomID || this.comp("dCondition").getValue('dateRoomID');
		if (state == '申请中') {
			if (!confirm(roomName + "在" + date + " " + time + ":00至" + (time * 1 + 1) + ":00已被申请,是否继续申请？"))
				return;
		} else if (state == '已安排') {
			if (!confirm(roomName + "在" + date + " " + time + ":00至" + (time * 1 + 1) + ":00已被占用,是否继续申请？"))
				return;
		}
		var process = "/OA/meeting/process/boardroomUseApply/boardroomUseApplyProcess";
		var activity = "useApply";
		var url = "$UI/OA/meeting/process/boardroomUseApply/useApply.w?process=" + process + "&activity=" + activity + "&roomID=" + roomID + "&date=" + date + "&time=" + time;
		justep.Portal.openWindow(url, {
			title : '会议室申请'
		});
	};

	Model.prototype.init = function() {
		var self = this;
		var dateIframe = document.getElementById('dateIframe')
		if (dateIframe.attachEvent) {
			dateIframe.attachEvent("onload", function() {
				$("#dateIframe")[0].contentWindow.initParam(self);
			});
		} else {
			dateIframe.onload = function() {
				$("#dateIframe")[0].contentWindow.initParam(self);
			};
		}
		var roomIframe = document.getElementById('roomIframe')
		if (roomIframe.attachEvent) {
			roomIframe.attachEvent("onload", function() {
				$("#roomIframe")[0].contentWindow.initParam(self);
			});
		} else {
			roomIframe.onload = function() {
				$("#roomIframe")[0].contentWindow.initParam(self);
			};
		}
	};

	Model.prototype.refreshScheduleData = function() {
		var dCondition = this.comp("dCondition");
		var dArrange = this.comp("dArrange");
		var roomID = dCondition.getValue("dateRoomID");
		if (roomID != "" && roomID != null) {
			dArrange.setFilter("roomFilterSchedule", "fBoardroomID='" + roomID + "'");
		}
		var dateBegin = dCondition.getValue("dateBegin");
		var dateEnd = dCondition.getValue("dateEnd");
		if (dateBegin && dateEnd) {
			if (dateEnd < dateBegin) {
				justep.Util.hint('结束时间必须大于开始时间！请重新选择时间区间！', {
					type : 'warning',
					parent : this.getRootNode()
				});
				return false;
			} else {
				var dateFilterStr = "(:toDate('" + dateBegin + "')<fArrTime)AND(:toDate('" + dateEnd + "')>fArrTime)";
				dArrange.setFilter("dateFilterSchedule", dateFilterStr);
				dArrange.setFilter("effectFilter", "fEffect=1");
				dArrange.refreshData();
				this.drawTable();
			}
		}
	};

	Model.prototype.tabArrangeClick = function(event) {
		this.refreshRoomData();
	};

	Model.prototype.refreshRoomData = function() {
		var dCondition = this.comp("dCondition");
		var roomDate = dCondition.getValue("roomDate");
		var roomIds = dCondition.getValue("roomIDs");
		if (roomIds != "" && roomIds != null && roomIds != undefined) {
			var roomIDArr = roomIds.split(" ");
			var roomFilterStr = "(";
			var roomIDStr = "(";
			for ( var i = 0; i < roomIDArr.length; i++) {
				if (i == 0) {
					roomFilterStr += "fBoardroomID='" + roomIDArr[i] + "'";
					roomIDStr += "OA_MT_Boardroom='" + roomIDArr[i] + "'";
				} else {
					roomFilterStr += " OR fBoardroomID='" + roomIDArr[i] + "'";
					roomIDStr += " OR OA_MT_Boardroom='" + roomIDArr[i] + "'";
				}
			}
			roomFilterStr += ")";
			roomIDStr += ")";
			var param = "<form>" + "<date-begin/>" + "<date-end/>" + "<date-roomid/>" + "<date-roomname/>" + "<room-date>" + roomDate + "</room-date>" + "<roomids>" + roomIDStr + "</roomids>"
					+ "<room-IDs>" + roomFilterStr + "</room-IDs>" + "<room-names/>" + "</form>";
			var iframeID = "roomIframe";
			var url = require.toUrl("$UI/OA/meeting/process/boardroomArrangeQuery/roomQuery/roomURL.j");
			biz.Request.callURL(url, iframeID, param);
		}
	};

	Model.prototype.weekRoomDateChange = function(event) {
	   
		var reportData = this.comp("dReport");
		var weekTime = this.getWeekDate(event.value);
		debugger;
		if(weekTimes == undefined)
		    return;
		var weekTimes = weekTime.split(",");
		if (weekTimes.length = 2) {
			reportData.setStringVar('param', weekTimes);
			this.comp("mixedChart").refresh();
		}
	};

	return Model;
});