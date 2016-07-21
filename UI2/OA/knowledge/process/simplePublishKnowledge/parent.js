define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	var request = require('$UI/system/lib/base/request');
	var DocUtils = require("$UI/system/components/justep/docCommon/docUtil");
	var common = require('$UI/OA/common/js/common');

	var Model = function() {
     
		this.callParent();
		this.operator;
		this.otherFolderIDs = '';
		this.kwid;
		this.reSave = false;

		this.initOK = justep.Bind.observable(false);
		this.result = justep.Bind.observable();

		this.canOpenRightsSet = justep.Bind.computed(function() {
			
			if (!this.initOK.get())
				return false;
			else
				return true;
			/*
			 * var dKnowledge = this.comp('dKnowledge');
			 * 
			 * if(!dKnowledge) return false; if (dKnowledge.isChanged()) {
			 * return false; } else { return true; }
			 */
		}, this);

	};

	Model.prototype.conceptIsReadonly = function() {
		
		var data = this.comp('dKnowledge');
		this.operator = this.getContext().getRequestParameter("operator");
		if (this.operator == 'new') {
			return false;
		} else if (this.operator == 'edit') {
			var createPsnID = data.getValue("fCreatePsnID");
			var releasePsnID = data.getValue("fReleasePsnID");
			var psnID = this.getContext().getCurrentPersonID();
			if ((psnID == createPsnID) || (psnID == releasePsnID)) {
				return false;
			}
		} else if (this.operator == 'manage') {
			return false;
		} else if (!this.operator) {
			// 判断是否是首环节 publishKWActivity applyActivity
			var activity = this.getContext().getCurrentActivity();
			if (activity == 'newsPublishActivity' || activity == 'noticePublishActivity' || activity == 'docPublishActivity' || activity == 'rulePublishActivity' || activity == "applyActivity")
				return false;
		}
		return true;
	}
	Model.prototype.btnOtherFoldersClick = function(event) {

		this.comp('dlgOtherFolders').open({
			data : {
				"otherFolderIDs" : this.otherFolderIDs
			}
		});
	};
	Model.prototype.dlgOtherFoldersReceive = function(event) {

		var otherFoldersName = "";
		var kwid = this.comp('dKnowledge').getCurrentRow();
		if (!kwid) {
			return;
		}
		var selectedDataReturn = event.data;

		this.otherFolderIDs = "";
		var me = this;
		selectedDataReturn.each(function(param) {
			me.otherFolderIDs = me.otherFolderIDs + "," + param.row.val('fFolderID');
			if (param.row.index() < 6)
				otherFoldersName = otherFoldersName + " " + param.row.val('fName');
			if (param.row.index() == 6)
				otherFoldersName = otherFoldersName + "等栏目";
		});

		this.otherFolderIDs = this.otherFolderIDs.replace(",", "");
		otherFoldersName = otherFoldersName.replace(" ", "");
		this.comp('dKnowledge').setValue('fOtherFolders', otherFoldersName, kwid);

	};

	Model.prototype.modelModelConstructDone = function(event) {
		var data = this.comp('dKnowledge');
		this.kwid = this.getContext().getRequestParameter("KWID");
		var sData1 = this.getContext().getProcessData1();
		if (!sData1) {
			if (!this.kwid) {
				data.newData();

				return;
			} else {
				var filter = "OA_KM_Knowledge='" + this.kwid + "'";
				data.filters.setFilter("KWFilter", "OA_KM_Knowledge='" + this.kwid + "'");
			}
		} else {
			data.filters.setFilter("KWFilter", "OA_KM_Knowledge='" + sData1 + "'");
		}

		data.refreshData();

	};

	Model.prototype.dKnowledgeBeforeNew = function(event) {

		this.getContext().setTask("");
	};

	Model.prototype.modelLoad = function(event) {
		this.otherFolderIDs = this.getKWFolderIDs();
		var currentActivity = this.getContext().getCurrentActivity();
		if (currentActivity != 'newsPublishActivity' && currentActivity != 'noticePublishActivity' && currentActivity != 'docPublishActivity' && currentActivity != 'rulePublishActivity') {
			var fd = this.comp('fDocument')
			/* fd.setAttachmentPermission(1543); */
			fd.set({
				'access' : 1543
			});
		}
	};

	Model.prototype.getKWFolderIDs = function() {

		var response;
		var dKnowledge = this.comp('dKnowledge');
		var kwid = dKnowledge.getCurrentRowID();
		var fTitle = dKnowledge.getValue('fTitle');
		if (fTitle) {
			var params = new biz.Request.ActionParam();
			params.setString("kwID", kwid);

			biz.Request.sendBizRequest({
				"context" : this.getContext(),
				"action" : "getKWFolderIDsAction",
				"parameters" : params,
				"callback" : function(callbackData) {
					callbackData.ignoreError = false;
					if (callbackData.state) {
						response = callbackData.response;
					} else {
						throw new Error("获取知识其他目录失败!");
					}
				}
			});
		}
		return response;
	};

	Model.prototype.btnKeyWordClick = function(event) {

		var fKeyword = this.comp('dKnowledge').getValue("fKeyword");
		this.comp('wDlgKeyWord').open({
			data : {
				"keyWord" : fKeyword ? fKeyword : ''
			}
		});
	};

	Model.prototype.dKnowledgeValueChanged = function(event) {
		
		var dKnowledge = this.comp('dKnowledge');
		var row = dKnowledge.getCurrentRow();
		// var fieldName = event.col;
		if (event.col == "fDocument") {

			var fDocument = event.value;
			if (fDocument) {
				row.val('fContentType', 'uploaddoc');
				row.val('fContentTypeName', '上传文档');
				row.val('fLinkURL', '');
				row.val('fTemplateID', '');
				row.val('fTemplateName', '');
				row.val('fContent', '');
				row.val('fContentURL', '');
				row.val('fPicture1', '');
				row.val('fPicture2', '');
				row.val('fPicture3', '');

			}
		}
		if (event.col == "fLinkURL") {
			var fLinkURL = event.value;
			if (fLinkURL) {
				row.val('fContentType', 'urllink');

				row.val('fContentTypeName', '引用链接');
				row.val('fDocument', '');
				row.val('fTemplateID', '');
				row.val('fTemplateName', '');
				row.val('fContent', '');
				row.val('fContentURL', '');
				row.val('fPicture1', '');
				row.val('fPicture2', '');
				row.val('fPicture3', '');

			}
		}

		if (event.col == "fContent") {
			var fContent = event.value;
			var fTemplateName = dKnowledge.getValue('fTemplateName');
			if (fContent) {
				row.val('fContentType', 'htmltemplate');
				row.val('fContentTypeName', 'HTML模板');
				row.val('fDocument', "");
				row.val('fLinkURL', "");
				if (!fTemplateName) {
					row.val('fTemplateName', '文本模板');
					row.val('fTemplateFileName', 'txtTemplate.html');
				}
			} else if (!fContent) {
				var count = this.getPicCount();
				// 除了判断图片，还要判断是否是uploaddoc urllink
				var fLinkURL = row.val("fLinkURL");
				var fDocument = row.val("fDocument");
				if (count == 0 && !fLinkURL && !fDocument) {
					row.val('fContentType', '');
					row.val('fContentTypeName', '');
					row.val('fTemplateName', '');
					row.val('fTemplateFileName', '');
				}
			}
		}
		if (event.col == "fPicture1" || event.col == "fPicture2" || event.col == "fPicture3") {
			var fContent = row.val('fContent');
			var count = this.getPicCount();
			var fTemplateName = "", fTemplateFileName = "";
			if (event.value) {
				row.val('fContentType', 'htmltemplate');
				row.val('fContentTypeName', 'HTML模板');
				row.val('fDocument', '');
				row.val('fLinkURL', '');
			}
			if (count == 0) {

				var fLinkURL = row.val("fLinkURL");
				var fDocument = row.val("fDocument");
				if ('' == fContent && !fLinkURL && !fDocument) {
					row.val('fContentType', '');
					row.val('fContentTypeName', '');
					row.val('fTemplateName', '');
					row.val('fTemplateFileName', '');
				} else {
//					row.val('fTemplateName', '文本模板');
//					row.val('fTemplateFileName', 'txtTemplate.html');
				}
			} else {
				fTemplateName = "文本+" + count + "图片模板";
				fTemplateFileName = "txtAnd" + count + "PicTemplate.html";
				row.val("fTemplateName", fTemplateName);
				row.val("fTemplateFileName", fTemplateFileName);
			}
		}
	};

	Model.prototype.getPicCount = function() {
		
		var dKnowledge = this.comp('dKnowledge');
		var count = 0;
		var fPicture1 = dKnowledge.getValue("fPicture1");
		var fPicture2 = dKnowledge.getValue("fPicture2");
		var fPicture3 = dKnowledge.getValue("fPicture3");
		if (fPicture1) {
			count += 1;
		}
		if (fPicture2) {
			count += 1;
		}
		if (fPicture3) {
			count += 1;
		}
		return count;
	};

	Model.prototype.dKnowledgeSaveCreateParam = function(event) {
	
		event.param.setString("otherFolderIDs", this.otherFolderIDs);
	};

	Model.prototype.dKnowledgeAfterSave = function(event) {
//		if (this.reSave) {
//			var data = this.comp('dKnowledge');
//			data.saveData();
//		}
		this.initOK.set(true);
	};
	// 保存前改为保存后
	Model.prototype.dKnowledgeBeforeSave = function(event) {
		var data = this.comp('dKnowledge');
		var knowledgeType = data.getValue('fContentType');
		if (knowledgeType && knowledgeType == 'htmltemplate') {
			event.cancel = true;
			var page = this.generateStaticHTML();
			if (page) {
				this.setStaticPage2MainData(page);
				event.cancel = false;
			}
		}
	};

	/**
	 * 生成静态HTML页面 参数: mode 预览/生成
	 */
	Model.prototype.generateStaticHTML = function() {
		
		var data = this.comp('dKnowledge');
		var knowledgeType = data.getValue('fContentType');
		if (!knowledgeType || knowledgeType != 'htmltemplate')
			return;
		var rowid = data.getCurrentRowID();
		var fTitle = data.getValue('fTitle');
		var fKeyword = data.getValue('fKeyword');
		var fDocNumber = data.getValue('fDocNumber');
		var fImportant = data.getValue('fImportant');
		var fWriter = data.getValue('fWriter');
		var fFolderID = data.getValue('fFolderID');
		var fFolderName = data.getValue('fFolderName');
		var fFolderFullID = data.getValue('fFolderFullID');
		var fFolderFullName = data.getValue('fFolderFullName');
		var fRightsText = data.getValue('fRightsText');
		var fIsNeedApprove = data.getValue('fIsNeedApprove');
		var fContentType = data.getValue('fContentType');
		var fContentTypeName = data.getValue('fContentTypeName');
		var fTemplateID = data.getValue('fTemplateID');

		var fTemplateName = data.getValue('fTemplateName');
		var fTemplateFileName = data.getValue('fTemplateFileName');
		var fLinkURL = data.getValue('fLinkURL');
		var fContent = data.getValue('fContent');
		var fContentURL = data.getValue('fContentURL');
		var fIsTop = data.getValue('fIsTop');
		var fCreateOgnID = data.getValue('fCreateOgnID');
		var fCreateOgnName = data.getValue('fCreateOgnName');
		var fCreateDeptID = data.getValue('fCreateDeptID');
		var fCreateDeptName = data.getValue('fCreateDeptName');
		var fCreatePsnID = data.getValue('fCreatePsnID');
		var fCreatePsnName = data.getValue('fCreatePsnName');
		var fCreatePsnFID = data.getValue('fCreatePsnFID');
		var fCreatePsnFName = data.getValue('fCreatePsnFName');
		var fCreateTime = data.getValue('fCreateTime');
		/*
		 * if(fCreateTime){ fCreateTime = fCreateTime.substring(0, 19);
		 * fCreateTime = fCreateTime.replace("T", " "); }
		 */
		var fReleaseOgnID = data.getValue('fReleaseOgnID');
		var fReleaseOgnName = data.getValue('fReleaseOgnName');
		var fReleaseDeptID = data.getValue('fReleaseDeptID');
		var fReleaseDeptName = data.getValue('fReleaseDeptName');
		var fReleasePsnID = data.getValue('fReleasePsnID');
		var fReleasePsnName = data.getValue('fReleasePsnName');
		var fReleasePsnFID = data.getValue('fReleasePsnFID');
		var fReleasePsnFName = data.getValue('fReleasePsnFName');
		var fReleaseTime = data.getValue('fReleaseTime');
		/*
		 * if(fReleaseTime){ fReleaseTime = fReleaseTime.substring(0,
		 * 19).replace("T", " "); }
		 */
		var fApproverID = data.getValue('fApproverID');
		var fApproverName = data.getValue('fApproverName');
		var fApproveTime = data.getValue('fApproveTime');
		var fReleaseStatus = data.getValue('fReleaseStatus');
		var fReleaseStatusName = data.getValue('fReleaseStatusName');
		var fIsDisplayOnPortal = data.getValue('fIsDisplayOnPortal');
		var fBizState = data.getValue('fBizState');
		var fBizStateName = data.getValue('fBizStateName');
		var fPicture1 = data.getValue('fPicture1');
		var fPicture2 = data.getValue('fPicture2');
		var fPicture3 = data.getValue('fPicture3');

		var pics = [];
		if (fPicture1) {
			var picUrl1 = this.getPicUrlByPicRowId(fPicture1);
			if (picUrl1)
				pics.push(picUrl1);
		}
		if (fPicture2) {
			var picUrl2 = this.getPicUrlByPicRowId(fPicture2);
			if (picUrl2)
				pics.push(picUrl2);
		}
		if (fPicture3) {
			var picUrl3 = this.getPicUrlByPicRowId(fPicture3);
			if (picUrl3)
				pics.push(picUrl3);
		}

		var xmlParams = "<knowledge>";
		xmlParams += "<rowid>" + rowid + "</rowid>";
		xmlParams += "<fTitle>" + fTitle + "</fTitle>";
		xmlParams += "<fKeyword>" + fKeyword + "</fKeyword>";
		xmlParams += "<fDocNumber>" + fDocNumber + "</fDocNumber>";
		xmlParams += "<fImportant>" + fImportant + "</fImportant>";
		xmlParams += "<fWriter>" + fWriter + "</fWriter>";
		xmlParams += "<fFolderID>" + fFolderID + "</fFolderID>";
		xmlParams += "<fFolderName>" + fFolderName + "</fFolderName>";
		xmlParams += "<fFolderFullID>" + fFolderFullID + "</fFolderFullID>";
		xmlParams += "<fFolderFullName>" + fFolderFullName + "</fFolderFullName>";
		xmlParams += "<fRightsText>" + fRightsText + "</fRightsText>";
		xmlParams += "<fIsNeedApprove>" + fIsNeedApprove + "</fIsNeedApprove>";
		xmlParams += "<fContentType>" + fContentType + "</fContentType>";
		xmlParams += "<fContentTypeName>" + fContentTypeName + "</fContentTypeName>";
		xmlParams += "<fTemplateID>" + fTemplateID + "</fTemplateID>";
		xmlParams += "<fTemplateName>" + fTemplateName + "</fTemplateName>";
		xmlParams += "<fTemplateFileName>" + fTemplateFileName + "</fTemplateFileName>";
		xmlParams += "<fContent>" + common.xmlEncode(fContent) + "</fContent>";
		xmlParams += "<fContentURL>" + fContentURL + "</fContentURL>";
		xmlParams += "<fIsTop>" + fIsTop + "</fIsTop>";
		xmlParams += "<fCreateOgnID>" + fCreateOgnID + "</fCreateOgnID>";
		xmlParams += "<fCreateOgnName>" + fCreateOgnName + "</fCreateOgnName>";
		xmlParams += "<fCreateDeptID>" + fCreateDeptID + "</fCreateDeptID>";
		xmlParams += "<fCreateDeptName>" + fCreateDeptName + "</fCreateDeptName>";
		xmlParams += "<fCreatePsnID>" + fCreatePsnID + "</fCreatePsnID>";
		xmlParams += "<fCreatePsnName>" + fCreatePsnName + "</fCreatePsnName>";
		xmlParams += "<fCreatePsnFID>" + fCreatePsnFID + "</fCreatePsnFID>";
		xmlParams += "<fCreatePsnFName>" + fCreatePsnFName + "</fCreatePsnFName>";
		xmlParams += "<fCreateTime>" + fCreateTime + "</fCreateTime>";
		xmlParams += "<fReleaseOgnID>" + fReleaseOgnID + "</fReleaseOgnID>";
		xmlParams += "<fReleaseOgnName>" + fReleaseOgnName + "</fReleaseOgnName>";
		xmlParams += "<fReleaseDeptID>" + fReleaseDeptID + "</fReleaseDeptID>";
		xmlParams += "<fReleaseDeptName>" + fReleaseDeptName + "</fReleaseDeptName>";
		xmlParams += "<fReleasePsnID>" + fReleasePsnID + "</fReleasePsnID>";
		xmlParams += "<fReleasePsnName>" + fReleasePsnName + "</fReleasePsnName>";
		xmlParams += "<fReleasePsnFID>" + fReleasePsnFID + "</fReleasePsnFID>";
		xmlParams += "<fReleasePsnFName>" + fReleasePsnFName + "</fReleasePsnFName>";
		xmlParams += "<fReleaseTime>" + fReleaseTime + "</fReleaseTime>";
		xmlParams += "<fApproverID>" + fApproverID + "</fApproverID>";
		xmlParams += "<fApproverName>" + fApproverName + "</fApproverName>";
		xmlParams += "<fApproveTime>" + fApproveTime + "</fApproveTime>";
		xmlParams += "<fReleaseStatus>" + fReleaseStatus + "</fReleaseStatus>";
		xmlParams += "<fReleaseStatusName>" + fReleaseStatusName + "</fReleaseStatusName>";
		xmlParams += "<fIsDisplayOnPortal>" + fIsDisplayOnPortal + "</fIsDisplayOnPortal>";
		xmlParams += "<fBizState>" + fBizState + "</fBizState>";
		xmlParams += "<fBizStateName>" + fBizStateName + "</fBizStateName>";
		xmlParams += "<pics>";
		for ( var i = 0; i < pics.length; i++) {
			var picUrl = pics[i];
			xmlParams += "<pic>";
			xmlParams += picUrl;
			xmlParams += "</pic>";
		}
		xmlParams += "</pics>";
		xmlParams += "</knowledge>";

		var response;
		var me = this;
		var loader = biz.Request.sendHttpRequest({
			url : require.toUrl("$UI/OA/knowledge/process/publishKnowledge/extend/generateStaticPage.j"),
			postData : xmlParams,
			callback : function(xhr, ts) {
				if (biz.Request.isSuccess(xhr)) {
					if (xhr.statusText == 'OK') {
						var objTemp = me.anaXml(xhr.responseText);
						response = objTemp.getElementsByTagName("fileName")[0].firstChild.nodeValue;
					} else {
						alert("生成该知识页面时发生了错误,错误码：" + response);
						response = null;
					}
				} else
					alert('error');
			}
		});
		return response;

	};

	Model.prototype.anaXml = function(xmlString) {
	
		var xmlDoc = null;
		// 判断浏览器的类型
		// 支持IE浏览器
		if (!window.DOMParser && window.ActiveXObject) { // window.DOMParser
			// 判断是否是非ie浏览器
			var xmlDomVersions = [ 'MSXML.2.DOMDocument.6.0', 'MSXML.2.DOMDocument.3.0', 'Microsoft.XMLDOM' ];
			for ( var i = 0; i < xmlDomVersions.length; i++) {
				try {
					xmlDoc = new ActiveXObject(xmlDomVersions[i]);
					xmlDoc.async = false;
					xmlDoc.loadXML(xmlString); // loadXML方法载入xml字符串
					break;
				} catch (e) {
				}
			}
		}
		// 支持Mozilla浏览器
		else if (window.DOMParser && document.implementation && document.implementation.createDocument) {
			try {

				domParser = new DOMParser();
				xmlDoc = domParser.parseFromString(xmlString, 'text/xml');
			} catch (e) {
			}
		} else {
			return null;
		}

		return xmlDoc;
	};

	Model.prototype.getPicUrlByPicRowId = function(picInfo_s) {

		if (!picInfo_s) {
			return null;
		}
		try {
			var picInfo = eval('(' + picInfo_s + ')');
		} catch (e) {
			alert("图片数据有误!");

		}
		if (picInfo.length > 0) {
			var docPath = picInfo[0].docPath;
			var fileID = picInfo[0].fileID;
			if (!fileID) {
				this.reSave = true;
			} else {
				this.reSave = false;
			}
			var docID = picInfo[0].docID;
			// var docServerInfo = DocUtils.getDocServerByDocPath(docPath);
			// var url = docServerInfo.url + "/repository/file/view/" + fileID +
			// "?" + "bsessionid=" + justep.Request.URLParams["bsessionid"];
			// Doc这个 东东拿不到
			var sdocPath = DocUtils.InnerUtils.getDocFullPath(docID, docPath);
			var url = DocUtils.InnerUtils.getdocServerAction({
				docPath : sdocPath,
				urlPattern : "/repository/file/view/" + fileID,
				context : this.getContext()
			});
			url = url.replace('&bsessionid=', '&amp;bsessionid=');
			return url;
		} else {
			return null;
		}
	};

	Model.prototype.setStaticPage2MainData = function(fileName) {

		var data = this.comp('dKnowledge');
		var knowledgeType = data.getValue('fContentType');
		if (knowledgeType == 'htmltemplate') {
			var webContext = "/KW/";
			var url = webContext + fileName;
			data.setValue('fContentURL', url);
		}
	};

	Model.prototype.wDlgKeyWordReceive = function(event) {

		this.comp('dKnowledge').setValue("fKeyword", event.data);
	};

	Model.prototype.openRightsSetDialog = function(event) {

		var dlg = this.comp("dlgRights");
		var data = this.comp("dKnowledge");
		var kwid = data.getCurrentRowID();

		var isInheritRights = data.getValue("fIsInheritRights");
		var options = {
			"kwid" : kwid,
			"isInheritRights" : isInheritRights
		};
		dlg.open({
			data : options
		});
	};

	Model.prototype.btnThumbnailClick = function(event) {

		var kwID = this.comp('dKnowledge').getCurrentRowID();
		options = {
			"kwID" : kwID
		};
		this.comp('dlgSmallpic').open({
			data : options
		})
	};

	Model.prototype.dlgSmallpicReceive = function(event) {

		var dKnowledge = this.comp('dKnowledge');
		dKnowledge.filters.setFilter("dKnowledgeFilter1", "OA_KM_Knowledge = '" + event.data + "'");
		dKnowledge.refreshData();
	};

	Model.prototype.previewStaticPage = function(event) {

		var data = this.comp('dKnowledge');
		var kwid = data.getCurrentRowID();
		if (kwid) {
			if (data.saveData()) {
				var title = data.getValue('fTitle');
				var process = this.getContext().getCurrentProcess();
				var activity = this.getContext().getCurrentActivity();

				var url = "$UI/OA/knowledge/process/viewKnowledge/viewKnowledge.w" + "?process=" + process + "&activity=" + activity + "&kwid=" + kwid + "&operator=preview";
				justep.Portal.openWindow(url, {
					title : title
				});

			}
		}
	};

	Model.prototype.dlgRightsReceive = function(event) {

	};

	Model.prototype.dKnowledgeSaveCommit = function(event) {
		justep.Util.hint("保存成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	};

	Model.prototype.fFolderHideOption = function(event) {
		
		// 此处怎样判断是否选择了栏目？
		var data = this.comp('dKnowledge');
		var dFolder = this.comp("dFolder");
		var foldRow = dFolder.getCurrentRow();

		if (foldRow) {
			var kwid = data.getCurrentRowID();
			var folderID = dFolder.getCurrentRowID();
			var folderName = foldRow.val("fName");
			var folderFullID = foldRow.val("fFullID");
			var folderFullName = foldRow.val("fFullName");
			var isNeedApprove = foldRow.val("fIsNeedApprove");
			data.setValue("fFolderFullID", folderFullID);
			data.setValue("fFolderFullName", folderFullName);
			data.setValue("fIsNeedApprove", isNeedApprove);
		}
	};

	Model.prototype.button2Click = function(event) {

		var data = this.comp('dKnowledge');
		// 保存成功后刷新data
		if (data.isChanged()) {
			data.saveData({
				"onError" : function(event) {
					return;
				}
			});
		}

		var kwid = data.getCurrentRowID();
		var folderID = data.getValue("fFolderID");
		var folderName = data.getValue("fFolderName");
		var folderFullID = data.getValue("fFolderFullID");
		var folderFullName = data.getValue("fFolderFullName");
		var otherFolders = data.getValue("fOtherFolders");
		var isNeedApprove = data.getValue("fIsNeedApprove");

		data.newData();

		if (confirm("是否发布到新建前同样的栏目?")) {
			if (kwid != '' && kwid != undefined) {
				data.setValue("fFolderID", folderID);
				data.setValue("fFolderName", folderName);
				data.setValue("fFolderFullID", folderFullID);
				data.setValue("fFolderFullName", folderFullName);
				data.setValue("fOtherFolders", otherFolders);
				data.setValue("fIsNeedApprove", isNeedApprove);
			}
		} else {
			otherFolderIDs = "";
		}

	};

	Model.prototype.dKnowledgeDataChange = function(event) {
	
		this.initOK.set(false);
	};

	return Model;
});