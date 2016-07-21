define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	var uuid = require('$UI/system/lib/base/uuid');
	var DocUtils = require("$UI/system/components/justep/docCommon/docUtil");
	var interval = "";
	var Model = function() {
		this.callParent();
	};
	var index = 2;
	Model.prototype.modelLoad = function(event) {
		var self = this;
		window.changeImage = function() {
//			if (index == 1) {
//				self.comp('contents').to(0);
//				index++;
//			} else if (index == 2) {
//				self.comp('contents').next();
//				index++;
//			} else {
//				self.comp('contents').next();
//				index = 1;
//			}
			self.comp('contents').next();
		};

		interval = setInterval('changeImage()', 3000);
	};

	Model.prototype.getDocURL = function(docData) {

		var url = '';
		if (docData != '') {
			var d = eval(docData);
			var docPath = d[0].docPath;
			var docID = d[0].docID;
			var fileID = d[0].fileID;
			var sdocPath = DocUtils.InnerUtils.getDocFullPath(docID, docPath);
			url = DocUtils.InnerUtils.getdocServerAction({
				docPath : sdocPath,
				urlPattern : "/repository/file/download/" + fileID + "/last/content",
				context : this.getContext()
			});

		}
		return url;
	}

	Model.prototype.modelModelConstruct = function(event) {
		// 加载图片
		var self = this
		var params = new biz.Request.ActionParam();
		params.setString('folderFullID', 'public/news');
		params.setString('count', "3");
		params.setString('includeChildren', "1");
		params.setString('isPic', "1");
		var rows = new Array();
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "getPortletDataAction",
			"parameters" : params,
			"async" : true,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					rows = callbackData.response.rows;
					var image = "image";
					for ( var i = 0; i < rows.length; i++) {
						 var url = self.getDocURL(rows[i].fSmallPic.value);
						var title = rows[i].fTitle.value;
						$(self.getElementByXid('label' + i)).text(title);
						 self.getElementByXid(image + i).src = url;
					}
				}
			}
		});

		// 加载列表
		var main = this.comp("main");
		var params2 = new biz.Request.ActionParam();
		params2.setString('folderFullID', 'public/news');
		params2.setString('count', "8");
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

	};
	
	Model.prototype.openUrl = function(event) {
		var activeIndex = this.comp("contents").getActiveIndex();
		var val = $(this.getElementByXid('label'+activeIndex)).text();
		var title = '';
		var data = this.comp("main");
		var rows = data.find([ 'fTitle' ], [ val ], true, true, true, true);
		if (rows.length === 1) {
			var kwid = rows[0].getID();
			this.openLink(title, kwid);
		}
	};

	Model.prototype.li2Click = function(event) {

		var data = this.comp("main");
		var kwid = data.getRowID(event.bindingContext.$object);
		data.to(kwid);
		// var kwid = data.getCurrentRowID();
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

	Model.prototype.modelUnLoad = function(event) {
		clearInterval(interval);
	};

	return Model;
});