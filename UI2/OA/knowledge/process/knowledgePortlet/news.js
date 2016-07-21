define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function() {
		this.callParent();
	};
	var index = 2;
	Model.prototype.modelLoad = function(event) {
		var self = this;
		window.changeImage = function() {
			if (index == 1) {
				self.comp('contents').to(0);
				self.comp("main").first();
				index++;
			} else if (index == 2) {
				self.comp('contents').next();
				self.comp("main").next();
				index++;
			} else {
				self.comp('contents').next();
				self.comp("main").next();
				index = 1;
			}
		};
		setInterval('changeImage()', 3000);
	};
	// 查询数据加载数据
	Model.prototype.modelModelConstruct = function(event) {
		var data = this.comp("main");
		var params = new biz.Request.ActionParam();
		params.setString('folderFullID', 'public/news');
		params.setString('count', "6");
		params.setString('includeChildren', "1");
		params.setString('isPic', "1");

		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "getPortletDataAction",
			"parameters" : params,
			"async" : true,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					data.loadData(callbackData.response);
				}
			}
		});
	};

	// 点击进入详细
	Model.prototype.li2Click = function(event) {
		
		var data = this.comp("main");
		var kwid = data.getCurrentRowID();
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



	return Model;
});