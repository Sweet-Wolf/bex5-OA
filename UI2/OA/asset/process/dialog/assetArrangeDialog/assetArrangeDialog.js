define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.result = function(){
		//这里实现返回的逻辑
	};

	Model.prototype.OKBtnClick = function(event){	
		var data = this.comp('dAssetArrange');
		var deptID = "",deptName="",psnID="",psnName="",arrangeDate="";
		
		deptID = data.getValue("deptID", null);
		deptName = data.getValue("deptName", null);
		psnID = data.getValue("psnID", null);
		psnName = data.getValue("psnName", null);
		arrangeDate = data.getValue("arrangeDate",null);
		
		if(deptID!="" ||deptName!=""||psnID!=""||psnName!=""||arrangeDate!="")
		{
			var params = {
				"deptID" : deptID,
				"deptName" : deptName,
				"psnID" : psnID,
				"psnName" : psnName,
				"arrangeDate" : arrangeDate
			}
			this.comp('wReceiver').windowEnsure(params);
		}else{
			alert("归还日期不能为空！");
		}	
	};

	Model.prototype.dAssetArrangeValueChanged = function(event){
		var data = this.comp('dAssetArrange');
		if (event.column == "deptID") {
			var rowid = data.getCurrentRowId();
			data.setValue("psnID", "", rowid);
			data.setValue("psnName", "", rowid);
		}
	};

	Model.prototype.psmSelectShowOption = function(event){
		var data = this.comp('dAssetArrange');
		var deptID = data.getValue("deptID");		
		var personData = this.comp('dPsm');
		personData.filters.setFilter("psmFilter", "SA_OPOrg.sFCode like '%" + deptID	+ "/%'");
		personData.refreshData();
	};

	return Model;
});