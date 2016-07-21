define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.DataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	
	
	Model.prototype.modelLoad = function(event){
		var mainData = this.comp("mainData");
		var data = this.getContext().getRequestParameter("data");
		if (data){
			var filter = "OA_AS_InM='" + data + "'";
			mainData.setFilter("____dataFilter_", filter);
			mainData.refreshData(); 
		}
	};
	
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