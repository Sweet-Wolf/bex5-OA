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
		var mainData = this.comp("dataMain");
		mainData.setFilter('filter1', "OA_FC_LoanApply = '" + event.data.data + "'");
		mainData.refreshData();
	};

	Model.prototype.chartBtnClick = function(event) {
		this.comp("process").showChart("/OA/finance/process/financeLoanApply/financeLoanApplyProcess", this.comp("dataMain").getCurrentRowID(), null);
	};

	return Model;
});
