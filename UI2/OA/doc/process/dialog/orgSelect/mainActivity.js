define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event){
	    ;
	    
		var selectedOrgIDs = event.data.selectedOrgIDs;
		if(selectedOrgIDs == undefined || selectedOrgIDs == "")
		    return;
		
		var selectedOrgIDArry = selectedOrgIDs.split(",");
		var len = selectedOrgIDArry.length;
		var grid = this.comp("orgTreeGrid");
		for(var i = 0;i<len;i++){	
	
			grid.setSelection(selectedOrgIDArry[i]);     //设置选中行不起作用
		}
	};

	Model.prototype.okBtnClick = function(event){
	   ;
	   var selectIDs = this.comp("orgTreeGrid").getCheckeds();
	   var data = this.comp("dExternalUnit");
	   
	   var orgNames = new Array();
	   for(var i = 0;i<selectIDs.length;i++){
	      
	        orgNames[i] = data.getValueByID("fName",selectIDs[i]);   
	   }
	    var returnparam = {
			   "selectIDs" : selectIDs,
			   "orgNames" : orgNames
	   }
	    
	   this.comp("windowReceiver").windowEnsure(returnparam);
       
	};

	Model.prototype.orgTreeGridBeforeRowSelect = function(event){
	    ;
	    //为何不能控制选中？
        var row = event.row;
        if(row.val("fCode") == "UNIT")
        	event.cancel = true;
	};

	return Model;
});