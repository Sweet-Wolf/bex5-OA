define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var common = require("$UI/OA/workTime/js/common");
	var IM = require("$UI/OA/finance/js/loanMessage");
	require("css!$UI/oa/common/css/pub").load();
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.backBtnClick = function(){
		justep.Portal.closeWindow();
	};
	
	Model.prototype.moreBtnClick = function(event){
		this.comp("processMenu").show();
	};
	
	
	
	Model.prototype.mainDataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	};

	
	Model.prototype.processAdvanceCommit = function(event){
		IM.sendMsg(this, "mainData", "申请");
	};

	
	Model.prototype.modelLoad = function(event){
			//加载之前的动画
		$("[xid=waitDiv]").hide();
		$("[xid=financeLoanContent]").show();
	};

	
	return Model;
});