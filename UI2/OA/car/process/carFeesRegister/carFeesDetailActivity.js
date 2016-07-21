define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.trgCarClick = function(event){
		this.comp("dlgCarInfo").open();
	};


	Model.prototype.dlgCarInfoReceive = function(event){
		this.action = event.data.action;
		var dFees = this.comp('dFees');
		if (event.data.action === "new"){
			dFees.clear();
			dFees.newData();
		}else{
			var row = dFees.getCurrentRow();
			var newRow = event.data.row;
			dFees.setValue("fCarNO", newRow.fCode, row);
			dFees.setValue("fCarName", newRow.fName, row);
		}
	};




	Model.prototype.modelModelConstructDone = function(event){
		var operator = this.getContext().getRequestParameter("operator");
		var id = this.getContext().getRequestParameter("id");

		var data = this.comp("dFees");
		if (operator == "edit") {
			data.filters.setFilter("applyFilter", "OA_CA_FeesRegister='" + id + "'");
			data.refreshData();	
		} else if (operator == "new") {
			data.newData();
		}
	};

	return Model;
});