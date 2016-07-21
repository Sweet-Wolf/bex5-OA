define(function(require){
	var $ = require("jquery");
	var IM = require("$UI/OA/signature/js/signatureMessage");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.processAdvanceCommit = function(event){
		IM.sendMsg(this, "dSignature", "审批");
	};

	Model.prototype.processBackCommit = function(event){
		IM.sendMsg(this, "dSignature", "回退");
	};

	Model.prototype.processAbortCommit = function(event){
		IM.sendMsg(this, "dSignature", "终止");
	};

	return Model;
});
