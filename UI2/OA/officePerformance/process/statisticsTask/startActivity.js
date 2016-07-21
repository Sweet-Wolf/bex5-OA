define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	// flag标志是否刷新
	var contFlag = 1;
	var Model = function() {
		this.callParent();
	};

	Model.prototype.bSearchClick = function(event) {
		if (contFlag == 1) {
			this.refreshReportData();
		} else if (contFlag == 2) {
			this.refreshPieData();
		} else if (contFlag == 3) {
			this.refreshSeriesData();
		}

	};

	Model.prototype.refreshReportData = function() {
		contFlag = 1;
		var dTemp = this.comp("dTemp");
		var beginDate = dTemp.getValue("beginDate");
		var endDate = dTemp.getValue("endDate");
		var orgID = dTemp.getValue("orgID");
		if (orgID == undefined) {
			orgID = "";
		}
		this.comp('dCountTaskReport').setStringVar("beginDate", beginDate);
		this.comp('dCountTaskReport').setStringVar("endDate", endDate);
		this.comp('dCountTaskReport').setStringVar("orgID", orgID);
		this.comp('report').refresh();

		// this.setChartStatus("report");
	}
	Model.prototype.refreshPieData = function() {
		contFlag = 2;
		var dTemp = this.comp("dTemp");
		var beginDate = dTemp.getValue("beginDate");
		var endDate = dTemp.getValue("endDate");
		var orgID = dTemp.getValue("orgID");
		if (orgID == undefined) {
			orgID = "";
		}
		this.comp('dCountTaskChart').setStringVar("beginDate", beginDate);
		this.comp('dCountTaskChart').setStringVar("endDate", endDate);
		this.comp('dCountTaskChart').setStringVar("orgID", orgID);
		// this.comp('taskChart').refresh();
		this.setChartStatus("taskChart");
	}
	Model.prototype.refreshSeriesData = function() {
		contFlag = 3;
		var dTemp = this.comp("dTemp");
		var beginDate = dTemp.getValue("beginDate");
		var endDate = dTemp.getValue("endDate");
		var orgID = dTemp.getValue("orgID");
		if (orgID == undefined) {
			orgID = "";
		}
		this.comp('dCountTaskChart2').setStringVar("beginDate", beginDate);
		this.comp('dCountTaskChart2').setStringVar("endDate", endDate);
		this.comp('dCountTaskChart2').setStringVar("orgID", orgID);
		// this.comp('taskChart2').refresh();
		this.setChartStatus("taskChart2");
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

	Model.prototype.setChartStatus = function(chartId) {
		var comp = this.comp(chartId);
		if (!comp.loaded) {
			setTimeout(function() {
				comp.refresh();
			}, 100);
			comp.loaded = true;
		}
	}

	Model.prototype.li2Click = function(event) {
		this.refreshPieData();
	};

	Model.prototype.li3Click = function(event) {
		this.refreshSeriesData();
	};

	Model.prototype.li1Click = function(event) {
		this.refreshReportData();
	};

	return Model;
});
