define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var docUtils = require("$UI/OA/doc/js/docUtils");
	var Data = require("$UI/system/components/justep/data/data");
	var KnowledgeInterface = require("$UI/OA/knowledge/js/knowledgeInterface");
	
	var Model = function() {
		this.callParent();
		this.selectFlag = '';
		this.rangeSetType = '';
	};

	Model.prototype.contains = function(str, strArr) {
		for ( var i in strArr) {
			if (str === strArr[i]) {
				return true;
			}
		}
		return false;
	};

	// 检查文件编号是否已存在
	Model.prototype.checkDocNumber = function() {
		var data = this.comp("dDoc");
		var fDocNumber = data.getValue("fDocNumber");
		fDocNumber = fDocNumber ? fDocNumber.substring(fDocNumber.indexOf("(")) : "";
		var rowid = data.getCurrentRowID();
		return this.checkFileNum(fDocNumber, rowid);
	};

	Model.prototype.checkFileNum = function(fDocNumber, rowid) {
		if ((fDocNumber !== "") && (rowid !== "")) {
			var options = {};
			var param = new biz.Request.ActionParam();
			param.setString("fDocNumber", fDocNumber);
			param.setString("rowid", rowid);
			options.contentType = 'application/json';
			options.process = this.getContext().getProcess();
			options.activity = this.getContext().getActivity();
			options.dataType = "json";
			options.parameters = param;
			options.action = "checkDocNumberAction";
			options.context = this.getContext();
			var r = biz.Request.sendBizRequest(options).responseJSON;
			if (!biz.Request.isBizSuccess(r)) {
				throw new Error(biz.Request.getServerError(r, "检查文件编号失败"));
			}
			var flag = r.data.value;
			if (flag == "1") {
				justep.Util.hint("文件编号已存在！", {
					parent : this.getRootNode(),
					type : 'warning'
				});
			}
			return flag;
		} else {
			return "0";
		}
	};

	Model.prototype.modelModelConstructDone = function(event) {
	    ;
		var activity = this.getContext().getActivity();
		if ("startActivity" == activity || "draftActivity" == activity || "deptApproveActivity" == activity || "drafterActivity" == activity || "meetingActivity" == activity
				|| "checkActivity" == activity) {
			$(this.getElementByXid("tabReport")).css("visibility", "hidden");
			var data = this.comp("dDoc");
			if ("startActivity" !== activity && "draftActivity" !== activity && "deptApproveActivity" !== activity && "drafterActivity" !== activity && "dispenseActivity" !== activity
					&& "secretaryDealActivity" !== activity) {
				this.comp("fTemplate").set({
					'access' : '519'
				});
				this.comp("fAttachment").set({
					'access' : '519'
				});
			}
			if ("registerNumActivity" == activity) {
				var currentTime = justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT);
				data.setValue('fUpdateTime', currentTime);
			}
			var activityPattern = this.getContext().getRequestParameter("activity-pattern");
			if ('detail' == activityPattern) {
				this.comp("fTemplate").set({
					'access' : '7'
				});
				this.comp("fAttachment").set({
					'access' : '7'
				});
			}
		}
	};

	Model.prototype.modelModelConstruct = function(event) {
		var data = this.comp("dDoc");
		var docId = this.getContext().getRequestParameter('docId');
		var operate = this.getContext().getRequestParameter('operate');
		var activity = this.getContext().getActivity();
		if (activity == "startActivity") {
			data.newData();
			// 通过链接打开，未测
			if (operate == "1") {
				var self = this;
				var st = this.getDocById(docId);
				st.each(function(param) {
					var row = param.row;
					data.setValue("fTitle", st.getValue("fTitle", row));
					data.setValue("fKeyword", st.getValue("fKeyword", row));
					data.setValue("fSponsorDeptID", st.getValue("fCreateDeptID", row));
					data.setValue("fSponsorDept", st.getValue("fCreateDeptName", row));
					data.setValue("fTemplate", st.getValue("fTemplate", row));
					data.setValue("fAttachment", st.getValue("fAttachment", row));
					data.setValue("fDocKind", st.getValue("fDocKind", row));
					data.setValue("fDocKindName", st.getValue("fDocKindName", row));
					data.setValue("fDocKindCode", st.getValue("fDocKindCode", row));
					data.setValue("fDocExigenceLevel", st.getValue("fDocExigenceLevel", row));
					data.setValue("fDocExigenceLevelCode", st.getValue("fDocExigenceLevelCode", row));
					data.setValue("fDocExigenceLevelName", st.getValue("fDocExigenceLevelName", row));
					data.setValue("fDocSecretLevel", st.getValue("fDocSecretLevel", row));
					data.setValue("fDocSecretLevelCode", st.getValue("fDocSecretLevelCode", row));
					data.setValue("fDocSecretLevelName", st.getValue("fDocSecretLevelName", row));
					data.setValue("fCopies", st.getValue("fCopies", row));
					data.setValue("fDraftPerID", self.getContext().getCurrentPersonID());
					data.setValue("fDraftPerName", self.getContext().getCurrentPersonName());
					data.setValue("fDraftTime", justep.Date.toString(new Date(), "yyyy-MM-dd"));

				});
			}
		} else {
			data.refreshData();
		}
	};

	// 根据ID获取文件信息
	Model.prototype.getDocById = function(docId) {
		var options = {};
		var param = new biz.Request.ActionParam();
		param.setString("docId", docId);
		options.parameters = param;
		options.action = "getDocByIdAction";
		options.context = this.getContext();
		var r = biz.Request.sendBizRequest(options).responseJSON;
		if (!justep.Request.isBizSuccess(r)) {
			throw new Error(justep.Request.getServerError(r, "获取文件信息失败"));
		}
		var st = new Data(this, {
			xid : 'docData',
			defCols : {
				fTitle : {
					type : 'String',
				},
				fKeyword : {
					type : 'String',
				},
				fCreateDeptID : {
					type : 'String',
				},
				fCreateDeptName : {
					type : 'String',
				},
				fIssueDate : {
					type : 'String',
				},
				fTemplate : {
					type : 'String',
				},
				fAttachment : {
					type : 'String',
				},
				fAttachmentName : {
					type : 'String',
				},
				fDocNumber : {
					type : 'String',
				},
				fDocKind : {
					type : 'String',
				},
				fDocKindName : {
					type : 'String',
				},
				fDocKindCode : {
					type : 'String',
				},
				fDocExigenceLevel : {
					type : 'String',
				},
				fDocExigenceLevelCode : {
					type : 'String',
				},
				fDocExigenceLevelName : {
					type : 'String',
				},
				fDocSecretLevel : {
					type : 'String',
				},
				fDocSecretLevelCode : {
					type : 'String',
				},
				fDocSecretLevelName : {
					type : 'String',
				},
				fCopies : {
					type : 'String',
				},
			},
			idColumn : 'fTitle',
		});
		st.loadData(r, true);
		return st;
	};

	Model.prototype.dDocValueChanged = function(event) {
		var data = this.comp("dDoc");
		var fieldName = event.col;
		if (fieldName && (fieldName !== "") && (fieldName !== "fDocType")) {
			if (fieldName == "fOrgLetter") {
				this.setDocNumber(event.value);// 此处待测
			}

			if (fieldName == "fAttachment") {
				this.setAttachmentName(event.value);
			}
		}
		// 更改模板名称
		var title = data.getValue('fTitle') || "";
		if (fieldName == "fTemplate") {
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
						data.setValue("fTemplate", template);
					}, 500);
				}
		}
		if (fieldName == "fTitle") {
			var template = data.getValue('fTemplate');
			if (template && template != '[]') {
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
					data.setValue("fTemplate", tmp);
				}, 500);
			}
		}
	};

	// 生成公文编号
	Model.prototype.setDocNumber = function(row) {
		var mainData = this.comp("dDoc");
		var data = this.comp("dOrgLetter");
		var orgLetterName = data.getValueByID("fName", row);
		var nowTime = justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT);
		var year = nowTime.substr(0, 4);
		var key = " (" + year + ")";
		var number = this.createNextSeqString(key, "0");
		var docNumber = orgLetterName + number.value + "号";
		mainData.setValue("fDocNumber", docNumber);
	};

	// 设置附件名
	Model.prototype.setAttachmentName = function(attachment) {
		var data = this.comp("dDoc");
		if (attachment && (attachment !== "")) {
			var attachmentName = "";
			var attachments = eval(attachment);
			var attachNames = [];
			for ( var i = 0; i < attachments.length; i++) {
				attachNames[i] = attachments[i].docName;
			}
			attachmentName = attachNames.join(","); // alert(attachmentName);
			data.setValue("fAttachmentName", attachmentName);
		} else {
			data.setValue("fAttachmentName", "");
		}
	};

	// 生成编号
	Model.prototype.createNextSeqString = function(key, format) {
		var options = {};
		var param = new biz.Request.ActionParam();
		param.setString("key", key);
		param.setString("format", format);
		options.parameters = param;
		options.context = this.getContext();
		options.action = "createNextSeqStringAction";
		var r = biz.Request.sendBizRequest(options).responseJSON;
		if (!biz.Request.isBizSuccess(r)) {
			throw new Error(biz.Request.getServerError(r, "编号生成失败"));
		}
		return r.data;
	};

	Model.prototype.selectKeywordClick = function(event) {
		var wDlgKeyWord = this.comp("wDlgKeyWord");
		var keyWord = this.comp('dDoc').getValue("fKeyword");
		keyWord = keyWord ? keyWord : "";
		wDlgKeyWord.open({
			data : {
				"keyWord" : keyWord
			}
		});
	};

	Model.prototype.wDlgKeyWordReceive = function(event) {
		this.comp('dDoc').setValue("fKeyword", event.data);
	};

	Model.prototype.trgSponsorDeptClick = function(event) {
		this.selectFlag = "sponsorDept";
		this.openDlgMAinDestDept();
	};

	Model.prototype.getCurrentSelectOrgIDs = function() {
		var data = this.comp('dDoc');
		var selectedOrgIDs = "";
		if (this.selectFlag !== "") {
			if (this.selectFlag == "sponsorDept") {
				selectedOrgIDs = data.getValue('fSponsorDeptID');
			} else if (this.selectFlag == "mainDestDept") {
				selectedOrgIDs = data.getValue('fMainDestDeptID');
			} else if (this.selectFlag == "copyDestDept") {
				selectedOrgIDs = data.getValue('fCopyDestDeptID');
			}
		}
		return selectedOrgIDs;
	};

	Model.prototype.trgMainDestDeptClick = function(event) {
		this.selectFlag = "mainDestDept";
		this.openDlgMAinDestDept();
	};

	Model.prototype.btnCopyDestDeptClick = function(event) {
		this.selectFlag = "copyDestDept";
		this.openDlgMAinDestDept();
	};

	Model.prototype.openDlgMAinDestDept = function() {
		var selectedOrgIDs = this.getCurrentSelectOrgIDs();
		this.comp("dlgTreeMultiOrg").open({
			data : {
				"selectedOrgIDs" : selectedOrgIDs
			}
		});
	};

	Model.prototype.dlgTreeMultiOrgReceive = function(event) {
	    var data = this.comp("dDoc");
        var row = data.getCurrentRow();
		
		
	    var orgIds = event.data.selectIDs;
	    var orgNames = event.data.orgNames;
	    var namesResult = "";
	    var idsResult = "";
	  
	   namesResult = orgNames.join(",");
	   idsResult = orgIds.join(",");
	   
	
		if (this.selectFlag !== "") {
			if (this.selectFlag == "sponsorDept") {
				row.val("fSponsorDeptID", idsResult);
				row.val("fSponsorDept", namesResult);
			} else if (this.selectFlag == "mainDestDept") {
				row.val("fMainDestDeptID", idsResult);
				row.val("fMainDestDept", namesResult);
			} else if (this.selectFlag == "copyDestDept") {
				row.val("fCopyDestDeptID", idsResult);
				row.val("fCopyDestDept", namesResult);
			} else if (this.selectFlag == "copyReportDept") {
				oldOrgIDs = row.val('fCopyReportDeptID');
				oldOrgNames = row.val('fCopyReportDept');
				idsResult = docUtils.getOrgIDs(oldOrgIDs, idsResult);
				namesResult = docUtils.getOrgNames(oldOrgNames, namesResult);
				row.val("fCopyReportDeptID", idsResult);
				row.val("fCopyReportDept", namesResult);
			} else if (this.selectFlag == "internalSendDept") {
				oldOrgIDs = row.val('fInternalSendDeptID');
				oldOrgNames = row.val('fInternalSendDeptName');
				idsResult = docUtils.getOrgIDs(oldOrgIDs, idsResult);
				namesResult = docUtils.getOrgNames(oldOrgNames, namesResult);
				row.val("fInternalSendDeptID", idsResult);
				row.val("fInternalSendDeptName", namesResult);
			}
		}
	};

	Model.prototype.btnPrintClick = function(event) {
	    var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
		
		var rowid = this.comp("dDoc").getCurrentRowID();	
		if (rowid && (rowid != "")) {
		///BIZ/OA/doc/process/reportDoc/receiveReportDoc/receiveReportDocProcess.process.m
			var url = "$UI/OA/doc/process/reportDoc/sendReportDoc/sendDocRptActivity.w?process="
				+ process + "&activity=" + activity + "&rowid=" + rowid;
			justep.Portal.openWindow(url,{title:"发文打印"});
		}

	};

	Model.prototype.btnViewRelevanceClick = function(event) {
		var data = this.comp("dDoc");
		if (data.isChanged()) {
			justep.Util.hint("请先保存数据", {
				parent : this.getRootNode(),
				type : 'warning'
			});
			return;
		}
		var docID = data.getCurrentRowID();
		var relevanceId = data.getValue("fRelevanceID");
		this.comp("dlgViewRelevance").open({
			data : {
				"relevanceId" : relevanceId,
				"docId" : docID
			}
		});
	};

	Model.prototype.dlgViewRelevanceReceive = function(event) {
		this.refreshData();
	};

	Model.prototype.refreshData = function() {
		var activity = this.getContext().getActivity();
		if (activity != "startActivity") {
			this.comp('dDoc').refreshData();
		}
	};

	Model.prototype.dlgViewRelevanceClose = function(event) {
		this.refreshData();
	};

	Model.prototype.btnReaderRangeSetClick = function(event) {
		this.rangeSetType = 'readerRange';
		var dDoc = this.comp("dDoc");
		if (dDoc.isChanged()) {
			justep.Util.hint("请先保存数据", {
				parent : this.getRootNode(),
				type : 'warning'
			});
			return;
		}
		this.dlgTreeMultiPsnSend();
		this.comp("dlgTreeMultiPsn").open();
	};

	Model.prototype.dlgTreeMultiPsnSend = function() {
		if (this.rangeSetType == "publishRange" || this.rangeSetType == "receiveRange") {// 文件发布
			// 文件发送
		} else if (this.rangeSetType == "readerRange") {
			// this.comp("dlgTreeMultiPsn").set({//TODO
			// 'includeOrgKind' : 'psm'
			// });
		}
	};

	Model.prototype.dlgTreeMultiPsnReceive = function(event) {
		var docID = this.comp("dDoc").getCurrentRowID();
		var rows = event.data;
		var context = this.getContext();
	    if (this.rangeSetType == "readerRange") {
			docUtils.setDocReaderRangeData(context, docID, rows);
		}
	};

	Model.prototype.btnReadeOpinionClick = function(event) {
		this.comp("dlgReadeOpinion").open({
			data : {
				'docID' : this.comp("dDoc").getCurrentRowID()
			}
		});
	};

	Model.prototype.tabReportClick = function(event) {
		var id = this.comp("dDoc").getCurrentRowID();
		this.comp('rDoc').setStringVar("id", id);
		this.comp('rDocDetail').setStringVar("id", id);
		this.comp("report").refresh();
	};

	Model.prototype.dDocBeforeSave = function(event){
		var data = this.comp("dDoc");
		var row = data.getCurrentRow();
		var state = data.getRowState(row);
		var ctx = this.getContext();
		if (state == "edit") {
			docUtils.setUpdateInfo(ctx,data);
		}
		
		
		if (row) {
			row.val("fDocType", "OA_DC_SendDoc");
			row.val("fDocTypeName", "发文");
		}
	};
    
    Model.prototype.btnvisible = function(btn){
		var visible = true;
		var ctx = this.getContext();
        var activity = ctx.getCurrentActivity();
		
		if(btn == "trgDocPublish"){ //文件发布
	    	if(activity != "dispenseActivity")
	    	   visible = false;
	    }else if(btn == "btnViewRelevance"){  //文件关联
	    
	 
	    
	        if(activity != "startActivity" && activity != "draftActivity" && activity !="secretaryDealActivity" && activity != "secretaryHandleActivity" )
	        	visible = false;
	   
	    }else if(btn == "trgDocSend"){//公文发送
	    	if(activity != "dispenseActivity" )
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
	        
	    	if(activity != "secretaryDealActivity" ){
	    	   btnstate = false;
	    	   
	    	}
	  
	    }else if(btn == "selectKeyword"){ //主题词
	        if(activity != "startActivity" && activity != "draftActivity" && activity != "dispenseActivity" )
	        	btnstate = false;
	    	//not(contains('startActivity, draftActivity,dispenseActivity', call('justep.Context.getCurrentActivity')))
	    }else if(btn == "trgSponsorDept"){ //拟办
	        if(activity != "startActivity" && activity != "draftActivity" && activity != "dispenseActivity" )
	        	btnstate = false;
	   
	    }else if(btn == "btnCopyDestDept"){ //抄送 contains('dispenseActivity', call('justep.Context.getCurrentActivity'))
	        if(activity != "dispenseActivity" )
	        	btnstate = false;
	   
	    }
	    
	   
	    
	    
		return btnstate;
	};
	
	
	Model.prototype.trgDocSendClick = function(event){
		// getRange();
		
		var docData = this.comp("dDoc");
		if (docData.isChanged()) {
			alert('请先保存数据！');
			return;
		}
	   // 打开对话框 选到岗位ogn,dpt,pos,psm
		
		this.comp("orgDialogPC").open();
	};
	
	
	Model.prototype.trgDocPublishClick = function(event){
		var docData = this.comp("dDoc");
		var docID = docData.getCurrentRowID();
		var row = docData.getCurrentRow();
		var docType = row.val("fDocType");
			
		if (row.val('fIssueDate') == '' || row.val('fIssueDate') == undefined) {
			var issueTime = justep.Date.toString(new Date(), "yyyy-MM-dd");
			    
			row.val("fIssueDate", issueTime);
		}
		if (docData.isChanged()) {
			docData.saveData();
		}
		var isPublished = KnowledgeInterface.isPublishedByBiz(docID, docType,this.getContext());
		if (isPublished == 'true' && !confirm("此文件已经发布，是否要重新发布？"))
			return;
	
		docUtils.doPublishKWByFolder(this.getContext(),this.comp("dDoc"),this.getRootNode());
		

	};
	
	
	Model.prototype.orgDialogPCReceive = function(event){
	    var docID = this.comp("dDoc").getCurrentRowID();
		var rows = event.data;
		var context = this.getContext();
		docUtils.setDocReceiveRangeData(context, docID, rows);
	};
	
	Model.prototype.getMeetingPsnIDsText =function(activity, rowid) {
		var st = this.comp('dTemp');
		var param = new biz.Request.ActionParam();
		param.setString("activity", activity);
		param.setString("rowid", rowid);
		var signPers = "";
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "getMeetingPsnIDsAction",
			"parameters" : param, 
			"callback" : function(data) {
				data.ignoreError = false;
				if (data.state) {
					st.loadData(null, data.response);
					var len = st.getCount();
					var text = [];
					
					if (len > 0) {
						for ( var i = 0; i < len; i++) {
							var fCreatePsnName = st.getValueByName("fCreatePsnName", i);
							var fUpdateTime = st.getValueByName("fUpdateTime", i);
							if (fUpdateTime != "") {
								fUpdateTime = fUpdateTime.replace("T", " ");
								var temp = fUpdateTime.split(":");
								fUpdateTime = temp[0] + ":" + temp[1];
							}
							text[i] = fCreatePsnName + "(" + fUpdateTime + ")";
						}
						signPers = text.join(",");
					}
				}else{
					throw new Error("获取会签人员信息失败");
				}
			}
		});
		return signPers;
	};

	Model.prototype.officeAutomation = function(event) {
		var instance = this.comp("dDoc");
		var row = instance.getCurrentRow();
		var fDocNumber = row.val("fDocNumber") || "";
		var fIssueDate = row.val("fIssueDate") || "";
		var fSignTime = row.val("fSignTime") || "";
		var fDraftTime = row.val('fDraftTime') || "";
		var fMeetingTime = row.val("fMeetingTime") || "";
		var signTime = "", meetingTime = "", year = "", month = "", day = "", fOrgYear = "", fOrgNum = "";
		var issueDate = "";
		if (fDocNumber) {
			fOrgYear = fDocNumber.split('(')[1].split(')')[0];
			fOrgNum = fDocNumber.split(')')[1].substring(0, 4);
		}
		if (fIssueDate) {
			year = parseInt(fIssueDate.substr(0, 4), 10);
			month = parseInt(fIssueDate.substr(5, 2), 10);
			day = parseInt(fIssueDate.substr(8, 2), 10);
			issueDate = year+"年"+month+"月"+day+"日";
		}
		if (fSignTime) {
			signTime = fSignTime.replace('.000Z', 'Z');
			signTime = signTime.substr(0, 10);
		}
		if (fMeetingTime) {
			meetingTime = fMeetingTime.replace('.000Z', 'Z');
		}
		var fDocExigenceLevelName = row.val('fDocExigenceLevelName') || "";
		var fDocSecretLevelName = row.val('fDocSecretLevelName') || "";
		var fSponsorDept = row.val('fSponsorDept') || "";
		var attachmentName = row.val('fAttachmentName') || "";
		var fSignOpinion = row.val('fSignOpinion') || "";
		//此处暂时屏蔽
		var signPers = this.getMeetingPsnIDsText("meetingActivity", instance
			.getCurrentRowID());
		var fCheckPerName = row.val('fCheckPerName');

		var p = {
				"发文编号" : fDocNumber,
				"快慢等级" : fDocExigenceLevelName,
				"密级" : fDocSecretLevelName,
				"签发人" : row.val("fSignPerName") || "",
				"签发日期" : signTime,
				"签发意见" : fSignOpinion,
				"拟办单位" : fSponsorDept,
				"拟稿人" : row.val('fDraftPerName') || "",
				"核稿人" : fCheckPerName,
				"会签" : signPers,
				"主送" : row.val("fMainDestDept") || "",
				"抄报" : row.val('fCopyReportDept') || "",
				"抄送" : row.val("fCopyDestDept") || "",
				"内发" : row.val('fInternalSendDeptName') || "",
				"打字" : row.val('fTypePerName') || "",
				"校对" : row.val('fProofReader') || "",
				"监印" : row.val('fSuperPrintPsnName') || "",
				"相关文件" : attachmentName,
				"打印份数" : row.val('fCopies') || "",
				"年号" : fOrgYear,
				"文号" : fOrgNum,
				"文种" : row.val('fDocKindName') || "",
				"主题词" : row.val('fKeyword') || "",
				"标题" : row.val('fTitle') || "",
				"拟办日期" : docUtils.baodate2chinese(fDraftTime),
				"发布日期" : issueDate
		};
       
       
		// 由于域填充必须在officeEditor对话框的页面内，获取到officeViewer后才能执行
		// 所以下面的代码将填充函数和填充数据送到officeEditor对话框中，让它在officeEditor页面内部被调用
			event.officeEditorContext.execute(function(params,officeEditor,ovObj) {
				// 在officeEditor对话框的页面内获取officeViewer
				// 遍历填充数据
				$.each(params, function(k, v) {
					// 填充
					ovObj.WriteWordBookmarkInfo(k, v);
				});
			}, p);
		
		
		//	var a = document.getElementById('attachmentEditorZw_docExtObj');
		//	a.excuteJSmethod('ov.WordAutoFillFields', OV.JSON.stringify(p));
	};

	Model.prototype.fTemplateOfficeLoaded = function(event){
		this.officeAutomation(event);
	};
	
	
	return Model;
});