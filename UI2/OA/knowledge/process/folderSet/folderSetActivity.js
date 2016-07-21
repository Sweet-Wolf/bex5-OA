define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');

	var Model = function() {
		this.callParent();
	};

	Model.prototype.show = function(msg) {
		justep.Util.hint(msg, {
			type : 'success',
			parent : this.getRootNode()
		});
	};

	Model.prototype.trgStartUseClick = function(event) {
		try {
			var dFolder = this.comp('dFolder');
			var row = dFolder.getCurrentRow();
			if (dFolder.getValue("fUseStatus", row) == '1') {
				this.show("已经启用过!");
			} else {
				dFolder.setValue("fUseStatus", '1', row);
				dFolder.setValue("fUseStatusName", '启用', row);
				dFolder.saveData();
			}
		} catch (e) {
			this.show("对不起,启用失败!");
		}
	};

	Model.prototype.trgAllUseClick = function(event) {
		try {
			var dFolder = this.comp('dFolder');

			dFolder.eachAll(function(param) {
				var useFlag = param.row.val('fUseStatus');
				var row = param.row;
				if (useFlag == '2' || useFlag == '') {
					dFolder.setValue("fUseStatus", '1', row);
					dFolder.setValue("fUseStatusName", '启用', row);
				}
			});
			dFolder.saveData();
		} catch (e) {
			this.show("对不起,全部启用失败!");
		}
	};

	Model.prototype.trgStopUseClick = function(event) {
		try {
			var dFolder = this.comp('dFolder');
			var row = dFolder.getCurrentRow();
			if (dFolder.getValue("fUseStatus", row) == '2') {
				this.show("已经停用了!");
			} else {
				dFolder.setValue("fUseStatus", '2', row);
				dFolder.setValue("fUseStatusName", '停用', row);
				dFolder.saveData();
			}
		} catch (e) {
			this.show("对不起,停用失败!");
		}
	};

	Model.prototype.dFolderSaveCommit = function(event) {
		justep.Util.hint("保存成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	};

	Model.prototype.approveSetClick = function(event) {
		;
		var data = this.comp('dFolder');
		var folderID = data.getCurrentRowID();
		if ('public' == folderID) {
			alert("请选择一个有效的栏目!");
			return;
		}

		var dCurrentFolderInfo = this.comp('dCurrentFolderInfo');
		var isNeedApprove = dCurrentFolderInfo.getValue("fIsNeedApprove");
		var isInheritApprove = dCurrentFolderInfo.getValue("fIsInheritApprove");
		if ((isNeedApprove != '0' && isNeedApprove != '1')
				|| (isInheritApprove != '0' && isInheritApprove != '1')) {
			alert("当前栏目审批信息不正确!");
			return;
		}
		var dlg = this.comp("dlgApproveSet");
		
		var options = {
			"folderID" : folderID,
			"isNeedApprove" : isNeedApprove,
			"isInheritApprove" : isInheritApprove
		};
		dlg.open({
			data : options
		});
	};

	Model.prototype.grdFolderRowClick = function(event) {
		this.displayCurrentFolderInfo();
	};

	Model.prototype.displayCurrentFolderInfo = function() {
		;
		var dCurrentFolder = this.comp("dCurrentFolderInfo");
		var dFolder = this.comp("dFolder");
		var folderID = dFolder.getRowID();
		if (folderID != 'public') {
			try {
				
				var infoResult = this.getFolderInfo(folderID);
				var arrInofResult = infoResult.split("|");
				var fIsNeedApprove = arrInofResult[0];
				var fIsInheritApprove = arrInofResult[1];
				var fIsInheritManager = arrInofResult[2];
				var fManagerNames = arrInofResult[3] == "null" ? ""
						: arrInofResult[3];
				var fIsInheritRights = arrInofResult[4];
				var folderFName = arrInofResult[5];

				dCurrentFolder.setValue("folderID", folderID);
				dCurrentFolder.setValue("folderFName", folderFName);
				dCurrentFolder.setValue("fIsNeedApprove", fIsNeedApprove);
				dCurrentFolder.setValue("fIsInheritApprove", fIsInheritApprove);
				dCurrentFolder.setValue("fIsInheritManager", fIsInheritManager);
				dCurrentFolder.setValue("fManagerNames", fManagerNames);
				dCurrentFolder.setValue("fIsInheritRights", fIsInheritRights);
				/*
				 * dCurrentFolder.setRowData("rowid1", [folderID, folderFName,
				 * fIsNeedApprove, fIsInheritApprove, fIsInheritManager,
				 * fManagerNames, fIsInheritRights], ['folderID', 'folderFName',
				 * 'fIsNeedApprove', 'fIsInheritApprove', 'fIsInheritManager',
				 * 'fManagerNames', 'fIsInheritRights']);
				 */
			} catch (e) {
				alert(e.massage);
				dCurrentFolder.setValue("folderID", folderID);
				dCurrentFolder.setValue("folderFName", folderFName);
				dCurrentFolder.setValue("fIsNeedApprove", '-1');
				dCurrentFolder.setValue("fIsInheritApprove", '-1');
				dCurrentFolder.setValue("fIsInheritManager", '-1');
				dCurrentFolder.setValue("fManagerNames", '');
				dCurrentFolder.setValue("fIsInheritRights", '-1');
				/*
				 * dCurrentFolder.setRowData("rowid1", [folderID, folderFName,
				 * '-1', '-1', '-1', '', '-1'], ['folderID', 'folderFName',
				 * 'fIsNeedApprove', 'fIsInheritApprove', 'fIsInheritManager',
				 * 'fManagerNames', 'fIsInheritRights']);
				 */
			}
		} else {
			dCurrentFolder.setValue("fIsNeedApprove", '0');
			dCurrentFolder.setValue("fManagerNames", '');
		}

	};

	// 获取栏目信息(fIsNeedApprove,fIsInheritApprove,fIsInheritManager,fManagerNames)
	Model.prototype.getFolderInfo = function(folderID) {
		var params = new biz.Request.ActionParam();
		params.setString("folderID", folderID);
		var response;
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "getFolderInfoAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					response = callbackData.response;
				}
			}
		});
		return response;
	}

	// 新建栏目
	Model.prototype.newBtnClick = function(event) {
		;
		var data = this.comp('dFolder');
		if (this.canNewNodeFun(data)) {
			var pid = data.getRowID();
			var pFullID = data.getValue("fFullID");
			var pFullName = data.getValue("fFullName");

			/*
			 * data.newData(null, pid); var fullID = pFullID + "/" +
			 * data.getCurrentRowId(); var fullName = pFullName + "/" +
			 * data.getValue("fName"); data.setValue("fFullID", fullID);
			 * data.setValue("fFullName", fullName);
			 */
			data.newData({parent:data.getCurrentRow()});
			var fullID = pFullID + "/" + data.getCurrentRowID();
			var fullName = pFullName + "/" + data.getValue("fName");
			data.setValue("fParent", pid);
			data.setValue("fFullID", fullID);
			data.setValue("fFullName", fullName);
			data.saveData();

			var folderID = data.getRowID();
			var folderName = data.getValue("fName");
			var pid = data.getValue("fParent");
			try {
				this.setDefValueToFolderWhenNew(folderID, pid);
				if (pid != 'public') {
					this.inheritApproveSetFun(folderID);
					this.inheritManagerSetFun(folderID);
					this.inheritRightsSetFun(folderID);
				}
				this.displayCurrentFolderInfo();
			} catch (e) {
				alert(e.message);
			}
		}
	};

	// 能否新建栏目
	Model.prototype.canNewNodeFun = function(data) {
		;
		var data = this.comp('dFolder');
		if (typeof (data) == "string") {
			data = this.comp(data);
		}
		var pName = data.getValue("fName");
		if (pName == "") {
			alert("父栏目名称不能为空!");
			return false;
		}
		return true;
	};

	// 新增栏目时赋初始值(fIsNeedApprove,fIsInheritApprove,fIsInheritManager,fIsInheritRights)
	Model.prototype.setDefValueToFolderWhenNew = function(folderID, pid) {
		;
		var params = new biz.Request.ActionParam();
		params.setString("folderID", folderID);
		params.setString("pid", pid);
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "setDefValueToFolderWhenNewAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (!callbackData.state) {
					throw new Error("为新增栏目赋初始值失败!");
				}
			}
		});
	};

	// 继承父栏目审批设置
	Model.prototype.inheritApproveSetFun = function(folderID) {
		;
		var params = new biz.Request.ActionParam();
		params.setString("folderID", folderID);
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "inheritApproveSetAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (!callbackData.state) {
					throw new Error("继承父栏目审批设置失败!");
				}
			}
		});
	};

	// 继承父栏目 管理员设置
	Model.prototype.inheritManagerSetFun = function(folderID) {
		;
		var params = new biz.Request.ActionParam();
		params.setString("folderID", folderID);

		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "inheritManagerSetAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (!callbackData.state) {
					throw new Error("继承父栏目管理员设置失败!");
				}
			}
		});
	};

	// 继承父栏目 权限设置
	Model.prototype.inheritRightsSetFun = function(folderID) {
		;
		var params = new biz.Request.ActionParam();
		params.setString("folderID", folderID);
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "inheritRightsSetAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (!callbackData.state) {
					throw new Error("继承父栏目权限设置失败!");
				}
			}
		});
		this.comp('dRights').refreshData();
	};

	Model.prototype.deleteFolderFun = function(event) {
		;
		var dFolder = this.comp('dFolder');
		var folderID = dFolder.getCurrentRowID();
		if (folderID == 'public') {
			alert("根节点不允许删除!");
			return;
		}
		var can = this.canDeleteFolder();
		if (can) {
			dFolder.deleteData();
			/*dFolder.saveData();
			dFolder.refreshData();*/
		} else {
			alert('该栏目下拥有子栏目或知识,请先删除!');
		}
	};

	Model.prototype.canDeleteFolder = function() {
		var data = this.comp('dFolder');
		if (data) {
			var can = false;
			var folderID = data.getCurrentRowID();
			var params = new biz.Request.ActionParam();
			params.setString("folderID", folderID);

			biz.Request.sendBizRequest({
				"context" : this.getContext(),
				"action" : "canDeleteFolderAction",
				"parameters" : params,
				"callback" : function(callbackData) {
					callbackData.ignoreError = false;
					if (callbackData.state) {
						;
						can = callbackData.response;
					}
				}
			});
		}
		return can;
	};

	Model.prototype.dlgApproveSetReceive = function(event){
		try {
			;
			var folderID = this.comp('dFolder').getCurrentRowID();
			var isNeedApprove = event.data.isNeedApprove;
			var isInherit = event.data.isInherit;
			var isOverride = event.data.isOverride;
			this.updateFolderApproveSet(folderID, isNeedApprove, isInherit, isOverride);
			var data = this.comp('dCurrentFolderInfo');
			data.setValue("fIsNeedApprove", isNeedApprove);
			data.setValue("fIsInheritApprove", isInherit);
		} catch (e) {
			alert("审批设置失败!");
		}
	};
	
	// 更新栏目审批设置
	Model.prototype.updateFolderApproveSet = function(folderID, isNeedApprove, isInherit, isOverride) {
		;
		var params = new biz.Request.ActionParam();
		params.setString("folderID", folderID);
		params.setString("isNeedApprove", isNeedApprove);
		params.setString("isInherit", isInherit);
		params.setString("isOverride", isOverride);

		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "updateFolderApproveSetAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (!callbackData.state) {
					throw new Error("审批设置失败!");
				}
			}
		});
	};

	Model.prototype.managerSetClick = function(event){
		;
		var data = this.comp('dFolder');
		var folderID = data.getCurrentRowID();
		if ('public' == folderID) {
			alert("请选择一个有效的栏目!");
			return;
		}
		var isInheritManager = this.comp('dCurrentFolderInfo')
				.getValue("fIsInheritManager");
		if (isInheritManager != '0' && isInheritManager != '1') {
			alert("当前栏目管理员信息不正确!");
			return;
		}
		var dlg = this.comp("dlgManagerSet");
		var options = {
			"folderID" : folderID,
			"isInheritManager" : isInheritManager
		};
		dlg.open({
			data : options
		});
	};

	Model.prototype.dlgManagerSetReceive = function(event){
		;
		
		var isInherit = event.data.isInherit;
		var managerNames = event.data.managerNames;
	
		var data = this.comp('dCurrentFolderInfo');
		data.setValue("fIsInheritManager", isInherit);
		data.setValue("fManagerNames", managerNames);
	};


	Model.prototype.openRightsSetDialog = function(event){
		;
		var dFolder = this.comp('dFolder');
		var folderID = dFolder.getCurrentRowID();
		var folderFullID = dFolder.getValue("fFullID");
		var isInheritRights = this.comp('dCurrentFolderInfo')
				.getValue("fIsInheritRights");
		if ('public' == folderID) {
			alert("请选择一个有效的栏目!");
			return;
		}
		if (isInheritRights != '0' && isInheritRights != '1') {
			alert("当前栏目权限信息不正确!");
			return;
		}
		var dlg = this.comp("dlgRightsSet");
		
		var options = {
			"folderID" : folderID,
			"folderFullID" : folderFullID,
			"isInheritRights" : isInheritRights
		}
		
		dlg.open({
			data : options
		});
		
	};

	Model.prototype.dlgRightsSetReceive = function(event){
		;
		var isInherit = event.data.isInherit;
		var data = this.comp('dCurrentFolderInfo');
		data.setValue("fIsInheritRights", isInherit);
		this.comp("dRights").refreshData();
	};
	
	Model.prototype.conceptIsReadonly = function(){
		;
		var data = this.comp('dFolder');
		if (data) {
			if (data.getCurrentRowID() == 'public') {
				return true;
			} else {
				return false;
			}
		} else {
			return true;
		}
	};
	return Model;
});