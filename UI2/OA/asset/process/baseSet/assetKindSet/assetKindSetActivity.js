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
		//按字段查询
		data=this.comp('mainData');
		var filter="fScope='固定资产类别'";
		data.filters.setFilter("RMFilter", filter);
		data.refreshData(); 
	};

	Model.prototype.saveBtnClick = function(event){		
		var row = data.getCurrentRow();		
		data.setValue("fScope", '固定资产类别',row);
		data.saveData();
		data.refreshData();
	};
	
	//启用
	Model.prototype.startUseBtnClick = function(event){
		var row = data.getCurrentRow();
		var fUseStatus = row.val("fUseStatus");
		var fUseStatusName = row.val("fUseStatusName");
		try {
			row.val("fUseStatus", '1');
			row.val("fUseStatusName", '启用');
			data.saveData();
		} catch (e) {
			row.val("fUseStatus", fUseStatus);
			row.val("fUseStatusName", fUseStatusName);
			alert("对不起,启用失败!");
		}
	};
	//全部启用
	Model.prototype.allUseBtnClick = function(event){
		try {			
			var rows = [];
			data.each(function(options) {
				var row = options.row;
				var useFlag = row.val("fUseStatus");
				if (useFlag == '2' || useFlag == '' || useFlag == '0' || useFlag == '') {
					rows.push({'row' : row,'fUseStatus' : row.val('fUseStatus'),'fUseStatusName' : row.val('fUseStatusName')});
					row.val("fUseStatus", '1');
					row.val("fUseStatusName", '启用');
				}

			});
			data.saveData();
		} catch (e) {
			$.each(rows,function(i,param){
				data.setValue('fUseStatus', param.fUseStatus, param.row);
				data.setValue('fUseStatusName', param.fUseStatusName, param.row);
			});
			alert("对不起,全部启用失败!");
		}
	};
	//停用
	Model.prototype.stopUseBtnClick = function(event){
		var row = data.getCurrentRow();
		var fUseStatus = row.val("fUseStatus");
		var fUseStatusName = row.val("fUseStatusName");
		try {
			row.val("fUseStatus", '2');
			row.val("fUseStatusName", '未启用');
			data.saveData();
		} catch (e) {
			row.val("fUseStatus", fUseStatus);
			row.val("fUseStatusName", fUseStatusName);
			alert("对不起,停用失败!");
		}
	};

	return Model;
});