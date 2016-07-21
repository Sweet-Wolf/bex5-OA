define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	//getRequest方法中需要的参数
	var workDaily,workDailyAction,workWeekly,workWeeklyAction,workMonthly,workMonthlyAction,sScheDay;

	Model.prototype.modelLoad = function(event){
		workDaily="workDailyData";
		workDailyAction="queryOA_WorkDailyScopeAction";
		workWeekly="workWeeklyData";
		workWeeklyAction="queryOA_WorkWeeklyScopeAction";
		workMonthly="workMonthlyData";
		workMonthlyAction="queryOA_WorkmonthlyScopeAction";
		this.getRequest(workDailyAction,workDaily);
	};
	
	Model.prototype.getRequest = function(action,dataStr) {
		var params = new biz.Request.ActionParam();
		var ctx = this.getContext();
		params.setParam('strStartDate', "");
		params.setParam('strEndDate', "");
		var self = this;
		biz.Request.sendBizRequest({
			contentType : 'application/json',
			dataType : "json",
			"context" : ctx,
			"action" : action,
			"parameters" : params,
			"callback" : function(data) {
				if (data.state) {
					var resultData = data.response[dataStr];
					if (resultData) {
						self.comp(dataStr).clear();
						self.comp(dataStr).loadData(resultData);
					}
				}
			}
		});
		//加载之前的动画
		$("[xid=waitDiv]").hide();
		$("[xid=content1]").show();
	}

	Model.prototype.WorkDailyBtnClick = function(event){
		this.getRequest(workDailyAction,workDaily);
	};

	Model.prototype.WorkWeeklyBtnClick = function(event){
		this.getRequest(workWeeklyAction,workWeekly);
	};

	Model.prototype.WorkmonthlyBtnClick = function(event){
		this.getRequest(workMonthlyAction,workMonthly);
	};

	Model.prototype.controlGroupClick = function(event){
		if($(event.target).hasClass("x-control-group-title")){
			$(".x-control-group-title").next("li").hide();
			$(event.target).next("li").show();
		}
	};

	
	return Model;
});