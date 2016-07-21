define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.OKBtnClick = function(event){
		var checkedRows=this.comp("mainTables").getCheckeds();
		this.comp("wReceiver").windowEnsure({rows:checkedRows});
	};

	return Model;
});