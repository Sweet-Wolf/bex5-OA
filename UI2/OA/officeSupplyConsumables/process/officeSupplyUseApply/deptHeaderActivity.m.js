define(function(require){
	var $ = require("jquery");
	//var IM = require("./../../../../chat/js/im");
	var IM = require("$UI/OA/officeSupplyConsumables/js/useApplyMessage");
//	var justep = require("$UI/system/lib/justep");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.modelModelConstructDone = function(event){
		
	};
 

	Model.prototype.processAdvanceCommit = function(event){
		IM.sendMsg(this, "mainData", "detailData", "审批");
	};
	//流程回退
	Model.prototype.processBackCommit = function(event){
		IM.sendMsg(this, "mainData", "detailData", "回退");
	};
	//流程终止
	Model.prototype.processAbortCommit = function(event){
		IM.sendMsg(this, "mainData", "detailData", "终止");
	};

	return Model;
});
