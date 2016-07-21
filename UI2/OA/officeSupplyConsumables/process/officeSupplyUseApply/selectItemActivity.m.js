define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!$UI/OA/config/pub").load();
	
	var Model = function(){
		this.callParent();
	};
	
	
	Model.prototype.okBtnClick = function(event){
		var checkedfNames = [];
		for(var i=0;i<this.comp("dataTables1").getCheckeds().length;i++){
			checkedfNames.push(this.comp("dataTables1").getCheckeds()[i].row.fName.value.latestValue);
		}
		this.comp("windowReceiver").windowEnsure(checkedfNames);
		
	};

	return Model;
});