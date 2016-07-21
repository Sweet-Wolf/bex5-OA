define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function(){
		this.callParent();
	};
	
	var mainData="";
	Model.prototype.windowReceiverReceive = function(event){		
		var historyId=event.data.historyId;
		mainData = this.comp('mainData');
		mainData.filters.setFilter("returnFilter", "OA_AM_History='" + historyId + "'");	
		mainData.refreshData();
		mainData.setValue("fCrosserID", this.getContext().getCurrentPersonID());
		mainData.setValue("fCrosserName", this.getContext().getCurrentPersonName());		
		mainData.setValue("fReturnTime", justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT));
		mainData.setValue("fReturnNum", mainData.getValue("fBorrowNum"));
		mainData.setValue("fReturnPsnID", mainData.getValue("fBorrowPsnID"));
		mainData.setValue("fReturnPsnName", mainData.getValue("fBorrowPsnName"));
	};

	Model.prototype.OKBtnClick = function(event){
		if (!(mainData.getValue("fBorrowNum") > mainData.getValue("fReturnNum"))) {
			mainData.setValue("fCloseTime", mainData.getValue("fReturnTime"));
		}
		mainData.saveData();
		if (!mainData.isChanged()) {
			this.comp("windowReceiver").windowEnsure();
		}
	};

	Model.prototype.mainDataAfterSave = function(event){
		var returnNum = mainData.getValue("fReturnNum");
		var archivalID = mainData.getValue("fArchivalID");

		var params = new biz.Request.ActionParam();
		params.setParam("fArchivalID", archivalID);
		params.setParam("fReturnNum", returnNum.toString());
		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "returnArchivalAction",
			parameters : params
		};		
		var r=biz.Request.sendBizRequest(options);		
		if (!biz.Request.sendBizRequest(options)) {
			throw new Error(biz.Request.getServerError(r, "档案归还失败!"));
		}
	};

	return Model;
});