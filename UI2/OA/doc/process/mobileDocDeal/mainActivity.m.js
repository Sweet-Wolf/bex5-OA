define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!$UI/OA/config/pub").load();
	var Model = function(){
		this.callParent();
	};

	Model.prototype.smartFilter1Filter = function(event){
	    var str = event.source.searchText.get();
		this.comp('findData').setValue("findStr",str);
		
		
	};
    
    Model.prototype.dataFilter = function(event){
		if(this.comp('findData').val('findStr')== undefined){
			return true;
		}else if(this.comp('findData').val('findStr')==''){
			return true;
		}else{
			return (event.val('sName').indexOf(this.comp('findData').val('findStr')) >= 0) || (event.val('fCreatePsnName').indexOf(this.comp('numData').val('findStr')) >= 0);
		}
	};
	
	Model.prototype.toAURL = function(url) {
		if (url && (url.charAt(0) == "/")){
			url = require.toUrl("$model" + url);
		}
		return url;
	};
	
	Model.prototype.listClick = function(event){
		//打开任务
		debugger;
		var row = this.comp('taskData').getCurrentRow();
		var task = row.val("SA_Task");
		var process = row.val("sProcess");
		var activity = row.val("sActivity");
		var url = this.toAURL(row.val("sEURL"));
		url += ((url.indexOf("?") == -1) ? "?" : "&");
		url += "&process=" + process + "&activity=" + activity + "&task=" + task;
		url = encodeURI(url);
		
		//TODO 将来由门户的api加bsessionid
		url = url + "&bsessionid=" + this.getContext().getBSessionID();
		justep.Portal.openWindow(url);	
		
	};
	Model.prototype.taskDataRefreshCreateParam = function(event){
		var param = event.param;
		
		param.setString("status", "waiting");
		param.setString("org", this.getContext().getCurrentPersonID());
	};
	Model.prototype.backBtnClick = function(event){
		justep.Portal.closeWindow();
	};
	
	Model.prototype.modelActive = function(event){
		this.comp('taskData').refreshData();
	};
	return Model;
});