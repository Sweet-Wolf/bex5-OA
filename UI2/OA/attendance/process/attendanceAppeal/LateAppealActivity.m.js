define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		
	};
	
	Model.prototype.moreBtnClick = function(event){
		this.comp("processMenu").show();
	};
	
	
	
	Model.prototype.modelLoad = function(event){
	//debugger;
		var self = this;
		var personal = this.getContext().getCurrentPersonName();
		this.comp("LateAppealData").setValue("fApplicantName",personal);
		var date = new Date();
		this.comp("LateAppealData").setValue("fApplicantTime",date);
		this.comp("LateAppealData").setValue("fClockTime",this.params.time);
		this.comp("LateAppealData").setValue("fLateTimer",this.params.lateTime);
		this.comp("LateAppealData").setValue("fAppealWay",this.params.status);
	};
	
		Model.prototype.moreBtnClick = function(event){
		this.comp("processMenu").show();
		};
		
	
	
	
	Model.prototype.modelModelConstruct = function(event){
	};	
	
	
	
	
	return Model;
});