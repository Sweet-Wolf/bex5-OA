define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	window.name = "bookManageActivity.w";
	var test = "aaa";
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.newBtnClick = function(event){
		//打开新增页面
		var id = "null";
		this.openBookDetail(id);
	};

	Model.prototype.maindataTablesRowDblClick = function(event){
	   ;
		var row = this.comp("dataMain").getCurrentRow();
		if (!row) {
			return;
		}
		this.openBookDetail(row.getID());
	};
    
    Model.prototype.openBookDetail = function(id) {
        ;
      
        var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var openPortalOperator = "";
    	var url = "";
    	if (id == "null") {
    		openPortalOperator = "new";
    		url = "$UI/OA/book/process/bookDetail/bookDetailActivity.w?process="
				+ process + "&activity=" + activity + "&openPortalOperator="
				+ openPortalOperator+ "&callerName="
				+ window.name ;
    	} else {
    		openPortalOperator = "edit";
    		url = "$UI/OA/book/process/bookDetail/bookDetailActivity.w?process="
				+ process + "&activity=" + activity + "&openPortalOperator="
				+ openPortalOperator + "&id=" + id+ "&callerName="
				+ window.name ;
    	}
   
    //	justep.Portal.openWindow(url);
    	justep.Portal.openWindow(url,{title:"图书详细信息"});
    };
    
     Model.prototype.dataChangeCallBackFun = function() {
        ;
    	var data = this.comp("dataMain");
    	data.refreshData();
}

	return Model;
});