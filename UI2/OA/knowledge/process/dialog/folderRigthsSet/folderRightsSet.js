define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	var request = require('$UI/system/lib/base/request');
	
	
	var Model = function(){
		this.callParent();
		this.rt_folderID;
		this.rt_folderFullID;
		this.rt_isInheritRights;
	};

	Model.prototype.windowReceiverReceive = function(event){
		;
		this.rt_folderID = event.data.folderID;
		this.rt_folderFullID = event.data.folderFullID;
		this.rt_isInheritRights = event.data.isInheritRights;
		
		if (this.rt_isInheritRights == '1') {
			this.comp('dCheck').setValue("inheritChb",true)
		}
	
		var dRights = this.comp('dRights');
		dRights.filters.setFilter("RightsFilter", "fFolderID = '" + this.rt_folderID
				+ "' and fKWKind = 'Folder'");
		dRights.refreshData();
	};

	Model.prototype.orgDialogPCReceive = function(event){
		;
		var dRights = this.comp('dRights');
		var rows = event.data;
		for ( var i in rows) {
			var fKWKind = "Folder";
			var orgKind = rows[i].val('sOrgKindID');
			var orgID = rows[i].val('sPersonID');
			if (orgID == "")
				orgID = rows[i].getID();
			var orgName = rows[i].val("sName");
			var orgFID = rows[i].val("sFID");
			var orgFName = rows[i].val("sFName");
			
			if (!this.havaPerson(orgFID)) {
				dRights.newData({});
				dRights.setValue("fKWKind", fKWKind);
				dRights.setValue("fFolderID", this.rt_folderID);
				dRights.setValue("fKWFullID", this.rt_folderFullID);
				dRights.setValue("fOrgKind", orgKind);
				dRights.setValue("fOrgID", orgID);
				dRights.setValue("fOrgName", orgName);
				dRights.setValue("fOrgFID", orgFID);
				dRights.setValue("fOrgFName", orgFName);
				dRights.setValue("fIsInherit", '0');
			}
		}
	};
	
	Model.prototype.havaPerson = function(id) {
		var b = false;
		var dRights = this.comp('dRights');
		dRights.eachAll(function(param) {
			if (param.row.val('fOrgFID') == id) {
				b = true;
				return;
			}
		});
		return b;
	};

	// 响应 继承父栏目设置 单击事件
	Model.prototype.inheritChbClick = function(event){
		;
		var dRights = this.comp('dRights');
		var dCheck = this.comp('dCheck');
		if (dCheck.getValue('inheritChb')) {
			try {
				//var grd = xforms('grdRights').grid;
				var r = this.getParentFolderRightsSetFun(this.rt_folderID);
				var st = this.comp("executeData");
				st.loadData(r);
				st.each(function(param){
					var orgFID = param.row.val('fOrgFID');
					if (this.havaPerson(orgFID)) {
						dRights.setValue("fIsInherit", '1',param.row);
					}else{
						dRights.newData({});
						var orgKind = param.row.val('fOrgKind');
						var orgID = param.row.val('fOrgID');
						var orgName = param.row.val('fOrgName');
						var orgFName = param.row.val('fOrgFName');
						var canCreateKW = param.row.val('fCanCreateKW');
						var canReadKW = param.row.val('fCanReadKW');
						var canReleaseKW = param.row.val('fCanReleaseKW');
						var canCreateComment = param.row.val('fCanCreateComment');
						var canScore = param.row.val('fCanScore');
						var canReadRecord = param.row.val('fCanReadRecord');
						var isInherit = '1';
						
						dRights.setValue("fKWKind", "Folder");
						dRights.setValue("fFolderID", this.rt_folderID);
						//"fKWFullID", "fOrgKind", "fOrgID",
						//rt_folderFullID, orgKind, orgID,
						dRights.setValue("fKWFullID", this.rt_folderFullID);
						dRights.setValue("fOrgKind", orgKind);
						dRights.setValue("fOrgID", orgID);
						//-"fOrgName", "fOrgFID", "fOrgFName", "fCanCreateKW",
						//-orgName, orgFID, orgFName, canCreateKW,
						dRights.setValue("fOrgName", orgName);
						dRights.setValue("fOrgFID", orgFID);
						dRights.setValue("fOrgFName", orgFName);
						dRights.setValue("fCanCreateKW", canCreateKW);
						
						//-"fCanReadKW", "fCanReleaseKW", "fCanCreateComment",
						//-canReadKW,canReleaseKW, canCreateComment,
						dRights.setValue("fCanReadKW", canReadKW);
						dRights.setValue("fCanReleaseKW", canReleaseKW);
						dRights.setValue("fCanCreateComment", canCreateComment);
						
						//-"fCanReadComment", "fCanScore", "fCanReadRecord","fIsInherit"
						//-canReadComment,canScore, canReadRecord, isInherit 
						dRights.setValue("fCanReadComment", canReadComment);
						dRights.setValue("fCanScore", canScore);
						dRights.setValue("fCanReadRecord", canReadRecord);
						dRights.setValue("fIsInherit", isInherit);
					}
				});
			} catch (e) {
				alert("继承父栏目权限出错!");
				return;
			}
		} else {
			dRights.each(function(param){
				param.row.val("fIsInherit",'0')
			});
		}
	};
	
	// 获取父栏目权限设置
	Model.prototype.getParentFolderRightsSetFun = function(folderID) {
		;
		var params = new biz.Request.ActionParam();
		params.setString("folderID", folderID);
		var response;
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "getParentFolderRightsSetAction",
			"parameters" : params,
			"translateParam" : "<translate-parameter><display-type>table</display-type></translate-parameter>",
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					response = callbackData.response;
				}else{
					throw new Error("获取父栏目权限失败!");
				}
			}
		});
		return response;
	};

	Model.prototype.OKBtnClick = function(event){
		;
		try {
			var data = this.comp('dRights');
			var dCheck = this.comp('dCheck');
			request.beginBatch();
			try{
				data.saveData();
				if (dCheck.getValue("overrideFDChb")) {
					this.overrideAllSubFDRightsSet(this.rt_folderID);
					if (dCheck.getValue("overrideKWChb")) {
						this.overrideKWRightsFromFDSet(this.rt_folderID, 'true');
					}
				} else {
					this.updateAllSubFDRightsSet(this.rt_folderID);
					if (dCheck.getValue('overrideKWChb')) {
						this.overrideKWRightsFromFDSet(this.rt_folderID, 'false');
					}
				}
			} catch (e) {
				alert("更新栏目权限信息出错!");
				return;
			}
			var r = request.endBatch();
			this.comp('windowReceiver').windowEnsure(this.sendData());
		} catch (e) {
			alert("对话框返回出错!");
		}
			
	};
	
	// 覆盖子栏目权限设置
	Model.prototype.overrideAllSubFDRightsSet = function(folderID) {
		var params = new biz.Request.ActionParam();
		params.setString("folderID", folderID);
		var response;
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "overrideAllSubFDRightsSetAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (!callbackData.state) {
					throw new Error("应用于子栏目操作失败!");
				}
			}
		});
	};

	// 覆盖栏目的知识权限设置
	// includeSub = 'true' 表示要除了要覆盖当前栏目知识权限外,还要覆盖所有子栏目的知识权限
	// includeSub = 'false' 只覆盖当前栏目下的知识权限
	Model.prototype.overrideKWRightsFromFDSet = function(folderID, includeSub) {
		
		var params = new biz.Request.ActionParam();
		params.setString("folderID", folderID);
		params.setString("includeSub", includeSub);
		var response;
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "overrideKWRightsFromFDSetAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (!callbackData.state) {
					throw new Error("应用于知识操作失败!");
				}
			}
		});
	};
	
	// 更新所有子栏目权限设置(继承)
	Model.prototype.updateAllSubFDRightsSet = function(folderID) {
		var params = new biz.Request.ActionParam();
		params.setString("folderID", folderID);
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "updateAllSubFDRightsSetAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (!callbackData.state) {
					throw new Error("更新子栏目权限失败!");
				}
			}
		});
	};
	
	
	Model.prototype.sendData = function() {
		var isInherit = '0';
		if (this.comp('dCheck').getValue("inheritChb")){
			isInherit = '1';
		}
		return {
			"isInherit" : isInherit
		};
	}
	return Model;
});