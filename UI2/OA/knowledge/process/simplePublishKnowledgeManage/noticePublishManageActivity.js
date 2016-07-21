define(function(require) {
	var $ = require("jquery");
	var Model = function() {
		this.callParent();
	};
	Model.prototype.addNews = function(event) {
		var process = "/OA/knowledge/process/simplePublishKnowledge/simplePublishKnowledgeProcess";
		var activity = "noticePublishActivity";
		var operator = 'new'

		var url = "$UI/OA/knowledge/process/simplePublishKnowledge/noticePublishActivity.a?process=" + process + "&activity=" + activity + "&operator=" + operator;
		justep.Portal.openWindow(url, {
			title : "公告发布"
		});

	};
	Model.prototype.RowDbleClick = function(event) {
		var process = "/OA/knowledge/process/simplePublishKnowledge/simplePublishKnowledgeProcess";
		var activity = "noticePublishActivity";
		var operator = 'edit'
		var dKnowledge = this.comp("dKnowledge");
		var kwid = dKnowledge.getCurrentRowID();

		var url = "$UI/OA/knowledge/process/simplePublishKnowledge/noticePublishActivity.a?process=" + process + "&activity=" + activity + "&operator=" + operator + "&KWID=" + kwid;
		justep.Portal.openWindow(url, {
			title : "公告发布"
		});
	};
	return Model;
});