define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.grid3RowClick = function(event){
		var mainData = this.comp("mainData");
		var url = require.toUrl("$UI/OA/asset/process/assetRepairApplyQuery/detailActivity.w?process=/OA/asset/process/assetRepairApplyQuery/assetRepairApplyQueryProcess&activity=assetRepairApplyQueryActivity&data=" + mainData.getCurrentRowID());
		justep.Portal.openWindow(url, {title: "资产维修申请详细"});
	};

	return Model;
});