define(function(require) {
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var XML = require("$UI/system/lib/base/xml");
	var WindowDialog = require("$UI/system/components/justep/windowDialog/windowDialog");///UI2/system/components/justep/windowDialog/windowDialog.js
	var folderInterfaceWindow;
	var Model = {
		/**
		 * 发布知识接口
		 */
		publishKnowledgeFun : function(bizData,ctx) {
			var param = new biz.Request.ActionParam();
			var xmlParam = new biz.Request.XMLParam(bizData);
			param.setXml("bizData", xmlParam);
			param.setString("delFlag","1");
			
			var result = false;
			biz.Request.sendBizRequest({
				"context" : ctx,
				"action" : "publishKnowledgeInterfaceAction",
				"parameters" : param, 
				"callback" : function(data) {
					    
					data.ignoreError = false;
					if (data.state) {
						result = true;
					}else{
						result = false;
					}
				}
			});
			return result;
		},
	
		/**
		 * 发布知识接口UI层
		 */
		publishKWByFolder : function(bizData,ctx,pNode) {
			var bizDom = XML.fromString(bizData); 
			if (!folderInterfaceWindow) {///UI2/OA/knowledge/dialog/folderInterface/folderInterface.w"
				var url = require.toUrl("$UI/OA/knowledge/process/dialog/folderInterface/folderInterface.w");
				folderInterfaceWindow = new WindowDialog({
					title : "选择栏目",
					showTitle : true,
					status: "normal", //对话框显示状态，取值范围：normal,maximize
					width : "50%",
					height : "80%",
					src : url,
					parentNode : pNode
				});
				
			/*	folderInterfaceWindow.on("onSend",function(){
						return {
							fTitle : XML.getNodeText(bizDom, "/root/fTitle"),
							fFolderID : XML.getNodeText(bizDom,
								"/root/fFolderID"),
							fOtherFolderIDs : XML.getNodeText(bizDom,
								"/root/fOtherFolderIDs"),
							fOtherFolderNames : XML.getNodeText(bizDom,
								"/root/fOtherFolderNames")
						};
				    },folderInterfaceWindow);
				*/
				
				folderInterfaceWindow.on("onReceive",function(event) {
					var folderInfos = event.data;
					XML.setNodeText(bizDom, "/root/fTitle", folderInfos
							.getValue("fTitle"));
					XML.setNodeText(bizDom, "/root/fFolderID", folderInfos
							.getValue("fFolderID"));
					XML.setNodeText(bizDom, "/root/fOtherFolderIDs",
							folderInfos.getValue("fOtherFolderIDs"));
					XML.setNodeText(bizDom, "/root/fOtherFolderNames",
							folderInfos.getValue("fOtherFolderNames"));
	
					var param = new biz.Request.ActionParam();
					var xmlParam = new biz.Request.XMLParam(bizDom);
					param.setXml("bizData", xmlParam);
					
					biz.Request.sendBizRequest({
						"context" : ctx,
						"action" : "publishKwInterfaceByFolderAction",
						"parameters" : param, 
						"callback" : function(data) {
							data.ignoreError = false;
							if (data.state) {
								
							}else{
								throw new Error("发布失败!");
							}
						}
					});
					
					
				},folderInterfaceWindow);
				
			
		
			}; 
			var sendparam =  {
				fTitle : XML.getNodeText(bizDom, "/root/fTitle"),
				fFolderID : XML.getNodeText(bizDom,
					"/root/fFolderID"),
				fOtherFolderIDs : XML.getNodeText(bizDom,
					"/root/fOtherFolderIDs"),
				fOtherFolderNames : XML.getNodeText(bizDom,
					"/root/fOtherFolderNames")
			};
			folderInterfaceWindow.open({data : sendparam});
		},
	
		// 转换XML特殊字符：& < > ' "
		xmlTranslate : function(str) {
			str = str.replace(/&/g, "&amp;");
			str = str.replace(/</g, "&lt;");
			str = str.replace(/>/g, "&gt;");
			str = str.replace(/'/g, "&apos;");
			str = str.replace(/"/g, "&quot;");
	
			return str;
		},
	
		isPublishedByBiz : function(bizID, bizType,ctx) {
			var param = new biz.Request.ActionParam();
			param.setString("fBizID", bizID);
			param.setString("fBizType", bizType);
			var result;
			biz.Request.sendBizRequest({
				"context" : ctx,
				"action" : "isPublishedByBizAction",
				"parameters" : param, 
				"callback" : function(data) {
					    
					data.ignoreError = false;
					if (data.state) {
						result = data.response;
					}else{
						throw new Error("判断是否发布过时出错了!");
					}
				}
			});
			
			return result;
		},
	
		getPublishedRangeByBiz : function(bizID, bizType,ctx) {
			var param = new biz.Request.ActionParam();
			param.setString("fBizID", bizID);
			param.setString("fBizType", bizType);
			var result;
			biz.Request.sendBizRequest({
				"context" : ctx,
				"action" : "getPublishedRangeByBizAction",
				"parameters" : param, 
				"callback" : function(data) {
					    
					data.ignoreError = false;
					if (data.state) {
						result =  data.response;
					}else{
						throw new Error("获取发布范围出错了!");
					}
				}
			});
			return result;
	
		}
	}

	return Model;
});