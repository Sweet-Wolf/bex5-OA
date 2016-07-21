define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.listTablesRowDblClick = function(event) {
		var rowID = event.rowID;
		if (rowID) {
			var url = new justep.URL(require.toUrl("$UI/OA/license/process/licenseApplyQuery/signatureApplyDetail.w"));
			url.setParam('rowID', rowID);
			url.setParam('process', this.getContext().getProcess());
			url.setParam('activity', this.getContext().getActivity());
			justep.Portal.openWindow(url.toString(), {
				title : '证照借用申请详细信息'
			});
		}
	};

	return Model;
});