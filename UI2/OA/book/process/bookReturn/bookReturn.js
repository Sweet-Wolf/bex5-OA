define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.btnReturnClick = function(event){
	    ;
		var data = this.comp('dBookInfo');
		var row = data.getCurrentRow();
		var bookNumber = row.val("fBooksNumber");
		var bookName = row.val("fBooksName");
		if(confirm("是否要归还'"+bookNumber+"--"+bookName+"'?")){
			var param = new biz.Request.ActionParam();
			param.setString("bizID",row.getID());
			var bookState = this.updateBookInfo(param);
			if(bookState == true){
				alert("图书归还成功!");
				data.refreshData();
			}
		}
	};
	
	Model.prototype.updateBookInfo = function(params){
	    var success = false;
	    var self = this;
		biz.Request.sendBizRequest({
				"context" : self.getContext(),
				"action" : "updateBookInfoLoanStatusAction",
				"parameters" : params, 
				"callback" : function(data) {					    
					data.ignoreError = false;
					if (data.state) {
						success = true;
					}else{
						   alert("图书归还失败!");
					}
				}
			});		
		
		return success;
	}
	return Model;
});