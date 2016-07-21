define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.saveCommit = function(event) {
		justep.Util.hint("保存成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	};

	Model.prototype.btnStartUseClick = function(event) {
		var data = this.getMainData();
		var row = data.getCurrentRow();
		try {
			data.setValue("fUseStatus", '1', row);
			data.setValue("fUseStatusName", '启用', row);
			data.saveData({
				"onSuccess" : function(event) {
					event.source.refreshData();
				}
			});
		} catch (e) {
			justep.Util.hint("对不起，启用失败！", {
				type : 'danger',
				parent : this.getRootNode()
			});
		}
	};

	Model.prototype.getMainData = function() {
		return this.comp("mainData");
	}

	Model.prototype.btnAllUseClick = function(event) {
		var data = this.getMainData();
		try {
			data.each(function(param) {
				var row = param.row;
				var useFlag = data.getValue("fUseStatus", row);
				data.setValue("fUseStatus", '1', row);
				data.setValue("fUseStatusName", '启用', row);
			});
			data.saveData({
				"onSuccess" : function(event) {
					event.source.refreshData();
				}
			});
		} catch (e) {
			justep.Util.hint("对不起，全部启用失败！", {
				type : 'danger',
				parent : this.getRootNode()
			});
		}
	};

	Model.prototype.btnStopUseClick = function(event) {
		var data = this.getMainData();
		var row = data.getCurrentRow();
		try {
			data.setValue("fUseStatus", '2', row);
			data.setValue("fUseStatusName", '停用', row);
			data.saveData({
				"onSuccess" : function(event) {
					event.source.refreshData();
				}
			});
		} catch (e) {
			justep.Util.hint("对不起，停用失败！", {
				type : 'danger',
				parent : this.getRootNode()
			});
		}
	};




	Model.prototype.newBtnClick = function(event){
//新建
		var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var operator = "new";
    	var url = "$UI/OA/meeting/process/boardroomDetail/boardroomDetail.w?process="
    		+ process +"&activity=" + activity + "&operator=" + operator ;
    	justep.Portal.openWindow(url,{title:"会议室信息"});
    	
	};
	
	Model.prototype.openDetail = function(id){
		var mainData = this.comp("mainData");
	
	
		var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var operator = "edit";
    	var url = "$UI/OA/meeting/process/boardroomDetail/boardroomDetail.w?process="
    		+ process +"&activity=" + activity + "&operator=" + operator + "&id=" + id;
    	justep.Portal.openWindow(url,{title:"会议室信息"});
	}

	Model.prototype.listCellRender = function(event){
		 if(event.colName == "fName"){
	       event.html = "<a  href='#' class='toDetail'>"+event.colVal+"</a>";
		
	   }
	};

	Model.prototype.listRowClick = function(event){
		var domButton = $(event.domEvent.target);//获取点击的元素
        if(domButton.hasClass("toDetail")){
        	  this.openDetail(event.rowID);
         }
	};

	return Model;
});