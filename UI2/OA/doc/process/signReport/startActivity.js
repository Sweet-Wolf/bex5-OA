define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var docUtils = require("$UI/OA/doc/js/docUtils");
	
	var Model = function(){
		this.callParent();
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

	Model.prototype.modelLoad = function(event){
		;
		var ctx = this.getContext();
    	var activity = ctx.getCurrentActivity();

		if ("startActivity" != activity && "draftActivity" != activity) {
		    ;
		    //此处问题：原来逻辑应该是编辑、下载权限，新版本中没有这种组合
		    this.comp("AttachmentZW").set({
					'access' : '519'
				});
			this.comp("BizFile").set({
					'access' : '519'
				});	
		
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

	Model.prototype.dDocValueChanged = function(event){
		var data = this.comp('dDoc');
		var row = data.getCurrentRow();
		var fieldName = event.col;
		if (fieldName == "fTemplate") {
			var title = row.val('fTitle') || "";
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
		if (fieldName == "fTitle") {
			debugger;
			var template = data.getValue('fTemplate');
			var title = event.value;
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
					row.val("fTemplate", tmp);
				}, 500);
			}
		}
	};
	 Model.prototype.checkTitle = function() {
		 var data = this.comp("dDoc");
		 var row = data.getCurrentRow();
		 if(!row)
		    return "0"
		    
		 var fTitle = row.val("fTitle");
		 var fDocType = row.val("fDocType");
		 var rowid = data.getCurrentRowID();
		 return docUtils.checkDocTitle(fTitle, fDocType, rowid,this.getContext());
	 };
	Model.prototype.dDocBeforeSave = function(event){
	
		var ctx = this.getContext();
		var data = this.comp("dDoc");
		
		var state = data.getRowState(data.getCurrentRow());
		if (state == "edit") {
			docUtils.setUpdateInfo(ctx,data);
		}
		
		var row = data.getCurrentRow();
		if (row) {
			row.val("fDocType", "OA_DC_SignReport");
			row.val("fDocTypeName", "签报");
		}
	};

	
	 Model.prototype.officeAutomation = function(event) {
		var instance = this.comp("dDoc");
		var row = instance.getCurrentRow();
		var fDocSecretLevelName = row.val("fDocSecretLevelName") || "";
		var fDocExigenceLevelName = row.val("fDocExigenceLevelName") || "";

		var fDeptLeadName = row.val("fDeptLeadName") || "";
		var fDraftPerPhone = row.val("fDraftPerPhone") || "";
		var fTitle = row.val("fTitle") || "";
		var fSignPerName = row.val("fSignPerName") || "";

		var p = {
				"密级" : fDocSecretLevelName,
				"紧急程度" : fDocExigenceLevelName,
				"部门领导审核签字" : fDeptLeadName,
				"经办人" : fSignPerName,
				"电话" : fDraftPerPhone,
				"标题" : fTitle
		};
		
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

    Model.prototype.btnvisible = function(btn){
		var visible = true;
		var ctx = this.getContext();
        var activity = ctx.getCurrentActivity();
		
		if(btn == "trgDocPublish"){ //文件发布
	    	if(activity != "secretaryActivity")
	    	   visible = false;
	    }else if(btn == "trgViewRelevance"){  //文件关联
	        if(activity != "startActivity" && activity == "draftActivity" && activity != "secretaryActivity" )
	        	visible = false;
	   
	    }
	    return visible;
	};
	
	Model.prototype.AttachmentZWOfficeLoaded = function(event){
		this.officeAutomation(event);
	};
	
	return Model;
});