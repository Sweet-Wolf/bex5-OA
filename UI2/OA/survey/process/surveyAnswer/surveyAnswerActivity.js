define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function(){
		this.callParent();
	};
	
	var mainData="";
	Model.prototype.modelLoad = function(event){
		mainData=this.comp("mainData");
	};
	
	Model.prototype.modelModelConstructDone = function(event){		
	    mainData=this.comp("mainData");
		var sql="V_OA_VS_Answer.fPerID ='"+this.getContext().getCurrentPersonID()+"'";
		mainData.filters.setFilter("RMFilter", sql);
		mainData.refreshData(); 
	};
	
	Model.prototype.dataTables1CellRender = function(event){		
		mainData=this.comp("mainData");
		mainData.to(event.row.getID());
		if(event.colName=="fTitle"){
			event.html="<a href='javascript:;' class='title'>"+mainData.getValue("fTitle")+"</a>";
		}
	};

	Model.prototype.dataTables1RowClick = function(event){
		var link=$(event.domEvent.target);
		if(link.hasClass("title")){
			var process = this.getContext().getCurrentProcess();
			var activity = this.getContext().getCurrentActivity();
			var taskid = mainData.getValue("fTaskID");
			var paperid = mainData.getValue("fPaperID");			
			var url = require.toUrl("$UI/OA/survey/process/surveyTask/surveyTask.j?process=" + process + "&activity=" + activity + "&task=" + taskid + "&paperID=" + paperid + "&surveyID=" + mainData.getCurrentRowID());
			justep.Portal.openWindow(url, {title: "在线调查问卷"});
		}
	};

	return Model;
});