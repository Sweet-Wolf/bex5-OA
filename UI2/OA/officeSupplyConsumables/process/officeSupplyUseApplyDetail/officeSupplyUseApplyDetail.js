define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	// 加载传过来的数据
	Model.prototype.modelModelConstructDone = function(event) {

		var id = this.getContext().getRequestParameter("id");
		var operator = this.getContext().getRequestParameter("operator");
		var data = this.comp('mainData');
		if (operator == "view") {
			data.filters.setFilter("useApplyFilter", "OA_OSC_UseApplyM='" + id + "'");
			data.refreshData();
		}

	};

	Model.prototype.button1Click = function(event) {

		var process = this.comp("process");
		process.showChart("/OA/officeSupplyConsumables/process/officeSupplyUseApply/officeSupplyUseApplyProcess", this.comp("mainData").getCurrentRowID(), null);

	};

	return Model;
});