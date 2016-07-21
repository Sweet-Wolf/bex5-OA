define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.result = function() {
		// 这里实现返回的逻辑
	};
	/*// 返回列表
	Model.prototype.OKBtnClick = function(event) {	
		var mainData = this.comp("mainData");
		mainData.saveData()
		this.comp("wReceiver").windowEnsure();

	};
	// 接受列表页的数据,用主表的id去查询从表
	Model.prototype.wReceiverReceive = function(event) {
		this.action = event.data.action;
		var mainData = this.comp('mainData');
		mainData.clear();
		if (event.data.action === "new") {
			mainData.newData();
		} else {
			var id = event.data.masterID;
			mainData.setFilter('filter1', "OA_OSC_BaseInfo='" + id + "'");
			mainData.refreshData();
		}

	};*/

	Model.prototype.modelModelConstructDone = function(event){
		var rowID = this.getContext().getRequestParameter("rowID");
		var operat = this.getContext().getRequestParameter("operat");
		var data = this.comp('mainData');
		if (operat === "new") {
			data.newData();
		} else {
			if (!rowID)
				return;
			data.filters.setFilter("BaseFilter", "OA_OSC_BaseInfo='" + rowID + "'");
			data.refreshData();
		}
	};
	Model.prototype.mainDataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	return Model;
});