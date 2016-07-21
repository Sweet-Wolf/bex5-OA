define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
	var mainData="";
		
	Model.prototype.modelLoad = function(event){		
		mainData = this.comp("mainData");
		var type = this.getContext().getRequestParameter("type");
		if(type=="new"){
			mainData.newData();
		} else {
			var data = this.getContext().getRequestParameter("data");
			if (data){
				var filter = "OA_AS_Card='" + data + "'";
				mainData.setFilter("____dataFilter_", filter);
				mainData.refreshData(); 
			}
		}
	};

	Model.prototype.wReceiverReceive = function(event){
		var assetID=event.data.assetID;
		mainData = this.comp("mainData");
		mainData.filters.setFilter("RMFilter","OA_AS_Card='" + assetID + "'");			
		mainData.refreshData();
	};
	
	Model.prototype.trgAssetInRecordClick = function(event){		
		var assetInID = mainData.getValue("fAssetInID");
		if(typeof(assetInID)=="undefined"){
			assetInID="";
		}
		var dlgOperator = "view";
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetInViewDialog/assetInViewDialog.w");
		if (assetInID == '') {
			var assetCardID = mainData.getValue("fCode");
			if(typeof(assetCardID)=="undefined"){
				assetCardID="";
			}
			alert("资产：" + assetCardID + "没有入库信息！");
		} else {
			var wDlgAssetInRecord = this.comp("wDlgAssetInRecord");
			wDlgAssetInRecord.initEveryTimes = true;
			wDlgAssetInRecord.open({src:url,data:{operator:dlgOperator,assetInID:assetInID}});
		}
	};

	Model.prototype.trgBuyRecordClick = function(event){
		var assetInID = mainData.getValue("fBuyApplyNO");
		if(typeof(assetInID)=="undefined"){
			assetInID="";
		}
		var dlgOperator = "view";
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetBuyRecord/assetBuyRecord.w");
		if (assetInID == '') {
			var assetCardID = mainData.getValue("fCode");
			if(typeof(assetCardID)=="undefined"){
				assetCardID="";
			}
			alert("资产：" + assetCardID + "没有采购信息！");
		} else {
			var wDlgAssetInRecord = this.comp("wDlgBuyRecord");
			wDlgAssetInRecord.initEveryTimes = true;
			wDlgAssetInRecord.open({src:url,data:{operator:dlgOperator,assetInID:assetInID}});
		}
	};
	
	Model.prototype.trgCheckClick = function(event){
		var checkID = mainData.getValue("fCheckID");
		if(typeof(checkID)=="undefined"){
			checkID="";
		}
		var dlgOperator = "view";
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetInCheckInfo/assetInCheckInfo.w");
		if (checkID == '') {
			var assetCardID = mainData.getValue("fCode");
			if(typeof(assetCardID)=="undefined"){
				assetCardID="";
			}
			alert("资产：" + assetCardID + "没有验收信息！");
		} else {
			var wDlgAssetInRecord = this.comp("wDlgCheck");
			wDlgAssetInRecord.initEveryTimes = true;
			wDlgAssetInRecord.open({src:url,data:{operator:dlgOperator,assetInID:checkID}});
		}
	};
	
	Model.prototype.trgUseRecordClick = function(event){
		var cardID = mainData.getCurrentRowID();
		var dlgOperator = "view";
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetUseRecord/assetUseRecord.w");
		var wDlgAssetInRecord = this.comp("wDlgUseRecord");		
		wDlgAssetInRecord.initEveryTimes = true;
		wDlgAssetInRecord.open({src:url,data:{operator:dlgOperator,assetInID:cardID}});
	};
	
	Model.prototype.trgRepairClick = function(event){
		var cardID = mainData.getCurrentRowID();
		var dlgOperator = "view";
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetRepairRecord/assetRepairRecord.w");
		var wDlgAssetInRecord = this.comp("wDlgRepair");
		wDlgAssetInRecord.initEveryTimes = true;
		wDlgAssetInRecord.open({src:url,data:{operator:dlgOperator,assetInID:cardID}});
	};
	
	Model.prototype.trgInventoryClick = function(event){
		var cardID = mainData.getCurrentRowID();
		var dlgOperator = "view";
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetInventoryRecord/assetInventoryRecord.w");
		var wDlgAssetInRecord = this.comp("wDlgInventory");
		wDlgAssetInRecord.initEveryTimes = true;
		wDlgAssetInRecord.open({src:url,data:{operator:dlgOperator,assetInID:cardID}});
	};
	
	return Model;
});