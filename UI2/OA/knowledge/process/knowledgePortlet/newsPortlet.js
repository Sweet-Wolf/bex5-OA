define(function(require) {
	var $ = require("jquery");
	var Model = function() {
		this.callParent();
	};
	Model.prototype.modelModelConstructDone = function(event) {
		this.loadDataList('public/news');
	};

	return Model;
});
