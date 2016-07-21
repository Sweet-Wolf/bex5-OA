define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.orderTablesRowDblClick = function(event){
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var rowID = event.rowID;
		var url = "$UI/OA/officeSupplyConsumables/process/officeSupplyBuyApplyQuery/officeSupplyBuyApplyDetail.w"
		 + "?process=" + process + "&activity=" + activity
		 + "&rowID="+ rowID;
		justep.Portal.openWindow(url,{title:'办公用品请购详细'});
	};





	return Model;
});