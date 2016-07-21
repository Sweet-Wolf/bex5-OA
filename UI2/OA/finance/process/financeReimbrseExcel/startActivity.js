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
		var dTemp = this.comp("dtempDate");
		debugger;
		var beginDate = dTemp.getValue("beginDate");
		var endDate = dTemp.getValue("endDate");
		if (beginDate == "" || endDate == "") {
			alert("请正确设置统计区间！");
		} else {
			if (endDate < beginDate) {
				alert("结束时间不能小于开始时间！");
			} else {

				var timeSQL = "(m.FLOANDATE >= cast('" + beginDate + "' as datetime) and m.FLOANDATE <= cast('" + endDate + "' as datetime))";
				var timeOracle = "(m.FLOANDATE >= to_date('" + beginDate + "','yyyy-mm-dd') and m.FLOANDATE <= to_date('" + endDate + "','yyyy-mm-dd'))";

				var sqlOrcl = "select a.FLOANDEPTNAME FLOANDEPTNAME,case when a.FCOSTTYPENAME is null then '出差补助' else a.FCOSTTYPENAME end 	FCOSTTYPENAME,sum(a.FCOSTAMT) FCOSTAMT from (select m.FLOANDEPTNAME FLOANDEPTNAME,d.FCOSTTYPENAME FCOSTTYPENAME,d.FCOSTAMT,m.FREIALLOWANCE from OA_FC_REIMBAPPLYM m,OA_FC_REIMBAPPLYD d	where m.FID = d.FREIMFID and m.FBIZSTATE = 'bsFinished'";
				if (timeOracle != '') {
					sqlOrcl += " and " + timeOracle;
				}
				sqlOrcl += " union select distinct m.FLOANDEPTNAME FLOANDEPTNAME,d.FCOSTTYPENAME,d.FCOSTAMT,m.FREIALLOWANCE from OA_FC_REIMBAPPLYM m,OA_FC_REIMBAPPLYD d where m.FID = d.FREIMFID and m.FBIZSTATE = 'bsFinished'";
				if (timeOracle != '') {
					sqlOrcl += " and " + timeOracle;
				}
				sqlOrcl += ") a group by a.FLOANDEPTNAME,a.FCOSTTYPENAME";

				var sqlMSSQL = "select a.FLOANDEPTNAME FLOANDEPTNAME,case when a.FCOSTTYPENAME is null then '出差补助' else a.FCOSTTYPENAME end FCOSTTYPENAME,sum(a.FCOSTAMT) FCOSTAMT from ( select m.FLOANDEPTNAME FLOANDEPTNAME, d.FCOSTTYPENAME FCOSTTYPENAME,d.FCOSTAMT,m.FREIALLOWANCE from OA_FC_REIMBAPPLYM m,OA_FC_REIMBAPPLYD d where m.FID = d.FREIMFID and m.FBIZSTATE = 'bsFinished'";
				if (timeSQL != '') {
					sqlMSSQL += " and " + timeSQL;
				}
				sqlMSSQL += " union select distinct m.FLOANDEPTNAME FLOANDEPTNAME,d.FCOSTTYPENAME,d.FCOSTAMT,m.FREIALLOWANCE from OA_FC_REIMBAPPLYM m,OA_FC_REIMBAPPLYD d where m.FID = d.FREIMFID and m.FBIZSTATE = 'bsFinished'";
				if (timeSQL != '') {
					sqlMSSQL += " and " + timeSQL;
				}
				sqlMSSQL += ") a group by a.FLOANDEPTNAME,a.FCOSTTYPENAME";

				this.comp('dReimbrseExcelReport').setSQL(sqlOrcl, "ORACLE");
				this.comp('dReimbrseExcelReport').setSQL(sqlMSSQL, "MSSQL");
				this.comp('dReimbrseExcelReport').setSQL(sqlMSSQL, "MySQL");
				
				this.comp('report').refresh();
			}
		}
	}

	Model.prototype.modelLoad = function(event) {
		var Nowdate = new Date();
		var MonthFirstDay = new Date(Nowdate.getFullYear(), Nowdate.getMonth(), 1);
		var MonthNextFirstDay = new Date(Nowdate.getFullYear(), Nowdate.getMonth() + 1, 1);
		var MonthLastDay = new Date(MonthNextFirstDay - 86400000);
		var dTemp = this.comp("dtempDate");

		dTemp.setValue("beginDate", justep.Date.toString(MonthFirstDay, 'YYYY-MM-DD'));
		dTemp.setValue("endDate", justep.Date.toString(MonthLastDay, 'YYYY-MM-DD'));

	};

	return Model;
});
