define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	
	var Model = function(){
		this.callParent();
		this.rowid;
		this.docType;
	};

	Model.prototype.trgPrintDOMActivate = function(event){
		// 打印
		;
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var rowid = this.comp("dDoc").getCurrentRowID();
		if ("OA_DC_SendDoc" == this.docType) {
			if (rowid) {
				var dlgSendDocRpt = this.comp('dlgSendDocRpt');
				dlgSendDocRpt.open({data:{rowid:rowid}});
			}
		}else if("OA_DC_SendDocPaper" == this.docType){
			alert('暂不支持OA_DC_SendDocPaper')
			//justep.HtmlPrint.printForm(["vSendDocPaper"]);
		} else if ("OA_DC_ReceiveDoc" == this.docType) {
			if (rowid) {
				var url = "$UI/OA/doc/process/reportDoc/receiveReportDoc/mainActivity.w?process="
				+ process + "&activity=" + activity + "&rowid=" + rowid;
				justep.Portal.openWindow(url,{title:"收文打印"});
			}
		} else if ("OA_DC_SignReport" == this.docType) {
			alert('暂不支持OA_DC_SignReport')
			//justep.HtmlPrint.printForm(["vSignReport"]);
		}
	};

	Model.prototype.trgViewRelevantDOMActivate = function(event){
		var data = this.comp("dDoc");
		if (data.isChanged()) {
			data.saveData();
		}
		if (!data.isChanged()) {
			var docId = data.getCurrentRowID();
			var relevanceId = data.getValue("fRelevanceID");
			var options =  {
				"relevanceId" : relevanceId,
				"docId" : docId
			};
			this.comp("dlgViewRelevance").open({data:options});
		}
	};

	Model.prototype.trgReadeOpinionDOMActivate = function(event){
		this.comp('dlgReadeOpinion').open({data:{"docID" : this.comp('dDoc').getCurrentRowID()}});
	};
	Model.prototype.getDataAndshowDiv = function(event){
		debugger;
		this.rowid = event.data.rowid;
		this.docType = event.data.docType;
		var documentNO = event.data.documentNO;

		if (this.rowid) {
			var data = this.comp("dDoc");
			data.filters
					.setFilter("docDetailFilter", "OA_DC_Doc = '" + this.rowid + "'");
			data.refreshData();
			var taskData = this.comp("taskData");
			taskData.filters.setFilter("Filter1", "SA_Task.sData1='" + this.rowid + "'");
			taskData.refreshData();
		}
		if (!this.rowid && documentNO) {
			var data = this.comp("dDoc");
			data.filters.setFilter("docDetailFilter", "OA_DC_Doc.fDocNumber = '" + documentNO + "'");
			data.refreshData();
			this.docType = data.getValue("fDocType");
			
			
			var taskData = this.comp("taskData");
			taskData.filters.setFilter("Filter1", "SA_Task.sData1='" + data.getCurrentRowID() + "'");
			taskData.refreshData();
		}
		if (this.docType) {
			if ("OA_DC_SendDoc" == this.docType) {
				this.getElementByXid('vSendDoc').style.display = "block";
			} else if ("OA_DC_SendDocPaper" == this.docType) {
				this.getElementByXid('vSendDocPaper').style.display = "block";
				setMeetingPsnIDs();
			} else if ("OA_DC_ReceiveDoc" == this.docType) {
				this.getElementByXid('vReceiveDoc').style.display = "block";
			} else if ("OA_DC_SignReport" == this.docType) {
				this.getElementByXid('vSignReport').style.display = "block";
			}
		}
	};
	
	Model.prototype.setTabReportVisable = function(){
		var data = this.comp("dDoc");
		var fDocType = data.getValue("fDocType");
		var fCurrentActivities = justep.String.trim(data.getValue("fCurrentActivities"));
		var tabReport = this.getElementByXid('tabReport');
		if ("OA_DC_SendDoc" == fDocType || "OA_DC_ReceiveDoc" == fDocType) {
			if(fCurrentActivities=="拟稿" || fCurrentActivities=="本部门审核" || fCurrentActivities=="拟稿人处理" || fCurrentActivities=="部门会签" || fCurrentActivities=="核稿" || fCurrentActivities=="收文登记" || fCurrentActivities=="拟办"){
				//this.comp('tabDoc').setVisable("tabReport",false);
				tabReport.style.display = "none";
			}else{
				tabReport.style.display = "block";
			}
		} else{
			tabReport.style.display = "none";
		}
	};
	
	Model.prototype.showDDocView = function(){
		;
		var data = this.comp("dDoc");
		var id = data.getCurrentRowID();
		var fRelevanceID = data.getValue("fRelevanceID");
		var dDocView = this.comp("dDocView");
		if(fRelevanceID){
			dDocView.filters.setFilter("relevanceFilter", "fRelevanceID = '" + fRelevanceID + "'");
			dDocView.filters.setFilter("notSelfFilter", "OA_DC_Doc <> '" + id + "'");
			dDocView.refreshData();
		}
	};
	
	Model.prototype.windowReceiverReceive = function(event){
		this.getDataAndshowDiv(event);
		this.setTabReportVisable();
		this.showDDocView();
	};
	
	
	Model.prototype.setMeetingPsnIDs = function(){
		var data = this.comp("dDoc");
		var rowid = data.getCurrentRowID();
		var meetingData = this.getMeetingPsnIDs("meetingActivity", rowid);
		var text = "<table border='0'>";
		meetingData.each(function(param){
			var fCreatePsnID = param.row.val('fCreatePsnID');
			var fCreatePsnName = param.row.val('fCreatePsnName');
			var fUpdateTime = param.row.val('fUpdateTime');
			
			if (fUpdateTime) {
				fUpdateTime = fUpdateTime.replace("T", " ");
				var temp = fUpdateTime.split(":");
				fUpdateTime = temp[0] + ":" + temp[1];
			}
			text = text + "<tr>" + "<td><font size='2' color='#000000'>"
					+ fCreatePsnName + "</font></td>"
					+ "<td><font size='2' color='#000000'>" + fUpdateTime
					+ "</font></td></tr>";
		});
		text = text + "</table>";
		this.getElementByXid('spanMeetingText').innerHTML = text;
	};
	
	/**
	 * 获取会签人员信息
	 */
	Model.prototype.getMeetingPsnIDs = function(activity, rowid) {
		;
		var params = new biz.Request.ActionParam();
		params.setString("activity", activity);
		params.setString("rowid", rowid);
		var meetingData = this.comp('meetingData');
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "getMeetingPsnIDsAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					;
					//这里不起确定翻出的类型！后期修改
					var response = callbackData.response;
					if(response.rows.length > 0){
						meetingData.newData(response);
					}
				}else{
					throw new Error("获取会签人员信息失败!");
				}
			}
		});
		return meetingData;
	};

	Model.prototype.dlgViewRelevanceClose = function(event){
		this.comp('dDoc').refreshData();
	};

	Model.prototype.dlgViewRelevanceReceive = function(event){
		this.comp('dDoc').refreshData();
	};

	Model.prototype.grdRelevanceDblclick = function(event){
		;
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var dDocView = this.comp("dDocView");
		var rowid = dDocView.getCurrentRowID();
		var docType = dDocView.getValue("fDocType");
		if (rowid) {
			var fDocKindName = dDocView.getValue("fDocKindName");
			var dlg;
			var options;
			if(fDocKindName == "电话记录"){
				dlg = this.comp('dlgDocQueryTelephone');
				options = {
					rowid:rowid
				};
			}else{
				dlg = this.comp('dlgDocDetailQuery');
				options = {
					rowid:rowid,
					docType:docType
				};
			}
			dlg.set({
				process:process,
				activity:activity
			});
			dlg.open({data:options})
		}
	};

	Model.prototype.tabContent2Select = function(event){
		debugger;
		var data = this.comp("dDoc");
		var id = data.getCurrentRowID();
		this.comp('rDoc').setStringVar("id",id);
		this.comp('rDoc').setStringVar("docType",this.docType);
		this.comp('rDocDetail').setStringVar("id",id);
		this.comp('rDocDetail').setStringVar("docType",this.docType);
		this.comp("report1").refresh();
	};

	
	return Model;
});