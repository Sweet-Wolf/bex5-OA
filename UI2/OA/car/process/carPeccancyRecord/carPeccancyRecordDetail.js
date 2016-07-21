define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	

	Model.prototype.selectCarClick = function(event){
		this.comp("dlgSelectCars").open();
	};

	Model.prototype.dlgSelectCarsReceive = function(event){
		this.action = event.data.action;
		var dCarPeccancyRecord = this.comp('dCarPeccancyRecord');
		if (event.data.action === "new"){
			dCarPeccancyRecord.clear();
			dCarPeccancyRecord.newData();
		}else{
			/*dCarPeccancyRecord.loadData({rows: [event.data.row]}, false);
			dCarPeccancyRecord.first();*/
			var row = dCarPeccancyRecord.getCurrentRow();
			var newRow = event.data.row;
			dCarPeccancyRecord.setValue("fCode", newRow.fCode, row);
			dCarPeccancyRecord.setValue("fName", newRow.fName, row);
			dCarPeccancyRecord.setValue("fType", newRow.fType, row);
			dCarPeccancyRecord.setValue("fCarKindName", newRow.fCarKindName, row);
		}
	
	};

	Model.prototype.modelModelConstructDone = function(event){
		 var operator = this.getContext().getRequestParameter("operator");
		var id = this.getContext().getRequestParameter("id");

		var data = this.comp("dCarPeccancyRecord");
	    if (operator == "new") {
			data.newData();
		}else{
			data.filters.setFilter("applyFilter", "OA_CA_PeccancyRecord='" + id + "'");
			data.refreshData();	
		}
		
	};

	return Model;
});