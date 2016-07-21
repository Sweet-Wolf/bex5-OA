define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.mainGridRowDblClick = function(event) {
		var rowID = event.rowID;
		if (rowID) {
			var url = new justep.URL(require.toUrl("$UI/OA/license/process/licanseAnnualReminder/licanseAnnualReminderDetail.w"));
			url.setParam('rowID', rowID);
			url.setParam('process', this.getContext().getProcess());
			url.setParam('activity', this.getContext().getActivity());
			justep.Portal.openWindow(url.toString(), {
				title : '证照详细信息'
			});
		}
	};

	Model.prototype.modelLoad = function(event) {
		var data = this.getMainData();
		var date = new Date();
		var date1 = justep.Date.toString(date, "yyyy-MM-dd");
		date.setDate(date.getDate() + 31);
		var date2 = justep.Date.toString(date, "yyyy-MM-dd");
		data.setFilter("reminderFilter1", "fValidityDate > stringToDate('" + date1 + "')");
		data.setFilter("reminderFilter2", "fNextExamDate < stringToDate('" + date2 + "')");
		data.refreshData();
	};
	Model.prototype.getMainData = function() {
		return this.comp("mainData");
	}

	return Model;
});