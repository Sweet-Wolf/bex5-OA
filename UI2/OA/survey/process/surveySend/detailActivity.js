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
		var type = this.getContext().getRequestParameter("type");
		if(type=="new"){
			mainData.newData();
		} else if(type=="edit"){
			var data = this.getContext().getRequestParameter("data");
			if (data){
				var filter = "OA_VS_Paper='" + data + "'";
				mainData.setFilter("____dataFilter_", filter);
				mainData.refreshData(); 
			}
			if(mainData.getValue("fPState")=="已完成" || mainData.getValue("fPState")=="已终止"){
				this.comp("trgFinish").set({"disabled":"true"});
				this.comp("trgAbort").set({"disabled":"true"});
				this.comp("saveBtn").set({"disabled":"true"});
				this.comp("deleteBtn").set({"disabled":"true"});
				this.comp("surveyBtn").set({"disabled":"true"});
				
				this.comp("button6").set({"disabled":"true"});
				this.comp("button4").set({"disabled":"true"});
				this.comp("button5").set({"disabled":"true"});
				this.comp("button9").set({"disabled":"true"});
				this.comp("button7").set({"disabled":"true"});
				this.comp("button8").set({"disabled":"true"});
			}

		}
	};
	
	//新增
	Model.prototype.newBtnClick = function(event){
		var url = require.toUrl("$UI/OA/survey/process/surveySend/detailActivity.w?process=/OA/survey/process/surveySend/surveySendProcess&activity=surveySendActivity&type=new&data=" + mainData.getCurrentRowID());
		justep.Portal.openWindow(url, {title: "问卷调查发布"});
	};
	
	//结束调查
	Model.prototype.trgFinishDOMActivate = function(event){
		if (confirm("是否确认结束本次在线调查？")){
			var paperID = mainData.getCurrentRowID();
			var params = new biz.Request.ActionParam();
			params.setParam("paperID", paperID);
			var ctx = this.getContext();
			var options = {
				context : ctx,
				process : ctx.getCurrentProcess(),
				activity : ctx.getCurrentActivity(),
				action : "finishSurveyAction",
				parameters : params
			};		
			var r=biz.Request.sendBizRequest(options);			
			if (!biz.Request.sendBizRequest(options)) {
				throw new Error(biz.Request.getServerError(r, "结束调查失败!"));
			}
			mainData.filters.setFilter("paperFilter", "OA_VS_Paper='" + paperID + "'");
			mainData.refreshData();
			this.callBackFun();
		}
	};
	
	//撤销问卷
	Model.prototype.trgAbortDOMActivate = function(event){
		if (confirm("是否确认撤销本次在线调查？")){
			var paperID = mainData.getCurrentRowID();
			var params = new biz.Request.ActionParam();
			params.setParam("paperID", paperID);
			var ctx = this.getContext();
			var options = {
				context : ctx,
				process : ctx.getCurrentProcess(),
				activity : ctx.getCurrentActivity(),
				action : "abortSurveyAction",
				parameters : params
			};		
			var r=biz.Request.sendBizRequest(options);			
			if (!biz.Request.sendBizRequest(options)) {
				throw new Error(biz.Request.getServerError(r, "撤销问卷失败!"));
			}
			mainData.filters.setFilter("paperFilter", "OA_VS_Paper='" + paperID + "'");
			mainData.refreshData();
			this.callBackFun();
		}
	};
	//回调函数?????????????????????????
	Model.prototype.callBackFun = function(event){
		this.comp("trgFinish").set({"disabled":"true"});
		this.comp("trgAbort").set({"disabled":"true"});
		this.comp("saveBtn").set({"disabled":"true"});
		this.comp("deleteBtn").set({"disabled":"true"});
		this.comp("surveyBtn").set({"disabled":"true"});
				
		this.comp("button6").set({"disabled":"true"});
		this.comp("button4").set({"disabled":"true"});
		this.comp("button5").set({"disabled":"true"});
		this.comp("button9").set({"disabled":"true"});
		this.comp("button7").set({"disabled":"true"});
		this.comp("button8").set({"disabled":"true"});
				
		/*var caller = null;
		var callerName = justep.Request.URLParams.callerName;
		if(callerName && (callerName != '')) {
			var frames = window.parent.frames;
			for(var i=0; i<frames.length; i++) {
				if(frames[i].name == callerName) {
					caller = frames[i];
					break;
				}
			}
		}		
		if(caller) {
			if(caller.dataChangeCallBackFun) {
				//var data = justep.xbl('dPaper');
				var id = mainData.getCurrentRowID();
				caller.dataChangeCallBackFun(id);
			}
		}*/
	};
	
	//调查发布
	Model.prototype.button1Click = function(event){
		var paperID = mainData.getCurrentRowID();
		var pState = mainData.getValue("fPState");
		var dlgOperator = "edit";
		var url=require.toUrl("$UI/OA/survey/process/dialog/surveySendDialog.w");
		this.comp("windowDialog").open({src:url,data:{operator:dlgOperator,paperID:paperID,pState:pState}});
	};
	
	//问卷调查预览
	Model.prototype.trgPreviewDOMActivate = function(event){
		var process = this.getContext().getCurrentProcess();//justep.Context.getCurrentProcess();
		 var activity = this.getContext().getCurrentActivity();//justep.Context.getCurrentActivity();
		 var mainData = this.comp("mainData");
		 var paperid = mainData.getCurrentRowID();
		 //var url = "/OA/survey/process/surveyPaper/surveyPaper.j?process=" + process + "&activity=" + activity + "&paperID=" + paperid;
		 var url = require.toUrl("$UI/OA/survey/process/surveyPaper/surveyPaper.j?process=" + process + "&activity=" + activity + "&paperID=" + paperid);
		 justep.Portal.openWindow(url, {title: "调查问卷预览"});
	};
	
	return Model;
});