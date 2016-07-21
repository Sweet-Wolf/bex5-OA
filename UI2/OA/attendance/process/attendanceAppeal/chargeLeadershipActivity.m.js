define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.modelLoad = function(event){
		
		var personal = this.getContext().getCurrentPersonName();
		this.comp("LateAppealData").setValue("fApplicantName",personal);
		var date = new Date();
	
	};

	return Model;
});
