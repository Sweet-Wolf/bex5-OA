define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var ToolUtils = require("$UI/OA/common/js/common");

	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelModelConstructDone = function(event){
	 
	   ;
	   
		var openPortalOperator = this.getContext().getRequestParameter("openPortalOperator");
		var id = this.getContext().getRequestParameter("id");
		var data = this.comp('dBookInfo');
		if (openPortalOperator == "new") {
			data.newData();
		} else {
			data.filters.setFilter("bookFilter", "OA_BK_BookInfo='" + id + "'");
			data.refreshData();
		}
	};



	Model.prototype.dBookInfoValueChanged = function(event){
	    ;
		if (event.col == "fBooksTypeID") {
		    ;
			var data = this.comp('dBookInfo');
			var kindData = this.comp('dBookKind');
			var row = kindData.getCurrentRow();
			var fcode = row.val("fCode");
		   
			
			var code =  ToolUtils.createNextSeqString(fcode, "0000",this.getContext());//
			var bookrow = data.getCurrentRow();
			bookrow.val("fBooksNumber", code);
		}
	};

  

	Model.prototype.dBookInfoSaveCommit = function(event){
	   //获取父窗体？
		var caller = null;
		var callerName = this.getContext().getRequestParameter("callerName");
		if (callerName && (callerName != "")) {
			var frames = window.parent.frames;
			if(frames.name == callerName){
				//alert("确认如何处理");
			
			//	 frames.dataChangeCallBackFun();
				 //this.getParent().comp("dataMain").refreshData();
			}
		}
	
	};

    Model.prototype.readOnly = function(){
	    var openPortalOperator = this.getContext().getRequestParameter("openPortalOperator");
		return openPortalOperator == "view";
	};
    
    Model.prototype.btnvisible = function(){
	    var openPortalOperator = this.getContext().getRequestParameter("openPortalOperator");
		return openPortalOperator == "new" || openPortalOperator == "edit";
	};
	
	return Model;
});