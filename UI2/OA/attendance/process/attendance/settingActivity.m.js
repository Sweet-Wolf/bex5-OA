define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.workRowClick = function(event){
		this.comp("shortTimeChooseDlg").open({
			"src" : "$UI/OA/attendance/process/attendance/shortTimeActivity.m.w",
			"data":{
				"status" :"work",
				"oldTime":$("[xid=workSpan]").html()
			}
		});
	};
	
	Model.prototype.lateRowClick = function(event){
		this.comp("shortTimeChooseDlg").open({
			"src" : "$UI/OA/attendance/process/attendance/shortTimeActivity.m.w",
			"data":{
				"status" :"late",
				"oldTime":$("[xid=lateSpan]").html()
			}
		});
	};
	
	Model.prototype.absentRowClick = function(event){
		this.comp("shortTimeChooseDlg").open({
			"src" : "$UI/OA/attendance/process/attendance/shortTimeActivity.m.w",
			"data":{
				"status" :"absent",
				"oldTime":$("[xid=absentSpan]").html()
			}
		});
	};
	
	Model.prototype.mastEarlyClick = function(event){
		this.comp("longTimeChooseDlg").open({
			"src" : "$UI/OA/attendance/process/attendance/longTimeDlgActivity.m.w", 
		});
	};
	Model.prototype.longTimeChooseDlgReceive = function(event){
		$("[xid=longSpan]").html(event.data);
		if(this.comp("timeData").getValue("fFirstEarlyTime") === undefined){
			var longDefaultValue = {
				  "fFirstEarlyTime" : event.data
			};
			this.comp("timeData").newData(longDefaultValue)
		}else{
			this.comp("timeData").setValue("fFirstEarlyTime", event.data)
		}
		this.comp("timeData").saveData()
	};
	
	Model.prototype.shortTimeChooseDlgReceive = function(event){
		if(event.data.status=="work"){
			$("[xid=workSpan]").html(event.data.time);
			if(this.comp("timeData").getValue("fGoWorkTime") === '关闭'){
				this.comp("timeData").setValue("fGoWorkTime", event.data.time)
			}
		}else if(event.data.status=="late"){
			$("[xid=lateSpan]").html(event.data.time);
			if(this.comp("timeData").getValue("fLateTime") === '关闭'){
				this.comp("timeData").setValue("fLateTime", event.data.time)
			}
		}else{
			$("[xid=absentSpan]").html(event.data.time);
			if(this.comp("timeData").getValue("fAbsentTime") === '关闭'){
				this.comp("timeData").setValue("fAbsentTime", event.data.time)
			}
		}
		this.comp("timeData").saveData()
	};
	

	
	Model.prototype.modelLoad = function(event){
		if(this.comp('timeData').count() === 0){
			this.comp('timeData').newData();
		}
	};
	
	
	
	
	
	return Model;
});