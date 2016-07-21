define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.addShareToQuery = function(event) {
		this.comp("dlgShareRange").open();
	};

	Model.prototype.modelLoad = function(event) {
		var sPersonID = this.getContext().getCurrentPersonID();
		this.comp("dShareRange").setFilter('psnFilter', "fSharedOrgID='" + sPersonID + "' AND fShareType = 1 ");
		this.comp("dShareRange").refreshData();
	};

	Model.prototype.dlgShareRangeReceive = function(event) {// 不重复添加。不添加本人
		var dShareRange = this.comp("dShareRange");
		var context = this.getContext();
		var fSharedOrgKind = 'psn';
		var fShareOrgID = context.getCurrentPersonID();
		var fShareOrgName = context.getCurrentOrgName();
		var fShareOrgFullID = context.getCurrentPersonMemberFID();
		var fShareOrgFullName = context.getCurrentPersonMemberFName();
		var rows = event.data;
		var defaultValues = [];
		$.each(rows, function(i, row) {
			var rowID = row.getID();
			var sName = row.val('sName');
			var fShareToOrgKind = row.val('sOrgKindID');
			var fShareToOrgFullID = row.val('sFID');
			var fShareToOrgFullName = row.val('sFName');
			if (fShareOrgFullID !== fShareToOrgFullID) {// 不添加本人
				var returnRows = dShareRange.find([ 'fShareToOrgID' ], [ rowID ], true, true, true, true);
				if (returnRows.length === 0) {
					defaultValues.push({
						'fShareType' : '1',
						'fSharedOrgKindID' : fSharedOrgKind,
						'fSharedOrgID' : fShareOrgID,
						'fSharedOrgName' : fShareOrgName,
						'fSharedOrgFID' : fShareOrgFullID,
						'fSharedOrgFName' : fShareOrgFullName,
						'fShareToOrgKindID' : fShareToOrgKind,
						'fShareToOrgID' : rowID,
						'fShareToOrgName' : sName,
						'fShareToOrgFID' : fShareToOrgFullID,
						'fShareToOrgFName' : fShareToOrgFullName,
					});
				}
			}
		});
		if (defaultValues.length > 0) {
			dShareRange.newData({
				defaultValues : defaultValues
			});
		}
	};

	return Model;
});