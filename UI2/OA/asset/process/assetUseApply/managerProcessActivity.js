define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var kindID = "",kind="",isFilter="";
	var Model = function(){
		this.callParent();
	};
	

	Model.prototype.trgSelectAssetClick = function(event){

		kindID = this.comp('mainData').getValue("fKindID");
		kind = this.comp('mainData').getValue("fKind");
		isFilter = "yes"
		
		var wDlgAssetCard = this.comp("wDlgAssetCard");
		wDlgAssetCard.initEveryTimes = true;
		wDlgAssetCard.open();
		
	};
	


	Model.prototype.mainDataValueChanged = function(event){
		if (event.column == "fProcess"){
		var dUseArrange = this.comp("dUseArrange");
		//var id = dUseArrange.getCurrentRowId();
		var id = dUseArrange.getCurrentRowID();
		if(id){
			var result = deleteAssetUseArrange(id);
			if(result==true){
				dUseArrange.refreshData();
			}
		}
	}
	};
	
	Model.prototype.deleteAssetUseArrange = function(id){
		var param = new justep.Request.ActionParam();
		param.setString("id", id);
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		
		var r = biz.Request.sendBizRequest(process, activity, "deleteAssetUseArrangeAction",param);
		if (!biz.Request.isBizSuccess(r)) {
			throw new Error(biz.Request.getServerError(r, "删除资产使用申请安排信息失败!"));
		}
		return true;
	}
	

	Model.prototype.wDlgAssetCardReceive = function(event){
		var data = this.comp('dUseArrange');
		
		var len = data.getCount();	
		if(len==0){
		
			data.newData();
			data.setValue("fAssetID",event.data.card.fAssetID);
			data.setValue("fCode",event.data.card.fCode);
			data.setValue("fName",event.data.card.fName);
			data.setValue("fSpecType",event.data.card.fSpecType);
			data.setValue("fKindID",event.data.card.fKindID);
			data.setValue("fKind",event.data.card.fKind);
			data.setValue("fUnitID",event.data.card.fUnitID);
			data.setValue("fUnit",event.data.card.fUnit);
		}else{
			if(data.fID!=data.getValue("fAssetID")){
				data.setValue("fAssetID",event.data.card.fAssetID);
				data.setValue("fCode",event.data.card.fCode);
				data.setValue("fName",event.data.card.fName);
				data.setValue("fSpecType",event.data.card.fSpecType);
				data.setValue("fKindID",event.data.card.fKindID);
				data.setValue("fKind",event.data.card.fKind);
				data.setValue("fUnitID",event.data.card.fUnitID);
				data.setValue("fUnit",event.data.card.fUnit);
				
				var psnID = this.getContext().getCurrentPersonID();
				var psnName = this.getContext().getCurrentPersonName();
				var time = justep.Date.toString(new Date(),'YYYY-MM-DD');
				
				data.setValue("fArrangePsnID", psnID);
				data.setValue("fArrangePsnName", psnName);
				data.setValue("fArrangeDate", time);

			}
	}
	};
	
	
	/**
	name:process#onBeforeAdvanceQuery
	description: <b>[回调型事件]</b>流转查询之前
	@param event 它的结构如下:<br/>{"source":组件的js对象,"task":任务标识,"cancel":false}
*/
	Model.prototype.processBeforeAdvanceQuery = function(event){
	var dUseApply = this.comp('mainData');
	var fProcess = dUseApply.getValue("fProcess");
	var dUseArrange = this.comp('dUseArrange');
	var fAssetID = dUseArrange.getValue("fAssetID");
	if(fProcess == 0){
		if(fAssetID == ""){
			data.cancel = true;
			alert('请填写分配信息！');
		}
	}
	};


		Model.prototype.mainDataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};


	return Model;
});
