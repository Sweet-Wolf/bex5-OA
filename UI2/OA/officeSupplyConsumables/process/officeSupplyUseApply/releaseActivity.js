define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.addBtnClick = function(event) {
		var DialogList = this.comp("DialogList");
		DialogList.open();
	};

	return Model;
});