define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function() {
		this.callParent();
	};

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

	Model.prototype.gotoDetail = function(event) {
		this.showSchedule({
			'rowid' : event.rowID
		});
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
			title : '公共日程安排查询'
		});
	};

	Model.prototype.dPersonIndexChanged = function(event) {
		this.refreshDatas();
	};

	Model.prototype.generateConditionQuery = function() {
		var ins = this.comp("dPerson");
		var currentSharedPersonFID = ins.getCurrentRowID();
		if (currentSharedPersonFID != '') {
			var sharePsnFilter = "OA_SD_Schedule IN ( SELECT e.fSDMasterID FROM OA_SD_Executor e WHERE e.fExecutorID ='" + currentSharedPersonFID + "')" + " AND OA_SD_Schedule.fIsShared=1 ";
		} else {
			sharePsnFilter = "1=0";
		}
		return sharePsnFilter;
	};

	Model.prototype.refreshListData = function() {
		var sharePsnFilter = this.generateConditionQuery();
		this.lastTab = "listTab";
		this.comp("dList").setFilter("listSharedPsnFilter", (sharePsnFilter == "" ? "1=0" : sharePsnFilter));
		this.comp("dList").refreshData();
	};

	Model.prototype.refreshDatas = function() {
		var self = this;
		if (this.lastTab === 'listTab')
			this.refreshListData();
		else
			this.comp("calendar").refresh();
	};

	Model.prototype.listTabClick = function(event) {
		this.lastTab = 'listTab';
		this.refreshListData();
	};

	Model.prototype.li1Click = function(event) {
		this.lastTab = 'scheduleTab';
		this.comp("calendar").refresh();
	};

	Model.prototype.modelLoad = function(event) {
		this.prepareOrgFilter(this.prepareSharedPersonList());
		// this.generateConditionQuery();
	};

	// 共享给我的人的列表
	Model.prototype.prepareSharedPersonList = function() {
		var options = {
			activity : this.getContext().getActivity(),
			process : this.getContext().getProcess(),
			action : "queryWhoShared2MeAction",
		};
		var r = biz.Request.sendBizRequest(options);
		if (!biz.Request.isBizSuccess(r.responseJSON)) {
			throw new Error(biz.Request.getServerError(r.responseJSON, "获取共享人员失败!"));
		}
		return r.responseJSON.data.value;
	};

	Model.prototype.prepareOrgFilter = function(sharedPersonFID) {
		if (sharedPersonFID == null) {
			this.comp("dPerson").setFilter("sharedPersonFilter", "V_SA_OPPerson=''");
			this.comp("dPerson").refreshData();
			return;
		}
		var psnFilter = '';
		var persons = sharedPersonFID.split(',');
		for ( var i = 0; i < persons.length; i++) {
			var person = persons[i];
			if (person && person != '') {
				psnFilter += "OR (V_SA_OPPerson='" + person + "') ";
			}
		}
		if (psnFilter != "") {
			psnFilter = psnFilter.substring(3, psnFilter.length);
		} else {
			psnFilter = "AND (1>2)";
		}
		this.comp("dPerson").filters.setFilter("sharedPersonFilter", psnFilter);
		this.comp("dPerson").refreshData();
	};

	Model.prototype.refreshScheduleData = function() {
		this.comp('dSchedule').setFilter("scheduleSharedPsnFilter", this.generateConditionQuery());
		this.comp("dSchedule").refreshData();
	};

	return Model;
});