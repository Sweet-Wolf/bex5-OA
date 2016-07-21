define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	
	var mainData = "";
	Model.prototype.modelModelConstructDone = function(event){
		mainData = this.comp('mainData');
	};

	Model.prototype.mainDataValueChanged = function(event){		
		if(event.col == "fApplyDeptID"){
			alert("11");
			mainData.setValue("fApplyPsnID","");
			mainData.setValue("fApplyPsnName","");
		}
	};

	Model.prototype.orgSelectPC4UpdateValue = function(event){
		var deptID = mainData.getValue("fApplyDeptID");		
		var personData = this.comp('dPsm');
		personData.filters.setFilter("psmFilter", "SA_OPOrg.sFCode like '%" + deptID	+ "/%'");
		personData.refreshData();
	};

	return Model;
});