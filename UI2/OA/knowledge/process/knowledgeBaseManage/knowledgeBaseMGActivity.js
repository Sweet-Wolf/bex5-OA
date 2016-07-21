define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	
	var Model = function(){
		this.callParent();
		this.canChange = false;
	};

	// 发布知识
	Model.prototype.relaseKnowledge = function(event){
		;
		var data = this.comp('dKnowledge');
		if (data) {
			try {
				var kwid = data.getCurrentRow();
				if (kwid) {
					//appCommon.DataUtils.refreshDataByRowIds(data,kwid);
					var releaseStatus = data.getValue("fReleaseStatus",kwid);
					if(releaseStatus == '1') {
						alert("该知识已经发布!");
						return;
					}
					var cfm = window.confirm('确定要发布吗?');
					if (cfm) {
						var fReleaseOgnID = this.getContext().getCurrentOgnID();
						var fReleaseOgnName = this.getContext().getCurrentOgnName();
						var fReleaseDeptID = this.getContext().getCurrentDeptID() || this.getContext().getCurrentOgnID();
						var fReleaseDeptName = this.getContext().getCurrentDeptName() || this.getContext().getCurrentOgnName();
						var fReleasePsnID = this.getContext().getCurrentPersonID();
						var fReleasePsnName = this.getContext().getCurrentPersonMemberNameWithAgent();
						var fReleasePsnFID = this.getContext().getCurrentPersonMemberFID();
						var fReleasePsnFName = this.getContext().getCurrentPersonMemberFNameWithAgent();
/*						var fReleaseTime = justep.Date.toString(justep.System
								.datetime(), justep.Date.STANDART_FORMAT);*/
								
					//	var fReleaseTime = new Date().toLocaleString();
						
						var fReleaseTime = justep.Date.toString(new Date(),
								justep.Date.STANDART_FORMAT);
						
						data.setValue('fReleaseOgnID',fReleaseOgnID);
						data.setValue('fReleaseOgnName',fReleaseOgnName);
						data.setValue('fReleaseDeptID',fReleaseDeptID);
						data.setValue('fReleaseDeptName',fReleaseDeptName);
						data.setValue('fReleasePsnID',fReleasePsnID);
						data.setValue('fReleasePsnName',fReleasePsnName);
						data.setValue('fReleasePsnFID',fReleasePsnFID);
						data.setValue('fReleasePsnFName',fReleasePsnFName);
						data.setValue('fReleaseTime',fReleaseTime);
						data.setValue('fReleaseStatus','1');
						data.setValue('fReleaseStatusName','已发布');
						
						data.saveData();
						alert("发布成功!");
					}
				} else {
					alert("当前没有可供发布的知识!");
					return;
				}
			} catch (e) {
				alert("发布知识出错!");
			}
		}
	};

	Model.prototype.cancelRelaseKnowledge = function(event){
		;
		var data = this.comp('dKnowledge');
		if (data) {
			try {
				var kwid = data.getCurrentRow();
				if (kwid) {
				//	appCommon.DataUtils.refreshDataByRowIds(data,kwid);
					var releaseStatus = data.getValue("fReleaseStatus",kwid);
					if(releaseStatus == '0') {
						alert("该知识还未发布!");
						return;
					} else if(releaseStatus =='2') {
						alert("该知识已经取消发布!");
						return;
					}
					var cfm = window.confirm('确定要取消发布吗?');
					if (cfm) {
						data.setValue("fReleaseStatus", "2");
						data.setValue("fReleaseStatusName", "已取消");
						data.saveData();
						alert('取消发布成功!');
					}
				} else {
					alert("当前没有可供取消的知识!");
					return;
				}
			} catch (e) {
				alert("取消发布失败! ");
			}
		}
	};

	
	//获取栏目管理员
	//返回格式 id1:name1 | id2:name2 | id3:name3 ...
	Model.prototype.getFolderManagers = function(folderID) {
		return this.getResponseByAction(folderID,"getFolderManagersAction","获取父栏目管理员失败!");
	};

	
	Model.prototype.getResponseByAction = function(folderID,action,errorMsg){
		;
		var params = new biz.Request.ActionParam();
		params.setString("folderID", folderID);
		var response = '';
		biz.Request.sendBizRequest({
			"context" : this.getContext(),
			"action" : action,
			"parameters" : params,
			"callback" : function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					response = callbackData.response;
				}else{
					if(errorMsg){
						throw new Error(errorMsg);
					}
				}
			}
		});
		return response;
	};
	
	Model.prototype.dtKnowledgeRowDblClick = function(event){
		;
		var dKnowledge = this.comp('dKnowledge');
		var dlgPublishKWActivity = this.comp('dlgPublishKWActivity');
		var title = dKnowledge.getValue('fTitle');

		var process = "/OA/knowledge/process/publishKnowledge/publishKnowledgeProcess"
		var activity = "publishKWActivity"
		var kwid = dKnowledge.getCurrentRowID();
		
		
		var process = "/OA/knowledge/process/publishKnowledge/publishKnowledgeProcess"
	    var activity = "publishKWActivity"
	    var url = "$UI/OA/knowledge/process/publishKnowledge/publishKWActivity.w"
			+ "?process=" + process + "&activity=" + activity + "&KWID="
			+ kwid + "&operator=manage";

		justep.Portal.openWindow(url,{title:"知识发布"});
	
	
	};
	

	Model.prototype.statusSelectUpdateValue = function(event){
		;
		var value = event.source.value;
		alert(value);
	};
	

	Model.prototype.grdFolderRowClick = function(event){
		var filterCondition = "";
		var dKW = this.comp('dKnowledge');
		var dFolder = this.comp('dFolder');
		var folderID = dFolder.getCurrentRowID();
		//var folderFullID = dFolder.getValue('folderFullID');
		var psnID = this.getContext().getCurrentPersonID();
		var managers = this.getFolderManagers(folderID);	
		if (managers && managers.indexOf(psnID) > -1) {
			var folderCondition = "(OA_KM_Knowledge.fFolderID = '" + folderID + "')";
			filterCondition = folderCondition;
		} else {
			filterCondition = "1=0";
		}
	
		// alert(filterCondition);
		dKW.filters.setFilter("knowledgeFilter", filterCondition);
		dKW.refreshData();
	};
	
	Model.prototype.knowledgeRecState = function(value) {
		;
		var personId = this.getContext().getCurrentPersonID();
		var ids = value?value:'';
		if (ids.indexOf(personId) == -1){
			return "未关注";
		} else {
			return "已关注";
		}
	};

	Model.prototype.mdKnowledgeModelConstructDone = function(event){
		var data = this.comp("dFolder");
	     data.newData({
			index : 0,
			defaultValues : [ {
				"folderID" : "public",
			    "fName":"知识中心",
				"folderFullID":"public"
			} ]
		});
         this.grdFolderRowExpand(data.getCurrentRow(),"public");
         this.canChange = true;
	};
   
   Model.prototype.grdFolderRowExpand = function(ParentRow,rowid) {
		var parent = rowid;
		var subFolders = this.getDirectSubFoldersMG(parent);
		if ((subFolders != '') && (subFolders != null)) {
		    var data = this.comp("dFolder");
			var arrFolder = subFolders.split("|");
			var len = arrFolder.length;
			//如果获取的目录为0或者已经加载了下级目录，则返回
			var rows = data.find(['fParent'],[parent]);
			
			if (len <= 0 || len == rows.length) {
				return;
			}
			
			for (var i = 0; i < len; i++) {
				var folder = arrFolder[i];
				var folderID = folder.split(":")[0];
				var folderName = folder.split(":")[1];
				var folderFullID = folder.split(":")[2];
				data.newData({
					parent : ParentRow,
					index : 0,
					defaultValues : [ {
						"folderID" : folderID,
						"fParent":parent,
						"fName":folderName,
						"folderFullID":folderFullID
						
					} ]
				});
		
				/*grdFolder.addRowPro(folderID, [folderName, folderFullID], i,
						parent);*/
			}
		}
	
   }

	// 获取父栏目下的直属级子栏目(知识库)
    Model.prototype.getDirectSubFoldersMG = function(folderID) {
        var returndata = "";
    	var param = new biz.Request.ActionParam();
    	
    	param.setString("folderID", folderID);
        
        biz.Request.sendBizRequest({
				"context" : this.getContext(),
				"action" : "getDirectSubFoldersMGAction",
				"parameters" : param, 
				"callback" : function(data) {
					; 
					data.ignoreError = false;
					if (data.state) {
						returndata =  data.response;
					}else{
						returndata = "";
					}
				}
			});
		return returndata;	
    	
    }
	Model.prototype.dFolderIndexChanged = function(event){
	    var data = this.comp("dFolder");
	    var row = data.getCurrentRow();
	    if(!this.canChange)
	        return;
		this.grdFolderRowExpand(row,row.val("folderID"));
	};
	Model.prototype.dFolderCreate = function(event){
		event.source.defTreeOption.isTree = true;
		event.source.defTreeOption.prarentRelation = "fParent";
		event.source.defTreeOption.nodeKindRelation = "fName";
		event.source.directDeleteMode = true;
	};
	return Model;
});