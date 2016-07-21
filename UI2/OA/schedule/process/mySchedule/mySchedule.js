define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {

	};

	Model.prototype.refreshScheduler = function() {
		this.refreshScheduleData()
		var dSchedule = this.comp("dSchedule");
		var returnData = [];
		var i = 0;
		var self = this;
		dSchedule.each(function(param) {
			i++;
			var row = param.row;
			var text = row.val('fTitle');
			var startTime = row.val('fBeginTime').getTime();
			var endTime = row.val('fEndTime').getTime();
			returnData.push({
				'id' : i,
				'title' : text,
				'url' : 'javascript:',
				'class' : 'event-warning',
				'start' : startTime,
				'end' : endTime,
			});
		})
		return returnData;
	};
	
	Model.prototype.refreshScheduleData = function() {
		var IDFilter = "OA_SD_Schedule IN ( SELECT e.fSDMasterID FROM OA_SD_Executor e WHERE e.fExecutorID ='" + this.getContext().getCurrentPersonID() + "')";
		this.comp("dSchedule").setFilter("IDFilter", IDFilter);
		this.comp("dSchedule").refreshData();
	}

	Model.prototype.monthBtnClick = function(event) {
		this.setCalendarView('month');
	};

	Model.prototype.weekBtnClick = function(event) {
		this.setCalendarView('week');
	};

	Model.prototype.dayBtnClick = function(event) {
		this.setCalendarView('day');
	};

	Model.prototype.prevBtnClick = function(event) {
		this.gotoDay('prev');
	};

	Model.prototype.todayBtnClick = function(event) {
		this.gotoDay('today');
	};

	Model.prototype.nextBtnClick = function(event) {
		this.gotoDay('next');
	};

	Model.prototype.gotoDay = function(value) {
		this.comp('calendar').navigate(value);
	};

	Model.prototype.setCalendarView = function(value) {
		this.comp("calendar").setView(value);
	};

	Model.prototype.calendarEventsLoad = function(event) {
		return this.refreshScheduler();
	};
	
	Model.prototype.showSchedule = function(param) {
		var url = new justep.URL(require.toUrl('$UI/OA/schedule/process/schedule/schedule.w'));
		url.setParam({
			activity : this.getContext().getActivity()
		});
		url.setParam({
			process : this.getContext().getProcess()
		});
		url.setParam(param);
		justep.Portal.openWindow(url.toString(), {
			title : '日程安排'
		});
	};

	Model.prototype.deleteSchedule = function(event) {
		var ensureDeleteAlert = this.comp("ensureDeleteAlert");
		var self = this;
		ensureDeleteAlert.show({
			callback : function(param) {
				if (param.button === 'yes') {
					var mainInstance = self.comp("dList");
					var fCreatePsnID = mainInstance.getValue('fCreatePsnID');
					var currentPsnID = self.getContext().getCurrentPersonID();
					if (fCreatePsnID !== currentPsnID) {
						self.showAlert({
							text : '您没有删除权限！',
							type : 'warning'
						})
						return;
					}
					var rowid = mainInstance.getCurrentRowID();
					self.callDeleteSchedule(rowid);
					self.refreshListData();
				}
			}
		});
	};

	Model.prototype.callDeleteSchedule = function(fID) {
		var options = {};
		var process = this.getContext().getProcess();
		var activity = this.getContext().getActivity();
		var param = new biz.Request.ActionParam();
		var action = "deleteScheduleAction";
		param.setString('fID', fID);
		options.activity = activity;
		options.process = process;
		options.action = action;
		options.parameters = param;
		var r = biz.Request.sendBizRequest(options);
		if (!biz.Request.isBizSuccess(r.responseJSON)) {
			throw new Error(biz.Request.getServerError(r, "删除日程失败"));
		} else {
			this.showAlert({
				text : '删除成功！'
			});
		}
		return true;
	}

	Model.prototype.showAlert = function(param) {
		var text = param.text;
		var type = param.type || 'success';
		justep.Util.hint(text, {
			type : type,
			parent : this.getRootNode()
		});
	};

	Model.prototype.li2Click = function(event) {
		this.refreshListData();
	};

	Model.prototype.refreshListData = function() {
		var IDFilter = "OA_SD_Schedule IN ( SELECT e.fSDMasterID FROM OA_SD_Executor e WHERE e.fExecutorID ='" + this.getContext().getCurrentPersonID() + "')";
		this.comp("dList").setFilter("IDFilter", IDFilter);
		this.comp("dList").refreshData();
	}

	Model.prototype.newSchedule = function(event) {
		this.showSchedule({
			'action' : 'new'
		});
	};

	Model.prototype.gotoDetail = function(event) {
		this.showSchedule({
			'rowid' : event.rowID
		});
	};

	Model.prototype.modelActive = function(event) {
		this.refreshListData();
	};

	Model.prototype.refreshCalendar = function(event){
		this.comp("calendar").refresh();
	};

	return Model;
});