define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var archival = require("$UI/OA/archival/js/archival");

	var Model = function() {
		this.callParent();
	};

	var mainData="",detailData="";
	Model.prototype.modelLoad = function(event){
		mainData=this.comp("mainData");
		detailData=this.comp("detailData");
	};
	
	//选择档案
	Model.prototype.addBtnClick = function(event){
		var url=require.toUrl("$UI/OA/archival/process/dialog/archivalMultipleDialog/archivalMultipleDialog.w");
		this.comp("windowDialog").open({src:url});
	};
	
	//选择档案返回
	Model.prototype.windowDialogReceive = function(event){
		var archivalId = event.data.archivalID;

		var result="";
		var params = new biz.Request.ActionParam();
		params.setParam("fArchivalID", archivalId);
		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "getDistoryInfoAction",
			parameters : params,
			callback: function(data){
				if(data.state){
					result=data.response;
				}else{
					Request.errorMessage(resultData, "执行失败！", null, null);
				}	
			}
		};		
		var r=biz.Request.sendBizRequest(options);		
		if (!biz.Request.sendBizRequest(options)) {
			throw new Error(biz.Request.getServerError(r, "档案销毁选择档案失败!"));
		}
		
		var archivalInfo = result.split(",");
		if ((archivalInfo != "") && (archivalInfo != null)) {
			for ( var j = 0; j < archivalInfo.length; j++) {
				var filedInfo = archivalInfo[j].split("|");
				//if (detailData.getIndex("fArchivalID", filedInfo[0]) < 0) {
					detailData.newData();
					detailData.setValue("fArchivalID", filedInfo[0]);
					detailData.setValue("fArchivalNO", filedInfo[1]);
					detailData.setValue("fState", filedInfo[3]);
					detailData.setValue("fIsRoll", filedInfo[4]);
					detailData.setValue("fCarry", filedInfo[5]);
					detailData.setValue("fFileDeptName", filedInfo[6]);
					detailData.setValue("fResponsibleName", filedInfo[7]);
					detailData.setValue("fTitle", filedInfo[2]);
				//}
			}
		}
	};
	
	Model.prototype.dataTables1CellRender = function(event){
		detailData.to(event.row.getID());
		var isRoll=detailData.getValue("fIsRoll");
		var sign=detailData.getValue("fSign");
		var state=mainData.getValue("fState");
		var imgUrl=archival.grdArchivalShowNodeImg(isRoll,sign,state);
		if(event.colName=="fTitle"){
			event.html=imgUrl+"<a href='javascript:;' class='detail'>"+detailData.getValue("fTitle")+"</a>";
		}
	};
	
	Model.prototype.dataTables1RowClick = function(event){
		var link=$(event.domEvent.target);
		var operator="search";
		var fCloseTime = detailData.getValue("fCloseTime");
		var currentTime = justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT);
		var archivalID=detailData.getValue("fArchivalID");
		if(link.hasClass("detail")){
			var isRoll = detailData.getValue("fIsRoll");
			var url="";
			if (isRoll == '0') {
				url=require.toUrl("$UI/OA/archival/process/dialog/archivalFileDetail/archivalFileDetail.w");
			} else if (isRoll == '1') {
				url=require.toUrl("$UI/OA/archival/process/dialog/archivalRollDetail/archivalRollDetail.w");
			}
			this.comp("archivalDialog").open({src:url,data:{archivalID:archivalID,operator:operator}});
		}
	};
		
	return Model;
});