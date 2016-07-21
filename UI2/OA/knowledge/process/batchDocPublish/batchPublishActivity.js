define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	
	var Model = function(){
		this.callParent();
	};

	/* 直接发布 */
	Model.prototype.relaseKnowledge = function(event) {
		;
		var data = this.comp('dKnowledge');
		if (data.saveData()) {
			;
			var params = new biz.Request.ActionParam();
			params.setString("id", data.getCurrentRowID());
			biz.Request.sendBizRequest({
				"context" : this.getContext(),
				"action" : "docBatchPublishAction",
				"parameters" : params,
				"callback" : function(callbackData) {
					callbackData.ignoreError = false;
					if (callbackData.state) {
						alert("发布成功！");
					}else{
						throw new Error("批量发布失败！");
					}
				}
			});
		}
	};
	
	return Model;
});