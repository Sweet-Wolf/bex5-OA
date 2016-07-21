define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};	
	
	Model.prototype.dataTablesCellRender = function(event){
		var mainData=this.comp("mainData");
		mainData.to(event.row.getID());
		if(event.colName == "fCode"){
			event.html = "<a href='javascript:;' class='card'>"+mainData.getValue("fCode")+"</a>";
		}
	};
	Model.prototype.dataTablesRowClick = function(event){
		var aLink = $(event.domEvent.target); 
		if (aLink.hasClass("card")) {			
			var url = require.toUrl("$UI/OA/asset/process/assetCard/assetCardDetailActivity.w?process=/OA/asset/process/assetCard/assetCardProcess&activity=assetCardActivity&data=" + event.row.getID());
			justep.Portal.openWindow(url, {title: "资产卡片"});
    	}
	};
	
	Model.prototype.trgArrangeClick = function(event){
		this.comp("wDlgArrange").open();
	};	

	Model.prototype.wDlgArrangeReceive = function(event){
		var deptID = event.data.deptID;
		var deptName = event.data.deptName;
		var psnID = event.data.psnID;
		var psnName = event.data.psnName;
		var arrangeDate = event.data.arrangeDate;
		
		var cardData = this.comp('mainData');			
		
		var assetID = cardData.getCurrentRowID();
		var code = cardData.getValue("fCode", cardData.getCurrentRow(false));
		
		cardData.setValue("fDutyDeptID",deptID, cardData.getCurrentRow(false));
		cardData.setValue("fDutyDeptName",deptName, cardData.getCurrentRow(false));

		cardData.setValue("fDutyPsnID",psnID, cardData.getCurrentRow(false));
		cardData.setValue("fDutyPsnName",psnName, cardData.getCurrentRow(false));
		cardData.setValue("fArrangeDate",arrangeDate, cardData.getCurrentRow(false));
		cardData.setValue("fStatus","1", cardData.getCurrentRow(false));
		cardData.setValue("fStatusName","占用", cardData.getCurrentRow(false));	

		cardData.saveData();
		cardData.refreshData();
		var result = this.assetArrangeRecord(assetID, arrangeDate);
		if (result == true) {
			alert("资产：" + code + "安排成功！");
		}		
	};	
	
	Model.prototype.assetArrangeRecord = function(assetID, arrangeDate) {
		var params = new biz.Request.ActionParam();
		params.setParam("assetID", assetID);
		params.setParam("arrangeDate", arrangeDate.toString());
		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "assetArrangeRecordAction",
			parameters : params
		};		
		var r=biz.Request.sendBizRequest(options);
		if (!biz.Request.sendBizRequest(options)) {
			throw new Error(biz.Request.getServerError(r, "生成资产安排记录失败!"));
		}
		return true;
	};

	Model.prototype.modelModelConstructDone = function(event){
		//var data = this.comp('mainData');
		//data.refreshData();
		this.setComponentsStatus();
	};

	Model.prototype.setComponentsStatus = function(envet) {
	
		var data = this.comp('mainData');
		var count = data.getCount();
	
		if(count==0){
			this.comp("trgArrange").set(true);
		
		}else{
			this.comp("trgArrange").set(false);
		
		}

	};

	Model.prototype.mainDataAfterRefresh = function(event){
		this.setComponentsStatus();
	};
	

	/**
		name:windowDialog#onSend
		@event {"source":组件的js对象,"data":数据}
	description: <b>[回调型事件]</b> 向对话框传递数据，该事件函数的返回值将传递给对话框
	
	 Model.prototype.wDlgSelectPsnClose = function(event){

		 var data = {
		"rootFilter" : "",
		"fixedFilter" : "",
		"manageTypeCodes" : "",
		"displayableOrgKinds" : "ogn,dpt,pos,psm",
		"selectableOrgKinds" : "psm",
		"onlyMainPsm" : true
		};
		return data;
	};
	 */	
/**
		name:windowDialog#onReceive
		@event {"source":组件的js对象,"data":传回的数据}
	description: <b>[回调型事件]</b> 对话框返回数据，该事件函数有一个参数event，是对话框返回的数据
	
	Model.prototype.wDlgSelectPsnReceive = function(event){

		var rowID = event.data.getValueByName("rowid").split("@")[0];
		var name = event.data.getValueByName("sName");
		var FID = event.data.getValueByName("sFID");
		var FName = event.data.getValueByName("sFName");
		var t = this.decodeURL(FID, '', FName);
		var deptID = t["fDptID"];
		var deptName = t["fDptName"];
		var ognID = t["fOgnID"];
		var ognName = t["fOgnName"];
		if(deptID==""){
			var deptID = ognID;
			var deptName = ognName;
		}
		var arrangeDate = justep.Date.toString(justep.System.datetime(),"YYYY-MM-DD");
		var data = this.comp('mainData');
		var assetID = data.getCurrentRowId();
		var code = data.getValue("fCode", assetID);
		data.setRowData(assetID,[deptID,deptName,rowID,name,arrangeDate,'1',"占用"],
				["fDutyDeptID","fDutyDeptName","fDutyPsnID","fDutyPsnName","fArrangeDate","fStatus","fStatusName"]);
		data.saveData();
		var result = assetArrangeRecord(assetID, arrangeDate);
		if (result == true) {
			alert("资产：" + code + "安排成功！");
		}
		data.refreshData();
	};
		
	Model.prototype.decodeURL= function(idURL, codeURL, nameURL, strict) {
			var $Suffix_Organ$ = ".ogn";
			var $Suffix_Dept$ = ".dpt";
			var $Suffix_Position$ = ".pos";
			var $Suffix_Employee$ = ".psm";

			var reArray = new Array();

			var sIDArray = idURL.split("/");
			var sCodeArray = codeURL.split("/");
			var sNameArray = nameURL.split("/");
			var idxOrgan = -1, idxDept = -1, idxPosition = -1, idxEmployee = -1;

			if (strict == true || strict == 'true') {
				if ((sCodeArray.length != sIDArray.length)
						|| (sNameArray.length != sIDArray.length)
						|| sIDArray[0].length <= 0) {
					alert("URL匹配错误!");
					return;
				}
			}

			for (var i = sIDArray.length - 1; i >= 0; i--) {
				if (sIDArray[i].indexOf($Suffix_Employee$) > -1) {
					if (idxEmployee == -1) {
						idxEmployee = i;
					}
					continue;
				} else if (sIDArray[i].indexOf($Suffix_Position$) > -1) {
					if (idxPosition == -1) {
						idxPosition = i;
					}
					continue;
				} else if (sIDArray[i].indexOf($Suffix_Dept$) > -1) {
					if (idxDept == -1) {
						idxDept = i;
					}
					continue;
				} else if (sIDArray[i].indexOf($Suffix_Organ$) > -1) {
					if (idxOrgan == -1) {
						idxOrgan = i;
					}
					break;
				}
			}

			reArray["fOgnID"] = (idxOrgan > -1
					? sIDArray[idxOrgan].split(".")[0]
					: "");
			reArray["fDptID"] = (idxDept > -1
					? sIDArray[idxDept].split(".")[0]
					: "");
			reArray["fPosID"] = (idxPosition > -1 ? sIDArray[idxPosition]
					.split(".")[0] : "");
			reArray["fPsmID"] = (idxEmployee > -1 ? sIDArray[idxEmployee]
					.split(".")[0].split("@")[0] : "");

			reArray["fOgnCode"] = (idxOrgan > -1 ? sCodeArray[idxOrgan] : "");
			reArray["fDptCode"] = (idxDept > -1 ? sCodeArray[idxDept] : "");
			reArray["fPosCode"] = (idxPosition > -1
					? sCodeArray[idxPosition]
					: "");
			reArray["fPsmCode"] = (idxEmployee > -1
					? sCodeArray[idxEmployee]
					: "");

			reArray["fOgnName"] = (idxOrgan > -1 ? sNameArray[idxOrgan] : "");
			reArray["fDptName"] = (idxDept > -1 ? sNameArray[idxDept] : "");
			reArray["fPosName"] = (idxPosition > -1
					? sNameArray[idxPosition]
					: "");
			reArray["fPsmName"] = (idxEmployee > -1
					? sNameArray[idxEmployee]
					: "");

			return reArray;
		}

*/


	return Model;
});