define(function(require) {
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	 var KnowledgeInterface = require("$UI/OA/knowledge/js/knowledgeInterface");
	 var Data = require("$UI/system/components/justep/data/data");
	 var chinese = ['零','一','二','三','四','五','六','七','八','九'];
	 var len = ['十'];
	 var ydm =['年','月','日'];
	return {
		recordReaded : function(ctx,docID) {
			var returnValue = null;
			var param = new biz.Request.ActionParam();
			param.setString("docID", docID);
			param.setString("personID",ctx.getCurrentPersonID());
			
			biz.Request.sendBizRequest({
				"context" : ctx,
				"action" : "recordReadedAction",
				"parameters" : param, 
				"callback" : function(data) {
					data.ignoreError = false;
					if (data.state) {
						returnValue = data.response;
					}else{
						throw new Error("记录文件已阅失败");
					}
				}
			});
			
			return returnValue;
		/*
			var param = new justep.Request.ActionParam();
			param.setString("docID", docID);
			param.setString("personID", personID);

			var r = justep.Request.sendBizRequest(justep.Context.getCurrentProcess(),
					justep.Context.getCurrentActivity(), "recordReadedAction", param);
			if (!justep.Request.isBizSuccess(r)) {
				throw new Error(justep.Request.getServerError(r, "记录文件已阅失败"));
			}
			return justep.Request.transform(justep.Request.getData(r.responseXML));*/
		},
	
		/**
		 * 添加文件关联
		 */
		addRelevance : function(ctx,docId, relevanceId) {
		
			var returnValue = null;
			var param = new biz.Request.ActionParam();
			param.setString("docId", docId);
			param.setString("relevanceId", relevanceId);
			
			biz.Request.sendBizRequest({
				"context" : ctx,
				"action" : "addRelevanceAction",
				"parameters" : param, 
				"callback" : function(data) {
					    
					data.ignoreError = false;
					if (data.state) {
						returnValue = data.response;
					}else{
						   alert("添加文件关联失败");
					}
				}
			});
			
			return returnValue;

		},
		/**
		 * 设置公文发送范围
		 */
		
		setDocReceiveRangeData : function(ctx,docID, store)  {
			var dom = "";
			var len = store.length;
			for (var i = 0; i < len; i++) {
				var row = store[i];
				var orgFID = row.val("sFID");
				var orgFName = row.val("sFName");
				dom += "<OA_DC_ReceiveRange>";
				dom += "<fRangeURL>" + orgFID + "</fRangeURL>";
				dom += "<fRangeURLName>" + orgFName + "</fRangeURLName>";
				dom += "</OA_DC_ReceiveRange>";
			}
			// dom = "<jscheme:xml><root>" + dom + "</root></jscheme:xml>";
			dom = "<root>" + dom + "</root>";

			var param = new biz.Request.ActionParam();
			var xmlParam = new biz.Request.XMLParam(dom);
			
			param.setString("docID", docID);
			param.setXml("dom", xmlParam);
			
			biz.Request.sendBizRequest({
				"context" : ctx,
				"action" : "setDocReceiveRangeAction",
				"parameters" : param, 
				"callback" : function(data) {
	    
					data.ignoreError = false;
					if (data.state) {
						var result = data.response;
						alert('设置公文发送范围成功！');
					}else{
						alert("设置公文发送范围失败");
					}
				}
			});
			
			
		},
		
		/**
		 * 删除文件关联
		 */
		deleteRelevance : function(ctx,relevanceId) {
		
			var  returnValue = null;
			var param = new biz.Request.ActionParam();
			param.setString("relevanceId", relevanceId);
			
			biz.Request.sendBizRequest({
				"context" : ctx,
				"action" : "deleteRelevanceAction",
				"parameters" : param, 
				"callback" : function(data) {
					    
					data.ignoreError = false;
					if (data.state) {
						returnValue = data.response;
					}else{
						alert("删除文件关联失败");
					}
				}
			});
			
			
			return returnValue;
		},
		
		/**
		 * 修改文件关联名称
		 */
		updateRelevance : function(ctx,relevanceID, sResult) {
			
			var returnValue = null;
			var param = new biz.Request.ActionParam();
			param.setString("relevanceID", relevanceID);
			param.setString("sResult", sResult);
			
			biz.Request.sendBizRequest({
				"context" : ctx,
				"action" : "updateRelevanceAction",
				"parameters" : param, 
				"callback" : function(data) {
	    
					data.ignoreError = false;
					if (data.state) {
						returnValue = data.response;
					}else{
						alert("修改文件关联名称失败");
					}
				}
			});
			return returnValue;
			
	
		},
		
		/**
		 * 设置阅文范围
		 */
		setDocReaderRangeData : function(ctx,docID, store) {
		  
			var dom = "";
			var len = store.length;
			for (var i = 0; i < len; i++) {
				var row = store[i];
			//	row..value.latestValue
				var orgKind = row.val("sOrgKindID");
				if (orgKind == 'psm') {
					var orgFID =  row.val("sFID"); 
					var orgFName = row.val("sFName");
					var orgID = row.val("SA_OPOrg").split('@')[1];
					var orgName = row.val("sName");
					var psnID =row.val("SA_OPOrg").split('@')[0]; 
					var psnName = row.val("sName"); 
				} else {
					var orgFID = row.val("sFID");
					var orgFName = row.val("sFName");
					var orgID = row.val("SA_OPOrg");
					var orgName = row.val("sName");
					var psnID = orgID;
					var psnName = orgName;
				}
				var orgTreeID = orgID;
				dom += "<OA_DC_ReaderRange>";
				dom += "<fOrgTreeID>" + orgTreeID + "</fOrgTreeID>";
				dom += "<fOrgKind>" + orgKind + "</fOrgKind>";
				dom += "<fOrgID>" + orgID + "</fOrgID>";
				dom += "<fOrgName>" + orgName + "</fOrgName>";
				dom += "<fPersonID>" + psnID + "</fPersonID>";
				dom += "<fPersonName>" + psnName + "</fPersonName>";
				dom += "<fRangeURL>" + orgFID + "</fRangeURL>";
				dom += "<fRangeURLName>" + orgFName + "</fRangeURLName>";
				dom += "</OA_DC_ReaderRange>";
			}
			dom = "<root>" + dom + "</root>";
			var param = new biz.Request.ActionParam();
			var xmlParam = new biz.Request.XMLParam(dom);
			param.setString("docID", docID);
			param.setXml("dom", xmlParam);
			
			biz.Request.sendBizRequest({
				"context" : ctx,
				"action" : "setDocReaderRangeAction",
				"parameters" : param, 
				"callback" : function(data) {
	    
					data.ignoreError = false;
					if (data.state) {
						var result = data.response;
						if(result=="" || result == null){
							alert('设置传阅范围成功！');
						}else{
							alert(result+"已设置传阅");
						}
					}else{
						alert("设置传阅范围失败");
					}
				}
			});
			
			
		},
		//文件发布
		doPublishKWByFolder : function(ctx,docInstance,pNode) {
			
			var row = docInstance.getCurrentRow();
			var fBizID = docInstance.getCurrentRowID();
			var fBizType = row.val("fDocType");
			var fBizTypeName = row.val("fDocTypeName");
			var fTitle = row.val("fTitle");
			var fKeyword = row.val("fKeyword");
			var fDocNumber = row.val("fDocNumber");
			var fWriter = row.val("fCreatePsnName");
			var fDocument = row.val("fTemplate");
			var fAttachment = row.val("fAttachment");
			var fCreateOgnID = row.val("fCreateOgnID");
			var fCreateOgnName = row.val("fCreateOgnName");
			var fCreateDeptID = row.val("fCreateDeptID");
			var fCreateDeptName = row.val("fCreateDeptName");
			var fCreatePsnID = row.val("fCreatePsnID");
			var fCreatePsnName = row.val("fCreatePsnName");
			var fCreatePsnFID = row.val("fCreatePsnFID");
			var fCreatePsnFName = row.val("fCreatePsnFName");
			var fReleaseOgnID = ctx.getCurrentOgnID();
			var fReleaseOgnName = ctx.getCurrentOgnName();
			var fReleaseDeptID = ctx.getCurrentDeptID() || ctx.getCurrentOgnID();
			var fReleaseDeptName = ctx.getCurrentDeptName() || ctx.getCurrentOgnName();
			var fReleasePsnID = ctx.getCurrentPersonID();
			var fReleasePsnName = ctx.getCurrentPersonMemberNameWithAgent();
			var fReleasePsnFID = ctx.getCurrentPersonMemberFNameWithAgent();
			var fReleasePsnFName = ctx.getCurrentPersonMemberFName();
			var fFolderID = "doc";
			var fContentType = "uploaddoc";
			var fContentTypeName = "上传文档";

			var bizData = "<root>" + "<fBizID>" + fBizID + "</fBizID>"
					+ "<fBizType>" + fBizType + "</fBizType>" + "<fBizTypeName>"
					+ fBizTypeName + "</fBizTypeName>" + "<fTitle>" + fTitle
					+ "</fTitle>" + "<fKeyword>" + fKeyword + "</fKeyword>"
					+ "<fDocNumber>" + fDocNumber + "</fDocNumber>" + "<fWriter>"
					+ fWriter + "</fWriter>" + "<fContentType>" + fContentType
					+ "</fContentType>" + "<fContentTypeName>" + fContentTypeName
					+ "</fContentTypeName>" + "<fDocument>" + fDocument
					+ "</fDocument>" + "<fAttachment>" + fAttachment + "</fAttachment>"
					+ "<fCreateOgnID>" + fCreateOgnID + "</fCreateOgnID>"
					+ "<fCreateOgnName>" + fCreateOgnName + "</fCreateOgnName>"
					+ "<fCreateDeptID>" + fCreateDeptID + "</fCreateDeptID>"
					+ "<fCreateDeptName>" + fCreateDeptName + "</fCreateDeptName>"
					+ "<fCreatePsnID>" + fCreatePsnID + "</fCreatePsnID>"
					+ "<fCreatePsnName>" + fCreatePsnName + "</fCreatePsnName>"
					+ "<fCreatePsnFID>" + fCreatePsnFID + "</fCreatePsnFID>"
					+ "<fCreatePsnFName>" + fCreatePsnFName + "</fCreatePsnFName>"
					+ "<fReleaseOgnID>" + fReleaseOgnID + "</fReleaseOgnID>"
					+ "<fReleaseOgnName>" + fReleaseOgnName + "</fReleaseOgnName>"
					+ "<fReleaseDeptID>" + fReleaseDeptID + "</fReleaseDeptID>"
					+ "<fReleaseDeptName>" + fReleaseDeptName + "</fReleaseDeptName>"
					+ "<fReleasePsnID>" + fReleasePsnID + "</fReleasePsnID>"
					+ "<fReleasePsnName>" + fReleasePsnName + "</fReleasePsnName>"
					+ "<fReleasePsnFID>" + fReleasePsnFID + "</fReleasePsnFID>"
					+ "<fReleasePsnFName>" + fReleasePsnFName + "</fReleasePsnFName>"
					+ "<fFolderID>" + fFolderID + "</fFolderID>" + "<fOtherFolderIDs/>"+ "<fOtherFolderNames/>" + "</root>";
          
			KnowledgeInterface.publishKWByFolder(bizData,ctx,pNode);
		},
		
		
		setUpdateInfo : function(ctx,data) {
		
			var currentPsnID = ctx.getCurrentPersonID();
			var currentPsnName = ctx.getCurrentPersonName();
			var currentTime = justep.Date.toString(new Date(),
					justep.Date.STANDART_FORMAT);
			data.setValue("fUpdatePsnID", currentPsnID);
			data.setValue("fUpdatePsnName", currentPsnName);
			data.setValue("fUpdateTime", currentTime);
		},
		
		recordReceived : function(ctx,fSendDocId, currentOgnId) {
		
			var returnValue = null;
			var param =  new biz.Request.ActionParam();
			param.setString("fSendDocId", fSendDocId);
			param.setString("currentOgnId", currentOgnId);
			
			biz.Request.sendBizRequest({
				"context" : ctx,
				"action" : "recordReceivedAction",
				"parameters" : param, 
				"callback" : function(data) {
					    
					data.ignoreError = false;
					if (data.state) {
						returnValue = data.response;
					}else{
						   alert("记录文件已收失败");
					}
				}
			});
			
			
			return returnValue;
		},
		/* 过滤已选择的机构ID */
		
		getOrgIDs : function(oldIDs, newIDs) {
			if (!newIDs || newIDs === "") {
				if (!oldIDs || oldIDs === "") {
					return "";
				} else {
					return oldIDs;
				}
			} else {
				if (!oldIDs || oldIDs === "") {
					return newIDs;
				} else {
					return this.filterOrgIDs(oldIDs.split(","), newIDs.split(","));
				}
			}
		},
		filterOrgIDs : function(oldOrgIDs, newOrgIDs) {
			var result = oldOrgIDs;
			var oldLength = 0, newLength = 0;
			oldLength = oldOrgIDs.length;
			newLength = newOrgIDs.length;
			for ( var i = 0; i < newLength; i++) {
				var flag = false;
				for ( var j = 0; j < oldLength; j++) {
					if (newOrgIDs[i] == oldOrgIDs[j])
						flag = true;
				}
				if (flag)
					result.push(newOrgIDs[i]);
			}
			return result.join(",");
		},
		/* 过滤已选择的机构名称 */
		getOrgNames : function(oldNames, newNames) {
			if (!newNames || newNames === "") {
				if (!oldNames || oldNames === "") {
					return "";
				}else{
					return oldNames;		
				}
			} else {
				if (!oldNames || oldNames === "") {
					return newNames;
				} else {
					return this.filterOrgNames(oldNames.split(","), newNames.split(","));
				}
			}
		},
		
		filterOrgNames : function(oldOrgNames, newOrgNames) {
			var result = oldOrgNames;
			var oldLength = 0, newLength = 0;
			oldLength = oldOrgNames.length;
			newLength = newOrgNames.length;
			for (var i = 0; i < newLength; i++) {
				var flag = false;
				for (var j = 0; j < oldLength; j++) {
					if (newOrgNames[i] == oldOrgNames[j])
						flag = true;
				}
				if (!flag)
					result.push(newOrgNames[i]);
			}
			return result.join(",");
		},
        
		/**
		 * 检查文件标题
		 */
		checkDocTitle : function(fTitle, fDocType, rowid,ctx) {
			var flag = null;
			var param = new biz.Request.ActionParam();
			param.setString("fTitle", fTitle);
			param.setString("fDocType", fDocType);
			param.setString("rowid", rowid);
			
			biz.Request.sendBizRequest({
				"context" : ctx,
				"action" : "checkTitleAction",
				"parameters" : param, 
				"callback" : function(data) {
					    
					data.ignoreError = false;
					if (data.state) {
						flag = data.response;
					}else{
						   alert("检查文件标题失败");
					}
				}
			});
			if (flag == "1") {
				alert("文件标题已存在！");
			}
			return flag;
			
			
		},
		
		baodate2chinese: function(s)
		{
		/* 验证输入的日期格式.并提取相关数字. */
		  s += "";
		  var datePat = /^(\d{2}|\d{4})(\/|-)(\d{1,2})(\2)(\d{1,2})$/; 
		  var matchArray = s.match(datePat); 
		  var ok="";
		  if (matchArray == null) return false;
		  for(var i=1;i<matchArray.length;i=i+2)
		  {
		    ok+=this.n2c(matchArray[i]-0)+ydm[(i-1)/2];
		  }
		  return ok;
		},
		
		n2c : function(s)
		{ 
		  /* 对特殊情况进行处理. */
		  s=""+s;
		  if(s.length==2)
		  {
			if(s.charAt(0)=="1")
		    {
		      if(s.charAt(1)=="0")return len[0];
		      return len[0]+chinese[s.charAt(1)];
		    }
		    if(s.charAt(1)=="0")return chinese[s.charAt(0)]+len[0];
		    return chinese[s.charAt(0)]+len[0]+chinese[s.charAt(1)];
		  }
		  return this.num2chinese(s);
		},
		
		num2chinese : function(s)
		{
		 /* 将单个数字转成中文. */
			s=""+s;
		    var slen = s.length;
			var result="";
			for(var i=0;i<slen;i++)
			{
			  result+=chinese[s.charAt(i)];
			}
			return result;
		},
		
		/**
		 * 根据id获取data对象，
		 * */
		getDocById : function(context,parent,docId) {

			var options = {};
			var param = new biz.Request.ActionParam();
			param.setString("docId", docId);
			options.parameters = param;
			options.action = "getDocByIdAction";
			options.context = context;
			//response.responseJSON.data.value
			var r = biz.Request.sendBizRequest(options).responseJSON;
			if (!biz.Request.isBizSuccess(r)) {
				throw new Error(biz.Request.getServerError(r, "获取文件信息失败"));
			}
			
			var row = r.data.value;
			var rows = row.rows;
		
			return rows;
		}
		
	};
});
