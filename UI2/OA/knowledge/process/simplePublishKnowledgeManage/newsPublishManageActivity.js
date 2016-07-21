define(function(require) {
	var $ = require("jquery");
	var Model = function() {
		this.callParent();
	};
	Model.prototype.addNews = function(event) {
		var process = "/OA/knowledge/process/simplePublishKnowledge/simplePublishKnowledgeProcess";
		var activity = "newsPublishActivity";
		var operator = 'new'

		var url = "$UI/OA/knowledge/process/simplePublishKnowledge/newsPublishActivity.a?process=" + process + "&activity=" + activity + "&operator=" + operator;
		justep.Portal.openWindow(url, {
			title : "新闻发布"
		});

	};
	Model.prototype.RowDbleClick = function(event) {
		var process = "/OA/knowledge/process/simplePublishKnowledge/simplePublishKnowledgeProcess";
		var activity = "newsPublishActivity";
		var operator = 'edit'
		var dKnowledge = this.comp("dKnowledge");
		var kwid = dKnowledge.getCurrentRowID();

		var url = "$UI/OA/knowledge/process/simplePublishKnowledge/newsPublishActivity.a?process=" + process + "&activity=" + activity + "&operator=" + operator + "&KWID=" + kwid;
		justep.Portal.openWindow(url, {
			title : "新闻发布"
		});
	};
	return Model;
});