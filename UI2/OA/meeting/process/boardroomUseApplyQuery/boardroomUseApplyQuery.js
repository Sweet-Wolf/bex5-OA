define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.listTablesRowDblClick = function(event) {
		//这样有问题
		var fID = event.rowID;
		var url = new justep.URL(require.toUrl("$UI/OA/meeting/process/boardroomUseApplyQuery/useApplyDetail.w"));
		url.setParam('applyID',fID);
		url.setParam('process',this.getContext().getProcess());
		url.setParam('activity',this.getContext().getActivity());
		justep.Portal.openWindow(url.toString(),{title:'会议室申请详细'});
	};

	

	return Model;
});