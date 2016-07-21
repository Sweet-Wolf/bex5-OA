define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.dtSignatureRowDblClick = function(event){
		
		var dKnowledge = this.comp('dSignature');
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var kwid = dKnowledge.getCurrentRowID();
		var url = "$UI/OA/signature/process/signatureApplyQuery/signatureApplyDetail.w"
		 + "?process=" + process + "&activity=" + activity
		 + "&kwid="+ kwid;
		justep.Portal.openWindow(url,{title:'印章管理详细'});
	};

	return Model;
});
