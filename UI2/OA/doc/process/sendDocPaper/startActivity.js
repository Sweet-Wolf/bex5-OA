define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var docUtil = require("$UI/OA/doc/js/docUtils");

	var Model = function() {
		this.callParent();
		this.selectFlag = '';
	};

	Model.prototype.contains = function(str, strArr) {
		for ( var i in strArr) {
			if (str === strArr[i]) {
				return true;
			}
		}
		return false;
	};

	Model.prototype.checkTitle = function() {
		var data = this.comp("dDoc");
		var fTitle = data.getValue("fTitle");
		var fDocType = data.getValue("fDocType");
		var rowid = data.getCurrentRowID();
		return docUtil.checkDocTitle(fTitle, fDocType, rowid, this.getContext());
	};

	Model.prototype.trgSponsorDeptClick = function(event) {
		;
		this.selectFlag = "sponsorDept";
		this.comp("dlgTreeMultiOrg").set({
			'includeOrgKind' : 'ogn,dpt'
		});
		this.comp("dlgTreeMultiOrg").open();
	};

	Model.prototype.dlgTreeMultiOrgReceive = function(event) {
		var data = this.comp("dDoc");
		var rows = event.data;
		
		var orgIds = [];
		var orgNames = [];
		var namesResult = "";
		var idsResult = "";
		var oldOrgIDs = '', oldOrgNames = '';
		var i = 0;
		$.each(rows, function(key, val) {
			orgIds[i] = val.getID();
			orgNames[i] = val.val("sName");
			i++;
		});
		namesResult = orgNames.join(",");
		idsResult = orgIds.join(",");
		if (this.selectFlag !== "") {
			if (this.selectFlag == "sponsorDept") {
				oldOrgIDs = data.getValue('fSponsorDeptID');
				oldOrgNames = data.getValue('fSponsorDept');
				idsResult = docUtil.getOrgIDs(oldOrgIDs, idsResult);
				namesResult = docUtil.getOrgNames(oldOrgNames, namesResult);
				data.setValue("fSponsorDeptID", idsResult);
				data.setValue("fSponsorDept", namesResult);
			} else if (this.selectFlag == "mainDestDept") {
				oldOrgIDs = data.getValue('fMainDestDeptID');
				oldOrgNames = data.getValue('fMainDestDept');
				idsResult = docUtil.getOrgIDs(oldOrgIDs, idsResult);
				namesResult = docUtil.getOrgNames(oldOrgNames, namesResult);
				data.setValue("fMainDestDeptID", idsResult);
				data.setValue("fMainDestDept", namesResult);
			} else if (this.selectFlag == "copyDestDept") {
				oldOrgIDs = data.getValue('fCopyDestDeptID');
				oldOrgNames = data.getValue('fCopyDestDept');
				idsResult = docUtil.getOrgIDs(oldOrgIDs, idsResult);
				namesResult = docUtil.getOrgNames(oldOrgNames, namesResult);
				data.setValue("fCopyDestDeptID", idsResult);
				data.setValue("fCopyDestDept", namesResult);
			} else if (this.selectFlag == "copyReportDept") {
				oldOrgIDs = data.getValue('fCopyReportDeptID');
				oldOrgNames = data.getValue('fCopyReportDept');
				idsResult = docUtil.getOrgIDs(oldOrgIDs, idsResult);
				namesResult = docUtil.getOrgNames(oldOrgNames, namesResult);
				data.setValue("fCopyReportDeptID", idsResult);
				data.setValue("fCopyReportDept", namesResult);
			} else if (this.selectFlag == "internalSendDept") {
				oldOrgIDs = data.getValue('fInternalSendDeptID');
				oldOrgNames = data.getValue('fInternalSendDeptName');
				idsResult = docUtil.getOrgIDs(oldOrgIDs, idsResult);
				namesResult = docUtil.getOrgNames(oldOrgNames, namesResult);
				data.setValue("fInternalSendDeptID", idsResult);
				data.setValue("fInternalSendDeptName", namesResult);
			}
		}
	};

	Model.prototype.trgMainDestDeptClick = function(event) {
		this.selectFlag = "mainDestDept";
		this.comp("dlgTreeMultiOrg").open();
	};

	Model.prototype.trgCopyReportDeptClick = function(event) {
		this.selectFlag = "copyReportDept";
		this.comp("dlgTreeMultiOrg").open();
	};

	Model.prototype.trgCopyDestDeptClick = function(event) {
		this.selectFlag = "copyDestDept";
		this.comp("dlgTreeMultiOrg").open();
	};

	Model.prototype.trgInternalSendDeptClick = function(event) {
		this.selectFlag = "internalSendDept";
		this.comp("dlgTreeMultiOrg").open();
	};

	Model.prototype.btnReaderRangeSetClick = function(event) {
		var data = this.comp("dDoc");
		if (data.isChanged()) {
			justep.Util.hint("请先保存数据！", {
				parent : this.getRootNode(),
				type : 'warning'
			});
			return;
		} else {
			this.comp("dlgTreeMultiPsn").open();
		}
	};

	Model.prototype.btnViewRelevanceClick = function(event) {
		var data = this.comp("dDoc");
		if (data.isChanged()) {
			justep.Util.hint("请先保存数据！", {
				parent : this.getRootNode(),
				type : 'warning'
			});
			return;
		} else {
			var docId = data.getCurrentRowID();
			var relevanceId = data.getValue("fRelevanceID");
			this.comp("dlgViewRelevance").open({
				data : {
					"relevanceId" : relevanceId,
					"docId" : docId
				}
			});
		}
	};

	Model.prototype.dlgViewRelevanceReceive = function(event) {
		var activity = this.getContext().getActivity();
		if (activity != "startActivity") {
			this.comp('dDoc').refreshData();
		}
	};

	Model.prototype.dlgTreeMultiPsnReceive = function(event) {
		var docID = this.comp("dDoc").getCurrentRowID();;
		var rows = event.data;
		
		docUtil.setDocReaderRangeData(this.getContext(), docID, rows);
	};

	Model.prototype.modelLoad = function(event) {
		var data = this.comp("dDoc");
		var rowid = data.getCurrentRowID();
//		var rows = docUtil.getMeetingPsnIDs("meetingActivity", rowid);
		var len = 0;
//		var len = rows.length;
		var text = "<table border='0'>";
		for ( var i = 0; i < len; i++) {
			var fCreatePsnName = rows[i].val("fCreatePsnName");
			var fUpdateTime = rows[i].val("fUpdateTime");
			if (fUpdateTime !== "") {
				fUpdateTime = fUpdateTime.replace("T", " ");
				var temp = fUpdateTime.split(":");
				fUpdateTime = temp[0] + ":" + temp[1];
			}
			text = text + "<tr>" + "<td><font size='2' color='#000000'>" + fCreatePsnName + "</font></td>" + "<td><font size='2' color='#000000'>" + fUpdateTime + "</font></td></tr>";
		}
		text = text + "</table>";
		$(this.getElementByXid("spanMeetingText")).innerHTML = text;

		var activity = this.getContext().getActivity();
		if ("startActivity" != activity && "draftActivity" != activity) {
			this.comp("BizFile").set({"access" : 519});
		}
		var activityPattern = this.getContext().getRequestParameter('activity-pattern');
		if ('detail' == activityPattern) {
			this.comp("BizFile").set({"access" : 7});
		}
	};
    
    Model.prototype.setAttachmentName = function(attachment) {
    	var data = this.comp("dDoc");
    	var row = data.getCurrentRow();
	// var attachment = data.getValue("fAttachment");
	if (attachment && (attachment != "")) {
		var attachmentName = "";
		var attachments = eval(attachment);
		var attachNames = new Array();
		for (var i = 0; i < attachments.length; i++) {
			attachNames[i] = attachments[i].docName;
		}
		attachmentName = attachNames.join(","); // alert(attachmentName);
		row.val("fAttachmentName", attachmentName);
	} else {
		row.val("fAttachmentName", "");
	}
}

	Model.prototype.dDocValueChanged = function(event){
		var fieldName = event.col;
		if (fieldName && (fieldName != "") && (fieldName != "fDocType")) {
			if (fieldName == "fAttachment") {
				this.setAttachmentName(event.value);
			}
		
		}
	};

	Model.prototype.dDocBeforeSave = function(event){
	   var ctx = this.getContext();
	   var data = this.comp("dDoc");
	   var row = data.getCurrentRow();
	   var state = data.getRowState(row);
	   if (state && (state != "")) {
		   if (state == "edit") {
			   docUtil.setUpdateInfo(ctx,data);
		   }
	   }
	
	
		if (row) {
			row.val("fDocType", "OA_DC_SendDocPaper");
			row.val("fDocTypeName", "发文稿纸");
		}
	};
    
    Model.prototype.btnvisible = function(btn){
		var visible = true;
		var ctx = this.getContext();
        var activity = ctx.getCurrentActivity();
		
		if(btn == "btnReaderRangeSet"){ //阅文设置
		    ;
	    	if(activity != "startActivity" && activity != "draftActivity" && activity !="secretaryDealActivity" && activity != "secretaryHandleActivity" && activity != "dispenseActivity") 
	    	   visible = false;
	    }else if(btn == "btnViewRelevance"){  //文件关联
	  
	        if(activity != "startActivity" && activity != "draftActivity" && activity !="secretaryDealActivity" && activity != "secretaryHandleActivity" )
	        	visible = false;
	   
	    }
	    return visible;
	};
	
	return Model;
});