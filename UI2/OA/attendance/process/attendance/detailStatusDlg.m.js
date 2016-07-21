define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
		this.title;
		this.date;
		this.deptID;
	};

	Model.prototype.modelParamsReceive = function(event){
		var status = event.params.data[0];
		var date = event.params.data[1];
		this.title=status;
		this.date=date;
		this.deptID = event.params.data[2];
		this.comp("detailTitleBar").set({"title":status+"人员列表"});
		this.personStatusRequestLoad("queryCheckSortStatAction", "sortData", "detailStatusDlgData", this.date, this.deptID);
	};

	
	Model.prototype.personStatusRequestLoad = function(action, type, dataCom, date,DeptID) {
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
	
	
	
	return Model;
});