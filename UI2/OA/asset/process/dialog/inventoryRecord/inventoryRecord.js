define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.result = function(){
		//这里实现返回的逻辑
	};

	Model.prototype.OKBtnClick = function(event){
		this.comp('wReceiver').windowEnsure(this.result());
	};
	
	var assetID="", mainData="";
	
	Model.prototype.wReceiverReceive = function(event){
		assetID=event.data.assetID;
		mainData=this.comp("dInventoryD");
		mainData.filters.setFilter("RMFilter","OA_AS_InventoryD.fAssetID='" + assetID + "'");
		mainData.refreshData();
	};

	Model.prototype.newBtnClick = function(event){
		var dialog = this.comp("wDlgInsertInventory");
		var url=require.toUrl("$UI/OA/asset/process/dialog/insertInventory/insertInventory.w");			
		dialog.initEveryTimes = true;
		dialog.open({src:url,data:{dlgOperator:"new",assetID:assetID}});		
	};

	Model.prototype.wDlgInsertInventoryReceive = function(event){
		mainData.refreshData();
	};

	Model.prototype.dInventoryListCellRender = function(event){
		if(event.colName=="inventory"){
			event.html="<a href='javascript:;' class='edit'>修改</a>";
		}
	};

	Model.prototype.dInventoryListRowClick = function(event){
		var linkObj=$(event.domEvent.target);
		var dialogObj=this.comp("wDlgUpdateInventory");
		if(linkObj.hasClass("edit")){
			this.openInventoryRecord(mainData.getValue("fInventoryID"),dialogObj);
		}
	};
	
	Model.prototype.openInventoryRecord=function(assetID,dialogObj){
		var url=require.toUrl("$UI/OA/asset/process/dialog/insertInventory/insertInventory.w");			
		dialogObj.initEveryTimes = true;		
		dialogObj.open({src:url,data:{dlgOperator:"edit",assetID:assetID}});
	}
	
	Model.prototype.wDlgUpdateInventoryReceive = function(event){
		mainData.refreshData();
	};
	
	Model.prototype.modelModelConstructDone = function(event){
	    debugger;
		assetID=this.getContext().getRequestParameter("data");
		mainData=this.comp("dInventoryD");
		mainData.filters.setFilter("RMFilter","OA_AS_InventoryD.fAssetID='" + assetID + "'");
		mainData.refreshData();
	};
	
	return Model;
});