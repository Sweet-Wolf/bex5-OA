define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var uuid = require('$UI/system/lib/base/uuid');
	var DocUtils = require("$UI/system/components/justep/docCommon/docUtil");
	var biz = require("$UI/system/lib/biz");
	require("css!$UI/OA/common/css/pub").load();
	var kwid = "";
	var Model = function(){
		this.callParent();
	};

	Model.prototype.listBtnClick = function(event){
		this.comp('windowReceiver').windowEnsure()
	};
	
	Model.prototype.displayAttach = function() {

		var data = this.comp('dKnowledge');
		
		var attach_s = data.getValue('fAttachment');
		if(attach_s == "" || attach_s == undefined)
			return false;
		else 
			return true;
	}
	
	

    Model.prototype.onLoadFunction = function() {
      
		var data = this.comp('dKnowledge');
		
		var contentType = data.getValue('fContentType');
		var iframeID = this.getIDByXID("iframe1");
		

		var iframe = document.getElementById(iframeID);
		if (contentType == 'htmltemplate') {
		  		
			this.getElementByXid('detail').style.display = "block";
			this.getElementByXid('urlcontent').style.display = "none";
			this.getElementByXid('doccontent').style.display = "none";
			
			var htmlContent = "<p style=\"text-align: left;font-size:18px\"><strong>"+data.getValue('fTitle')+"</strong></p>"
			                +"<p>"+data.getValue('fReleasePsnName')+" &nbsp;"+ data.getValue('fReleaseTime')+"</p>";
			this.getElementByXid('htmlDiv').innerHTML = htmlContent + data.getValue('fContent');
					
		} else if (contentType == 'urllink') {
		    debugger;
		    this.getElementByXid('urlcontent').style.display = "block";
			this.getElementByXid('detail').style.display = "none";
			this.getElementByXid('doccontent').style.display = "none";
			var fLinkURL = data.getValue('fLinkURL');
			fLinkURL = fLinkURL.trim(" ");
			if ((fLinkURL.indexOf("http://") != 0)
					&& (fLinkURL.indexOf("HTTP://") != 0)) {
				fLinkURL = "http://" + fLinkURL;
			}
		
			iframe.src = fLinkURL;
			
		} else if (contentType == 'uploaddoc') {
		    
			var docInfo_s = data.getValue('fDocument');
			if (docInfo_s == "") {
				alert("没有上传文档！");
				return false;
			}
		//	var dociframeID = 'docIframe';
			var dociframeID = $(this.getElementByXid("dociframe")).attr('id');
			var dociframe = document.getElementById(dociframeID);
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
				
				var sdocPath = DocUtils.InnerUtils.getDocFullPath(docID, docPath);
				var url = DocUtils.InnerUtils.getdocServerAction(sdocPath, "/repository/file/view/"+fileID+"/last/content",false,false,this.getContext());
				
				var conentName = docName.split(".")[0];
				if (conentName.length >= 15) {
					conentName = conentName.substring(0, 12) + "...";
				}
				
	
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
					
					var param =unescape(JSON.stringify(OVP));
					
					url = require.toUrl("$UI/OA/knowledge/components/office/officeViewerWindow.m.w?process=" + this.getContext().getCurrentProcess()
					               + "&activity=" + this.getContext().getCurrentActivity())+"&paramA="+param;
				    
				   biz.Request.callURL(url, dociframeID, param);
				 	
				 
					this.getElementByXid('urlcontent').style.display = "none";
					this.getElementByXid('detail').style.display = "none";
					this.getElementByXid('doccontent').style.display = "block";

					this.getElementByXid('documentDiv').style.display = "block";
				} else {
					dociframe.src = url;
				}
			}
		} else {}
		
	};
	
	
	Model.prototype.modelLoad = function(event){
		
		//加载之前的动画
		$("[xid=waitDiv]").hide();
		$("[xid=content2]").show();
	};
	
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
	
	
	Model.prototype.windowReceiverReceive = function(event){
	
		this.kwid = event.data.data;
		this.getElementByXid('documentDiv').style.display = "none";
	
		if (!this.kwid)
			return;
	
		var data = this.comp('dKnowledge');
		data.filters.setFilter("KWFilter", "OA_KM_Knowledge='" + this.kwid + "'");
		data.refreshData();
		this.insertReadersAction();
		this.onLoadFunction();
	};
	
	
	return Model;
});