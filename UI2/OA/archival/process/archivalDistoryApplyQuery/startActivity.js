define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.dataTables1RowDblClick = function(event){
		var mainData=this.comp("mainData");
		var url = require.toUrl("$UI/OA/archival/process/archivalDistoryApplyDetail/detailActivity.w?process=/OA/archival/process/archivalDistoryApply/archivalDistoryApplyProcess&activity=startActivity&data=" + mainData.getCurrentRowID());
		justep.Portal.openWindow(url, {title: "档案销毁详细"});
	};
	

	return Model;
});