define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		var context = this.getContext();
		var taskType = context.getRequestParameter('taskType');
		var docType = context.getRequestParameter('docType');
		var beginDate = context.getRequestParameter('beginDate');
		var endDate = context.getRequestParameter('endDate');
		var orgID = context.getRequestParameter('orgID');
		var dayNum = context.getRequestParameter('dayNum');
		beginDate = beginDate.substring(0, 10);
		endDate = endDate.substring(0, 10);
		orgID = orgID.replace(new RegExp("~2C", "gm"), " ");
		var rData = this.comp("rData");
		var rDataTitle = this.comp("rDataTitle");
		rData.setStringVar("taskType", taskType);
		rData.setStringVar("docType", docType);
		rData.setStringVar("beginDate", beginDate);
		rData.setStringVar("endDate", endDate);
		rData.setStringVar("dayNum", dayNum);
		rData.setStringVar("orgIDs", orgID);
		rDataTitle.setStringVar("taskType", taskType);
		rDataTitle.setStringVar("docType", docType);
		rDataTitle.setStringVar("beginDate", beginDate);
		rDataTitle.setStringVar("endDate", endDate);
		rDataTitle.setStringVar("dayNum", dayNum);
		rDataTitle.setStringVar("orgIDs", orgID);
	};

	return Model;
});