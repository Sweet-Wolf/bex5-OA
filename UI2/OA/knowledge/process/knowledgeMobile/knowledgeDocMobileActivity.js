define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.backBtnClick = function(event){
		this.owner.close();
	};
	return Model;
});