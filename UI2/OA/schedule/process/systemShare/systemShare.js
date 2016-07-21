define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.addShareToQuery = function(event) {
		this.comp("dlgShareToPerson").open();
	};

	Model.prototype.dlgShareToPersonReceive = function(event) {//测试
		var dShareRange = this.comp("dShareRange");
		var rows = event.data;
		var defaultValues = [];
		var selectedRow = this.comp("orgTree").getSelected();
		var nodeKind = selectedRow.val('sOrgKindID');
		if (nodeKind === 'person') {
			var treeData = this.comp("treeData");
			var personID = selectedRow.val('sId');
			var orgID = selectedRow.val('sId');
			var orgName = selectedRow.val('sName');
			var parentID = selectedRow.val('sParent');
			var orgFID = treeData.getValueByID("sFId", parentID);
			orgFID = orgFID + "/" + orgID + ".psn";
			var orgFName = treeData.getValueByID("sFName", parentID);
			orgFName = orgFName + "/" + orgName;
		} else {
			orgID = selectedRow.getID();
			orgName = selectedRow.val('sName');
			personID = "";
			orgFID = selectedRow.val("sFID");
			orgFName = selectedRow.val("sFName");
		}
		$.each(rows, function(i, row) {
			var rowID = row.getID();
			var sPersonId = row.val('sPersonID');
			var sName = row.val('sName');
			var fShareToOrgKind = row.val('sOrgKindID');
			var fShareToOrgFullID = row.val('sFID');
			var fShareToOrgFullName = row.val('sFName');
			var returnRows = dShareRange.find([ 'fShareToOrgID' ], [ rowID ], true, true, true, true);
			defaultValues.push({
				'fShareType' : 0 + '',
				'fSharedOrgKindID' : nodeKind,
				'fSharedOrgID' : orgID,
				'fSharedOrgName' : orgName,
				'fSharedOrgFID' : orgFID,
				'fSharedOrgFName' : orgFName,
				'fShareToOrgKindID' : fShareToOrgKind,
				'fShareToOrgID' : rowID,
				'fShareToOrgName' : sName,
				'fShareToOrgFID' : fShareToOrgFullID,
				'fShareToOrgFName' : fShareToOrgFullName,
			});
		});
		dShareRange.newData({defaultValues : defaultValues})
	};

	Model.prototype.grid1IndexChanged = function(event){
		this.comp("dShareRange").refreshData();
	};

	Model.prototype.dShareRangeBeforeRefresh = function(event){
		var orgID = this.comp("orgTree").getSelected().getID();
		this.comp("dShareRange").setFilter('personFilter', "OA_SD_ShareRange.fSharedOrgID = '"+orgID+"'");
	};

	return Model;
});