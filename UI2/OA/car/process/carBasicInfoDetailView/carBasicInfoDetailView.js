define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.btnClickGotoPage = function(event,dialog){
		
		var dCarBasicInfo = this.comp("dCarBasicInfo");
		
		var	dlgOperator = "view";
	
		var carBasicInfoID = dCarBasicInfo.getCurrentRowID();
		var options = {
			operator : dlgOperator,
			carBasicInfoID:carBasicInfoID
		};
		dialog.open({
				data : options
		});
	}
	return Model;
});