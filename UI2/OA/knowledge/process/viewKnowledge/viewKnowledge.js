define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	var uuid = require('$UI/system/lib/base/uuid');
	var DocUtils = require("$UI/system/components/justep/docCommon/docUtil");
	
	
	
	var Model = function(){
		this.callParent();
		this.kwid;
		this.operator;
	};

	Model.prototype.windowReceiverReceive = function(event){
		
	};

	/*
	 * 加载附件
	 */
	Model.prototype.loadAttachment = function(){
		this.comp('attachmentPC').set({
			'access' : '7'
		});
		$('.x-item-upload').hide(); 
		$('.x-item-new-tpl').hide();
		$('.x-item-remove').hide();  
		
		//this.comp('attachmentPC').loadData();
	}
	/**
	 * 调用插入已阅数据action
	 */
	Model.prototype.callInsertReader = function() {
		if ((this.kwid) && (this.operator != 'preview')) {
			var flag = this.insertReadersAction();
		}
	};
	
	/**
	 * 插入一条阅读数据
	 */
	Model.prototype.insertReadersAction = function(){
		
		var params = new biz.Request.ActionParam();
		params.setString("KWID", this.kwid);
		var response = false;
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "insertReadersAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					response = true;
				}
			}
		});
		return response;
	};
	
	Model.prototype.onLoadFunction = function() {
		
		var data = this.comp('dKnowledge');
		var rowid = data.getCurrentRowID();
		var contentType = data.getValue('fContentType');
		
		
		var iframeID = this.getIDByXID("iframe1");
		
		debugger;
		var iframe = document.getElementById(iframeID);
		
		
		if (contentType == 'htmltemplate') {
			var staticPageUrl = data.getValue('fContentURL');
			iframe.src = staticPageUrl+"?"+uuid.createUUID();
		} else if (contentType == 'urllink') {
		    debugger;
			var fLinkURL = data.getValue('fLinkURL');
			fLinkURL = fLinkURL.trim(" ");
			if ((fLinkURL.indexOf("http://") != 0)
					&& (fLinkURL.indexOf("HTTP://") != 0)) {
				fLinkURL = "http://" + fLinkURL;
			}
			
			iframe.src = fLinkURL;
			
			
		} else if (contentType == 'uploaddoc') {
		   debugger;
			var docInfo_s = data.getValue('fDocument');
			if (docInfo_s == "") {
				alert("没有上传文档！");
				return false;
			}
			var docInfo = eval('(' + docInfo_s + ')');
			if (docInfo) {
			   
				var docPath = docInfo[0].docPath;
				var fileID = docInfo[0].fileID;
				var docName = docInfo[0].docName;
				var docID = docInfo[0].docID;
				var host = docPath.substring(1);
				host = host.indexOf("/") == -1 ? host : host.substring(0, host.indexOf("/"));
				host = "/"+host;
				var versionID = versionID ? versionID : "last";
				var partType = partType ? partType : "content";
				//var docServerInfo = DocUtils.getDocServerByDocPath(docPath);
				//var url = docServerInfo.url + "/repository/file/view/" + fileID + "?" + "bsessionid=" + justep.Request.URLParams["bsessionid"];
				
				var sdocPath = DocUtils.InnerUtils.getDocFullPath(docID, docPath);
				var url = DocUtils.InnerUtils.getdocServerAction(sdocPath, "/repository/file/view/"+fileID+"/last/content",false,false,this.getContext());
				
				var conentName = docName.split(".")[0];
				if (conentName.length >= 15) {
					conentName = conentName.substring(0, 12) + "...";
				}
				/*var contentLinkSpan = this.getElementByXid('contentLinkSpan');
				contentLinkSpan.innerHTML="<font size='2'>正文 <a href='"+ url +"'>" + conentName + "</a></font> ";*/
	
				if ('.doc.docx.xls.xlsx.ppt.mpp.vsd.'.indexOf(String(/\.[^\.]+$/
						.exec(docName))
						+ '.') >= 0) {
					var programID = 'OpenOffice';
					var OVP = {};
					OVP.host = docPath;
					OVP.programID = programID;
					OVP.versionID = versionID;
					OVP.partType = partType;
					OVP.fileID = fileID;		
					OVP.fileExt = String(/\.[^\.]+$/.exec(docName));
					OVP.filename = docName.substr(0, docName.lastIndexOf('.'));
					OVP.filename = escape(OVP.filename);
					var param = unescape(JSON.stringify(OVP));
					debugger;
//					var wc = this.comp('windowContainer');
//					wc.setSrc('$UI/OA/knowledge/components/office/officeViewerWindow.w?param='+param);
//					wc.refresh();
				//	this.getElementByXid('documentDiv').style.display = "block";
				//	this.getElementByXid('divIframe').style.display = "none";
					url = require.toUrl("$UI/OA/knowledge/components/office/officeViewerWindow.m.w?process=" + this.getContext().getCurrentProcess()
					               + "&activity=" + this.getContext().getCurrentActivity())+"&paramA="+param;
				    
				   biz.Request.callURL(url, iframeID, param);
				   
//					var url = require.toUrl('$UI/OA/knowledge/components/office/officeViewerWindow.w?process='
//							+ this.getContext().getCurrentProcess()
//							+ "&activity=" + this.getContext().getCurrentActivity()
//							+ "&param="+param);
//					biz.Request.callURL(url,iframeID, param);

//					var url = "$UI/OA/knowledge/components/office/officeViewerWindow.w"
//					 + "?process=" + this.getContext().getCurrentProcess() + "&activity=" + this.getContext().getCurrentActivity();
//					// + "&param="+ param;
//					 url = require.toUrl(url);
//					justep.Portal.openWindow(url,{title:'show doc'});
				} else {
					iframe.src = url;
				}
			}
		} else {}
		this.fillAttachments();
	};
	
	
	/**
	 * 获取附件个数
	 */
	Model.prototype.fillAttachments = function() {
		var attachemntsField = this.comp('dKnowledge').getValue('fAttachment');
		var attachments = eval(attachemntsField);
		this.attachmentCount = (attachments == null ? 0 : attachments.length);
		var aAtachment = this.getElementByXid('aAtachment');
		aAtachment.innerHTML = this.attachmentCount;
	};
	
	/**
	 * 显示已阅人数
	 */
	Model.prototype.showReaded = function() {
		
		var data = this.comp('dKnowledge');
		var readedCounts = this.getElementByXid('readedCounts');
		if(data) {
			var kwid = data.getCurrentRowID();
			if(kwid) {
				var count = data.getValue("fReaderCount");
				if(count) {
					readedCounts.innerHTML = count;
					return;
				}
			}
		}
		readedCounts.innerHTML = '0';
	};
	
	// 显示未阅人员对话框
	Model.prototype.showNotReadedDialog = function() {

		
		var noreaders = this.getNotReaderAction();
		var options =  {"noreaders":noreaders};
		this.comp('dlgnoReader').open({data:options});
		
	//	this.callNotReaderAction();
	//	xforms('noReaderDialog').open();
	};
	
	// 显示未阅人数
	Model.prototype.showNotReaded = function() {
	    
		var data = this.comp('dKnowledge');
		var readingCounts = this.getElementByXid('readingCounts');
		if(data) {
			var kwid = data.getCurrentRowID();
			if(kwid != '') {
				var count = this.getNotReadCountsAction(kwid);
				if(count != '') {
					readingCounts.innerHTML = count;
					return;
				}
			}
		}
		readingCounts.innerHTML = '0';
	}
	
	// 统计未阅人数
	Model.prototype.getNotReadCountsAction = function(KWID) {
		
		var KWID = this.comp('dKnowledge').getCurrentRowID();
		var params = new biz.Request.ActionParam();
		params.setString("KWID", KWID);
		var response = '';
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "getNoReaderCountAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					response = callbackData.response;
				}
			}
		});
		return response;
	};
	
	/**
	 * 调用获取未阅人数数据action
	 */
	Model.prototype.callNotReaderAction = function() {
	   
		var KWID = this.comp('dKnowledge').getCurrentRowID();
		if (KWID) {
			var noreaders = this.getNotReaderAction().xml;
			
			var tempDivValue = "<table border=\"0\" height=3> "
								+"<tr><td width=\"80\" align=\"center\"></td><td align=\"center\"></td></tr></table>"
								+"<table border=\"1\"   style= \"BORDER-COLLAPSE:collapse;width:98% \" align=\"center\"> "
								+"<tr style=\"font-size:12px;font-weight:bold\" bgcolor=\"#F0F8FF\" height=\"25px\"><td width=\"80\" align=\"center\">姓名</td><td align=\"center\">所在部门</td></tr>";
			
			var len=justep.XML.eval(noreaders,"/root/data/xbiz:xml/noReaders","single",'xmlns:xbiz="http://www.justep.com/xbiz#"').childNodes.length;
			noreaders = justep.XML.fromString(noreaders.xml.replace(/xbiz:xml/g,"jscheme"));						
			// var len =
			// noreaders.selectNodes('/root/data/jscheme/noReaders/*').length;
			for(var i=1;i<=len;i++)
			{
				var nameURL = "/root/data/jscheme/noReaders/reader[" + i + "]/sName";
				var fNameURL = "/root/data/jscheme/noReaders/reader[" + i + "]/sFName";
				if(i%2==1) {
					tempDivValue +="<tr style=\"font-size:12px;\" bgcolor=\"#D7D7D7\"><td>"+noreaders.selectSingleNode(nameURL).text+"</td>"+"<td>"+noreaders.selectSingleNode(fNameURL).text+"</td></tr>";
				} else{
					tempDivValue +="<tr style=\"font-size:12px;\"><td>"+noreaders.selectSingleNode(nameURL).text+"</td>"+"<td>"+noreaders.selectSingleNode(fNameURL).text+"</td></tr>";
				}
			}
			tempDivValue +="</table>";
			var noReaderDiv = this.getElementByXid('noReaderDiv');
		   noReaderDiv.innerHTML = tempDivValue;
		}
	};
	
	
	/**
	 * 获取未阅人数
	 */
	Model.prototype.getNotReaderAction = function() {
		
		var KWID = this.comp('dKnowledge').getCurrentRowID();
		var params = new biz.Request.ActionParam();
		params.setString("KWID", KWID);
		var response = '';
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "getNoReadersAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					response = callbackData.response;
				}
			}
		});
		return response;
	};
	
	Model.prototype.aAtachmentClick = function(event){
		var attachmentDiv = this.getElementByXid('attachmentDiv');
		if(attachmentDiv.style.display == "block" || this.attachmentCount == 0){
			attachmentDiv.style.display = "none";
		}else{
			attachmentDiv.style.display = "block";
		}
	};
	
	Model.prototype.readedCountsClick = function(event){
		
		var kwid = this.comp('dKnowledge').getCurrentRowID();
		var options =  {"kwid":kwid};
		this.comp('dlgReaded').open({data:options});
	};

	Model.prototype.btnAddAttentionClick = function(event){
		
		var params = new biz.Request.ActionParam();
		params.setString("kwid", this.kwid);
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : "addKnowledgeGZAction",
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					var result = callbackData.response;
					if(result=="YES"){
						alert("增加关注成功！");
					}else if(result=="NO"){
						alert("当前文档已经设置关注！");
					}
				}else{
					throw new Error("增加关注失败");
				}
			}
		});
	};

	Model.prototype.mdKnowledgeLoad = function(event){
		//this.getElementByXid('documentDiv').style.display = "none";
		this.kwid = this.getContext().getRequestParameter("kwid");
		this.operator = this.getContext().getRequestParameter("operator");
		
		if (!this.kwid)
			return;
		this.callInsertReader();
		var data = this.comp('dKnowledge');
		data.filters.setFilter("KWFilter", "OA_KM_Knowledge='" + this.kwid + "'");
		data.refreshData();
		this.onLoadFunction();
		this.showReaded();
		this.showNotReaded();
		this.loadAttachment();
		
	};

	return Model;
});