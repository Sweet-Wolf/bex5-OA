define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.noticeBtnClick = function(event){
	this.comp("noticeDialog").open();

	};
	Model.prototype.noticeDialogReceive = function(event){
		this.comp("KnowledgeNoRead").refreshData();
		this.comp("numData").refreshData();
		this.comp("KnowledgeRead").refreshData();
	};
	Model.prototype.modelLoad = function(event){
		//加载之前的动画
		$("[xid=waitDiv]").hide();
		$("[xid=content1]").show();
		$("[xid=bottom1_4]").show();
	};
	
	return Model;
});