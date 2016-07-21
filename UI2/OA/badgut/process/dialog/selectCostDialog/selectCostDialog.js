define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.result = function(){
		//这里实现返回的逻辑
	};
	var data = "", card="";
	Model.prototype.dataTablesRowDblClick = function(event){
		this.returnData(event);
	};
	
	Model.prototype.OKBtnClick = function(event){
		this.returnData(event);
	};
	
	Model.prototype.returnData = function(){
	
		var data = this.comp('dCost');
		var fID = data.getRowID();
		var fCode = data.getValue("fCostCenterCode");
		var fName = data.getValue("fCostCenterName");
		var params = {
			"fID" : fID,
			"fCode" : fCode,
			"fName" : fName
		};
			this.comp('wReceiver').windowEnsure(params);
	}
	


	

	return Model;
});