define(function(require) {
	var $ = require("jquery");
	var OA = require("$UI/OA/common/js/pub");
	require("css!$UI/OA/common/css/pub").load();

	var Model = function() {
		this.callParent();
	};

	Model.prototype.closeBtnClick = function(event) {
		this.comp('windowReceiver').windowCancel();
	};

	Model.prototype.windowReceiverReceive = function(event) {
		var mainData = this.comp("mainData");
		mainData.setFilter('filter1', "OA_OSC_UseApplyM = '" + event.data.data + "'");
		mainData.refreshData();
	};

	Model.prototype.chartBtnClick = function(event) {
		this.comp("process").showChart("/OA/officeSupplyConsumables/process/officeSupplyUseApply/officeSupplyUseApplyProcess", this.comp("mainData").getCurrentRowID(), null);
	};

	return Model;
});
