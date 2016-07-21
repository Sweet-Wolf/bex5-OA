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



	Model.prototype.processBeforeAdvanceQuery = function(event){
		var detailData = this.comp('detailData');
		if(detailData.count() <= 0){
			alert('办公用品信息不能为空');
			event.cancel = true;
		}
	};

	return Model;
});