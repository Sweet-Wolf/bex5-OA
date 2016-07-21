define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	
	var mainData="";
	Model.prototype.modelLoad = function(event){
		mainData=this.comp("mainData");
		var data = this.getContext().getRequestParameter("data");
		var type = this.getContext().getRequestParameter("type");
		if(type=="new"){
			mainData.newData();
			if(mainData.getValue("fIsReducHoliday")==undefined){
				mainData.setValue("fIsReducHoliday",0);
			}
		} else if(type=="edit"){
			if (data){
				var filter = "OA_WM_LeaveType='" + data + "'";
				mainData.setFilter("____dataFilter_", filter);
				mainData.refreshData(); 
			}
		}
	};

	Model.prototype.btnStartUseClick = function(event){
		var row = mainData.getCurrentRow();
		try {
			mainData.setValue("fUseStatus", '1', row);
			mainData.setValue("fUseStatusName", '启用', row);
			mainData.saveData({
				"onSuccess" : function(event) {
					event.source.refreshData();
				}
			});
		} catch (e) {
			justep.Util.hint("对不起,启用失败！", {
				type : 'danger',
				parant : this.getRootNode()
			});
		}
	};

	Model.prototype.btnStopUseClick = function(event){
		var row = mainData.getCurrentRow();
		try {
			mainData.setValue("fUseStatus", '2', row);
			mainData.setValue("fUseStatusName", '未启用', row);
			mainData.saveData({
				"onSuccess" : function(event) {
					event.source.refreshData();
				}
			});
		} catch (e) {
			justep.Util.hint("对不起,停用失败！", {
				type : 'danger',
				parant : this.getRootNode()
			});
		}
	};

	Model.prototype.mainDataValueChanged = function(event){
		if (event.col == 'fIsSalary') {
			var fIsSalary=mainData.getValue("fIsSalary");
			if(fIsSalary==null){
				fIsSalary=0;
			}
			mainData.setValue("fIsSalary",fIsSalary);
		}
		if (event.col == 'fIsReducHoliday') {
			var fIsReducHoliday=mainData.getValue("fIsReducHoliday");
			if(fIsReducHoliday==null){
				fIsReducHoliday=0;
			}
			mainData.setValue("fIsReducHoliday",fIsReducHoliday);
		}
	};

	return Model;
});