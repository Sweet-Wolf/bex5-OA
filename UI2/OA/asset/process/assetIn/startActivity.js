define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.newBtnClick = function(event) {
		var url = require.toUrl("$UI/OA/asset/process/assetIn/detailActivity.w?process=/OA/asset/process/assetIn/assetInProcess&activity=startActivity&t=new");
		justep.Portal.openWindow(url, {title: "资产入库管理新增"});
	};

	Model.prototype.orderTablesRowDblClick = function(event){
		var mainData = this.comp("mainData");
		var url = require.toUrl("$UI/OA/asset/process/assetIn/detailActivity.w?process=/OA/asset/process/assetIn/assetInProcess&activity=startActivity&t=edit&data=" + mainData.getCurrentRowID());
		justep.Portal.openWindow(url, {title: "资产入库管理详细"});
	};

	Model.prototype.mainDataAfterDelete = function(event){
		justep.Util.hint("删除成功！", {type: 'success', parent: this.getRootNode()});
	};
	
	
	return Model;
});