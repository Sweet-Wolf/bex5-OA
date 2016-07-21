define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.maindataTablesRowDblClick = function(event){
	   ;
		var row = this.comp("dVBookStatus").getCurrentRow();
		if (!row) {
			return;
		}
		this.openBookApplyDetail(row.val("fBookApplyMid"));
	};
	
	Model.prototype.openBookApplyDetail = function(id){
    	var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var operator = "view";
    	var url = "$UI/OA/book/process/bookBorrowApplyDetail/bookBorrowApplyDetailActivity.w?process="
    		+ process +"&activity=" + activity + "&operator=" + operator + "&id=" + id;
    	justep.Portal.openWindow(url,{title:"图书借阅申请详细"});
    	
    };
	Model.prototype.statusSelectUpdateValue = function(event){
		;
	    var data = this.comp("dVBookStatus");
		this.comp("dVBookStatus").refreshData();
		
		var data = this.comp("dVBookStatus");
		var dStatusSelect = this.comp("conditionData");
		var status = event.source.value;
		
		if(status=="" || status == null){
			//dStatusSelect.setValue("status", "bsEditing,bsExecuting");
			//dStatusSelect.setValue("statusName", "编辑中,处理中");
			data.filters.setFilter("statefilter", " 1=1 ");
		}else{
			status = status.replace(/\,/g, "','" ); 
			data.filters.setFilter("statefilter", "V_OA_Book_ApplyStatus.fBookApplyStatus in('"+status+"') ");
		}
		data.refreshData();
	
	
	};
	return Model;
});