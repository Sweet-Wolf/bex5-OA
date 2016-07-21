define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.orderTablesRowDblClick = function(event) {
		var mainData = this.comp("mainData");
		var data = event.rowID;
		if (data) {
			var url = require.toUrl("$UI/OA/asset/process/assetBuyApplyQuery/detailActivity.w?process=/OA/asset/process/assetBuyApplyQuery/assetBuyApplyQueryProcess&activity=startActivity&data="
					+ data);
			justep.Portal.openWindow(url, {
				title : "资产采购查询详细"
			});
		}
	};

	return Model;
});