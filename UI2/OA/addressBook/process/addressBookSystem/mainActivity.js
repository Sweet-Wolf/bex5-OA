define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
		this.isQuickSearch = false;
		this.searchStr = "";
		this.isShowSub = "false"
	};

	Model.prototype.orgTreeGridIndexChanged = function(event) {
		var row = event.row;
		if (row) {
			if (row.val('sParent')) {
				this.generateCondition();
			}
			var data = this.comp("psnListData").refreshData();
		}
	};

	Model.prototype.generateCondition = function() {
		var condi = '1=2';
		if (this.isQuickSearch && this.searchStr != "") {
			condi = "(" + this.generateQuickSearchCondition() + ") AND (";
			if (this.isShowSub == "false") {
				condi += this.generateNoSubCondition() + ")";
			} else {
				condi += this.generateSubDepartCondition() + ")";
			}
			this.isQuickSearch = false;
			this.searchStr = "";
		} else {
			if (this.isShowSub == "false") {
				condi = this.generateNoSubCondition();
			} else {
				condi = person.generateSubDepartCondition();
			}
		}
		var data = this.comp("psnListData");
		data.setFilter("personFilter", condi);
	};

	Model.prototype.generateSubDepartCondition = function() {
		if (this.isRoot()) {
			return "1=0";
		} else {
			var treeData = this.comp("orgTreeData");
			var sFID = treeData.getCurrentRowID();
			return "mainOrg.sFID LIKE '" + sFID + "%'";
		}
	};

	Model.prototype.generateNoSubCondition = function() {
		var treeData = this.comp("orgTreeData");
		var rowid = treeData.getCurrentRowID();
		return "SA_OPPerson.sMainOrgID='" + rowid + "'";
	};

	Model.prototype.generateQuickSearchCondition = function() {
		var upperStr = this.searchStr.toUpperCase();
		var lowerStr = this.searchStr.toLowerCase();
		return "UPPER(SA_OPPerson.sCode) LIKE '%" + person.searchStr + "%' OR UPPER(SA_OPPerson.sName) LIKE '%" + person.searchStr + "%'" + " OR UPPER(SA_OPPerson.sCode) LIKE '%" + upperStr
				+ "%' OR UPPER(SA_OPPerson.sName) LIKE '%" + upperStr + "%'" + " OR UPPER(SA_OPPerson.sCode) LIKE '%" + lowerStr + "%' OR UPPER(SA_OPPerson.sName) LIKE '%" + lowerStr + "%'";
	};

	Model.prototype.isRoot = function() {
		return this.comp("orgTreeData").getValue('sParent');
	}

	return Model;
});