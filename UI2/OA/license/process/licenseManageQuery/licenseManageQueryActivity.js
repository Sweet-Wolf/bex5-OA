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

	Model.prototype.mainGridRowDblClick = function(event) {
		var mainData = this.comp("mainData");
		var rowId = mainData.getCurrentRowID();
		var ctx = this.getContext();
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var operator = "edit";
    	var url = "$UI/OA/license/process/licenseManageQuery/licenseManageQueryDetail.w?process="
    		+ process +"&activity=" + activity + "&operator=" + operator 
    		+ + "&callerName="
			+ "licenseManageActivity.w" + "&rowID=" + rowId;
    	justep.Portal.openWindow(url,{title:"证照详细信息"});
	};

	Model.prototype.getMainData = function() {
		return this.comp("mainData");
	}

	return Model;
});