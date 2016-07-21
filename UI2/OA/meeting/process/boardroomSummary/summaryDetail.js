define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.selectPsnsClick = function(event){
		this.comp("orgDialog").open();
	};

	Model.prototype.orgDialogReceive = function(event){
		var rows = event.data;
		var sNames = "";
		for(var i in rows){
			sNames += rows[i].val('sName') +','
		}
		if (sNames != "") {
			sNames = sNames.substring(0,sNames.length-1);
		}
//		this.comp("fMeetPsnsI").val();
		var data = this.comp("dSummary");
		data.setValue("fMeetPsns", sNames);
		data.setValue("fMeetPsnNum",sNames.length);
	};

	Model.prototype.modelModelConstructDone = function(event){
		var data = this.comp("dSummary");
		var rowID = this.getContext().getRequestParameter("rowID")
		var operate = this.getContext().getRequestParameter("operate")
		if(operate == 'new'){
			data.newData();
		}else{
			if(rowID){
				data.setFilter('getSummaryByID',"OA_MT_Summary='"+rowID+"'" );
				data.refreshData();
			}
		}
	};

	Model.prototype.dSummarySaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	Model.prototype.orgSelectPC2ShowOption = function(event){
		var deptId = this.comp('dSummary').getValue('fUseDeptID');
		var personData = this.comp('bizData2');
//		personData.setFilter("_filter_dept_","SA_OPOrg.sParent = '" + deptId + "'");
		personData.setFilter("_filter_dept_","SA_OPOrg.sFID LIKE '%" + deptId + "%'");
		personData.refreshData();
		
	};

	Model.prototype.orgSelectPC1HideOption = function(event){
		this.comp('dSummary').setValue('fUsePsnID','');
		this.comp('dSummary').setValue('fUsePsnName','');
	};

	return Model;
});