define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		var operator = this.getparameter('operator');
		var mdMain = this.comp("mdMain");
		if (justep.String.trim(operator) === 'new') {
			mdMain.newData();
		} else {
			 var rowid = this.getparameter('rowID');
			 if(rowid){
				 mdMain.setFilter('filter_data', "OA_AB_AddressBook='"+rowid+"'");
				 mdMain.refreshData();
			 }
		}
	};

	Model.prototype.getparameter = function(parameter) {
		return this.getContext().getRequestParameter(parameter);
	};
	
	Model.prototype.mdMainSaveCommit = function(event){
		justep.Util.hint('数据保存成功！', {parent:this.getRootNode(),type:'success'});
	};
	
	return Model;
});