define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	
	var data="";
	Model.prototype.modelLoad = function(event){
		data=this.comp("mainData");
	};
	
	Model.prototype.btnStartUseClick = function(event){
		var row = data.getCurrentRow();
		try {
			data.setValue("fUseStatus", '1', row);
			data.setValue("fUseStatusName", '启用', row);
			data.saveData({
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

	Model.prototype.btnAllUseClick = function(event){
		try {
			data.each(function(param) {
				var row = param.row;
				var useFlag = data.getValue("fUseStatus", row);
//				if (useFlag === '0' || useFlag === '') {
					data.setValue("fUseStatus", '1', row);
					data.setValue("fUseStatusName", '启用', row);
//				}
			});
			data.saveData({
				"onSuccess" : function(event) {
					event.source.refreshData();
				}
			});
		} catch (e) {
			justep.Util.hint("对不起,全部启用失败！", {
				type : 'danger',
				parant : this.getRootNode()
			});
		}
	};
	
	Model.prototype.btnStopUseClick = function(event){
		var row = data.getCurrentRow();
		try {
			data.setValue("fUseStatus", '2', row);
			data.setValue("fUseStatusName", '未启用', row);
			data.saveData({
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

	//新增
	Model.prototype.newBtnClick = function(event){		
		var url = require.toUrl("$UI/OA/workTime/process/leavetype/detailActivity.w?process=/OA/workTime/process/leavetype/leavetypeProcess&activity=mainActivity&type=new&data=" + data.getCurrentRowID());
		justep.Portal.openWindow(url, {title: "请假类型新增"});
	};
	
	Model.prototype.dataTables1CellRender = function(event){		
		data=this.comp("mainData");
		data.to(event.row.getID());
		var text="";
		if(event.colName=="fIsSalary"){
			if(data.getValue("fIsSalary")==1){
				text="是";
			} else{
				text="否";
			}
			event.html=text;
		}
		if(event.colName=="fIsReducHoliday"){
			if(data.getValue("fIsReducHoliday")==1){
				text="是";
			} else{
				text="否";
			}
			event.html=text;
		}
	};
	//详细
	Model.prototype.dataTables1RowDblClick = function(event){
		var url = require.toUrl("$UI/OA/workTime/process/leavetype/detailActivity.w?process=/OA/workTime/process/leavetype/leavetypeProcess&activity=mainActivity&type=edit&data=" + data.getCurrentRowID());
		justep.Portal.openWindow(url, {title: "请假类型详细"});
	};



	return Model;
});