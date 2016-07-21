define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.grid3RowClick = function(event) {

		var row = this.comp("mainData").getCurrentRow();
		if (!row) {
			return;
		}
		this.openDetail(row.getID());

	};

	Model.prototype.openDetail = function(id) {
		var ctx = this.getContext();

		var process = ctx.getCurrentProcess();
		var activity = ctx.getCurrentActivity();
		var url = "";

		var openPortalOperator = "view";
		url = "$UI/OA/asset/process/assetUseApplyQuery/detailActivity.w?process=" + process + "&activity=" + activity + "&id=" + id;

		justep.Portal.openWindow(url, {
			title : "设备使用申请详细信息"
		});
	};

	Model.prototype.statusSelectUpdateValue = function(event) {

		var data = this.comp("mainData");
		var status = event.source.value;

		if (status == "" || status == null) {

			data.filters.setFilter("statefilter", " 1=1 ");
		} else {
			status = status.replace(/\,/g, "','");
			data.filters.setFilter("statefilter", "OA_AS_UseApplyM.fBizState in('" + status + "') ");
		}
		data.refreshData();
	};

	return Model;
});