define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var docUtils = require("$UI/OA/doc/js/docUtils");
    var KnowledgeInterface = require("$UI/OA/knowledge/js/knowledgeInterface");
    var Data = require("$UI/system/components/justep/data/data");
	var operate = "";
	

	var Model = function(){
		this.callParent();
	};

	Model.prototype.printBtnClick = function(event){
	   
	   var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
		
		var rowid = this.comp("dDoc").getCurrentRowID();	
		if (rowid && (rowid != "")) {
		///BIZ/OA/doc/process/reportDoc/receiveReportDoc/receiveReportDocProcess.process.m
			var url = "$UI/OA/doc/process/reportDoc/receiveReportDoc/mainActivity.w?process="
				+ process + "&activity=" + activity + "&rowid=" + rowid;
			justep.Portal.openWindow(url,{title:"收文打印"});
		}
	};

	Model.prototype.trgViewRelevanceClick = function(event){

		var data = this.comp("dDoc");
	
		if (data.isChanged()) {
			data.saveData();
		}
		if (!data.isChanged()) {
		   
			var row = data.getCurrentRow();
			var docId = row.getID();
			var relevanceId = row.val("fRelevanceID");
			var param = {
					"relevanceId" : relevanceId,
					"docId" : docId
			};
		
			this.comp("dlgViewRelevance").open({data:param});
		}
	  
	};

	Model.prototype.dlgViewRelevanceClose = function(event){
		var ctx = this.getContext();

    	var activity = ctx.getCurrentActivity();
		if(activity != "startActivity"){
			this.comp('dDoc').refreshData();
		}
	};


	Model.prototype.trgReaderRangeSetClick = function(event){
	  //  this.comp("orgDialog").open({data:{selected:{kind:'sName',value:["郑迪文"]}}});
		this.comp("orgDialog").open();
		
	};

	Model.prototype.trgReadeOpinionClick = function(event){
	    var param = {
	    		"docID" : this.comp('dDoc').getCurrentRowID()
	    };

			
		this.comp('dlgReadeOpinion').open({data:param});
	};

	Model.prototype.trgDocPublishClick = function(event){
		debugger;
		var docData = this.comp("dDoc");
		var docID = docData.getCurrentRowID();
		var row = docData.getCurrentRow();
		var docType = row.val("fDocType");

		var isPublished = KnowledgeInterface.isPublishedByBiz(docID, docType,this.getContext());
		if (isPublished == 'true' && !confirm("此文件已经发布，是否要重新发布？"))
			return;
	
		docUtils.doPublishKWByFolder(this.getContext(),this.comp("dDoc"),this.getRootNode());
	};

	Model.prototype.mdDocLoad = function(event){
	  
		var ctx = this.getContext();
    	var activity = ctx.getCurrentActivity();

		if ("startActivity" != activity && "regActivity" != activity && "secretaryActivity" != activity ) {
		 
		    //此处问题：原来逻辑应该是编辑、下载权限，新版本中没有这种组合
		    this.comp("AttachmentZW").set({
					'access' : '519'
				});
			this.comp("BizFile").set({
					'access' : '519'
				});	
	
		}
		if (operate == "1") {
			this.comp("AttachmentZW").set({
					'access' : '7'
				});
			this.comp("BizFile").set({
					'access' : '7'
				});	
		//	this.comp('attachmentEditorZw').set('access',7);
		//	this.comp('BizFile').set('access',7);
		}
		var activityPattern = this.getContext().getRequestParameter('activity-pattern');
		if('detail' == activityPattern){
			this.comp("AttachmentZW").set({
					'access' : '7'
				});
			this.comp("BizFile").set({
					'access' : '7'
				});	
		}
	};

	Model.prototype.dDocBeforeSave = function(event){
	
	    var ctx = this.getContext();
		var data = this.comp("dDoc");
		 var row = data.getCurrentRow();
		if (data.isChanged()) {
			docUtils.setUpdateInfo(ctx,data);
		}
		if (operate == "1") {
		   
		   
		   
			var state = data.getRowState(row);
			if (state == "new") {
				docUtils.recordReceived(ctx,row.val("fSendDocID"), ctx.getCurrentOgnID());
			}
		}
		
		if (row) {
			row.val("fDocType", "OA_DC_ReceiveDoc");
			row.val("fDocTypeName", "收文");
		}
	};
    
   
	Model.prototype.mdDocModelConstructDone = function(event){

		var data = this.comp("dDoc");
		
		var docId = this.getContext().getRequestParameter("docId");
		operate = this.getContext().getRequestParameter("operate");
		
		var activity = this.getContext().getCurrentActivity();
		if (activity == "startActivity") {
			data.newData();
			
			if (operate == "1") {
				var st = docUtils.getDocById(this.getContext(),this,docId);
				
			//	var st = this.getDocById(this.getContext(),docId);
				
				
				var len = st.length;
				for (var i = 0; i < len; i++) {
					var fTitle = st[i].fTitle.value;
					var fKeyword = st[i].fKeyword.value;
					var fCreateDeptID = st[i].fCreateDeptID.value;
					var fCreateDeptName = st[i].fCreateDeptName.value;
					var fIssueDate = st[i].fIssueDate.value;
					if ('' != fIssueDate && undefined != fIssueDate) {
					    
						fIssueDate = justep.Date.fromString(fIssueDate,
							"yyyy-MM-dd");
						fIssueDate = justep.Date.toString(fIssueDate, "yyyy-MM-dd");
					}
					var fTemplate = st[i].fTemplate.value;
					var fAttachment = st[i].fAttachment.value;
					var fAttachmentName = st[i].fAttachmentName.value;
					var fDocNumber = st[i].fDocNumber.value;
					var fDocKind = st[i].fDocKind.value;
					var fDocKindName = st[i].fDocKindName.value;
					var fDocKindCode = st[i].fDocKindCode.value;
					var fDocExigenceLevel = st[i].fDocExigenceLevel.value;
					var fDocExigenceLevelCode = st[i].fDocExigenceLevelCode.value;
					var fDocExigenceLevelName = st[i].fDocExigenceLevelName.value;
					var fDocSecretLevel = st[i].fDocSecretLevel.value;
					var fDocSecretLevelCode = st[i].fDocSecretLevelCode.value;
					var fDocSecretLevelName = st[i].fDocSecretLevelName.value;
					var fCopies = st[i].fCopies.value;
					
				
                    data.setValue("fTitle",fTitle);
                    data.setValue("fKeyword",fKeyword);
                    data.setValue("fCreateDeptID",fCreateDeptID);
                    data.setValue("fCreateDeptName",fCreateDeptName);
                    data.setValue("fIssueDate",fIssueDate);
                    data.setValue("fTemplate",fTemplate);
                    data.setValue("fAttachment",fAttachment);
                    data.setValue("fAttachmentName",fAttachmentName);
                    data.setValue("fDocNumber",fDocNumber);
                    data.setValue("fDocKind",fDocKind);
                    data.setValue("fDocKindName",fDocKindName);
                    data.setValue("fDocKindCode",fDocKindCode);
                    data.setValue("fDocExigenceLevel",fDocExigenceLevel);
                    data.setValue("fDocExigenceLevelCode",fDocExigenceLevelCode);
                    data.setValue("fDocExigenceLevelName",fDocExigenceLevelName);
                    data.setValue("fDocSecretLevel",fDocSecretLevel);
                    data.setValue("fDocSecretLevelCode",fDocSecretLevelCode);
                    data.setValue("fDocSecretLevelName",fDocSecretLevelName);
                    data.setValue("fCopies",fCopies);
                    data.setValue("fSendDocID",docId);
                    
				/*	data.setRowData(data.getCurrentRowID(), [fTitle, fKeyword,
						fCreateDeptID, fCreateDeptName, fIssueDate, fTemplate,
						fAttachment, fAttachmentName, fDocNumber, fDocKind,
						fDocKindName, fDocKindCode, fDocExigenceLevel,
						fDocExigenceLevelCode, fDocExigenceLevelName,
						fDocSecretLevel, fDocSecretLevelCode,
						fDocSecretLevelName, fCopies, docId], ["fTitle",
						"fKeyword", "fSourceDeptID", "fSourceDept",
						"fSourceDate", "fTemplate", "fAttachment",
						"fAttachmentName", "fSourceDocNumber", "fDocKind",
						"fDocKindName", "fDocKindCode", "fDocExigenceLevel",
						"fDocExigenceLevelCode", "fDocExigenceLevelName",
						
						"fDocSecretLevel", "fDocSecretLevelCode",
						"fDocSecretLevelName", "fCopies", "fSendDocID"]);*/
				}
			}
		}
	};

	Model.prototype.dDocValueChanged = function(event){
		// 更改模板名称
		
		var data = this.comp('dDoc');
		var row = data.getCurrentRow();
		var fieldName = event.col;
		if (fieldName == "fTemplate") {
			var title = row.val('fTitle');
			if ('' != title) {
				if (!event.value && event.value != '[]') {
					setTimeout(function() {
						var tmp = event.value;
						var obj = eval(tmp);
						var docName = obj[0].docName;
						var array = docName.split(".");
						var ext = array[array.length - 1];
						title += "(正文)" + "." + ext;
						if (docName == title) {
							return;
						}
						var template = tmp.replace(docName, title);
						row.val("fTemplate", template);
					}, 500);
				}
			}
		}
		if (fieldName == "fTitle") {
			var template = data.getValue('fTemplate');
			var title = event.value;
			if (template && template != '[]'&& '' != title) {
				setTimeout(function() {
					var obj = eval(template);
					var docName = obj[0].docName;
					var array = docName.split(".");
					var ext = array[array.length - 1];
					title += "(正文)" + "." + ext;
					if (docName == title) {
						return;
					}
					var tmp = template.replace(docName, title);
					row.val("fTemplate", tmp);
				}, 500);
			}
		}
	};



	Model.prototype.orgDialogReceive = function(event){
	
		var docID = this.comp("dDoc").getCurrentRowID();
		var data = event.data;

	    var ctx = this.getContext();
	
		docUtils.setDocReaderRangeData(ctx,docID, data);
	
	};
	
	Model.prototype.btnvisible = function(btn){
		var visible = true;
		var ctx = this.getContext();
        var activity = ctx.getCurrentActivity();
		
		if(btn == "trgDocPublish"){ //文件发布
	    	if(activity != "secretaryActivity")
	    	   visible = false;
	    }else if(btn == "trgViewRelevance"){  //文件关联
	        if(activity != "startActivity" && activity != "regActivity" && activity !="draftActivity" && activity != "secretaryActivity" )
	        	visible = false;
	   
	    }
	    return visible;
	};
  
   //文件发布按钮只读
    Model.prototype.btnreadOnly = function(btn){
        var btnstate = true; 
        var ctx = this.getContext();
        var activity = ctx.getCurrentActivity();
	     if(btn == "SourceDeptBtn"){ //选择来问单位按钮
	        if(activity != "startActivity" && activity != "regActivity"){
	        	btnstate = false;
	        
	         }
	      
	    }else if(btn == "printBtn"){  //打印按钮
	        
	    	if(activity != "secretaryActivity" ){
	    	   btnstate = false;
	    	   
	    	}
	  
	    }else if(btn == "KeyWordBtn"){ //主题词
	        if(activity != "startActivity" && activity != "regActivity" && activity != "secretaryActivity" )
	        	btnstate = false;
	    	//not(contains('startActivity, regActivity,secretaryActivity', call('justep.Context.getCurrentActivity')))
	    }
	    
		return btnstate;
	};
	
	
	Model.prototype.SourceDeptBtnClick = function(event){
		var row = this.comp('dDoc').getCurrentRow();
		var selectedOrgIDs = row.val('fSourceDeptID');
	
	     var param = {
	    		"selectedOrgIDs" : selectedOrgIDs
	     };			
		this.comp('dlgTreeMultiOrg').open({data:param});
	    
	};
	
	
	Model.prototype.KeyWordBtnClick = function(event){
		var wDlgKeyWord = this.comp("wDlgKeyWord");
		var param = {
	    		"keyWord" : this.comp('dDoc').getCurrentRow().val("fKeyword")
	     };
		
		wDlgKeyWord.open({data:param});
	};
	
	
	Model.prototype.dlgTreeMultiOrgReceive = function(event){

		var data = this.comp("dDoc");
        var row = data.getCurrentRow();
		
		
	    var orgIds = event.data.selectIDs;
	    var orgNames = event.data.orgNames;
	    var namesResult = "";
	    var idsResult = "";
	  
	   namesResult = orgNames.join(",");
	   idsResult = orgIds.join(",");
	
	
	   row.val("fSourceDeptID", idsResult);
	   row.val("fSourceDept", namesResult);
	};
	
	
	Model.prototype.wDlgKeyWordReceive = function(event){
	
		var row = this.comp('dDoc').getCurrentRow();
		row.val("fKeyword",event.data);
	};
	
	
	return Model;
});