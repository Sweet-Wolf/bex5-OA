define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var common = require("../common/commonJs");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.saveCommit = function(event) {
		justep.Util.hint("保存成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	};

	Model.prototype.modelLoad = function(event) {
		this.getContext().getRequestParameter("operator");
	};

	Model.prototype.displayKnowledge = function() {
		var filterCondition = '';
		var dKW = this.comp('mainData');

		var folderFullID = this.getContext().getRequestParameter("folderFullID");
		var psnID = this.getContext().getCurrentPersonID();
		if (!psnID)
			return;
		var orgCondition = common.getCurrentMembersURLFilter(this, 'OA_KM_Rights.fOrgFID');
		var rightsCondition = "OA_KM_Rights.fCanReadKW = '1'";
		var folderCondition = "(OA_KM_KWFolder.fKWFullID LIKE '" + folderFullID + "%')" + " and (OA_KM_Rights.fKWFullID LIKE '" + folderFullID + "%' or OA_KM_Rights.fFolderID IS NULL)";

		filterCondition = "(OA_KM_Rights.fOrgID='" + psnID + "' or " + orgCondition + ")";
		filterCondition += " and (" + rightsCondition + ")";
		filterCondition += " and (" + folderCondition + ")";
		filterCondition += " and (OA_KM_Knowledge.fReleaseStatus = 1)";

		dKW.filters.setFilter("knowledgeFilter", filterCondition);
		dKW.refreshData();
	}

	return Model;
});