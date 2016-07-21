define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var common = require('$UI/OA/common/js/common');
	var IM = require("$UI/OA/finance/js/reimbrseMessage");
	require("css!$UI/OA/common/css/pub").load();

	var Model = function() {
		this.callParent();
	};

	Model.prototype.backBtnClick = function() {
		justep.Portal.closeWindow();
	};

	Model.prototype.moreBtnClick = function(event) {
		this.comp("processMenu").show();
	};

	Model.prototype.newPlaceClick = function(event) {
		this.comp("selectItemDlg").open();
	};

	Model.prototype.selectItemClick = function(event) {

		// this.comp("detailData").newData();
	};

	Model.prototype.selectItemDlgReceive = function(event) {
		this.comp("detailData").newData({
			defaultValues : [ {
				"fName" : event.data
			} ]
		});
	};

	Model.prototype.processBeforeAdvanceQuery = function(event) {
		var detailCount = this.comp("detailData").getCount();
		event.cancel = detailCount < 0 ? true : false;
	};

	Model.prototype.mainDataSaveCommit = function(event) {
		justep.Util.hint("保存成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	};

	// 对话框调用
	Model.prototype.button1Click = function(event) {
		var selectLoanInfoDlg = this.comp("dlgSelectLoanApplyInfo");
		selectLoanInfoDlg.initEveryTimes = true;
		selectLoanInfoDlg.open();
	};
	// 对话框结果
	Model.prototype.dlgSelectLoanApplyInfoReceive = function(event) {
		var data = this.comp('mainData');
		var rowid = data.getRowID();
		var doc = event.data.card;

		var loanAmt = doc.fLoanAmt;
		var reimAmt = data.getValue('fReimAmt');
		var mustReimamt = reimAmt - loanAmt;
		data.setValue('fLoanAmt', loanAmt);
		data.setValue('fIsPreLoan', doc.fNO);
		data.setValue('fMustReimAmt', mustReimamt);

		var oughtReimbAmtCn = common.num2ChMoney(mustReimamt);
		data.setValue('fOughtReimbAmtCn', oughtReimbAmtCn);
	};

	// 删除子表数据

	Model.prototype.delData = function(event) {
		var data = this.comp('detailData');
		var grid = this.comp('detail');
		var rowIds = grid.getCheckeds();
		for ( var i = 0; i < rowIds.length; i++) {
		var row = data.getRowByID(rowIds[i]);
			data.deleteData(row);
		}

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
		$("[xid=financeContent]").show();
	};

	return Model;
});