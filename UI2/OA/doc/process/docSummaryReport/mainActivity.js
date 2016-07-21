define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.btnQueryClick = function(event) {

		this.refreshData();
	};

	Model.prototype.btnDocQueryClick = function(event) {
		;
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var url = "$UI/OA/doc/process/docQuery/docQuery.w?process=" + process + "&activity=" + activity;
		justep.Portal.openWindow(url, {
			title : "公文查询"
		});
	};

	Model.prototype.refreshData = function() {
		;
		var dTemp = this.comp("dTemp");
		var dayNum = dTemp.getValue("dayNum");
		var orgIDs = dTemp.getValue("orgID");
		orgIDs = orgIDs || '';
		var beginDate = dTemp.getValue("beginDate");
		var endDate = dTemp.getValue("endDate");
		if (beginDate == "" || endDate == "") {
			alert("请正确设置统计区间！");
		} else {
			if (endDate < beginDate) {
				alert("结束时间不能小于开始时间！");
			} else {
				var rData = this.comp('rData');
				var rDataSW = this.comp('rDataSW');
				var rDChar = this.comp('rDChar');
				var rDCharSW = this.comp('rDCharSW');
				rData.setStringVar("beginDate", beginDate);
				rData.setStringVar("endDate", endDate);
				rData.setStringVar("dayNum", dayNum);
				rData.setStringVar("orgIDs", orgIDs);
				rDataSW.setStringVar("beginDate", beginDate);
				rDataSW.setStringVar("endDate", endDate);
				rDataSW.setStringVar("dayNum", dayNum);
				rDataSW.setStringVar("orgIDs", orgIDs);
				rDChar.setStringVar("beginDate", beginDate);
				rDChar.setStringVar("endDate", endDate);
				rDChar.setStringVar("dayNum", dayNum);
				rDChar.setStringVar("orgIDs", orgIDs);
				rDCharSW.setStringVar("beginDate", beginDate);
				rDCharSW.setStringVar("endDate", endDate);
				rDCharSW.setStringVar("dayNum", dayNum);
				rDCharSW.setStringVar("orgIDs", orgIDs);
				this.comp('report').refresh();
				this.comp('chartFW').refresh();
				this.comp('chartSW').refresh();
			}
		}
	};

	Model.prototype.mdMainLoad = function(event) {
		;
		var Nowdate = new Date();
		
		var MonthFirstDay = new Date(Nowdate.getFullYear(), Nowdate.getMonth(), 1);
		var MonthNextFirstDay = new Date(Nowdate.getFullYear(), Nowdate.getMonth() + 1, 1);
		var MonthLastDay = new Date(MonthNextFirstDay - 86400000);
		var dTemp = this.comp("dTemp");
		dTemp.setValue("beginDate", justep.Date.toString(MonthFirstDay, 'YYYY-MM-DD'));
		dTemp.setValue("endDate", justep.Date.toString(MonthLastDay, 'YYYY-MM-DD'));
		dTemp.setValue("dayNum", 5);
		this.refreshData();

	};

	return Model;
});