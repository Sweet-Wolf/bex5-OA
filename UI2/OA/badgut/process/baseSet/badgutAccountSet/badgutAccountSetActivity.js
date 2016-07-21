define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	
	
	Model.prototype.dPubBaseCodeSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	
	return Model;
});