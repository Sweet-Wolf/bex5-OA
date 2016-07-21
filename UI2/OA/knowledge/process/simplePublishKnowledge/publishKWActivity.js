define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	var date = require('$UI/system/lib/base/date');
		
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.relaseKnowledge = function(event){
		
		var data = this.comp('dKnowledge');
		
		if (data.isChanged()) {
			alert('请先保存！');
			return;
		}
		var canRelease = this.canReleaseKWFun();
		if (!canRelease) {
			return;
		}
		try {
			var kwid = data.getCurrentRowID();
			var cfm = window.confirm('确定要发布吗?');
			if (cfm) {
				var fReleaseOgnID = this.getContext().getCurrentOgnID();
				var fReleaseOgnName = this.getContext().getCurrentOgnName();
				var fReleaseDeptID = this.getContext().getCurrentDeptID()
						|| this.getContext().getCurrentOgnID();
				var fReleaseDeptName = this.getContext().getCurrentDeptName() || this.getContext().getCurrentOgnName();
				var fReleasePsnID = this.getContext().getCurrentPersonID();
				var fReleasePsnName = this.getContext()
						.getCurrentPersonMemberNameWithAgent();
				var fReleasePsnFID = this.getContext().getCurrentPersonMemberFID();
				var fReleasePsnFName = this.getContext()
						.getCurrentPersonMemberFNameWithAgent();
				/*var fReleaseTime = justep.Date.toString(new Date(),
						justep.Date.STANDART_FORMAT);*/
			//	var fReleaseTime = new Date().toLocaleString();
				var fReleaseTime = justep.Date.toString(new Date(),
						justep.Date.STANDART_FORMAT);
						
				data.setValue('fReleaseOgnID',fReleaseOgnID);
				data.setValue('fReleaseOgnName',fReleaseOgnName);
				data.setValue('fReleaseDeptID',fReleaseDeptID);
				data.setValue('fReleaseDeptName',fReleaseDeptName);
				data.setValue('fReleasePsnID',fReleasePsnID);
				data.setValue('fReleasePsnName',fReleasePsnName);
				data.setValue('fReleasePsnFID',fReleasePsnFID);
				data.setValue('fReleasePsnFName',fReleasePsnFName);
				data.setValue('fReleaseTime',fReleaseTime);
				data.setValue('fReleaseStatus','1');
				data.setValue('fReleaseStatusName','已发布');
				
				/*data.setRowData(kwid, [fReleaseOgnID, fReleaseOgnName,
						fReleaseDeptID, fReleaseDeptName, fReleasePsnID,
						fReleasePsnName, fReleasePsnFID, fReleasePsnFName,
						fReleaseTime, '1', '已发布'], ['fReleaseOgnID',
						'fReleaseOgnName', 'fReleaseDeptID', 'fReleaseDeptName',
						'fReleasePsnID', 'fReleasePsnName', 'fReleasePsnFID',
						'fReleasePsnFName', 'fReleaseTime', 'fReleaseStatus',
						'fReleaseStatusName']);*/
				data.saveData();
				
				alert("发布成功!");
			}
		} catch (e) {
			alert("发布知识出错!"+e.message);
		}
	};
	
	// 判断当前人是否有权限发布知识(不走流程的直接发布)
	Model.prototype.canReleaseKWFun = function() {
		
		var folderID = this.comp('dKnowledge').getValue('fFolderID');
		if (folderID && (folderID != '')) {
			
			var params = new biz.Request.ActionParam();
			params.setString("folderID", folderID);
			var response = false;
			biz.Request.sendBizRequest({
				"context" : this.getContext(),
				"action" : "canReleaseKWAction",
				"parameters" : params,
				"callback" : function(callbackData) {
					callbackData.ignoreError = false;
					if (callbackData.state) {
						if(callbackData.response == true){
							response = true;
						}else{
							throw new Error("对不起,您目前没有发布知识的权限!");
						}
					}else{
						throw new Error("对不起,发布失败了!");
					}
				}
			});
		} else {
			alert("请先选择一个有效的栏目!");
		}
		return response;
	};
	
	/* 审批发布 */
	Model.prototype.approveRelaseKnowledge = function(event){
		
		var data = this.comp('dKnowledge');
		if (data.saveData()) {
			var kwid = data.getCurrentRowID();
			var flowEngine = this.comp("processKW");
			var taskid = this.getContext().getTask();
			if (taskid == null || taskid == '') {
				flowEngine.start(null, null, kwid);
			}
			flowEngine.advanceQuery();
		}
	};
	
	/* 取消发布 */
	Model.prototype.cancelRelaseKnowledge = function(event){
		
		var data = this.comp('dKnowledge');
		if (data) {
			try {
				var kwid = data.getCurrentRowID();
				if (kwid != '') {
					var cfm = window.confirm('确定要取消发布吗?');
					if (cfm) {
						data.setValue("fReleaseStatus", "2");
						data.setValue("fReleaseStatusName", "已取消");
						data.saveData();
						alert('取消发布成功!');
					}
				}
			} catch (e) {
				alert("取消发布失败! "+e.message);
			}
		}
	};
	
	
	Model.prototype.windowReceiverReceive = function(event){
		debugger;
		if(event.data == null)
			return;
		var operator = event.data.operator;
		this.kwid = event.data.KWID;
		if('edit' == operator){
			var dKnowledge = this.comp('dKnowledge');
			dKnowledge.filters.setFilter("KWFilter", "OA_KM_Knowledge='" + event.data.KWID + "'");
			var confirmRefresh = dKnowledge.confirmRefresh;
			try{
				dKnowledge.confirmRefresh = false;
				dKnowledge.refreshData();
			}finally{
				dKnowledge.confirmRefresh = confirmRefresh;
			}
			this.otherFolderIDs = this.getKWFolderIDs();
		}
	};
	


	

	
	return Model;
});