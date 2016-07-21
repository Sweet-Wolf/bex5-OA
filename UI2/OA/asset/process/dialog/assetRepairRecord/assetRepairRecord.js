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
		if(operator=="view"){
			var mainData=this.comp("dRepairRecord");
			mainData.filters.setFilter("RMFilter","OA_AS_RepairApply.fAssetID='" + assetInID + "'");
			mainData.refreshData();
		}
	};

	return Model;
});