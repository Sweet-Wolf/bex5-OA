define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.result = function(){
		//这里实现返回的逻辑
	};
	
	var dAssetInDate="";
	Model.prototype.wReceiverReceive = function(event){
		//alert("aaa");
		dAssetInDate=this.comp("dAssetInDate");
		//alert(justep.Date.toString(new Date(), "YYYY-MM-DD"));
		dAssetInDate.setValue("inDate", justep.Date.toString(new Date(), "YYYY-MM-DD"));
	};
	
	Model.prototype.OKBtnClick = function(event){
		this.comp('wReceiver').windowEnsure({inDate:dAssetInDate.getValue("inDate")});
	};

	

	return Model;
});