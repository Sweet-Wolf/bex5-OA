define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/lib/base/util");

	var Model = function() {
		this.callParent();
		this.deptID;
		this.rowID;
	};

	Model.prototype.formatDate = function(date) {
		var str = "", week = "";
		str += date.getFullYear() + "-";
		str += date.getMonth() + 1 + "-";
		str += date.getDate();
		switch (date.getDay()) {
		case 1:
			week = "星期一";
			break;
		case 2:
			week = "星期二";
			break;
		case 3:
			week = "星期三";
			break;
		case 4:
			week = "星期四";
			break;
		case 5:
			week = "星期五";
			break;
		case 6:
			week = "星期六";
			break;
		case 0:
			week = "星期日";
			break;
		}
		return week + "  " + str;
	}

	


	Model.prototype.modelParamsReceive = function(event) {
		var date = new Date();
		var str = this.formatDate(date);
		this.comp("scheTitleBar").set({
			"title" : str
		});
	};
//前后选择时间按钮
	Model.prototype.prevBtnClick = function(event) {
		var self = this;
		var date = this.comp("scheTitleBar").get("title");
		date = date.split("  ")[1];
		var prevDate = new Date(date);
		prevDate.setDate(prevDate.getDate() - 1);
		var str = this.formatDate(prevDate);
		this.comp("scheTitleBar").set({
			"title" : str
		});
		date = justep.Date.toString(prevDate, "yyyy-MM-dd");
		var deptID = this.comp("deptStatusData").val("fDeptID");
		this.personStatusRequestLoad("queryCheckSortStatAction", "sortData", "attenStatusData", date, deptID);
		this.deptStatusRequestLoad("queryCheckStatDeptAction", "deptData", "deptStatusData", date);
		this.comp("deptStatusData").first();
		this.comp("deptStatusData").to(this.rowID);
	};

	Model.prototype.nextBtnClick = function(event) {
		var self = this;
		var date = this.comp("scheTitleBar").get("title");
		date = date.split("  ")[1];
		var prevDate = new Date(date);
		prevDate.setDate(prevDate.getDate() + 1);
		if (prevDate < new Date()) {
			var str = this.formatDate(prevDate);
			this.comp("scheTitleBar").set({
				"title" : str
			});
			date = justep.Date.toString(prevDate, "yyyy-MM-dd");
			var deptID = this.comp("deptStatusData").val("fDeptID");
			this.personStatusRequestLoad("queryCheckSortStatAction", "sortData", "attenStatusData", date, deptID);
			this.deptStatusRequestLoad("queryCheckStatDeptAction", "deptData", "deptStatusData", date);
			this.comp("deptStatusData").first();
			this.comp("deptStatusData").to(this.rowID);
		} else {
			util.hint("考勤统计数截止到今日");
		}
	};

// 请求部门数据
	Model.prototype.deptStatusRequestLoad = function(action, type, dataCom, date) {
		var params = new biz.Request.ActionParam();
		var ctx = this.getContext();
		params.setParam('strDate', date);
		var self = this;
		biz.Request.sendBizRequest({
			contentType : 'application/json',
			dataType : "json",
			"context" : ctx,
			"action" : action,
			"parameters" : params,
			"callback" : function(data) {
				if (data.state) {
					var resultData = data.response[type];
					if (resultData) {
						self.comp(dataCom).clear();
						self.comp(dataCom).loadData(resultData);
					}
				}
			}
		});
	}

	Model.prototype.deptStatusDataCustomRefresh = function(event) {
		this.deptStatusRequestLoad("queryCheckStatDeptAction", "deptData", "deptStatusData", justep.Date.toString(new Date(), "yyyy-MM-dd"));

	};
//选择部门
	Model.prototype.selDeptBtnClick = function(event) {
		var date = justep.Date.toString(justep.Date.fromString(this.comp("scheTitleBar").title.split("  ")[1], "yyyy-M-d"), "yyyy-MM-dd");
		this.comp("selDeptDialog").open({
			"data" : date
		});
	};

	Model.prototype.selDeptDialogReceive = function(event) {
		var self = this;
		var deptID = event.data[0];
		var rowID = event.data[1];
		this.rowID = rowID;
		this.deptID = deptID;
		window.setTimeout(function() {
			self.comp("deptStatusData").to(rowID);
		}, 1);
		var date = justep.Date.toString(justep.Date.fromString(this.comp("scheTitleBar").title.split("  ")[1], "yyyy-M-d"), "yyyy-MM-dd");
		this.personStatusRequestLoad("queryCheckSortStatAction", "sortData", "attenStatusData", date, deptID);
		this.deptStatusRequestLoad("queryCheckStatDeptAction", "deptData", "deptStatusData", date);
	};

	// 请求人员状态数据
	Model.prototype.personStatusRequestLoad = function(action, type, dataCom, date, DeptID) {
		var params = new biz.Request.ActionParam();
		var ctx = this.getContext();
		params.setParam('strDate', date);
		params.setParam('strDeptID', DeptID);
		var self = this;
		biz.Request.sendBizRequest({
			contentType : 'application/json',
			dataType : "json",
			"context" : ctx,
			"action" : action,
			"parameters" : params,
			"callback" : function(data) {
				if (data.state) {
					var resultData = data.response[type];
					if (resultData) {
						self.comp(dataCom).clear();
						self.comp(dataCom).loadData(resultData);
					}
				}
			}
		});
	}

	Model.prototype.attenStatusDataCustomRefresh = function(event) {
		this.rowID = 0;
		this.deptID = this.getContext().getCurrentDeptID();
		var deptID = this.getContext().getCurrentDeptID();
		var date = justep.Date.toString(new Date(), "yyyy-MM-dd");
		this.personStatusRequestLoad("queryCheckSortStatAction", "sortData", "attenStatusData", date, deptID);

	};

//显示具体的内容
	Model.prototype.showCountListClick = function(event) {
		var status = this.comp("AllStatusData").getValue("fStatus");
		if(status == "正常"){
			status = "正常考勤";
		}
		var count = this.comp("attenStatusData").count(function(e){var v = e.source.getValue("fStatus",e.row); return v.indexOf(status)==0;});
		if(count == 0){
			util.hint("没有人"+status,{
				"delay":1500
			});
			return;
		}
		var date = justep.Date.toString(justep.Date.fromString(this.comp("scheTitleBar").title.split("  ")[1], "yyyy-M-d"), "yyyy-MM-dd");
		var deptID = this.comp("deptStatusData").val("fDeptID");
		this.comp("detailStatusDialog").open({
			"data" : [ status, date, this.deptID ]
		});
	};


	Model.prototype.contentsGPActiveChange = function(event){
		var to = event.to;
		if (to == 1) {
			// 优化内存占用
			$('.x-window-container', this.comp('contentsGP').$domNode).css('display', 'none');
			this.comp('personWindow').$domNode.css('display', 'block');
			this.comp("personWindow").refresh();
		}
	};

	Model.prototype.modelLoad = function(event){
		$("[xid=waitDiv]").hide()
		$("[xid=panel1]").show()
	};
	
//	考勤排行榜
//	Model.prototype.rankRowClick = function(event){
//		justep.Shell.showPage("$UI/OA/attendance/process/attendance/rankListActivity.m.w?process=/OA/attendance/process/attendance/attendanceProcess&activity=rankListActivity");
//	};

	return Model;
});