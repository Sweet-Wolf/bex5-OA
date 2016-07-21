define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	var common = require("../common/commonJs");

	var Model = function() {
		this.callParent();
		this.canChange = false;
	};

	Model.prototype.btnAddClick = function(event) {
		this.btnAddOrCancelClick("addKnowledgeGZAction", "增加关注成功！",
				"当前文档已经设置关注！", "增加关注失败");
	};

	Model.prototype.btnCancelClick = function(event) {
		this.btnAddOrCancelClick("cancelKnowledgeGZAction", "取消关注成功！",
				"当前文档没有设置关注，不能进行取消关注操作！", "取消关注失败");
	};

	Model.prototype.btnAddOrCancelClick = function(action, yesMsg, noMsg,
			errorMsg) {

		var data = this.comp('dKnowledge');
		var kwid = data.getCurrentRowID();
		var len = data.getCount();
		if (len == 0) {
			alert("请选择需要取消关注的文档，再进行取消关注操作！");
		} else {
			;
			var params = new biz.Request.ActionParam();
			params.setString("kwid", kwid);
			biz.Request.sendBizRequest({
				"context" : this.getContext(),
				"action" : action,
				"parameters" : params,
				"callback" : function(callbackData) {
					callbackData.ignoreError = false;
					if (callbackData.state) {
						var response = callbackData.response;
						if (response == "YES") {
							alert(yesMsg);
							data.refreshData();
						} else if (response == "NO") {
							alert(noMsg);
						}
					} else {
						throw new Error(errorMsg);
					}
				}
			});
		}
	};

	Model.prototype.displayKnowledge = function(event) {
		;
		var filterCondition = '';
		var dKW = this.comp('dKnowledge');
		var folderID = this.comp('dFolder').getCurrentRowID();
		//var folderFullID = this.comp('dFolder').getValue('folderFullID');
		var folderFullID = this.comp('dFolder').getCurrentRow().val("folderFullID");
		var psnID = this.getContext().getCurrentPersonID();

		if (!psnID)
			return;

		var orgCondition = common.getCurrentMembersURLFilter(this,'OA_KM_Rights.fOrgFID');
		var rightsCondition = "OA_KM_Rights.fCanReadKW = '1'";
		var folderCondition = "(OA_KM_KWFolder.fFolderID='" + folderID + "')"
				+ " and (OA_KM_Rights.fFolderID='" + folderID
				+ "' or OA_KM_Rights.fFolderID IS NULL)";
		;
		if (this.comp('displaySubChb').val()) { // 显示当前栏目及其子栏目下的知识
			folderCondition = "(OA_KM_KWFolder.fKWFullID LIKE '" + folderFullID
					+ "%')" + " and (OA_KM_Rights.fKWFullID LIKE '"
					+ folderFullID + "%' or OA_KM_Rights.fFolderID IS NULL)";
		}

		filterCondition = "(OA_KM_Rights.fOrgID='" + psnID + "' or "
				+ orgCondition + ")";
		filterCondition += " and (" + rightsCondition + ")";
		filterCondition += " and (" + folderCondition + ")";
		filterCondition += " and (fReleaseStatus = 1)";
		if (this.comp('iptCheckBox').val()) {
			var gzCondition = "'"
					+ psnID
					+ "' in (select p.fCreatePsnID from OA_KM_KnowledgeGZPsn p where p.fMasterID = OA_KM_Knowledge)";
			filterCondition += " and (" + gzCondition + ")";
		}
		// alert(filterCondition);
		dKW.filters.setFilter("knowledgeFilter", filterCondition);
		dKW.refreshData();
	};

	Model.prototype.knowledgeRecState = function(value) {
		;
		var personId = this.getContext().getCurrentPersonID();
		var ids = value?value:'';
		if (ids.indexOf(personId) == -1){
			return "未关注";
		} else {
			return "已关注";
		}
	};

	Model.prototype.dtKnowledgeRowDblClick = function(event) {
		;
		var dKnowledge = this.comp('dKnowledge');
		var title = dKnowledge.getValue('fTitle');

		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var kwid = dKnowledge.getCurrentRowID();

		var url = "$UI/OA/knowledge/process/viewKnowledge/viewKnowledge.w"
		 + "?process=" + process + "&activity=" + activity
		 + "&kwid="+ kwid;
		justep.Portal.openWindow(url,{title:title});
	};

	Model.prototype.grdFolderRowClick = function(event){
	;
		this.displayKnowledge(event);
	};

    Model.prototype.grdFolderRowExpand = function(ParentRow,rowid) {
		var parent = rowid;
		var subFolders = this.getDirectSubFolders(parent);
		if ((subFolders != '') && (subFolders != null)) {
		    var data = this.comp("dFolder");
			var arrFolder = subFolders.split("|");
			var len = arrFolder.length;
			//如果获取的目录为0或者已经加载了下级目录，则返回
			var rows = data.find(['fParent'],[parent]);
			
			if (len <= 0 || len == rows.length) {
				return;
			}
			
			for (var i = 0; i < len; i++) {
				var folder = arrFolder[i];
				var folderID = folder.split(":")[0];
				var folderName = folder.split(":")[1];
				var folderFullID = folder.split(":")[2];
				data.newData({
					parent : ParentRow,
					index : 0,
					defaultValues : [ {
						"folderID" : folderID,
						"fParent":parent,
						"fName":folderName,
						"folderFullID":folderFullID
						
					} ]
				});
		
				/*grdFolder.addRowPro(folderID, [folderName, folderFullID], i,
						parent);*/
			}
		}
	
};

	// 获取父栏目下的直属级子栏目(知识库)
    Model.prototype.getDirectSubFolders = function(folderID) {
        var returndata = "";
    	var param = new biz.Request.ActionParam();
    	
    	param.setString("folderID", folderID);
        
        biz.Request.sendBizRequest({
				"context" : this.getContext(),
				"action" : "getDirectSubFoldersAction",
				"parameters" : param, 
				"callback" : function(data) {
					; 
					data.ignoreError = false;
					if (data.state) {
						returndata =  data.response;
					}else{
						returndata = "";
					}
				}
			});
		return returndata;	
    	
};

	Model.prototype.dFolderIndexChanged = function(event){
	    var data = this.comp("dFolder");
	    var row = data.getCurrentRow();
	    if(!this.canChange)
	        return;
		this.grdFolderRowExpand(row,row.val("folderID"));
	};
	Model.prototype.mdKnowledgeModelConstructDone = function(event){
	     //增加知识中心
		debugger;
	     var data = this.comp("dFolder");
	     data.newData({
			index : 0,
			defaultValues : [ {
				"folderID" : "public",
			    "fName":"知识中心",
				"folderFullID":"public"
			} ]
		});
        this.grdFolderRowExpand(data.getCurrentRow(),"public");
        this.canChange = true;
	};
	Model.prototype.dFolderCreate = function(event){
		event.source.defTreeOption.isTree = true;
		event.source.defTreeOption.prarentRelation = "fParent";
		event.source.defTreeOption.nodeKindRelation = "fName";
		event.source.directDeleteMode = true;
	};
	return Model;
});