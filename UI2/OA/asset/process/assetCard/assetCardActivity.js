define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};
/*
	Model.prototype.saveCommit = function(event) {
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	*/
	Model.prototype.grid3RowClick = function(event){
		var mainData = this.comp("mainData");
		var url = require.toUrl("$UI/OA/asset/process/assetCard/assetCardDetailActivity.w?process=/OA/asset/process/assetCard/assetCardProcess&activity=assetCardActivity&type=edit&data=" + mainData.getCurrentRowID());
		justep.Portal.openWindow(url, {title: "资产卡片详细"});
	};
	/*
	Model.prototype.button2Click = function(event) {
		var data = this.comp("mainData");
		data.deleteData();
		var tabs = this.comp('tabs');
		tabs.setActiveTab('nav-list');
	};
*/
	Model.prototype.addBtnClick = function() {
		var url = require.toUrl("$UI/OA/asset/process/assetCard/assetCardNewActivity.w?process=/OA/asset/process/assetCard/assetCardProcess&activity=assetCardActivity&type=new");
		justep.Portal.openWindow(url, {title: "资产卡片新增"});
	};	
/*
	Model.prototype.trgAssetInRecordClick = function(event){
		
		var assetInID = this.comp('mainData').getValue("fAssetInID");
		if(typeof(assetInID) == "undefined"){
			assetInID="";
		}
		var dlgOperator = "view";
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetInViewDialog/assetInViewDialog.w");
		if (assetInID == '') {
			var assetCardID = this.comp('mainData').getValue("fCode");
			if(typeof(assetCardID) == "undefined"){
				assetCardID="";
			}
			alert("资产：" + assetCardID + "没有入库信息！");
		} else {
			var wDlgAssetInRecord = this.comp("wDlgAssetInRecord");
			wDlgAssetInRecord.initEveryTimes = true;
			wDlgAssetInRecord.open({src:url,data:{operator:dlgOperator,assetInID:assetInID}});
		}
	};

	Model.prototype.trgCheckClick = function(event){
		var checkID = this.comp('mainData').getValue("fCheckID");
		if(typeof(checkID) == "undefined"){
			checkID="";
		}
		var dlgOperator = "view";
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetInCheckInfo/assetInCheckInfo.w");
		if (checkID == '') {
			var assetCardID = this.comp('mainData').getValue("fCode");
			if(typeof(assetCardID) == "undefined"){
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
		var cardID = this.comp('mainData').getCurrentRowID();
		var dlgOperator = "view";
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetUseRecord/assetUseRecord.w");
		var wDlgAssetInRecord = this.comp("wDlgUseRecord");		
		wDlgAssetInRecord.initEveryTimes = true;
		wDlgAssetInRecord.open({src:url,data:{operator:dlgOperator,assetInID:cardID}});
	};

	Model.prototype.trgRepairClick = function(event){
		var cardID = this.comp('mainData').getCurrentRowID();
		var dlgOperator = "view";
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetRepairRecord/assetRepairRecord.w");
		var wDlgAssetInRecord = this.comp("wDlgRepair");
		wDlgAssetInRecord.initEveryTimes = true;
		wDlgAssetInRecord.open({src:url,data:{operator:dlgOperator,assetInID:cardID}});
	};

	Model.prototype.trgInventoryClick = function(event){
		var cardID = this.comp('mainData').getCurrentRowID();
		var dlgOperator = "view";
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetInventoryRecord/assetInventoryRecord.w");
		var wDlgAssetInRecord = this.comp("wDlgInventory");
		wDlgAssetInRecord.initEveryTimes = true;
		wDlgAssetInRecord.open({src:url,data:{operator:dlgOperator,assetInID:cardID}});
	};

	Model.prototype.trgBuyRecordClick = function(event){
		var assetInID = this.comp('mainData').getValue("fBuyApplyNO");
		if(typeof(assetInID) == "undefined"){
			assetInID="";
		}
		var dlgOperator = "view";
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetBuyRecord/assetBuyRecord.w");
		if (assetInID == '') {
			var assetCardID = this.comp('mainData').getValue("fCode");
			if(typeof(assetCardID) == "undefined"){
				assetCardID="";
			}
			alert("资产：" + assetCardID + "没有采购信息！");
		} else {
			var wDlgAssetInRecord = this.comp("wDlgBuyRecord");
			wDlgAssetInRecord.initEveryTimes = true;
			wDlgAssetInRecord.open({src:url,data:{operator:dlgOperator,assetInID:assetInID}});
		}
	};
*/
	return Model;
});