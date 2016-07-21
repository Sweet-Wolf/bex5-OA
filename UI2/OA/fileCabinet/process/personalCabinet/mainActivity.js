define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var docUtil = require("$UI/system/components/justep/docCommon/docUtil");
	
	var Model = function(){
		this.callParent();
	};
	
	//页面加载
	var docTree=null,docNodeList=null;
	var docAuthList = null;
	Model.prototype.modelLoad = function(event){
		docTree = this.comp("docNodeTree");
		docNodeList = this.comp("docNodeList");
		docTree.refreshData();			   
		/*docTree.expandRow(docTree.getRowID());
		//this.comp("treeGrid").expandRow(docTree.getRowID()); //扩展行
		//this.docNodeTreeIndexChanged();
		var docID = this.getContext().getRequestParameter("docID");
		var docPath = this.getContext().getRequestParameter("docPath");
		alert(docID+" ; "+docPath+" ; "+(docID && docPath));
		if(docID && docPath){
			this.setDocIndex(docID, docPath);
		}
*/
	};
	//新建文件夹
	Model.prototype.newDirBtnClick = function(event){
		if(event){
			var item = event.getData().menuitem;
			if(item.program == "uploadDir"){
				// 上传文件夹能力 原来采用ocx实现，考虑到跨平台情况暂时去掉了这个能力
				if (!justep.doc.InnerUtils.checkOcx())
					return;
				this.createTransportElement("transportDiv", "transport");
				var docNodeTree = this.comp("docNodeTree");
				var rowId = docNodeTree.getCurrentRowID();
				var docPath = justep.doc.InnerUtils.getDocFullPath(rowId, docNodeTree.getValue("sDocPath", rowId));
				var docServerInfo = justep.doc.InnerUtils.getDocServerByDocPath(docPath);
				rootDisplayPath = justep.doc.InnerUtils.getDocFullDisplayPath(docNodeTree.getValue("sDocName", rowId), docNodeTree.getValue("sDocDisplayPath", rowId));
				transport.InitUpLoaderParam(docServerInfo.host, docServerInfo.port, "/repository/file/upload", "testuser", "testuser", justep.Request.URLParams["bsessionid"]);
				var localFullPath = transport.GetFileSys().OpenSelectDirDialog();
				if(localFullPath){
					if(localFullPath.lastIndexOf('\\') == localFullPath.length-1){
						var rootName = localFullPath.substring(0,localFullPath.lastIndexOf('\\')-1);
					}else{
						var rootName = localFullPath.substring(localFullPath.lastIndexOf('\\')+1);
					}
					this.comp("uploadDirProgress").open();
					localDirRootNameToUpload = localFullPath.replace(new RegExp("\\\\\\\\","g"),"/");
					transport.GetUploader().SetSimUploadLimit(5, 0);
					// changeLog = {items:[],"operate":"","url":""};
					transport.GetUploader().UploadDir(localFullPath);
				}
			}else if(item.program == "createDir"){
				var docNodeTree = this.comp("docNodeTree");
				createDir("新建文件夹");
				docNodeTree.saveData();
				docNodeTreeIndexChanged();
			}
		}else{
			alert("error: docCenter.window newDir event is null.");
		}
	};
	
	Model.prototype.createDir = function(docName){
		var docNodeTree = this.comp("docNodeTree");
		var currentRowId = docNodeTree.getCurrentRowID();
		var newDirDocPath = justep.doc.InnerUtils.getDocFullPath(currentRowId, docNodeTree.getValue("sDocPath"));
		var newDirDocDisplayPath = justep.doc.InnerUtils.getDocFullDisplayPath(docNodeTree.getValue("sDocName"), docNodeTree.getValue("sDocDisplayPath"));
		docNodeTree.newData(0,currentRowId);
		var newDirID = docNodeTree.getCurrentRowID();
		docNodeTree.setValue("sDocName",docName, newDirID);
		docNodeTree.setValue("sKind","dir", newDirID);
		docNodeTree.setValue("sDocPath",newDirDocPath, newDirID);
		docNodeTree.setValue("sDocDisplayPath",newDirDocDisplayPath, newDirID);
		docNodeTree.setValue("sCreatorFID",this.getContext().getCurrentPersonMemberFID(), newDirID);
		docNodeTree.setValue("sCreatorName",this.getContext().getCurrentPersonName(), newDirID);
		docNodeTree.setValue("sCreatorDeptName",this.getContext().getCurrentDeptName()?this.getContext().getCurrentDeptName():"", newDirID);
		docNodeTree.setValue("sCreateTime",justep.System.datetimeString(), newDirID);
		docNodeTree.setValue("sLastWriterFID",this.getContext().getCurrentPersonMemberFID(), newDirID);
		docNodeTree.setValue("sLastWriterName",this.getContext().getCurrentPersonName(), newDirID);
		docNodeTree.setValue("sLastWriterDeptName",this.getContext().getCurrentDeptName()?this.getContext().getCurrentDeptName():"", newDirID);
		docNodeTree.setValue("sLastWriteTime",justep.System.datetimeString(), newDirID);
		docNodeTree.setValue("sFlag","1", newDirID);
		docNodeTree.getStore().setValueById(newDirID, "version", "0");
		docNodeTree.setRowState(newDirID, "new", newDirID);
		return newDirID;
	};
	
	Model.prototype.createTransportElement = function(containerID, objectID){
		if (!document.getElementById(objectID)) {
			var transport = document.getElementById(containerID);
			transport.outerHTML = '<object id="'
					+ objectID
					+ '" classid="clsid:9E4A15C5-61F4-4EC7-9B5F-7DE2620629BB" style="width:100%"'
					+ 'codebase='
					+ justep.Request.convertURL("/UI/system/service/doc/transport/x5_file_mng.cab#version="+justep.doc._ocx_version,true) + ' style="display:none;" >'
					+ '</object>';
		}
	};
		
	//属性
	Model.prototype.attributeBtnClick = function(event){
		var afterEnsureFun = function(event){
			//var docNodeList = justep.xbl("docNodeTree");
			if(docNodeList.isChanged()) {
				docNodeList.setRowState(docNodeList.getCurrentRowID(), "edit");
				docNodeList.saveData();
			}
		}					  
		justep.doc.Dialog.openDocDirInfoDialog(docTree, afterEnsureFun);
	};
	
	//下载按钮
	Model.prototype.dowBtnClick = function(event){
		this.downloadDoc();
	};
	
	//自定义函数//////////////////////////////////////////////////
	//下载
	Model.prototype.downloadDoc = function(event){
		if(justep.xbl('permissions').getValue("downloadDoc") == 'true'){
			var docNodeList = justep.xbl("docNodeList");
			var docPath = docNodeList.getValue("sDocPath");
			var fileID = docNodeList.getValue("sFileID");
			addAccessRecord("download");
			justep.doc.InnerUtils.downloadDocByFileID(docPath, fileID);
		}
	};	
	//文档节点树指数变化
	Model.prototype.docNodeTreeIndexChanged = function(event){
		if(!docAuthList){
			this.getDocAuthList();
		}
		var docNodeTree = justep.xbl("docNodeTree");
		var rowId = docNodeTree.getCurrentRowId();
		var isVirtualRoot = docNodeTree.getStore()._isVirtualRoot(rowId);
		if(!isVirtualRoot){
			var docPath = docNodeTree.getValue("sDocPath", rowId);
			var docFullPath = justep.doc.InnerUtils.getDocFullPath(rowId, docPath);
			var access = getTreeIndexChangedAccess(docFullPath);
			if(docNodeTree.getCount()==0)  
				access = 1;
		}else{
			var docPath = "/";
			var docFullPath = "/";
			var access = getTreeIndexChangedAccess(docFullPath);
			if(docNodeTree.getCount()==0)  
				access = 1;
			if(access >= 16384)	
			var access = 16384;
		}
		currentRootAccess = access ;  
		var permissions = justep.xbl("permissions");
		permissions.setValue("newDir", ((access % 512) >= 256).toString(), "permissionsRow");
		permissions.setValue("deleteDir", ((access % 2048) >= 1024).toString(), "permissionsRow");
		permissions.setValue("editDir", ((access % 1024) >= 512).toString(), "permissionsRow");
		permissions.setValue("manageDir", ((access % 32768) >= 16384).toString(), "permissionsRow");
		permissions.setValue("downloadDir", ((access % 8) >= 4).toString(), "permissionsRow");
		permissions.setValue("newDoc", ((access % 512) >= 256).toString(), "permissionsRow");
		if(justep.xbl('docNodeList').getCount()>0){
			if(justep.Browser.hasTouch){
				permissions.setValue("editDoc", 'false', "permissionsRow");
			}else{
				permissions.setValue("editDoc", ((access % 1024) >= 512).toString(), "permissionsRow");
			}
			permissions.setValue("deleteDoc", ((access % 2048) >= 1024).toString(), "permissionsRow");
			permissions.setValue("manageDoc", ((access % 32768) >= 16384).toString(), "permissionsRow");
			permissions.setValue("downloadDoc", ((access % 8) >= 4).toString(), "permissionsRow");
			permissions.setValue("browseDoc", ((access % 4) >= 2).toString(), "permissionsRow");
			docNodeListIndexChanged();
		}else if(justep.xbl('docNodeList').getCount() == 0){
			permissions.setValue("editDoc", 'false', "permissionsRow");
			permissions.setValue("deleteDoc",'false' , "permissionsRow");
			permissions.setValue("manageDoc", 'false', "permissionsRow");
			permissions.setValue("downloadDoc", 'false', "permissionsRow");
			permissions.setValue("browseDoc", 'false', "permissionsRow");
		}
	};
	//设置文档索引
	Model.prototype.setDocIndex = function(event){
		docTree.expandTreeByIdPath(docPath.substring(1));
		docNodeList.setIndex(docNodeList.getIndex(docID));
	};
	//身份验证列表
	Model.prototype.getDocAuthList = function(event){
		docAuthList = justep.doc.InnerUtils.getDocAuthList();//获取有权限的文件
		if(!docAuthListArr) 
		    docAuthListArr = {}
		for(var deptFID in docAuthList) {
			var authItems = docAuthList[deptFID];
			var deptAuth = new Array();
			var i=0;
			for(var authId in authItems) {
				var authItem = authItems[authId];
				deptAuth[i] = {"authId":authId,"sDocPath":authItem.sDocPath,"sAuthorizeeFID" : authItem.sAuthorizeeFID,"sAccess":authItem.sAccess};
				i++;
			}
			docAuthListArr[deptFID] = deptAuth;
		}
		
		if (docCenter.checkEvent(ONGETDOCAUTHLIST)){
	 		docCenter.callEvent(ONGETDOCAUTHLIST, [docAuthListArr]);
		}
	};
	

	return Model;
});