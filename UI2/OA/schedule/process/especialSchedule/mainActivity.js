define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.showSchedule = function(param) {
		var url = new justep.URL(require.toUrl('$UI/OA/schedule/process/especialSchedule/schedule.w'));
		url.setParam({
			activity : this.getContext().getActivity()
		});
		url.setParam({
			process : this.getContext().getProcess()
		});
		url.setParam(param);
		justep.Portal.openWindow(url.toString(), {
			title : '领导日程安排'
		});
	};

	Model.prototype.newData = function(event) {
		this.showSchedule({
			action : 'new'
		})
	};

	Model.prototype.dataTables1RowDblClick = function(event) {
		this.showSchedule({
			rowid : event.rowID
		});
	};

	return Model;
});