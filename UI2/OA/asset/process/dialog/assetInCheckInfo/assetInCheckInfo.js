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

	Model.prototype.wReceiverReceive = function(event){
		var operator=event.data.operator;
		var assetInID=event.data.assetInID;
		
		var mainData=this.comp("mainData");
		var mainSql="OA_AS_CheckM='"+assetInID+"'";
		mainData.filters.setFilter("RMFilter",mainSql);
		mainData.refreshData();
		
		var subData=this.comp("subData");
		var subSql="fMasterID='"+assetInID+"'";
		subData.filters.setFilter("RMFilter",subSql);
		subData.refreshData();
	};

	return Model;
});