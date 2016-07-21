define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	var common = require("../common/commonJs");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.displayKnowledge = function(event) {
		
		var filterCondition = '';
		var dKW = this.comp('dKnowledge');
		var folderID = this.comp('dFolder').getCurrentRowID();
		var folderFullID = this.comp('dFolder').getValue('fFullID');
		var psnID = this.getContext().getCurrentPersonID();

		if (!psnID)
			return;
		
		var orgCondition = common.getCurrentMembersURLFilter(this, 'OA_KM_Rights.fOrgFID');
		var rightsCondition = "OA_KM_Rights.fCanReadKW = '1'";
		var folderCondition = "(OA_KM_KWFolder.fFolderID='" + folderID + "')" + " and (OA_KM_Rights.fFolderID='" + folderID + "' or OA_KM_Rights.fFolderID IS NULL)";
		
		if (this.comp('displaySubChb').val()) { // 显示当前栏目及其子栏目下的知识
			folderCondition = "(OA_KM_KWFolder.fKWFullID LIKE '" + folderFullID + "%')" + " and (OA_KM_Rights.fKWFullID LIKE '" + folderFullID + "%' or OA_KM_Rights.fFolderID IS NULL)";
		}

		filterCondition = "(OA_KM_Rights.fOrgID='" + psnID + "' or " + orgCondition + ")";
		filterCondition += " and (" + rightsCondition + ")";
		filterCondition += " and (" + folderCondition + ")";
		filterCondition += " and (fReleaseStatus = 1)";
		dKW.filters.setFilter("knowledgeFilter", filterCondition);
		dKW.refreshData();
	};

	Model.prototype.knowledgeRecState = function(value) {
		
		var personId = this.getContext().getCurrentPersonID();
		var ids = value ? value : '';
		if (ids.indexOf(personId) == -1) {
			return "未关注";
		} else {
			return "已关注";
		}
	};

	Model.prototype.dtKnowledgeRowDblClick = function(event) {
		
		var dKnowledge = this.comp('dKnowledge');
		var title = dKnowledge.getValue('fTitle');

		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var kwid = dKnowledge.getCurrentRowID();

		var url = "$UI/OA/knowledge/process/viewKnowledge/viewKnowledge.w" + "?process=" + process + "&activity=" + activity + "&kwid=" + kwid;
		justep.Portal.openWindow(url, {
			title : title
		});
	};

	Model.prototype.grdFolderRowClick = function(event) {
		
		this.displayKnowledge(event);
	};


	Model.prototype.mdKnowledgeLoad = function(event){
		this.displayKnowledge(event);
		var grdFolder = this.comp('grdFolder');
		var dFolder = this.comp("dFolder");
		grdFolder.expandByIDPath(dFolder.getCurrentRowID());
	};


	return Model;
});