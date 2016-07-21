define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	var mainData="";
	Model.prototype.dInventoryListCellRender = function(event){
		mainData=this.comp("dInventoryD");
		mainData.to(event.row.getID());
		if(event.colName=="inventory"){
			event.html="<a href='javascript:;' class='open'>"+mainData.getValue("fInventoryNO")+"</a>";
		}		
	};
	
	Model.prototype.dInventoryListRowClick = function(event){
		var linkObj=$(event.domEvent.target);
		if(linkObj.hasClass("open")){
			var url = require.toUrl("$UI/OA/asset/process/assetCard/assetCardDetailActivity.w?process=/OA/asset/process/assetCard/assetCardProcess&activity=assetCardActivity&data=" + mainData.getValue("fAssetID"));
			justep.Portal.openWindow(url, {title: "资产卡片"});
		}
	};

	return Model;
});