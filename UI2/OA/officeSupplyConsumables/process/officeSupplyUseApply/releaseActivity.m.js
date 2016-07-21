define(function(require){
	var $ = require("jquery");
	var IM = require("$UI/OA/officeSupplyConsumables/js/useApplyMessage");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.processAdvanceCommit = function(event){
		IM.sendMsg(this, "mainData", "detailData", "签收");
	};

	Model.prototype.processBackCommit = function(event){
		IM.sendMsg(this, "mainData", "detailData", "回退");
	};

	Model.prototype.processAbortCommit = function(event){
		IM.sendMsg(this, "mainData", "detailData", "终止");
	};

	return Model;
});
