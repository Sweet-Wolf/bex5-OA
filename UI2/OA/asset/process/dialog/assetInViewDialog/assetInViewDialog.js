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
	
	var mainData="", detailData="";
	Model.prototype.wReceiverReceive = function(event){
		var operator=event.data.operator;
		var assetInID=event.data.assetInID;
			
		mainData=this.comp("mainData");
		var mainSql="OA_AS_InM='"+assetInID+"'";
		mainData.filters.setFilter("RMFilter",mainSql);
		mainData.refreshData();
		
		detailData=this.comp("detailData");
		var subSql="fMasterID='"+assetInID+"'";
		detailData.filters.setFilter("RMFilter",subSql);
		detailData.refreshData();
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

	Model.prototype.dataTables1CellRender = function(event){
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