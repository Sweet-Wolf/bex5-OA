define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	Model.prototype.dataTables1RowDblClick = function(event){
		var mainData = this.comp("mainData");
		var url = require.toUrl("$UI/OA/workTime/process/evecsure/detailActivity.w?process=/OA/workTime/process/evection/evectionProcess&activity=mainActivity&data=" + mainData.getCurrentRowID());
		justep.Portal.openWindow(url, {title: "出差确认"});
	};

	return Model;
});