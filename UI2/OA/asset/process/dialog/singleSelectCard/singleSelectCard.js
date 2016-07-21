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
	Model.prototype.dataTables1RowClick = function(event){
		data = this.comp('dAssetCard');		
		data.to(event.row.getID());
		card={"fAssetID":event.row.getID(),
				"fCode":data.getValue("fCode"),
				"fName":data.getValue("fName"),
				"fSpecType":data.getValue("fSpecType"),
				"fKindID":data.getValue("fKindID"),
				"fKind":data.getValue("fKind"),
				"fUnitID":data.getValue("fUnitID"),
				"fUnit":data.getValue("fUnit"),
				"fServiceYear":data.getValue("fServiceYear"),
				"fUsedYear":data.getValue("fUsedYear"),
				"fRemainValue":data.getValue("fRemainValue")};

	};
	
	Model.prototype.OKBtnClick = function(event){
		this.comp('wReceiver').windowEnsure({"card":card});
	};


	return Model;
});