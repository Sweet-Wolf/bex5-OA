define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var IM = require("$UI/OA/signature/js/signatureMessage");
	require("css!$UI/OA/common/css/pub").load();
	
	var Model = function() {
		this.callParent();
	};

	Model.prototype.moreBtnClick = function(event) {
		this.comp("processMenu").show();
	};

	Model.prototype.selectfSignatureTypeName = function(event) {
		this.comp("popMenu").show();
	};

	Model.prototype.selectItemClick = function(event) {
		var row = event.bindingContext.$object;
		var mainData = this.comp("mainData");
		mainData.setValue("fSignatureTypeName", row.val('fName'));
		mainData.setValue("fSignatureTypeID", row.getID());
	};

	Model.prototype.mainDataBeforeSave = function(event) {
		var data = this.comp("mainData");
		var currentPsnID = this.getContext().getCurrentPersonID();
		var currentPsnName = this.getContext().getCurrentPersonName();
		var currentTime = justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT);
		data.setValue("fUpdatePsnID", currentPsnID);
		data.setValue("fUpdatePsnName", currentPsnName);
		data.setValue("fUpdateTime", currentTime);
	};

	Model.prototype.processAdvanceCommit = function(event){
		IM.sendMsg(this, "mainData", "申请");
	};

	Model.prototype.processBackCommit = function(event){
		IM.sendMsg(this, "mainData", "回退");
	};

	Model.prototype.processAbortCommit = function(event){
		IM.sendMsg(this, "mainData", "终止");
	};

	Model.prototype.modelLoad = function(event){
			//加载之前的动画
		$("[xid=waitDiv]").hide();
		$("[xid=signatureContent]").show();
	};

	return Model;
});