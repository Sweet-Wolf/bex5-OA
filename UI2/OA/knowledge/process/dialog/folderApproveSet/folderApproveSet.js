define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.okBtnClick = function(event){
		;
		var dCheckbox = this.comp("dCheckbox");
		var isNeedApprove = '0';
		var isInherit = '0';
		var isOverride = '0';
		if (dCheckbox.getValue("approveChb")) {
			isNeedApprove = '1';
		}
		if (dCheckbox.getValue("inheritChb")) {
			isInherit = '1';
		}
		if (dCheckbox.getValue("overrideChb")) {
			isOverride = '1';
		}
		var options = {
			"isNeedApprove" : isNeedApprove,
			"isInherit" : isInherit,
			"isOverride" : isOverride
		};
		this.comp("windowReceiver").windowEnsure(options);
	};

	Model.prototype.windowReceiverReceive = function(event){
		;
		var dApproveParam = this.comp("dApproveParam");
		dApproveParam.setValue("folderID",event.data.folderID);
		dApproveParam.setValue("isNeedApprove",event.data.isNeedApprove);
		dApproveParam.setValue("isInheritApprove",event.data.isInheritApprove);
		
		var dCheckbox = this.comp("dCheckbox");
		var dIsDisabled = this.comp("dIsDisabled");
		if(dApproveParam.getValue("isNeedApprove") == '1'){
			dCheckbox.setValue("approveChb",true);
		}
		if(dApproveParam.getValue("isInheritApprove") == '1'){
			dCheckbox.setValue("inheritChb",true);
			dIsDisabled.setValue("approveChb",true);
		}
		
/*		var approveChb = this.comp("approveChb");
		var inheritChb = this.comp("inheritChb");
		var overrideChb = this.comp("overrideChb");*/
	};

	// 响应 继承父栏目设置 单击事件
	Model.prototype.inheritChbClick = function(event){
		;
		var dApproveParam = this.comp("dApproveParam");
		var dCheckbox = this.comp("dCheckbox");
		var dIsDisabled = this.comp("dIsDisabled");
		var checked = dCheckbox.getValue("inheritChb");
		if (checked) {
			try {
				var result = this.getParentFolderApproveSetFun(dApproveParam.getValue("folderID"));
				var arrRst = result.split(" ");
				var pID = arrRst[0];
				var pNeedApprove = arrRst[1];
				if (pID == "public" || pID == "private" || pID == "map") { /* 是根节点 */
					dIsDisabled.setValue('inheritChb',true);
					dCheckbox.setValue('inheritChb',false);
				} else {
					dIsDisabled.setValue('approveChb',true);
					if (pNeedApprove == '1') {
						dCheckbox.setValue('approveChb',true);
					} else {
						dCheckbox.setValue('approveChb',false);
					}
				}
			} catch (e) {
				alert(e.message);
				dCheckbox.setValue('inheritChb',false);
			}
		} else {
			dIsDisabled.setValue('approveChb',false);
		}
	};
	
	/*
	 * 获取父栏目审批设置 返回数据格式："栏目fid 栏目是否需要审批 "
	 */
	Model.prototype.getParentFolderApproveSetFun = function(folderID) {
		;
		var params = new biz.Request.ActionParam();
		params.setString("folderID", folderID);
		var response;
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "getParentFolderApproveSetAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					response = callbackData.response;
				}else{
					throw new Error("继承父栏目审批设置出错!");
				}
			}
		});
		return response;
	};
	
	return Model;
});