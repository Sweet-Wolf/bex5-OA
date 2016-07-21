define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};



	Model.prototype.editBtnClick = function(event){
	
	   var mainData = this.comp("mainData");
	
		var id = mainData.getCurrentRowID();
		var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var operator = "edit";
    	var url = "$UI/OA/car/process/carUseRecord/carUseRecordDetail.w?process="
    		+ process +"&activity=" + activity + "&operator=" + operator + "&id=" + id;
    	justep.Portal.openWindow(url,{title:"用车记录详细"});
    	
	
		
	};

	Model.prototype.dataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	Model.prototype.addBtn = function(event){
	   var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var operator = "new";
    	var url = "$UI/OA/car/process/carUseRecord/carUseRecordDetail.w?process="
    		+ process +"&activity=" + activity + "&operator=" + operator ;
    	justep.Portal.openWindow(url,{title:"用车记录详细"});
    	
	
	};

	return Model;
});