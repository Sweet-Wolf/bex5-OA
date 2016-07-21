define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	var mainData="";
	Model.prototype.modelLoad = function(event){
		mainData=this.comp("mainData");
		var paperID = this.getContext().getRequestParameter("data");		
		if (paperID){
			var filter = "OA_VS_Survey.fPaperID='" + paperID + "'";
			mainData.setFilter("____dataFilter_", filter);
			mainData.refreshData(); 
		}				
	};

	Model.prototype.dataTables1CellRender = function(event){
		mainData=this.comp("mainData");
		mainData.to(event.row.getID());
		if(event.colName=="view"){
			event.html="<a href='javascript:;' class='view'>查看</a>";
		}
	};

	Model.prototype.dataTables1RowClick = function(event){
		mainData=this.comp("mainData");
		var link=$(event.domEvent.target);
		if(link.hasClass("view")){			
			if (mainData.getValue("fSState") == '已完成') {
				var process = this.getContext().getCurrentProcess();
				var activity = this.getContext().getCurrentActivity();
				var taskid = mainData.getValue("fTaskID");
				var paperid = mainData.getValue("fPaperID");			
				var url = require.toUrl("$UI/OA/survey/process/surveyTask/surveyTask.j?process=" + process + "&activity=" + activity + "&task=" + taskid + "&paperID=" + paperid + "&surveyID=" + mainData.getCurrentRowID());
				justep.Portal.openWindow(url, {title: "在线调查问卷"});
			} else {
				alert('只能查看已完成问卷的详细信息！');
			}
		}
	};

	return Model;
});