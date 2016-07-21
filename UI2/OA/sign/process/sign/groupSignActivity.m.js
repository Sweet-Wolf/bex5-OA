define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
		this.date;
	};

	Model.prototype.transWeek = function(date){
		var week =date.getDay();
		switch(week){
			case 1:
				week = "一";
				break;
			case 2:
				week = "二";
				break;
			case 3:
				week = "三";
				break;
			case 4:
				week = "四";
				break;
			case 5:
				week = "五";
				break;
			case 6:
				week = "六";
				break;
			case 0:
				week = "日";
				break;
		};
		return week;
	}

	Model.prototype.modelLoad = function(event){
		var time=justep.Date.toString(this.date, "yyyy-MM-dd");
		$("[xid=dateSpang]").html(time);
		var week = this.transWeek(this.date);
		$("[xid=weekSpang]").html("星期"+week);
		this.comp("datePickerg").setValue(this.params.data);
		
		$("[xid=waitDiv]").hide();
		$("[xid=content1]").show();
	};

	Model.prototype.datePickergOK = function(event){
		var date=event.source.getValue();
		this.date=date;
		$("[xid=dateSpang]").html(justep.Date.toString(date, "yyyy-MM-dd"));
		var week = this.transWeek(date);
		$("[xid=weekSpang]").html("星期"+week);
		
		this.RequestLoad("queryDeptLatestSignAction", "deptLatestSign","hasSignData",justep.Date.toString(date, "yyyy-MM-dd"));
		this.RequestLoad("queryDeptNotSignAction", "deptNotSign","unSignData",justep.Date.toString(date, "yyyy-MM-dd"));
	};

	Model.prototype.signPeopleListClick = function(event){
		var fPersonID = this.comp("hasSignData").val("fPersonID");
		justep.Shell.showPage("$UI/OA/sign/process/sign/statisticsPerSignActivity.m.w?process=/OA/sign/process/sign/signProcess&activity=statisticsPerSignActivity",{"data" : [fPersonID,this.date]});
	};

	Model.prototype.hasSignDataCustomRefresh = function(event){
		this.date = this.params.data;
		this.RequestLoad("queryDeptLatestSignAction", "deptLatestSign","hasSignData",justep.Date.toString(this.date,"yyyy-MM-dd"));
	};

	Model.prototype.unSignDataCustomRefresh = function(event){
		this.date = this.params.data;
		this.RequestLoad("queryDeptNotSignAction", "deptNotSign", "unSignData",justep.Date.toString(this.date,"yyyy-MM-dd"));
	};
	
	
	//请求数据
	Model.prototype.RequestLoad = function(action,type,dataCom,date){
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
	
	
	return Model;
});