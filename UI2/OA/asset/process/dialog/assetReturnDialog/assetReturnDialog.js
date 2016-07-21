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
		var data = this.comp('dAssetReturn');		
		var returnDate = data.getValue("returnDate");		
		var remark = data.getValue("remark");
		this.comp('wReceiver').windowEnsure({returnDate:returnDate,remark:remark});
	};

	return Model;
});