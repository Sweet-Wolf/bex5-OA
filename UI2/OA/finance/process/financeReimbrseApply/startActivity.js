define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var common = require('$UI/OA/common/js/common');
	var Model = function() {
		this.callParent();
	};

	//保存提示
	Model.prototype.mainDataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	

	// 加载
	Model.prototype.modelLoad = function(event){
		if (this.getContext().getCurrentActivity() != 'startActivity') {
		var btnStatus = this.comp('dBtnStatus');
		var data = this.comp('mainData');
		var mustReimamt = data.getValue('fMustReimAmt');
		var oughtReimbAmtCn = common.num2ChMoney(mustReimamt);
	
		btnStatus.setValue('fOughtReimbAmtCn', oughtReimbAmtCn);
		}
	};
	// 加载	
	Model.prototype.modelModelConstructDone = function(event){
		/*var data = this.comp("mainData");
		var sData1 = this.getContext().getProcessData1();
		if (sData1 == null || sData1 == undefined) {
			data.newData();
		} else {
			data.filters
					.setFilter("filter", "OA_FC_ReimbApplyM = '" + sData1 + "'");
			data.refreshData();
		}*/
	};

// 数据改变
	Model.prototype.mainDataValueChanged = function(event){
	var data = this.comp('mainData');
//	var btnStatus = this.comp('dBtnStatus');
	var rowid = data.getRowID();

//	alert(event.col);
	if (event.col == "fLoanDeptID") {
		data.setValue("fLoanPsnID");
		data.setValue("fLoanPsnName");
	}
	
	 if (event.col == "fReiAllowance") {
		var reiAllowance = "";
		var factAmount = "";
		var sReiAllowance = "";
		var sFactAmount = "";
		var reimAmt = "";
		var sReimAmt = "";
		var loanAmt = "";
		var mustReimamt = "";
		var oughtReimbAmtCn = "";
		if (event.col != '') {
			reiAllowance = event.value;

		} else {
			reiAllowance = 0;
		}
		factAmount = data.getValue('fFactAmount');
		sReiAllowance = parseFloat(reiAllowance);
		sFactAmount = parseFloat(factAmount);
		reimAmt = sReiAllowance + sFactAmount;
		sReimAmt = reimAmt.toFixed(2);
		loanAmt = data.getValue('fLoanAmt');
		mustReimamt = sReimAmt - loanAmt;
//		alert('sReimAmt=='+sReimAmt+'---loanAmt=='+loanAmt+'---mustReimamt=='+mustReimamt);
		data.setValue('fReimAmt',reimAmt);
		data.setValue('fMustReimAmt',mustReimamt);

		oughtReimbAmtCn = common.num2ChMoney(mustReimamt);
//		btnStatus.setValue('fOughtReimbAmtCn', oughtReimbAmtCn);
		data.setValue('fOughtReimbAmtCn', oughtReimbAmtCn);
	} else if (event.col == "fFactAmount") {
		factAmount = event.value;
		reiAllowance = data.getValue('fReiAllowance');
		sReiAllowance = parseFloat(reiAllowance);
		sFactAmount = parseFloat(factAmount);
		reimAmt = sReiAllowance + sFactAmount;
		sReimAmt = reimAmt.toFixed(2);
		loanAmt = data.getValue('fLoanAmt');
		mustReimamt = sReimAmt - loanAmt;
		data.setValue('fReimAmt', sReimAmt);
		data.setValue('fMustReimAmt', mustReimamt);

		oughtReimbAmtCn = common.num2ChMoney(mustReimamt);
//		btnStatus.setValue('fOughtReimbAmtCn', oughtReimbAmtCn);
		data.setValue('fOughtReimbAmtCn', oughtReimbAmtCn);
	}else if(event.col=="fMustReimAmt"){
		mustReimamt = data.getValue('fMustReimAmt');
		oughtReimbAmtCn = common.num2ChMoney(mustReimamt);
//		btnStatus.setValue('fOughtReimbAmtCn', oughtReimbAmtCn);
		data.setValue('fOughtReimbAmtCn', oughtReimbAmtCn);
	}
	};
	
	// 子表合计
 Model.prototype.sumAmt = function() {
	var mData = this.comp('mainData');
	var dData = this.comp('detailData');

	var costAmt = 0;
	var length = dData.getCount();
	for ( var i = 0; i < length; i++) {
		var rowid = dData.getCurrentRow(i);
		if (typeof rowid == "undefined") {
			continue;
		}
		costAmt += parseFloat(dData.getValue("fCostAmt"));
	}
	mData.setValue("fFactAmount", costAmt);
}

 	// 子表删除
	Model.prototype.detailDataAfterDelete = function(event){
		this.sumAmt();
	};

	// 子表数据改变
	Model.prototype.detailDataValueChanged = function(event){
		this.sumAmt();
	};
	// 对话框调用
	Model.prototype.trgSelectAssetDOMActivate = function(event){
		var selectLoanInfoDlg = this.comp("dlgSelectLoanApplyInfo");
		selectLoanInfoDlg.initEveryTimes = true;
		selectLoanInfoDlg.open();
	};
	// 对话框结果
	Model.prototype.dlgSelectLoanApplyInfoReceive = function(event){
		var data = this.comp('mainData');
		var rowid = data.getRowID();
		var doc = event.data.card;
		
		var loanAmt = doc.fLoanAmt;
		var reimAmt = data.getValue('fReimAmt');
		var mustReimamt = reimAmt - loanAmt;		
		data.setValue('fLoanAmt', loanAmt);
		data.setValue('fIsPreLoan', doc.fNO);
		data.setValue('fMustReimAmt', mustReimamt);
	
//		var btnStatus = this.comp('dBtnStatus');
		var oughtReimbAmtCn = common.num2ChMoney(mustReimamt);
//		btnStatus.setValue('fOughtReimbAmtCn', oughtReimbAmtCn);
		data.setValue('fOughtReimbAmtCn', oughtReimbAmtCn);
	};

	return Model;
});
