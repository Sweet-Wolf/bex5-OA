define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.saveCommit = function(event) {
		justep.Util.hint("保存成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	};
	// 双击进入详细页面
	Model.prototype.mainGridRowDblClick = function(event) {

		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var data = this.comp('mainData');
		var rowID = data.getCurrentRowID();
		var id = data.getValue("fMasterID");
		var operator = "view";
		var url = "$UI/OA/officeSupplyConsumables/process/officeSupplyUseApplyDetail/officeSupplyUseApplyDetail.a?process=" + process + "&activity=" + activity + "&operator=" + operator + "&id=" + id;
		justep.Portal.openWindow(url, {
			title : "办公用品领用详细"
		});

	};



	return Model;
});