define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.newBtnClick = function(event) {
		var mainData = this.comp("mainData");
		mainData.newData();
		this.goTotab();
	};

	Model.prototype.goTotab = function() {
		var tabs = this.comp("tabs");
		tabs.setActiveTab("nav-detail");
	}

	Model.prototype.orderTablesRowDblClick = function(event){
		var mainData = this.comp("mainData");
		/*mainData.to(event.bindingContext.$object);
		this.goTotab();*/
		var url = require.toUrl("$UI/OA/asset/process/assetInQuery/detailActivity.w?process=/OA/asset/process/assetInQuery/assetInQueryProcess&activity=startActivity&data=" + mainData.getCurrentRowID());
		justep.Portal.openWindow(url, {title: "资产入库查询详细"});
	};
	
	Model.prototype.DataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	/*
	Model.prototype.trgBuyRecordClick = function(event){
		var assetInID = this.comp('detailData').getValue("fBuyApplyNO");
		var dlgOperator = "view";
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetBuyRecord/assetBuyRecord.w");
		var wDlgAssetInRecord = this.comp("wDlgBuyRecord");
		wDlgAssetInRecord.initEveryTimes = true;
		wDlgAssetInRecord.open({src:url,data:{operator:dlgOperator,assetInID:assetInID}});
	};
	
	Model.prototype.trgCheckClick = function(event){
		var checkID = this.comp('detailData').getValue("fCheckID");	
		var dlgOperator = "view";
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetInCheckInfo/assetInCheckInfo.w");
		if (checkID == '') {
			var assetCardID = this.comp('mainData').getValue("fCode");
			alert("资产：" + assetCardID + "没有验收信息！");
		} else {
			var wDlgAssetInRecord = this.comp("wDlgCheck");
			wDlgAssetInRecord.initEveryTimes = true;
			wDlgAssetInRecord.open({src:url,data:{operator:dlgOperator,assetInID:checkID}});
		}
	};
*/
	var detailData="";
	Model.prototype.dataTables1CellRender = function(event){
		detailData=this.comp('detailData');
		var row=detailData.find(["OA_AS_InD"],[event.row.getID()],true,true,true);
		if(event.colName=="fCheckNO"){
			var text=detailData.getValue("fCheckNO",row[0]);
			if(text==undefined){
				text="";
			}
			event.html="<a href='javascript:;' class='check'>"+text+"</a>";
		} else if(event.colName=="fBuyApplyNO"){
			var text=detailData.getValue("fBuyApplyNO",row[0]);
			if(text==undefined){
				text="";
			}
			event.html="<a href='javascript:;' class='buyApply'>"+text+"</a>";
		}
	};	
	Model.prototype.dataTables1RowClick = function(event){
		var link=$(event.domEvent.target);
		var row=detailData.find(["OA_AS_InD"],[event.row.getID()],true,true,true);	
		if(link.hasClass("check")){
			var checkObj = this.comp("wDlgCheck");
			this.openCheck(detailData.getValue("fCheckID",row[0]),checkObj);
		}
		if(link.hasClass("buyApply")){
			var buyApplyObj = this.comp("wDlgBuyRecord");
			this.openBuyApply(detailData.getValue("fBuyApplyID",row[0]),buyApplyObj);
		}
	};
	Model.prototype.openCheck = function(checkID,checkObj){
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetInCheckInfo/assetInCheckInfo.w");
		checkObj.initEveryTimes = true;
		checkObj.open({src:url,data:{operator:"",assetInID:checkID}});
	}
	Model.prototype.openBuyApply = function(buyApplyID,buyApplyObj){
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetBuyRecord/assetBuyRecord.w");
		buyApplyObj.initEveryTimes = true;
		buyApplyObj.open({src:url,data:{operator:"",assetInID:buyApplyID}});
	}
	
	
	return Model;
});