define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!$UI/OA/common/css/pub").load();

	var Model = function() {
		this.callParent();
	};

	Model.prototype.startProcess = function(event) {
		this.comp("newDialog").open();
	};



  Model.prototype.creatorListClick = function(event) {
        debugger;
		var row = event.bindingContext.$object;
		
		this.comp('showDetailDialog').open({
			data : {
				data : this.comp('creatorData').val('fID'),
				type : 'detail'
			}
		});
	};
	
	
	Model.prototype.parListClick = function(event) {
		this.comp('showDetailDialog').open({
			data : {
				data : this.comp('parData').getCurrentRowID(),
				type : 'detail'
			}
		});
	};

	Model.prototype.cloListClick = function(event) {
		this.comp('showDetailDialog').open({
			data : {
				data : this.comp('closeData').getCurrentRowID(),
				type : 'detail'
			}
		});
	};
   Model.prototype.getRequest = function(type, dataxid) {
		var params = new biz.Request.ActionParam();
		var ctx = this.getContext();
		params.setParam('type', type);
		params.setParam('tableName', "OA_OSC_UseApplyM");
		params.setParam('sProcess', "/OA/officeSupplyConsumables/process/officeSupplyUseApply/officeSupplyUseApplyProcess");
		params.setParam('notInActivities', "'listActivity'");
		params.setParam('DataModel', "/OA/officeSupplyConsumables/data");
		var self = this;
		biz.Request.sendBizRequest({
			"context" : ctx,
			"action" : "querylistDataExAction",
			"parameters" : params,
			"callback" : function(data) {
				if (data.state) {
					var resultData = data.response[type];
					if (resultData) {
						self.comp(dataxid).clear();
						self.comp(dataxid).loadData(resultData);
					}
				}
			}
		});
	}
   Model.prototype.toAURL = function(url) {
		if (url && (url.charAt(0) == "/")) {
			url = require.toUrl("$model" + url);
		}
		return url;
	};
   
	Model.prototype.intoWork = function(event) {

		debugger;
		var row = event.bindingContext.$object;
		var task = row.val("sID");
		var process = row.val("sProcess");
		var activity = row.val("sActivity");
		var url = this.toAURL(row.val("sEURL"));
		url += ((url.indexOf("?") == -1) ? "?" : "&");
		url += "&process=" + process + "&activity=" + activity + "&task=" + task;
		url = encodeURI(url);

		url = url + "&bsessionid=" + this.getContext().getBSessionID();
		justep.Portal.openWindow(url);
		
	};

	Model.prototype.toAURL = function(url) {
		if (url && (url.charAt(0) == "/")) {
			url = require.toUrl("$model" + url);
		}
		return url;
	};

	Model.prototype.modelLoad = function(event) {
		this.showlistCount();
	};

	Model.prototype.showlistCount = function() {
		 var cloNO = this.comp('cloList').getBindingObjects().length;

		this.comp('numData').setValue('exeNum', this.comp("executorData").getCount());
		this.comp('numData').setValue('croNum', this.comp("creatorData").getCount());
		this.comp('numData').setValue('parNum', this.comp("parData").getCount());
		 this.comp('numData').setValue('cloNum', cloNO);
	};

	Model.prototype.modelActive = function(event) {
		this.comp("creatorData").refreshData();
		this.comp("executorData").refreshData();
		this.comp("parData").refreshData();
		this.comp("closeData").refreshData();
		this.showlistCount();
	};

	Model.prototype.smartFilterFilter = function(event){
		var str = event.source.searchText.get();
		this.comp('numData').setValue("findStr", str);
	};
    // 转换时间显示方式
	Model.prototype.showTime = function(event) {
		return OA.transformDate(event.val('fApplyDate'));
	};
    
	Model.prototype.closeDataCustomRefresh = function(event){
		this.getRequest("clo","closeData");
	};
    
	Model.prototype.executorDataCustomRefresh = function(event){
		this.getRequest("execute", "executorData");
	};
    Model.prototype.creatorDataCustomRefresh = function(event) {
		 this.getRequest("cre", "creatorData");
	};

	Model.prototype.parDataCustomRefresh = function(event){
		this.getRequest("par", "parData");
	};
	return Model;
});