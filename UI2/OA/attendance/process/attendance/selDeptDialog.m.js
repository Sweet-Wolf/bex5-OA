define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.date;
	};
	
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

	Model.prototype.deptStatusDataCustomRefresh = function(event){
		this.date = this.params.data;
		this.deptStatusRequestLoad("queryCheckStatDeptAction", "deptData", "deptStatusDialogData", this.date);
	};
	
	Model.prototype.dialogDeptListClick = function(event){
		var rowID = this.comp("deptStatusDialogData").getRowID();
		//获取第几行
		var deptID = this.comp("deptStatusDialogData").val("fDeptID");
		this.owner.send([deptID,rowID]);
		this.owner.close();
	};
	
	return Model;
});