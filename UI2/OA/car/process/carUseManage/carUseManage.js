define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowDialogReceive = function(event){
	/*	var mainData = this.comp("mainData");
		if (event.data.action === "new") {
			var id = event.data.row[mainData.idColumn];
			this.comp('mainData').loadData({
				rows : [ event.data.row ]
			}, true);
			mainData.to(id);
		} else {
			$.each(mainData.defCols, function(col) {
				if (event.data.row[col]) {
					mainData.setValue(col, event.data.row[col]);
				}
			});
		}*/
	};

	Model.prototype.editBtnClick = function(event){
		var mainData = this.comp("mainData");
		var row = mainData.getCurrentRow();
		
		var id = row.val("fMasterID");
		var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var operator = "edit";
    	var url = "$UI/OA/car/process/carUseManage/carUseManageArrange.w?process="
    		+ process +"&activity=" + activity + "&operator=" + operator + "&id=" + id;
    	justep.Portal.openWindow(url,{title:"用车管理详细"});
    	
	
	};

	Model.prototype.addBtn = function(event){
		
		var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var operator = "new";
    	var url = "$UI/OA/car/process/carUseManage/carUseManageArrange.w?process="
    		+ process +"&activity=" + activity + "&operator=" + operator ;
    	justep.Portal.openWindow(url,{title:"用车管理详细"});
	};

//此处未起作用
	Model.prototype.listCellRender = function(event){
	   
	   if(event.colName == "fCode"){
	       event.html = "<a  href='#' class='toDetail'>"+event.colVal+"</a>";
		
	   }
	   

	};
	
	// 车辆详细
    Model.prototype.openCarBasicDetail = function(rowId) {
        ;
        var data = this.comp('mainData');

        var row = data.getCurrentRow();
    	var id = row.val("fCarID");
    	
    	var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	operator = "view";
    	
    	var url = "$UI/OA/car/process/carBasicInfoDetailView/carBasicInfoDetailView.w?process="
    		+ process +"&activity=" + activity + "&operator=" + operator +"&id="+id;
    	justep.Portal.openWindow(url,{title:"车辆信息详细"});
    	
   
    };


	Model.prototype.listRowClick = function(event){
	    ;
		var domButton = $(event.domEvent.target);//获取点击的元素
        if(domButton.hasClass("toDetail")){
        	  this.openCarBasicDetail(event.rowID);
         }
	};


	Model.prototype.btnCancelDOMActivate = function(event){
		if (confirm("确定取消当前安排？")) {
			var data = this.comp('mainData');
			var rowid = data.getCurrentRowID();
			var tableName = data.idColumn;
	
			var params = new biz.Request.ActionParam();
			params.setString("id", rowid);
			params.setString("fieldName", "fEffect");
			params.setString("fieldValue", "0");
			params.setString("tableName", tableName);
	
			biz.Request.sendBizRequest({
				"context": this.getContext(),
				"action": "upDataFieldValueAction",
				"parameters": params,
				"callback": function(callbackData) {
					callbackData.ignoreError = false;
					if (callbackData.state) {
						data.refreshData();
					}else{
						throw new Error("取消安排请求失败！");
					}
				}
			});	
		}
	};


	return Model;
});