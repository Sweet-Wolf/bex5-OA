define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.result = function(){
		//这里实现返回的逻辑
	};
	var data = "", card="";
	Model.prototype.dataTables1RowClick = function(event){
		data = this.comp('dLoanApply');		
		data.to(event.row.getID());
		card={"fNO":data.getValue("fNO"),
				"fReimAmt":data.getValue("fReimAmt"),
				"fLoanAmt":data.getValue("fLoanAmt"),
				"fIsPreLoan":data.getValue("fIsPreLoan"),
				"fMustReimAmt":data.getValue("fMustReimAmt")
				};

	};
	
	Model.prototype.OKBtnClick = function(event){
		this.comp('wReceiver').windowEnsure({"card":card});
	};


	return Model;
});