define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	
	var Model = function(){
		this.callParent();
		this.rowid;
		this.docType;
	};

	Model.prototype.btnReaderOpnionDOMActivate = function(event){

		var data = this.comp("dDoc");
		if (data) {
			var dlgReaderOpinion = this.comp("dlgProcessInfo");
			var docId = data.getCurrentRowID();
			if (docId) {
				var options = {
					"docId" : docId
				};
				dlgReaderOpinion.open({data:options});
			}
		}
	};

	Model.prototype.windowReceiverReceive = function(event){
	
		this.rowid = event.data.rowid;
		this.docType = event.data.docType;
		var data = this.comp("dDoc");
		var personId = this.getContext().getCurrentPersonID();
		if (this.rowid) {
			data.filters.setFilter("docDetailFilter", "OA_DC_Doc = '" + this.rowid + "'");
			data.refreshData();
			var fReaderIDs = data.getValue("fReaderIDs");
			fReaderIDs = fReaderIDs || '';
			if(fReaderIDs.indexOf(personId)!=-1){
				//xforms.Core.setClass(xforms('btnReaderOpnion').element,"xforms-disabled", true);
				this.getElementByXid('btnReaderOpnion').style.display = "none";
			}
		}
		if (this.docType) {
			if ("OA_DC_SendDoc" == this.docType) {
				this.getElementByXid('vSendDoc').style.display = "block";
			} else if ("OA_DC_SendDocPaper" == this.docType) {
				this.getElementByXid('vSendDocPaper').style.display = "block";
				this.setMeetingPsnIDs();
			} else if ("OA_DC_ReceiveDoc" == this.docType) {
				this.getElementByXid('vReceiveDoc').style.display = "block";
			} else if ("OA_DC_SignReport" == this.docType) {
				this.getElementByXid('vSignReport').style.display = "block";
			}
		}
		
		var taskData = this.comp("taskData");
			taskData.filters.setFilter("Filter1", "SA_Task.sData1='" + this.rowid + "'");
			taskData.refreshData();
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
	

	Model.prototype.mdDocModelConstructDone = function(event){
		
		this.rowid = this.getContext().getRequestParameter("rowid");
		this.docType = this.getContext().getRequestParameter("docType");
		var data = this.comp("dDoc");
		var personId = this.getContext().getCurrentPersonID();
		if (this.rowid) {
			data.filters.setFilter("docDetailFilter", "OA_DC_Doc = '" + this.rowid + "'");
			data.refreshData();
			var fReaderIDs = data.getValue("fReaderIDs");
			fReaderIDs = fReaderIDs || '';
			if(fReaderIDs.indexOf(personId)!=-1){
				//xforms.Core.setClass(xforms('btnReaderOpnion').element,"xforms-disabled", true);
				this.getElementByXid('btnReaderOpnion').style.display = "none";
			}
		}
		if (this.docType) {
			if ("OA_DC_SendDoc" == this.docType) {
				this.getElementByXid('vSendDoc').style.display = "block";
			} else if ("OA_DC_SendDocPaper" == this.docType) {
				this.getElementByXid('vSendDocPaper').style.display = "block";
				this.setMeetingPsnIDs();
			} else if ("OA_DC_ReceiveDoc" == this.docType) {
				this.getElementByXid('vReceiveDoc').style.display = "block";
			} else if ("OA_DC_SignReport" == this.docType) {
				this.getElementByXid('vSignReport').style.display = "block";
			}
		}
		
		var taskData = this.comp("taskData");
			taskData.filters.setFilter("Filter1", "SA_Task.sData1='" + this.rowid + "'");
			taskData.refreshData();
	
	};
	

	Model.prototype.mdDocLoad = function(event){
		this.loadAttachment();
	};
	Model.prototype.loadAttachment = function(){
		this.comp('BizFile').set({
			'access' : '7'
		});
		this.comp('attachmentPC2').set({
			'access' : '7'
		});
		this.comp('attachmentPC1').set({
			'access' : '7'
		});
		this.comp('attachmentPC3').set({
			'access' : '7'
		});
		
		
		$('.x-item-upload').hide(); 
		$('.x-item-new-tpl').hide();
		$('.x-item-remove').hide();  
		
		//this.comp('attachmentPC').loadData();
	};
	

	return Model;
});