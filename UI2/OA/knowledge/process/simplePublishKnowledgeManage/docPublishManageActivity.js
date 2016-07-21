define(function(require) {
	var $ = require("jquery");
	var Model = function() {
		this.callParent();
	};
	Model.prototype.addNews = function(event) {
		var process = "/OA/knowledge/process/simplePublishKnowledge/simplePublishKnowledgeProcess";
		var activity = "docPublishActivity";
		var operator = 'new'

		var url = "$UI/OA/knowledge/process/simplePublishKnowledge/docPublishActivity.a?process=" + process + "&activity=" + activity + "&operator=" + operator;
		justep.Portal.openWindow(url, {
			title : "文件发布"
		});

	};
	Model.prototype.RowDbleClick = function(event) {
		var process = "/OA/knowledge/process/simplePublishKnowledge/simplePublishKnowledgeProcess";
		var activity = "docPublishActivity";
		var operator = 'edit'
		var dKnowledge = this.comp("dKnowledge");
		var kwid = dKnowledge.getCurrentRowID();

		var url = "$UI/OA/knowledge/process/simplePublishKnowledge/docPublishActivity.a?process=" + process + "&activity=" + activity + "&operator=" + operator + "&KWID=" + kwid;
		justep.Portal.openWindow(url, {
			title : "文件发布"
		});
	};
	return Model;
});