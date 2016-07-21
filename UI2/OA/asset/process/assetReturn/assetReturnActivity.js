 define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	Model.prototype.dataTablesCellRender = function(event){
		var mainData=this.comp("dAssetCard");
		mainData.to(event.row.getID());
		if(event.colName == "fCode"){
			event.html = "<a href='javascript:;' class='card'>"+mainData.getValue("fCode")+"</a>";
		}
	};
	Model.prototype.dataTablesRowClick = function(event){
		var aLink = $(event.domEvent.target); 
		if (aLink.hasClass("card")) {
			var url = require.toUrl("$UI/OA/asset/process/assetCard/assetCardDetailActivity.w?process=/OA/asset/process/assetCard/assetCardProcess&activity=assetCardActivity&data=" + event.row.getID());
			justep.Portal.openWindow(url, {title: "资产卡片"});
    	}
	};

	Model.prototype.trgReturnClick = function(event){
		var wDlgReturn = this.comp("wDlgReturn");
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetReturnDialog/assetReturnDialog.w");			
		wDlgReturn.initEveryTimes = true;		
		wDlgReturn.open({src:url});
	};
	
	Model.prototype.wDlgReturnReceive = function(event){
		var returnDate=event.data.returnDate;
		var remark = event.data.remark;
		
		var cardData = this.comp('dAssetCard');			
		
		var assetID = cardData.getCurrentRowID();
		var code = cardData.getValue("fCode", cardData.getCurrentRow(false));		
		var name = cardData.getValue("fName", cardData.getCurrentRow(false));
		var kind = cardData.getValue("fKind", cardData.getCurrentRow(false));
		var unit = cardData.getValue("fUnit", cardData.getCurrentRow(false));
		var specType = cardData.getValue("fSpecType", cardData.getCurrentRow(false));		
		var ognID = this.getContext().getCurrentOgnID();
		var ognName = this.getContext().getCurrentOgnName();
		var ognFID = this.getContext().getCurrentOgnFID();
		var deptID = this.getContext().getCurrentDeptID() || this.getContext().getCurrentOgnID();
		var deptName = this.getContext().getCurrentDeptName() || this.getContext().getCurrentOgnName();
		var posID = this.getContext().getCurrentPosID();
		var posName = this.getContext().getCurrentPosName();
		var psnID = this.getContext().getCurrentPersonID();
		var psnName = this.getContext().getCurrentPersonName();
		var psnFID = this.getContext().getCurrentPersonMemberFID();		
		
		cardData.setValue("fDutyOgnID",ognID, cardData.getCurrentRow(false));
		cardData.setValue("fDutyOgnName",ognName, cardData.getCurrentRow(false));
		cardData.setValue("fDutyOgnFID",ognFID, cardData.getCurrentRow(false));
		cardData.setValue("fDutyDeptID",deptID, cardData.getCurrentRow(false));
		cardData.setValue("fDutyDeptName",deptName, cardData.getCurrentRow(false));
		cardData.setValue("fDutyPosID",posID, cardData.getCurrentRow(false));
		cardData.setValue("fDutyPosName",posName, cardData.getCurrentRow(false));
		cardData.setValue("fDutyPsnID",psnID, cardData.getCurrentRow(false));
		cardData.setValue("fDutyPsnName",psnName, cardData.getCurrentRow(false));
		cardData.setValue("fDutyPsnFID",psnFID, cardData.getCurrentRow(false));
		cardData.setValue("fStatus","0", cardData.getCurrentRow(false));
		cardData.setValue("fStatusName","闲置", cardData.getCurrentRow(false));

		var returnData = this.comp('dAssetReturn');
		returnData.newData();
		returnData.setValue("fTime",returnDate);
		returnData.setValue("fRemark",remark);
		returnData.setValue("fCode",code);
		returnData.setValue("fName",name);
		returnData.setValue("fKind",kind);
		returnData.setValue("fUnit",unit);
		returnData.setValue("fSpecType",specType);		
		returnData.setValue("fDutyOgnID",ognID);
		returnData.setValue("fDutyOgnName",ognName, cardData.getCurrentRow(false));		
		returnData.setValue("fDutyDeptID",deptID);
		returnData.setValue("fDutyDeptName",deptName);
		returnData.setValue("fDutyPosID",posID);
		returnData.setValue("fDutyPosName",posName);
		returnData.setValue("fDutyPsnID",psnID);
		returnData.setValue("fDutyPsnName",psnName);
		returnData.setValue("fDutyPsnFID",psnFID);		

		cardData.saveData();
		returnData.saveData();	
		cardData.refreshData();
		var result = assetReturn(assetID, returnDate,this);
		if (result == true) {
			alert("资产：" + code + "归还成功！");
		}

	};
	
	function assetReturn(assetID, returnDate,_this) {
		var params = new biz.Request.ActionParam();
		params.setParam("assetID", assetID);
		params.setParam("returnDate", returnDate.toString());
		var ctx = _this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "assetReturnAction",
			parameters : params
		};		
		var r=biz.Request.sendBizRequest(options);
		if (!biz.Request.sendBizRequest(options)) {
			throw new Error(biz.Request.getServerError(r, "更新资产安排记录失败!"));
		}
		return true;
	}

	return Model;
});