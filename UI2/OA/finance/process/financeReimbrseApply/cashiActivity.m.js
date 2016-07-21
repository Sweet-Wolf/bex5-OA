define(function(require){
	var $ = require("jquery");
	var IM = require("$UI/OA/finance/js/reimbrseMessage");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.processAdvanceCommit = function(event){
		IM.sendMsg(this, "mainData", "审批");
	};

	Model.prototype.processBackCommit = function(event){
		IM.sendMsg(this, "mainData", "回退");
	};

	Model.prototype.processAbortCommit = function(event){
		IM.sendMsg(this, "mainData", "终止");
	};

	return Model;
});
