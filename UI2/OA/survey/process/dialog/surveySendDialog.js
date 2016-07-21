define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function(){
		this.callParent();
	};
	var paperID="",pState="",mainData="";
	Model.prototype.windowReceiverReceive = function(event){
		mainData = this.comp("mainData");
		var operator = event.data.operator;
		paperID = event.data.paperID;
		pState = event.data.pState;
		if (operator == "edit") {
			mainData.filters.setFilter("paperFilter", "OA_VS_Survey.fPaperID='"	+ paperID + "'");
			mainData.refreshData();
		}
	};
	
	//发布
	Model.prototype.trgSendDOMActivate = function(event){
		var mainData = this.comp('mainData');
		if (mainData.getCount() == 0) {
			alert("请选择要发布的问卷信息！");
			return;
		}
		var surveyID = mainData.getCurrentRowID();
		var fSState = mainData.getValue("fSState");
		if ((pState == "编制中") || (pState == "已发布")) {
			if (fSState == "编制中") {
				this.singleSendSurvey(paperID, surveyID);
			} else {
				if (confirm("当前任务" + fSState + "，是否继续？")) {
					this.singleSendSurvey(paperID, surveyID);
				}
			}
		} else if (pState == "已终止") {
			alert("本次在线调查已终止,不能再进行问卷发布！");
		} else {
			alert("本次在线调查已完成,不能再进行问卷发布！");
		}
	};
	
	//全部发布
	Model.prototype.trgAllSendDOMActivate = function(event){
		if ((pState == "编制中") || (pState == "已发布")) {
			this.allSendSurvey(paperID);
		} else if (pState == "已终止") {
			alert("本次在线调查已终止,不能再进行问卷发布！");
		} else {
			alert("本次在线调查已完成,不能再进行问卷发布！");
		}
	};
		
	//作废
	Model.prototype.trgDestroyDOMActivate = function(event){
		if (confirm("是否确认作废本张调查问卷？")) {
			var mainData = this.comp('mainData');
			var taskID = mainData.getValue("fTaskID");
			var surveyID = mainData.getCurrentRowID();
			var params = new biz.Request.ActionParam();
			params.setParam("taskID", taskID);
			params.setParam("surveyID", surveyID);
			var ctx = this.getContext();
			var options = {
				context : ctx,
				process : ctx.getCurrentProcess(),
				activity : ctx.getCurrentActivity(),
				action : "destroySurveyAction",
				parameters : params
			};		
			var r=biz.Request.sendBizRequest(options);			
			if (!biz.Request.sendBizRequest(options)) {
				throw new Error(biz.Request.getServerError(r, "问卷作废失败!"));
			}
			mainData.refreshData();
			//appCommon.DataUtils.refreshDataByRowIds(mainData, surveyID, null);
		}
	};	
		
	Model.prototype.singleSendSurvey = function(paperID, surveyID){
		var params = new biz.Request.ActionParam();
		params.setParam("paperID", paperID);
		params.setParam("surveyID", surveyID);
		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "singleSendSurveyAction",
			parameters : params
		};		
		var r=biz.Request.sendBizRequest(options);		
		if (!biz.Request.sendBizRequest(options)) {
			throw new Error(biz.Request.getServerError(r, "问卷发送失败!"));
		}
		mainData.refreshData();
		//appCommon.DataUtils.refreshDataByRowIds(this.comp('mainData'), surveyID, null);
	};
	
	Model.prototype.allSendSurvey = function(paperID){
		var params = new biz.Request.ActionParam();
		params.setParam("paperID", paperID);
		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "sendSurveyAction",
			parameters : params
		};		
		var r=biz.Request.sendBizRequest(options);		
		if (!biz.Request.sendBizRequest(options)) {
			throw new Error(biz.Request.getServerError(r, "问卷发送失败!"));
		}
		this.comp('mainData').refreshData();
	};
	
	//新增
	Model.prototype.insertDOMActivate = function(event){
		this.comp("orgDialogPC").open();
	};
	//新增返回值
	Model.prototype.orgDialogPCReceive = function(event){
		mainData=this.comp("mainData");
		var rows = event.data;
		var n=rows.length;		
		for ( var i in rows) {
			var options = {
				defaultValues : [ {
					fPaperID: paperID,
					fPersonID: rows[i].val('sPersonID'),
					fPerName: rows[i].val('sName'),
					fPerFID: rows[i].val('sFID'),
					fPerFName: rows[i].val('sFName'),
					fDeptFName: rows[i].val('sFName').replace("/" + rows[i].val('sName'), "")
				} ]
			};
			mainData.newData(options);			
		}
		mainData.saveData();	
		mainData.refreshData();
	};

	return Model;
});