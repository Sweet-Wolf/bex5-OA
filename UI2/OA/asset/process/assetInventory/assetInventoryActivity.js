define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};	
	
	var mainData="";
	Model.prototype.assetInventoryTablesCellRender = function(event){
		mainData=this.comp("dAssetInventory");
		mainData.to(event.row.getID());
		if(event.colName == "inventory"){
			event.html = "<a href='javascript:;' class='view'>查看</a>";
		}
		if(event.colName == "fCode"){
			event.html = "<a href='javascript:;' class='card'>"+mainData.getValue("fCode")+"</a>";
		}		
	};
	
	Model.prototype.assetInventoryTablesRowClick = function(event){
		var aLink = $(event.domEvent.target);
        var obj = this.comp("wDlgInventoryRecord");
        var cardDialog=this.comp("assetCardDialog");
        if (aLink.hasClass("view")) {
        	this.openInventoryRecord(event.row.getID(),obj);
        }
        if (aLink.hasClass("card")) {
        	this.openCard(event.row.getID(),cardDialog);
        }
        
	};
	
	Model.prototype.openInventoryRecord = function(assetID,wDlgAssetInRecord){
		var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
		var url = "$UI/OA/asset/process/dialog/inventoryRecord/inventoryRecord.w?process="+process+"&activity="+activity+"&data=" + assetID;
		justep.Portal.openWindow(url, {title: "资产清查记录"});
		
	}
	
	Model.prototype.openCard = function(assetID,wDlgAssetInRecord){
	/*	var url=require.toUrl("$UI/OA/asset/process/assetCard/assetCardDetailActivity.w");			
		wDlgAssetInRecord.initEveryTimes = true;		
		wDlgAssetInRecord.open({src:url,data:{assetID:assetID}});
		*/

		var url = require.toUrl("$UI/OA/asset/process/assetCard/assetCardDetailActivity.w?process=/OA/asset/process/assetCard/assetCardProcess&activity=assetCardActivity&data=" + assetID);
		justep.Portal.openWindow(url, {title: "资产卡片"});
	
		
	}
	
	Model.prototype.newBtnClick = function(event){		
		var assetIDStr = "";
		var checkedIDs = this.comp("assetInventoryTables").getCheckeds();
		var len = checkedIDs.length;
		
		if (len == 0) {
			alert("您没选择任何要清查的资产，请先选择！");
		} else {
			for (var i = 0; i < len; i++) {
				if (assetIDStr == "") {
					assetIDStr = checkedIDs[i].val("OA_AS_Card");
				} else {
					assetIDStr += "," + checkedIDs[i].val("OA_AS_Card");
				}
			}
			
			var wDlgInsertInventory = this.comp("wDlgInsertInventory");
			var url=require.toUrl("$UI/OA/asset/process/dialog/insertInventory/insertInventory.w");
			wDlgInsertInventory.initEveryTimes = true;
			wDlgInsertInventory.open({src:url,data:{assetID:assetIDStr,dlgOperator:"news"}});

		}

	};
	
	return Model;
});


