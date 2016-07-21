define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.dateShowClick = function(event) {
		var v = this.comp('mianData').setValue('isChecked');
		this.comp("dateChooseDlg").open({
			"src" : "$UI/OA/attendance/process/attendance/personCountDlg.w"
		}, {
			"data" : v
		});

	};
	
	Model.prototype.countContent = function() {
		var normalCount = this.comp('mianData').countByAll(function(event) {
			var v = event.source.getValue('fStatus', event.row);
			return v.indexOf('正常考勤') == 0;
		});
		$("[xid=normalSpan]").html(normalCount + '天');
			
		// 迟到
		var lateCount = this.comp('mianData').countByAll(function(event) {
			var v = event.source.getValue('fStatus', event.row);
			return v.indexOf('迟到') == 0;
		});
		$("[xid=lateSpan]").html(lateCount + '次');
		var row = this.comp("statusData").getRowByID("迟到")
		if (lateCount == 0) {
			this.comp("statusData").setValue("isHide", false, row);
		} else {
			this.comp("statusData").setValue("isHide", true, row);
		}

		// 早退
		var earlyCount = this.comp('mianData').countByAll(function(event) {
			var v = event.source.getValue('fStatus', event.row);
			return v.indexOf('早退') == 0;
		});
		$("[xid=earlySpan]").html(earlyCount + '次');
		var row = this.comp("statusData").getRowByID("早退")
		if (earlyCount == 0) {
			this.comp("statusData").setValue("isHide", false, row);
		} else {
			this.comp("statusData").setValue("isHide", true, row);
		}

		// 未打卡
		var absentCount = this.comp('mianData').countByAll(function(event) {
			var v = event.source.getValue('fStatus', event.row);
			return v.indexOf('未打卡') == 0;
		});
		$("[xid=absentSpan]").html(absentCount + '次');
		var row = this.comp("statusData").getRowByID("未打卡")
		if (absentCount == 0) {
			this.comp("statusData").setValue("isHide", false, row);
		} else {
			this.comp("statusData").setValue("isHide", true, row);
		}

		// 旷工
		var noCount = this.comp('mianData').countByAll(function(event) {
			var v = event.source.getValue('fStatus', event.row);
			return v.indexOf('旷工') == 0;
		});
		var row = this.comp("statusData").getRowByID("旷工")
		if (noCount == 0) {
			this.comp("statusData").setValue("isHide", false, row);
		} else {
			this.comp("statusData").setValue("isHide", true, row);
		}

	};
	
	Model.prototype.modelParamsReceive = function(event){
		this.countContent();
	};
	
	Model.prototype.modelLoad = function(event){
		var time = new Date();
		time = (time.getFullYear() + '年' + (time.getMonth() + 1) + '月');
		var timeYear=new Date().getFullYear() + '年';
		var timeMonth=(new Date().getMonth() + 1) + '月';
		$("[xid=yearShowSpan]").html(timeYear);
		$("[xid=monthShowSpan]").html(timeMonth);
	
		var param = new biz.Request.ActionParam();
		var ctx = this.getContext();
		var dateParam;
		if (time.substring(5, 6) < 10) {
			dateParam = time.substring(0, 4) + "-0" + time.substring(5, 6);
		} else {
			dateParam = time.substring(0, 4) + "-" + time.substring(5, 6);
		}
		param.setParam('strDate', dateParam);
		var ctx = this.getContext();
		var self = this;
		biz.Request.sendBizRequest({
			contentType : 'application/json',
			dataType : "json",
			"context" : ctx,
			"action" : "queryCheckStatAction",
			"parameters" : param,
			"callback" : function(data) {
				if (data.state) {
					self.comp('mianData').clear();
					var resultData = data.response['attendanceData'];
					if (resultData) {
						self.comp('mianData').loadData(resultData);
						// self.comp('mianData').refreshData();'
					} else {
						return;
					}
				}
			}
		});
		this.countContent();
		
		$("[xid=waitDiv]").hide()
		$("[xid=panel2]").show()

	};
	
	Model.prototype.dateChooseDlgReceive = function(event) {
		this.comp('mianData').setValue("isChecked", event.v);
		var timeYear=event.data.substring(0, 5);
		var timeMonth=event.data.substring(5);
		$("[xid=yearShowSpan]").html(timeYear);
		$("[xid=monthShowSpan]").html(timeMonth);
	};
	
	Model.prototype.dateChooseDlgReceived = function(event) {
		/* 设置参数 */
		var param = new biz.Request.ActionParam();
		var ctx = this.getContext();
		var dateParam;
		if (event.data.substring(5, 6) < 10) {
			dateParam = event.data.substring(0, 4) + "-0" + event.data.substring(5, 6);
		} else {
			dateParam = event.data.substring(0, 4) + "-" + event.data.substring(5, 6);
		}
		param.setParam('strDate', dateParam);
		var ctx = this.getContext();
		var self = this;
		biz.Request.sendBizRequest({
			contentType : 'application/json',
			dataType : "json",
			"context" : ctx,
			"action" : "queryCheckStatAction",
			"parameters" : param,
			"callback" : function(data) {
				if (data.state) {
					self.comp('mianData').clear();
					var resultData = data.response['attendanceData'];
					if (resultData) {
						self.comp('mianData').loadData(resultData);
						// self.comp('mianData').refreshData();'
					} else {
						return;
					}
				}
			}
		});
		this.countContent();
		

	};
	
	
	
	Model.prototype.LateAppealBtnClick = function(event){
		var row = event.bindingContext.$object;
		console.log(row.val("fStatus"));
		justep.Shell.showPage(
			"$UI/OA/attendance/process/attendanceAppeal/LateAppealActivity.m.w?process=/OA/attendance/process/attendanceAppeal/attendanceAppealProcess&Activity=LateAppealActivity",
			{"time":row.val("fCheckTime"),"lateTime":row.val("fUnusualMistiming"),"status":row.val("fStatus"),"fID":row.val("fID")}
			)
	};
	
	return Model;
});