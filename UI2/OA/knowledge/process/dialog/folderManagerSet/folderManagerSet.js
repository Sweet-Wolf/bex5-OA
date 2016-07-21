define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	var request = require('$UI/system/lib/base/request');
	

	var Model = function() {
		this.callParent();
		this.mg_folderID;
		this.mg_isInheritManager;
	};

	Model.prototype.windowReceiverReceive = function(event) {
		;
		this.mg_folderID = event.data.folderID;
		this.mg_isInheritManager = event.data.isInheritManager;
		if (this.mg_isInheritManager == '1') {
			this.comp("dChecked").setValue('inheritChb', true);
		}
		var dManager = this.comp('dManager');
		dManager.filters.setFilter("managerFilter", "fFolderID = '"
				+ this.mg_folderID + "'");
		dManager.refreshData();
	};


	Model.prototype.orgDialogPCReceive = function(event) {
		;
		var rows = event.data;
		var dManager = this.comp('dManager');
		for ( var i in rows) {
			var fManagerID = rows[i].val('sPersonID');
			var fManagerName = rows[i].val('sName');
			var sOrgFName = rows[i].val('sFName').replace("/" + fManagerName,
					"");
			if (!this.havaPerson(fManagerID)) {
				dManager.newData({});
				dManager.setValue("fFolderID", this.mg_folderID);
				dManager.setValue("fManagerID", fManagerID);
				dManager.setValue("fManagerName", fManagerName);
				dManager.setValue("sOrgFName", sOrgFName);
				dManager.setValue("fIsInherit", '0');
			}
		}
	};

	Model.prototype.havaPerson = function(name) {
		;
		var b = false;
		var dManager = this.comp('dManager');
		dManager.eachAll(function(param) {
			if (param.row.val('fManagerID') == name) {
				b = true;
				return;
			}
		});
		return b;
	};

	// 响应 继承父栏目设置 单击事件
	Model.prototype.inheritChbClick = function(event) {
		;
		var dManager = this.comp('dManager');
		var dChecked = this.comp('dChecked');
		var DMANAGER_DATA_COLUMNIDS = "fManagerID,fManagerName";
		if (dChecked.getValue('inheritChb')) {
			try {
				//var grd = xforms('grdManager').grid;
				var r = this.getParentFolderManagerSetFun(this.mg_folderID);
				//var st = new SimpleStore("executeData", DMANAGER_DATA_COLUMNIDS);
				var st = this.comp("executeData");
				st.loadData(r.responseXML);
				//var len = st.getRowsNum();
				st.each(function(param){
					var managerID = param.row.val('fManagerID');
					var managerName = param.row.val('fManagerName');
					var isInherit = '1';
					var sOrgFName = "";
					if (managerID != '') {
						sOrgFName = this.getPsnMainOrgFullNameFun(managerID);
					}
					if (this.havaPerson(fManagerID)) {
						var row = param.row;
						dManager.setValue("sOrgFName", sOrgFName,row);
						dManager.setValue("fIsInherit", isInherit,row);
					}else{
						dManager.newData({});
						dManager.setValue("fFolderID", this.mg_folderID);
						dManager.setValue("fManagerID", fManagerID);
						dManager.setValue("fManagerName", fManagerName);
						dManager.setValue("sOrgFName", sOrgFName);
						dManager.setValue("fIsInherit", '1');
					}
				});
			} catch (e) {
				alert("继承父栏目管理员出错!");
				return;
			}
		} else {
			dManager.each(function(param){
				param.row.val('fIsInherit','0');
			});
		}
	};

	Model.prototype.getParentFolderManagerSetFun = function(folderID) {
		;
		var params = new biz.Request.ActionParam();
		params.setString("folderID", folderID);
		var response;
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "getParentFolderManagerSetAction",
			"parameters" : params,
			"translateParam" : "<translate-parameter><display-type>table</display-type></translate-parameter>",
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					response = callbackData.response;
				}else{
					throw new Error("获取父栏目管理员失败!");
				}
			}
		});
		return response;
	};
	
	// 获取人员主机构name路径
	Model.prototype.getPsnMainOrgFullNameFun = function(psnID) {
		;
		var params = new biz.Request.ActionParam();
		params.setString("psnID", psnID);
		var response;
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "getPsnMainOrgFullNameAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					response = callbackData.response;
				}else{
					throw new Error("获取人员主机构失败!");
				}
			}
		});
		return response;
	};
	
		
	Model.prototype.okBtnClick = function(event) {
		;
		try {
			var dManager = this.comp('dManager');
			request.beginBatch();
			try{
				dManager.saveData();
				this.updateAllSubFolderManagerSet(this.mg_folderID);
			} catch (e) {
				alert("更新管理员信息出错!");
			} 
			var r = request.endBatch();
			this.comp('windowReceiver').windowEnsure(this.sendData());
		} catch (e) {
			alert("对话框返回出错!");
		}
	};
	
	// 更新子栏目 管理员设置
	// @pFolderID 父栏目ID
	// @kind 更新类型(1=继承 2=覆盖)
	Model.prototype.updateAllSubFolderManagerSet = function(folderID) {
		var dChecked = this.comp("dChecked");
		var isInherit = '0';
		if (dChecked.getValue('inheritChb')) {
			isInherit = '1';
		}
		var kind = '1';
		if (dChecked.getValue('overrideChb')) {
			kind = '2';
		}
		
		var params = new biz.Request.ActionParam();
		params.setString("folderID", folderID);
		params.setString("isInherit", isInherit);
		params.setString("kind", kind);
		var response;
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "updateAllSubFolderManagerSetAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (!callbackData.state) {
					throw new Error("更新子栏目管理员出错!");
				}
			}
		});
	};
	
	Model.prototype.sendData = function () {
		;
		var dManager = this.comp('dManager');
		var isInherit = '0';
		if (this.comp('dChecked').getValue('inheritChb')) {
			isInherit = '1';
		}
		var managerNames = "";
		
		dManager.each(function(param){
			var manager = param.row.val("fManagerName");
			managerNames = manager + " " + managerNames;
		});
		return {
			"isInherit" : isInherit,
			"managerNames" : managerNames
		};
	}
	
	return Model;
});