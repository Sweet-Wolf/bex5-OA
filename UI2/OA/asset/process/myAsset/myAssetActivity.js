define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event) {
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};	

	Model.prototype.trgConfirmClick = function(event){	
		var data = this.comp('mainData');		
		var gridData = this.comp('listData').getCheckeds();		
		if(gridData.length > 0){
			for(var i=0; i<gridData.length; i++){
				data.setValue("fAssetConfirm","已确认",gridData[i]);
			}
			data.saveData();
		}	
	};
	
	Model.prototype.listDataCellRender = function(event){
		var mainData=this.comp("mainData");
		mainData.to(event.row.getID());
		if(event.colName == "fCode"){
			event.html = "<a href='javascript:;' class='card'>"+mainData.getValue("fCode")+"</a>";
		}
	};
	
	Model.prototype.listDataRowClick = function(event){
		var aLink = $(event.domEvent.target); 
		if (aLink.hasClass("card")) {
			var url = require.toUrl("$UI/OA/asset/process/assetCard/assetCardDetailActivity.w?process=/OA/asset/process/assetCard/assetCardProcess&activity=assetCardActivity&data=" + event.row.getID());
			justep.Portal.openWindow(url, {title: "资产卡片"});
    	}
	};
	
	return Model;
});