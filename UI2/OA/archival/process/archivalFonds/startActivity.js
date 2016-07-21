define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function() {
		this.callParent();
	};
	// 保存提示
	Model.prototype.mainDataSaveCommit = function(event) {
		this.comp('detailData').saveData();
		justep.Util.hint("保存成功！", {
			type : 'success',
			parent : this.getRootNode()
		});

	};

	// 状态启用
	Model.prototype.StartUseBtnClick = function(event) {
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
	// 状态全部启用
	Model.prototype.AllUseBtnClick = function(event) {
		try {
			var data = this.comp('mainData');

			data.each(function(param) {
				var row = param.row;
				var useFlag = data.getValue("fUseStatus", row);
				
				if (useFlag === '0' || useFlag === '') {
					data.setValue("fUseStatus", '1', row);
					data.setValue("fUseStatusName", '启用', row);
				}
			});
			data.saveData({
				"onSuccess" : function(event) {
					event.source.refreshData();
				}
			});
		} catch (e) {
			alert("对不起,全部启用失败!");
		}
		/*
		 * try { var data = this.comp('mainData'); checkedIDs =
		 * this.comp('mainGrid').getCheckeds(); var len = checkedIDs.length;
		 * 
		 * for (var i = 0; i < len; i++) { var id =
		 * data.getRowByID(checkedIDs[i]);
		 * 
		 * var useFlag = data.getValue("fUseStatus"); if (useFlag == '2' ||
		 * useFlag == ''|| useFlag == '0' || useFlag == '') {
		 * data.setValue("fUseStatus", '1',id); data.setValue("fUseStatusName",
		 * '启用',id); } } data.saveData(); } catch (e) { alert("对不起,全部启用失败!"); }
		 */
	};
	// 状态停用
	Model.prototype.StopUseBtnClick = function(event) {

		try {
			var data = this.comp('mainData');
			var id = data.getCurrentRowID();

			data.setValue("fUseStatus", '0');
			data.setValue("fUseStatusName", '未启用');
			data.saveData();
		} catch (e) {
			alert("对不起,停用失败!");
		}
	};

	// 打开对话框
	Model.prototype.addBtnClick = function(event) {
		var baseInfoDlg = this.comp("dlgSelectCategory");
		baseInfoDlg.initEveryTimes = true;
		baseInfoDlg.open();
	};

	// 对话框返回接收处理
	Model.prototype.dlgSelectCategoryReceive = function(event) {
		var doc = event.data;
		var data = this.comp('detailData');
		var len = doc.length;
		var flag = 0;
		if (len > 0) {
			for ( var i = 0; i < len; i++) {
				if (flag == 0) {
					data.newData();
					data.setValue('fCategoryID', doc[i].val('OA_AM_Category'));
					data.setValue('fCategoryNO', doc[i].val("fCategoryNO"));
					data.setValue('fCategoryName', doc[i].val('fCategoryName'));
				}
			}
		}
	};

	Model.prototype.importExcel1Success = function(event) {
		var ksql = '';
		var ctx = this.getContext();

		var dataModel = '/OA/archival/data';
		var list = null;
		var grid = this.comp('mainGrid');
		for ( var i = 0; i < grid.getDataRow(); i++) {
			var fOwnDeptName = grid.getValueByName('fOwnDeptName', i);
			var fOwnDeptID = grid.getValueByName('fOwnDeptID', i);
			if (fOwnDeptName != '' && fOwnDeptID == '') {
				ksql = "select a,a.sFID,a.sFName from V_SA_OPOrg a where a.sName='" + fOwnDeptName + "' and a.sValidState=1";
				var params = new biz.Request.ActionParam();
				params.setParam("ksql", ksql);
				params.setParam("dataModel", dataModel);

				var options = {
					context : ctx,
					process : ctx.getCurrentProcess(),
					activity : ctx.getCurrentActivity(),
					action : "ksqlQueryAction",
					parameters : params
				};

				biz.Request.sendBizRequest(options);
				list = justep.XML.eval(result.responseXML, "//rows/row");
				if (list.length > 0) {
					fOwnDeptID = justep.XML.getNodeText(justep.XML.eval(list[0], 'cell[1]', 'single'));
					var fOwnDeptFID = justep.XML.getNodeText(justep.XML.eval(list[0], 'cell[2]', 'single'));
					var fOwnDeptFName = justep.XML.getNodeText(justep.XML.eval(list[0], 'cell[3]', 'single'));
					grid.setValueByName('fOwnDeptID', fOwnDeptID, i);
					grid.setValueByName('fOwnDeptFID', fOwnDeptFID, i);
					grid.setValueByName('fOwnDeptFName', fOwnDeptFName, i);
				} else {
					var n = i + 1;
					alert('第' + n + '行数据错误,错误原因:无对应名称的部门或状态为禁用,请确认后重新填写');
					// grid.setValueByName('fOwnDeptName', '', i);
					grid.del(i);
				}
			}
		}
	};

	Model.prototype.mainGridCellRender = function(event) {
		var mainData = this.comp('mainData');
		mainData.to(event.row.getID());
		fAllCategory = mainData.getValue("fAllCategory");
		if (event.colName == "fAllCategory") {
			if (fAllCategory == 1) {
				event.html = "<input name='Fruit' type='checkbox' checked/>";// disabled='disabled'
			} else {
				event.html = "<input name='Fruit' type='checkbox'/>";
			}
		}
	};

	return Model;
});