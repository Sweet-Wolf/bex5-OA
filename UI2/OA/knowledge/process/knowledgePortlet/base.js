define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	

	var Model = function() {
		this.callParent();
	};

	Model.prototype.li1Click = function(event) {
		
		var data = this.comp("main");
		var kwid = data.getRowID(event.bindingContext.$object);
		data.to(kwid);
		//var kwid = data.getCurrentRowID();
		var fTitle = data.getValue("fTitle");
		this.openLink(fTitle, kwid);
	};
	Model.prototype.openLink = function(title, kwid) {
		
		var process = "/OA/knowledge/process/knowledgePortlet/knowledgePortletProcess";
		var activity = "textAndPicPortletActivity";
		var url = "$UI/OA/knowledge/process/viewKnowledge/viewKnowledge.a" + "?process=" + process + "&activity=" + activity + "&kwid=" + kwid;
		justep.Portal.openWindow(url, {
			title : "详细"
		});
	}

	

	Model.prototype.loadDataList = function(folderFullID) {
		// 加载列表
		var main = this.comp("main");
		var params2 = new biz.Request.ActionParam();
		params2.setString('folderFullID', folderFullID);
		params2.setString('count', "5");
		params2.setString('includeChildren', "1");
		params2.setString('isPic', "0");
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "getPortletDataAction",
			"parameters" : params2,
			"async" : true,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					main.loadData(callbackData.response);
				}
			}
		});
	}

	return Model;
});