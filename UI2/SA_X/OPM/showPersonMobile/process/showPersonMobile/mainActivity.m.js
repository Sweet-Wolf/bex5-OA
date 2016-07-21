define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存数据成功！");
	};
	
	Model.prototype.logoutClick = function(event){
	justep.Shell.fireEvent('onCallPortal',{fn:'logout'});

	};
	
	return Model;
});