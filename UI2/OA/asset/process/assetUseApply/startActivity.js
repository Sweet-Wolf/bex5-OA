define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var mainDataValueChanging = false;
	var Model = function(){
		this.callParent();
	};
	
Model.prototype.modelModelConstructDone = function(event){
		var data = this.comp('mainData');
		var sData1 = this.getContext().getProcessData1();
		if (sData1 == null || sData1 == undefined) {
			data.newData();
			alert(sData1);
		} else {
			data.filters
					.setFilter("flowFilter", "OA_AS_UseApplyM='" + sData1 + "'");
			data.refreshData();
		}
	};

		
	Model.prototype.mainDataValueChanged = function(event){
			if (!mainDataValueChanging) {
					mainDataValueChanging = true;
					try {
						var psnID = this.getContext().getCurrentPersonID();
						
						var psnName = this.getContext().getCurrentPersonName();
						var time = justep.Date.toString(new Date(),justep.Date.STANDART_FORMAT);
						var data = this.comp("mainData");
			
						if (event.column == "fApplyDeptID") {
							var rowid = data.getCurrentRowId();
							data.setValue("fApplyPsnID", "", rowid);
							data.setValue("fApplyPsnName", "", rowid);
						}
			
						data.setValue("fUpdatePsnID", psnID);
						data.setValue("fUpdatePsnName", psnName);
						data.setValue("fUpdateTime", time);
					} finally {
						mainDataValueChanging = false;
					}
				}
	};


	Model.prototype.mainDataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	


	return Model;
});
