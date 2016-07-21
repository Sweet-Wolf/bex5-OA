define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.result = function(){
		//这里实现返回的逻辑
	};

	Model.prototype.wReceiverReceive = function(event){
		var year=event.data.year;
		var tempData=this.comp("tempData");
		tempData.newData();
		tempData.setValue("effectiveDate",year+"-01-01");
		tempData.setValue("failureDate",year+"-12-31");
		tempData.saveData();
	};
	
	Model.prototype.OKBtnClick = function(event){
		var tempData=this.comp("tempData");
		var effectiveDate=tempData.getValue("effectiveDate");
		var failureDate=tempData.getValue("failureDate");
		this.comp('wReceiver').windowEnsure({effectiveDate:effectiveDate,failureDate:failureDate});
	};

	return Model;
});