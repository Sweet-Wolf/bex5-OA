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
		var dayNum = dTemp.getValue("dayNum");
		var orgIDs = dTemp.getValue("orgID");
		if (orgIDs == undefined) {
			orgIDs = "";
		}
		var beginDate = dTemp.getValue("beginDate");
		var endDate = dTemp.getValue("endDate");
		if (beginDate == "" || endDate == "") {
			alert("请正确设置统计区间！");
		} else {
			if (endDate < beginDate) {
				alert("结束时间不能小于开始时间！");
			} else {
				this.comp('rData').setStringVar("beginDate", beginDate);
				this.comp('rData').setStringVar("endDate", endDate);
				this.comp('rData').setStringVar("dayNum", dayNum);
				this.comp('rData').setStringVar("orgIDs", orgIDs);
				this.comp('rDataD').setStringVar("beginDate", beginDate);
				this.comp('rDataD').setStringVar("endDate", endDate);
				this.comp('rDataD').setStringVar("orgIDs", orgIDs);
				this.comp('rDCharZT').setStringVar("beginDate", beginDate);
				this.comp('rDCharZT').setStringVar("endDate", endDate);
				this.comp('rDCharZT').setStringVar("dayNum", dayNum);
				this.comp('rDCharZT').setStringVar("orgIDs", orgIDs);
				this.comp('rDCharBT').setStringVar("beginDate", beginDate);
				this.comp('rDCharBT').setStringVar("endDate", endDate);
				this.comp('rDCharBT').setStringVar("orgIDs", orgIDs);
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
		dTemp.setValue("dayNum", 5);

	};

	return Model;
});
