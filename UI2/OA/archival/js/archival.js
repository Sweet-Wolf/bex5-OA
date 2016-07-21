define(function(require) {
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");	
	
	var archivalDialog;
	return {
		// 更新档案		
		generateArchivalInfo:function(activity, process, infoIDs, infoType) {
			var param = new justep.Request.ActionParam();
			param.setString("infoIDs", infoIDs);
			param.setString("infoType", infoType);
		
			var r = justep.Request.sendBizRequest(process, activity,
					"generateArchivalInfoAction", param);
			if (!justep.Request.isBizSuccess(r)) {
				throw new Error(justep.Request.getServerError(r, "档案信息更新失败!"));
			}
		
			return justep.Request.transform(justep.Request.getData(r.responseXML));
		},
		// 案卷改变
		rollChange : function(activity, process, rollID, infoType) {
			var param = new justep.Request.ActionParam();
			param.setString("rollID", rollID);
			param.setString("infoType", infoType);
			
			var r = justep.Request.sendBizRequest(process, activity,
					"rollChangeAction", param);
			if (!justep.Request.isBizSuccess(r)) {
				throw new Error(justep.Request.getServerError(r, "案卷信息修改失败!"));
			}
			
			return justep.Request.transform(justep.Request.getData(r.responseXML));
		},
		
		grdFolderRowExpand : function(event) {
			if (event.delay) {
				var treedata = justep.xbl('dTreeData');
				var URLID = event.rowId;
				var parentID = treedata.getValue("fID", URLID);
				var typeID = treedata.getValue("fType", URLID);
				var subNodes = getNodeInfo(parentID, typeID, URLID);
				var grdSCTree = xforms('grdSCTree').grid;
				if ((subNodes != '') && (subNodes !=null)) {
					var arrNodes = subNodes.split("|");
					var len = arrNodes.length;
					if (len <= 0) {
						return;
					}
					if (typeID == "root") {
						for (var i = 0; i < len; i++) {
							var node = arrNodes[i];
							var infoID = node.split(":")[0];
							var nodeName = node.split(":")[1];
							var nodetype = node.split(":")[2];
							var nodeURL = node.split(":")[3];
							var atrName = node.split(":")[4];
							var fCategoryURLName = node.split(":")[5];
							grdSCTree.addRowPro(nodeURL, [nodeName, nodetype, infoID,
									infoID, atrName,fCategoryURLName, "", ""], i, URLID);
						}
					} else {
						var fondsID = treedata.getValue("fFondsID", URLID);
						var fondsName = treedata.getValue("fFondsName", URLID);
						for (var i = 0; i < len; i++) {
							var node = arrNodes[i];
							var infoID = node.split(":")[0];
							var nodeName = node.split(":")[1];
							var nodetype = node.split(":")[2];
							var nodeURL = node.split(":")[3];
							var atrName = node.split(":")[4];
							var fCategoryURLName = node.split(":")[5];
							grdSCTree.addRowPro(nodeURL, [nodeName, nodetype, infoID,
									fondsID, fondsName, infoID, atrName,fCategoryURLName], i, URLID);
						}
					}
					event.source.setNodeLoadSuccess(event.rowId);
				} else {
					event.source.setNodeLoadSuccess(event.rowId);
				}
			}
		},
		
		getNodeInfo : function(parentID, typeID, URL) {
			var param = new justep.Request.ActionParam();
			param.setString("parentID", parentID);
			param.setString("type", type);
			param.setString("URL", URL);
		
			var process = justep.Context.getCurrentProcess();
			var activity = justep.Context.getCurrentActivity();
		
			var r = justep.Request.sendBizRequest(process, activity,
					"getNodeInfoAction", param);
			if (!justep.Request.isBizSuccess(r)) {
				throw new Error(justep.Request.getServerError(r, "获取节点信息失败!"));
			}
		
			return justep.Request.transform(justep.Request.getData(r.responseXML));
		},
		
		grdFolderShowNodeImg : function(event) {
			var nodeID = event.rowId;
			type = justep.xbl('dTreeData').getValue("fType", nodeID);
			if (type == 'root') {
				return '/UI2/OA/common/images/category_tree.png';
			} else if (type == 'fonds') {
				return '/UI2/OA/common/images/fonds.png';
			} else if (type == 'category') {
				return '/UI2/OA/common/images/category.png';
			}
		},
		
		//grdArchivalShowNodeImg : function(event) {
		grdArchivalShowNodeImg : function(isRoll,sign,state) {			
			var baseURL = document.URL.split("/UI2")[0];//justep.Request.BASE_URL;
			//var isRoll = event.cell.getValueByColId("fIsRoll");
			//var sign = event.cell.getValueByColId("fSign");
			//var state = event.cell.getValueByColId("fState");
			
			var imgURL = "<img src='" + baseURL;
			if (isRoll == "0") {
				if(state == '01'){
					imgURL += "/UI2/OA/common/images/new_file.png'/>";
				}else if (state == '02'){
					imgURL += "/UI2/OA/common/images/submit_file.png'/>";
				}else if(state == '03'){
					imgURL += "/UI2/OA/common/images/filed_file.png'/>";
				}else{
					imgURL += "/UI2/OA/common/images/what.png'/>";
				}
			}else if (isRoll == "1"){
				if(state == '11'){
					if (sign == "0") {
						imgURL += "/UI2/OA/common/images/newO_roll.png'/>";
					}else{
						imgURL += "/UI2/OA/common/images/newC_roll.png'/>";
					}
				}else if (state == '12'){
					if (sign == "0") {
						imgURL += "/UI2/OA/common/images/submitO_roll.png'/>";
					}else{
						imgURL += "/UI2/OA/common/images/submitC_roll.png'/>";
					}
				}else if (state == '13'){
					if (sign == "0") {
						imgURL += "/UI2/OA/common/images/open_roll.png'/>";
					}else{
						imgURL += "/UI2/OA/common/images/close_roll.png'/>";
					}
				}else{
					imgURL += "/UI2/OA/common/images/what.png'/>";
				}
			}else{
				imgURL += "/UI2/OA/common/images/what.png'/>";
			}
			return imgURL;
		},
		
		archivalInterfaceDialog : function(infoXML) {
			if (!archivalDialog) {
				archivalDialog = new justep.WindowDialog("archivalDialog",
						"/OA/archival/process/dialog/archivalFileDialog/archivalFileDialog.w",
						"文件归档", true, null, 760, 480, 0, 0, false);
				archivalDialog.attachEvent("onSend", function() {
					return {
						archivalInfo : infoXML,
						operator : "interface"
					};
				}, archivalDialog);
				archivalDialog.attachEvent("onReceive", function(event) {
					afterArchival(event);
				}, archivalDialog);
			}
			archivalDialog.open();
		}
		
	};
});