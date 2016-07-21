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
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var operator = "viewer";
		var mainData = this.comp("mainData");
		var url = require.toUrl("$UI/OA/archival/process/archivalBorrowApplyDetail/archivalBorrowApplyDetail.w?process=" + process + "&activity=" + activity + "&operator=" + operator + "&id=" + mainData.getCurrentRowID());
		justep.Portal.openWindow(url, {title: "档案借阅详细"});
	};

	return Model;
});