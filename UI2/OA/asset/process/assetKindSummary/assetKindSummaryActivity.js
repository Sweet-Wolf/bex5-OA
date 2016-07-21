define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.bSearchClick = function(event) {
		this.refreshReport();
		
	};

	Model.prototype.refreshReport = function() {
		debugger;
		var dTemp = this.comp("dTemp");
		var tempOrgID = dTemp.getValue("tempOrgID");
		var sqlReport = "", sqlPie = "";

		sqlReport = sqlPie = "SELECT c.fKind AS FKIND,TRIM(SUM(c.fRemainValue)/10000) AS FREMAINVALUE FROM OA_AS_Card c ";
		if (tempOrgID != '') {
			tempOrgID = "'" + tempOrgID + "'";
			tempOrgID = tempOrgID.replace(" ", "','");
			sqlReport += " where c.fDutyDeptID in (" + tempOrgID + ")";
			sqlPie += " where c.fDutyDeptID in (" + tempOrgID + ")";
		}
		sqlReport += " GROUP BY c.fKind";
		sqlPie += " GROUP BY c.fKind";
		this.comp('dReport').setKSQL(sqlReport);
		this.comp('dPie').setKSQL(sqlPie);
		this.comp('report').refresh();

	}

	return Model;
});
