define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var knowledgeInterface = require("$UI/OA/knowledge/js/knowledgeInterface");
	
	var Model = function(){
		this.callParent();
	};


	Model.prototype.gotoDetile = function(operate){
		var dSummary = this.comp('dSummary');
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var rowID = dSummary.getCurrentRowID();

		var url = "$UI/OA/meeting/process/boardroomSummary/summaryDetail.w"
		 + "?process=" + process + "&activity=" + activity
		 + "&rowID="+ rowID
		 + "&operate="+ operate;
		justep.Portal.openWindow(url,{title:'会议纪要信息'});
	
	};
	

	Model.prototype.btnRangeClick = function(event){
		;
		var dMain = this.comp("dSummary");
		var fDocument = dMain.getValue("fContent");
		if (!fDocument) {
			alert("正文为空，不能发布!");
			return false;
		}
		var summaryID = dMain.getCurrentRowID();
		var summaryType = "doc";
		var isPublished = knowledgeInterface.isPublishedByBiz(summaryID,
				summaryType,this.getContext());
		if(isPublished == "true")
		    isPublished = true;
		else
		    isPublished = false;    
		    
		if (isPublished && !confirm("此文件已经发布，是否要重新发布？"))
			return;
	
		var oldPublishedRange = "";
		if (isPublished)
			oldPublishedRange = knowledgeInterface.getPublishedRangeByBiz(
					summaryID, summaryType,this.getContext());
	
		if (oldPublishedRange != "") {
			oldPublishedRange = " selected-full-ids='" + oldPublishedRange + "'";
		}
		var rangeInfoDlg = this.comp("wDlgRangeIssue");
		var option =  {
			getSimpleStore : function() {
				var store = new SimpleStore("spcdata", "sName");
				return store;
			},
			getShowAlias : function() {
				return null;
			},
			selectKind : 'psm',
			viewKind : 'ogn,dpt,pos'
		};
		if (rangeInfoDlg) {
			rangeInfoDlg.initEveryTimes = true;
			rangeInfoDlg.open({data:option});
		}
	};

	Model.prototype.wDlgRangeIssueReceive = function(evt){
		;
		var sNames = "";
		var sPersonIDs = "";
		var dMain = this.comp("dSummary");
		var dPerson = this.comp('dIssue');
		var plannames = evt.data;
		var right = "";
		for ( var i = 0; i < plannames.length; i++) {
			var data = plannames[i].data;
			var row = data.getCurrentRow();
			var rowID = data.getCurrentRowID();
			var sPersonId = data.getValue('sPersonID', row);
			var sName = data.getValue('sName', row);
			var fOrgKind = 'psn';
			/*
			 * var fOrgFullID =
			 * plannames.getValueByName('sOrgID__SA_SA_OPOrg__sFID', i); fOrgFullID =
			 * fOrgFullID + "/" + sPersonId + ".psn";
			 */
			var fOrgFullID = data.getValue('sFID', row);
			//var fOrgFullID = plannames.getValueByName('sFID', i);
			/*
			 * var fOrgFullName =
			 * plannames.getValueByName('sOrgID__SA_OPOrg__sFName', i); fOrgFullName =
			 * fOrgFullName + "/" + sName;
			 */
			var fOrgFullName = data.getValue('sFName', row);
			//var fOrgFullName = plannames.getValueByName('sFName', i);
			if (sPersonIDs.indexOf(rowID + ",") != -1)
				continue;
			sPersonIDs += rowID + ",";
			sNames += sName + ",";
			var options = {
				defaultValues : [
		 			{fOrgKind:fOrgKind,
		 			fOrgID:sPersonId,
		 			fOrgName:sName,
		 			fPersonID:sPersonId,
		 			fPersonName:sName,
		 			fRangeURL:fOrgFullID,
		 			fRangeURLName:fOrgFullName,
		 			version:0
		 			}
	 			]
			};	
			dPerson.newData(options);
			/*dPerson.instance.setValueByName('fOrgKind', fOrgKind);
			dPerson.instance.setValueByName('fOrgID', sPersonId);
			dPerson.instance.setValueByName('fOrgName', sName);
			dPerson.instance.setValueByName('fPersonID', sPersonId);
			dPerson.instance.setValueByName('fPersonName', sName);
			dPerson.instance.setValueByName('fRangeURL', fOrgFullID);
			dPerson.instance.setValueByName('fRangeURLName', fOrgFullName);
			dPerson.instance.setValueByName('version', 0);*/
			right = right + "<right><fOrgKind>" + fOrgKind + "</fOrgKind><fOrgID>"
					+ sPersonId + "</fOrgID><fOrgName>" + sName
					+ "</fOrgName><fOrgFID>" + fOrgFullID + "</fOrgFID><fOrgFName>"
					+ fOrgFullName + "</fOrgFName><fCanReadKW>1</fCanReadKW>"
					+ "<fCanCreateKW>1</fCanCreateKW>"
					+ "<fCanReadComment>1</fCanReadComment>"
					+ "<fCanCreateComment>1</fCanCreateComment>"
					+ "<fCanReadRecord>1</fCanReadRecord>"
					+ "<fCanScore>1</fCanScore>" + "</right>";
		}
		var fBizID = dMain.getCurrentRowID();
		var fBizType = 'doc';
		var fBizTypeName = '文件中心';
		var fTitle = dMain.getValue("fMeetName");
		var fKeyword = " ";
		var fDocNumber = " ";
		var fWriter = dMain.getValue("fCreatePsnName");
		var fDocument = dMain.getValue("fContent");
		var fAttachment = dMain.getValue("fAttachment");
		var fCreateOgnID = dMain.getValue("fCreateOgnID");
		var fCreateOgnName = dMain.getValue("fCreateOgnName");
		var fCreateDeptID = dMain.getValue("fCreateDeptID");
		var fCreateDeptName = dMain.getValue("fCreateDeptName");
		var fCreatePsnID = dMain.getValue("fCreatePsnID");
		var fCreatePsnName = dMain.getValue("fCreatePsnName");
		var fCreatePsnFullID = dMain.getValue("fCreatePsnFID");
		var fCreatePsnFullName = dMain.getValue("fCreatePsnFName");
		var fReleaseOgnID = this.getContext().getCurrentOgnID();
		var fReleaseOgnName = this.getContext().getCurrentOgnName();
		var fReleaseDeptID = this.getContext().getCurrentDeptID()
				|| this.getContext().getCurrentOgnID();
		var fReleaseDeptName = this.getContext().getCurrentDeptName();
		var fReleasePsnID = this.getContext().getCurrentPersonID();
		var fReleasePsnName = this.getContext().getCurrentPersonMemberName();
		var fReleasePsnFullID = this.getContext().getCurrentPersonMemberFID();
		var fReleasePsnFullName = this.getContext().getCurrentPersonMemberFName();
		var fFolderID = "doc";
		var fFolderName = "文件中心";
		var fFolderFullID = "public/doc";
		var fFolderFullName = "知识中心/文件中心";
		var fContentType = "uploaddoc";
		var fContentTypeName = "上传文档";
	
		var bizDataPre = "<root>" + "<fBizID>" + fBizID + "</fBizID>"
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
				+ "<fCreatePsnFID>" + fCreatePsnFullID + "</fCreatePsnFID>"
				+ "<fCreatePsnFName>" + fCreatePsnFullName + "</fCreatePsnFName>"
				+ "<fReleaseOgnID>" + fReleaseOgnID + "</fReleaseOgnID>"
				+ "<fReleaseOgnName>" + fReleaseOgnName + "</fReleaseOgnName>"
				+ "<fReleaseDeptID>" + fReleaseDeptID + "</fReleaseDeptID>"
				+ "<fReleaseDeptName>" + fReleaseDeptName + "</fReleaseDeptName>"
				+ "<fReleasePsnID>" + fReleasePsnID + "</fReleasePsnID>"
				+ "<fReleasePsnName>" + fReleasePsnName + "</fReleasePsnName>"
				+ "<fReleasePsnFID>" + fReleasePsnFullID + "</fReleasePsnFID>"
				+ "<fReleasePsnFName>" + fReleasePsnFullName
				+ "</fReleasePsnFName>" + "<fFolderID>" + fFolderID
				+ "</fFolderID>" + "<fFolderName>" + fFolderName + "</fFolderName>"
				+ "<fFolderFullID>" + fFolderFullID + "</fFolderFullID>"
				+ "<fFolderFullName>" + fFolderFullName + "</fFolderFullName>"
				+ "<rights>";
		var bizData = bizDataPre + right + "</rights>" + "</root>";
		// ;
		var success = knowledgeInterface.publishKnowledgeFun(bizData,this.getContext());
		if (success) {
			dMain.setValue("fIssueState", 1);
			dMain.setValue("fIssueStateName", "已发布");
			dMain.saveData();
			alert("发布成功！");
		} else {
			alert("发布失败！");
		}
			
	};

	Model.prototype.newBtnClick = function(event){
		this.gotoDetile('new');
	};

	Model.prototype.dataTablesSummaryRowDblClick = function(event){
		this.gotoDetile('edit');
	};

	return Model;
});