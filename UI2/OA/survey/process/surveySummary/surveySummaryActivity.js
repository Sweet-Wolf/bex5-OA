define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	var mainData="";
	Model.prototype.dataTables1CellRender = function(event){
		mainData=this.comp("mainData");
		mainData.to(event.row.getID());
		if(event.colName=="fTitle"){
			event.html="<a href='javascript:;' class='title'>"+mainData.getValue("fTitle")+"</a>";
		}
	};

	Model.prototype.dataTables1RowClick = function(event){
	    debugger;
		var link=$(event.domEvent.target);
		if(link.hasClass("title")){
		   var process = this.getContext().getCurrentProcess();
			var activity = this.getContext().getCurrentActivity();
			var paperid = this.comp("mainData").getCurrentRowID();
			var taskid = mainData.getValue("fTaskID");
			
			
	       var url =require.toUrl("$UI/OA/survey/process/surveyFinally/surveyFinally.j?process="
			+ process + "&activity=" + activity + "&paperID=" + paperid);
	        justep.Portal.openWindow(url, {title: "在线调查问卷"});
		
		  
		
		/*	var process = this.getContext().getCurrentProcess();
			var activity = this.getContext().getCurrentActivity();
			var taskid = mainData.getValue("fTaskID");
			var paperid = mainData.getValue("fPaperID");			
			var url = require.toUrl("$UI/OA/survey/process/surveyTask/surveyTask.j?process=" + process + "&activity=" + activity + "&task=" + taskid + "&paperID=" + paperid + "&surveyID=" + mainData.getCurrentRowID());
			justep.Portal.openWindow(url, {title: "在线调查问卷"});*/
		}
	};

	Model.prototype.button1Click = function(event){		
		paperID = mainData.getCurrentRow();
		dlgOperator = "view";
		var fPublicType = mainData.getValue("fPublicType", paperID);
		var fPublicTypeName = mainData.getValue("fPublicTypeName", paperID);
		var fCreatePsnID = mainData.getValue("fCreatePsnID", paperID);
		if (fPublicType == "Anonymity" || fPublicType == "AnonyPublic") {
			alert("当前调查公布类型为：" + fPublicTypeName + "   不能查看问卷明细！");
			return;
		} else if (fPublicType == "SumPublic" || fPublicType == "NoPublic") {
			if (fCreatePsnID != this.getContext().getCurrentPersonID()) {
				alert("当前调查公布类型为：" + fPublicTypeName + "  只能查看本人创建的调查问卷明细！");
				return;
			}
		}		
		var url = require.toUrl("$UI/OA/survey/process/surveySummary/questionnaireActivity.w?process=/OA/survey/process/surveySummary/surveySummaryProcess&activity=surveySummaryActivity&data=" + mainData.getCurrentRowID());
		justep.Portal.openWindow(url, {title: "问卷明细"});
		//this.comp("windowDialog").open({src:url});
	};

	return Model;
});