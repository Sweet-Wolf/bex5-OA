define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
		this.date = new Date();
	};

	Model.prototype.openMeDetailClick = function(event) {
		var ctx = this.getContext();
		var personID = ctx.getCurrentPersonID();
		justep.Shell.showPage("$UI/OA/sign/process/sign/statisticsPerSignActivity.m.w?process=/OA/sign/process/sign/signProcess&activity=statisticsPerSignActivity", {"data":[ personID, this.date ]});
	};

	Model.prototype.openGroupClick = function(event) {
		justep.Shell.showPage("$UI/OA/sign/process/sign/groupSignActivity.m.w?process=/OA/sign/process/sign/signProcess&activity=groupSignActivity", {"data":this.date})
	};

	Model.prototype.selPersonClick = function(event) {
		this.comp("selectPersontDialog").open();
	};

	Model.prototype.selectPersontDialogReceive = function(event){
		var personID = event.data[0].val("sPersonID");
		justep.Shell.showPage("$UI/OA/sign/process/sign/statisticsPerSignActivity.m.w?process=/OA/sign/process/sign/signProcess&activity=statisticsPerSignActivity", {"data" : [ personID, this.date ]});
	};

	Model.prototype.modelLoad = function(event){
		$("[xid=waitDiv]").hide();
		$("[xid=content1]").show();
	};

	return Model;
});