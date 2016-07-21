define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var OA = require("$UI/OA/common/js/pub");
	 require("css!$UI/OA/common/css/pub").load();

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		this.showlistCount();
	};

	Model.prototype.getRequest = function(type, dataxid) {
		var params = new biz.Request.ActionParam();
		params.setParam('type', type);
		var self = this;
		biz.Request.sendBizRequest({
			process : "/OA/workTime/process/outQuery/outQueryProcess",
			activity : "mainActivity",
			"action" : "queryOA_WM_outApplyAction",
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

	Model.prototype.showlistCount = function() {
//		 var exeNO = this.comp('executorList').getBindingObjects().length;
		// var croNO = this.comp('creatorList').getBindingObjects().length;
		// var parNO = this.comp('parList').getBindingObjects().length;
		// var cloNO = this.comp('cloList').getBindingObjects().length;

		this.comp('numData').setValue('exeNum', this.comp("executorData").getCount());
		this.comp('numData').setValue('croNum', this.comp("creatorData").getCount());
		this.comp('numData').setValue('parNum', this.comp("parData").getCount());
		// this.comp('numData').setValue('cloNum', cloNO);
	};

	Model.prototype.backBtnClick = function(event) {
		justep.Portal.closeWindow();
	};

	Model.prototype.addBtnClick = function(event) {
		var url = this.getUrl({
			url : '$UI/OA/workTime/process/outApply/mainActivity.m.w',
			param : {
				process : '/OA/workTime/process/outApply/outApplyProcess',
				activity : 'mainActivity'
			}
		});
		justep.Portal.openWindow(url);
	};

	Model.prototype.getUrl = function(options) {
		var url = new justep.URL(require.toUrl(options.url));
		if (options.param) {
			$.each(options.param, function(key, val) {
				var paramJson = {};
				paramJson[key] = val;
				url.setParam(paramJson);
			});
		} else {
			url.setParam({
				process : this.getContext().getProcess()
			});
			url.setParam({
				activity : this.getContext().getActivity()
			});
		}
		return url.toString();
	};

	Model.prototype.newDialogReceive = function(event) {
		this.comp("creatorData").refreshData();
		this.comp("executorData").refreshData();

		var croNO = this.comp('creatorList').getBindingObjects().length;
		this.comp('numData').setValue('croNum', croNO);
	};

	Model.prototype.creatorListClick = function(event) {
		var row = event.bindingContext.$object;
		this.comp('detailDialog').open({
			data : {
				data : this.comp('creatorData').val('fID'),
				type : 'detail'
			}
		});
	};

	Model.prototype.executoristClick = function(event) {
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

	Model.prototype.parListClick = function(event) {
		this.comp('detailDialog').open({
			data : {
				data : this.comp('parData').getCurrentRowID(),
				type : 'detail'
			}
		});
	};

	Model.prototype.cloListClick = function(event) {
		this.comp('detailDialog').open({
			data : {
				data : this.comp('closeData').getCurrentRowID(),
				type : 'detail'
			}
		});
	};

	// 设置前端过滤条件，list会自动刷新
	Model.prototype.smartFilterFilter = function(event) {
		var str = event.source.searchText.get();
		this.comp('numData').setValue("findStr", str);
	};

	// 转换时间显示方式
	Model.prototype.showTime = function(event) {
		return OA.transformDate(event.val('fApplyDate'));
	};

	Model.prototype.modelActive = function(event) {
		this.comp("creatorData").refreshData();
		this.comp("executorData").refreshData();
		this.comp("parData").refreshData();
		this.comp("closeData").refreshData();
		this.showlistCount();
	};

	Model.prototype.closeDataCustomRefresh = function(event) {
		// this.getRequest("execute","closeData");
	};

	Model.prototype.executorDataCustomRefresh = function(event) {
		this.getRequest("execute", "executorData");
	};

	Model.prototype.creatorDataCustomRefresh = function(event) {
		 this.getRequest("cre", "creatorData");
	};

	return Model;
});
