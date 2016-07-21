define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	//保存提示
	Model.prototype.dataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	
	
	//状态启用
	Model.prototype.StartUseBtnClick = function(event){
		try {
			var data = this.comp('mainData');
			var id = data.getCurrentRowID();
			data.setValue("fUseStatus", '1');
			data.setValue("fUseStatusName", '启用');
			data.saveData();
		} catch (e) {
			alert("对不起,启用失败!");
		}
	};
	//状态全部启用
	Model.prototype.AllUseBtnClick = function(event){
		try {
		var data = this.comp('mainData');
		checkedIDs = this.comp('mainGrid').getCheckeds();	
		var len = checkedIDs.length;

		for (var i = 0; i < len; i++) {
			var id = data.getRowByID(checkedIDs[i]);

			var useFlag = data.getValue("fUseStatus");
			if (useFlag == '2' || useFlag == ''|| useFlag == '0' || useFlag == '') {
				data.setValue("fUseStatus", '1',id);
				data.setValue("fUseStatusName", '启用',id);
			}
		}
		data.saveData();
		} catch (e) {
			alert("对不起,全部启用失败!");
		}
	};
	//状态停用
	Model.prototype.StopUseBtnClick = function(event){

		try {
			var data = this.comp('mainData');
			var id = data.getCurrentRowID();
	
			data.setValue("fUseStatus", '2');
			data.setValue("fUseStatusName", '未启用');
			data.saveData();
		} catch (e) {
			alert("对不起,停用失败!");
		}
	};
	
	
	//打开对话框
	Model.prototype.addBtnClick = function(event){
		var baseInfoDlg = this.comp("dlgAccount");
		baseInfoDlg.initEveryTimes = true;
		baseInfoDlg.open();
	};

	
	
	//对话框返回接收处理
	Model.prototype.dlgAccountReceive = function(event){
		var doc = event.data;
		var data = this.comp('detailData');
		var len = doc.length;
		var flag = 0;

		if (len > 0) {
			for (var i = 0; i < len; i++) {
				if ( flag == 0) {
					data.newData();
					data.setValue('fAccountCode', doc[i].val('fCode'));
					data.setValue('fAccountName', doc[i].val('fName'));
				}
			}
		}
	};

	
	
	
	return Model;
});