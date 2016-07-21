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
		var dTemp = this.comp("dTemp");
		var tempOrgID = dTemp.getValue("tempOrgID");
		if (tempOrgID == undefined) {
			tempOrgID = "";
		}
		var tempLike = dTemp.getValue("tempLike");
		if (tempLike == undefined) {
			tempLike = "";
		}
		var beginDate = dTemp.getValue("beginDate");
		var endDate = dTemp.getValue("endDate");
		if (beginDate == "" || endDate == "") {
			alert("请正确设置统计区间！");
		} else {
			if (endDate < beginDate) {
				alert("结束时间不能小于开始时间！");
			} else {
				var tempDateTime = "(AM.fDemandDate >= stringToDate('" + beginDate + "') and AM.fDemandDate <= stringToDate('" + endDate + "'))";
				
				var sqlPie = "", sqlReport = "";
				sqlPie = "SELECT AD.fKindName AS FKINDNAME,SUM(AD.fFactNum) AS FFACTNUM FROM OA_OSC_UseApplyM AM JOIN OA_OSC_UseApplyD AD ON AM = AD.fMasterID AND AM.fProvideState = '1'";

				sqlReport = "SELECT AD.fName AS FNAME,AD.fSpecType AS FSPECTYPE,AD.fKindName AS FKINDNAME,AD.fConsultPrice AS FCONSULTPRICE,AD.fUnitName AS FUNITNAME,AD.fFactPrice AS FFACTPRICE,SUM(AD.fDemandNum) AS FDEMANDNUM,SUM(AD.fConsultAmount) AS FCONSULTAMOUNT,SUM(AD.fFactNum) AS FFACTNUM,SUM(AD.fFactAmount) AS FFACTAMOUNT FROM OA_OSC_UseApplyD AD join OA_OSC_UseApplyM AM ON AM = AD.fMasterID AND AM.fProvideState = '1'";
				if (tempDateTime != '') {
					sqlPie += " and " + tempDateTime;
					sqlReport += " and " + tempDateTime;
				}
				if (tempLike != '') {
					sqlPie += " and (AD.fName like '%" + tempLike + "%' or AD.fKindName like '%" + tempLike + "%')";
					sqlReport += " and (AD.fName like '%" + tempLike + "%' or AD.fKindName like '%" + tempLike + "%')";
				}
				if (tempOrgID != '') {
					tempOrgID = "'" + tempOrgID + "'";
					tempOrgID = tempOrgID.replace(" ", "','");

					sqlPie += " and AM.fApplyDeptID in (" + tempOrgID + ")";
					sqlReport += " and AM.fApplyDeptID in (" + tempOrgID + ")";
				}
				sqlPie += " GROUP BY AD.fKindName";
				sqlReport += " GROUP BY AD.fKindName,AD.fName,AD.fSpecType,AD.fConsultPrice,AD.fUnitName,AD.fFactPrice ORDER BY AD.fKindName";
				
				this.comp('dPie').setKSQL(sqlPie);
				this.comp('dReport').setKSQL(sqlReport);
				this.comp('report').refresh();
				

			}
		}
	}

	Model.prototype.modelLoad = function(event) {
		var Nowdate = new Date();
		var MonthFirstDay = new Date(Nowdate.getFullYear(), Nowdate.getMonth(), 1);
		var MonthNextFirstDay = new Date(Nowdate.getFullYear(), Nowdate.getMonth() + 1, 1);
		var MonthLastDay = new Date(MonthNextFirstDay - 86400000);
		var dTemp = this.comp("dTemp");

		dTemp.setValue("beginDate", justep.Date.toString(MonthFirstDay, 'YYYY-MM-DD'));
		dTemp.setValue("endDate", justep.Date.toString(MonthLastDay, 'YYYY-MM-DD'));

	};

	return Model;
});
