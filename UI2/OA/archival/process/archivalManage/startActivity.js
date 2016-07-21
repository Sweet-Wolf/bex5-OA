define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function() {
		this.callParent();
	};

var dlgOperator = '', archivalID = '', archivalStr = '',fSeparate='';

	Model.prototype.saveCommit = function(event) {
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	
		Model.prototype.grid3RowClick = function(event){
		var data = this.comp("dArchivalRoll");
		var id = event.row.getID();
		data.to(id);
		var tabs = this.comp('tabs');
		tabs.setActiveTab('nav-detail');
	};
	
	Model.prototype.button2Click = function(event) {
		var data = this.comp("dArchivalRoll");
		data.deleteData();
		var tabs = this.comp('tabs');
		tabs.setActiveTab('nav-list');
	};

	Model.prototype.addBtnClick = function() {
		var data = this.comp("dArchivalRoll");
		data.newData();
		var tabs = this.comp('tabs');
		tabs.setActiveTab('nav-detail');
	};
//数据加载
	Model.prototype.modelLoad = function(event){
		this.comp('dTreeData').refreshData();
	};
	
	Model.prototype.dTreeDataAfterRefresh = function(event){
	var treegrid = this.comp('grdSCTree').;
	window.setTimeout(function() {
//	event.source.expandRow("archival");
	treegrid.e
	}, 200);
	};
	

	// 封卷
	Model.prototype.seamingClick = function(event){
	var rollGrid = this.comp('grdvRollCheck');
	var data = this.comp('dArchivalRoll');
	var infoIds = rollGrid.grid.getCheckedRowIds();
	for ( var i = 0; i < infoIds.length; i++) {
		if (data.getValue("fState", infoIds[i]) == '11'
				|| data.getValue("fState", infoIds[i]) == '12')
			data.setValue("fSign", "1", infoIds[i]);
	}
	if (infoIds.length == 0) {
		alert("请选择未归档的案卷进行封卷！");
		return;
	}

	data.saveData();
	data.refreshData();
	};
	
	// 拆卷
	Model.prototype.resolutionClick = function(event){
		var rollGrid = this.comp('grdvRollCheck');
		var data = this.comp('dArchivalRoll');
		var infoIds = rollGrid.grid.getCheckedRowIds();
		for ( var i = 0; i < infoIds.length; i++) {
			if (data.getValue("fState", infoIds[i]) == '11'
					|| data.getValue("fState", infoIds[i]) == '12')
				data.setValue("fSign", "0", infoIds[i]);
		}
		if (infoIds.length == 0) {
			alert("请选择未归档的案卷进行拆卷！");
			return;
		}
		data.saveData();
		data.refreshData();
	};
	
	// 组卷
	Model.prototype.shiftinClick = function(event){
		var outFiledGrid = this.comp('grdvFliedCheck');
		var data = this.comp('dvFileCheck');
		var infoIds = outFiledGrid.grid.getCheckedRowIds();
		var infoStr = "";
		for ( var i = 0; i < infoIds.length; i++) {
			if (data.getValue("fRollID", infoIds[i]) == ''
					&& (data.getValue("fState", infoIds[i]) == '01' || data
							.getValue("fState", infoIds[i]) == '02'))
				if (infoStr == '') {
					infoStr = infoIds[i];
				} else {
					infoStr = infoStr + "," + infoIds[i];
				}
		}
		if (infoStr == '') {
			alert("请选择未组卷的件进行组卷！");
			return;
		} else {
			archivalStr = infoStr;
			var showRollsDlg = this.comp("dlgRollsList");
			showRollsDlg.initEveryTimes = true;
			showRollsDlg.open();
		}
	};
	// 对话框参数
	Model.prototype.dlgRollsListLoad = function(event){
		/*var params = {
			"type" : "roll",
			"where" : "OA_AM_Archival.fSign='0' and (OA_AM_Archival.fState='11' or OA_AM_Archival.fState='12' or OA_AM_Archival.fState='13') and fCreatePsnID = '"
					+ this.getContext().getCurrentPersonID+ "'"
		};
		return params;*/
	};

	Model.prototype.dlgRollsListReceive = function(event){
		/*var params = new biz.Request.ActionParam();
		params.setParam("filedIDs", archivalStr);
		params.setParam("rollID", event.data.fID);
	
		var ctx = this.getContext();		
		var options = {
				   context : ctx,
				   process : ctx.getCurrentProcess(),
				   activity : ctx.getCurrentActivity(),
					action : "buildUpAction",
					parameters : params
			};
					
		if (!biz.Request.sendBizRequest(options))
			throw new Error(biz.Request.getServerError(options, "档案组卷失败！"));
				this.displayUnfiled();*/
	};
	
	
	// 对话框返回
	 Model.prototype.dlgRollsListReceive =function(event) {
			/*var param = new justep.Request.ActionParam();
			param.setString("filedIDs", archivalStr);
			param.setString("rollID", event.data.fID);
		
			var process = justep.Context.getCurrentProcess();
			var activity = justep.Context.getCurrentActivity();
		
			var r = justep.Request.sendBizRequest(process, activity, "buildUpAction",
					param);
			if (!justep.Request.isBizSuccess(r))
				throw new Error(justep.Request.getServerError(r, "档案组卷失败！"));
			displayUnfiled();*/
	};
	// 移出
/*	 Model.prototype.shiftoutDOMActivate =function (event) {
		if (confirm("将移出选中的件信息,是否继续？")) {
			var inFiledGrid = this.comp('grdvFliedCheck');
			var infoIds = inFiledGrid.grid.getCheckedRowIds();
			var infoStr = "";
			var data = this.comp('dvFileCheck');
			for ( var i = 0; i < infoIds.length; i++) {
				if (data.getValue("fState", infoIds[i]) == '01'
						|| data.getValue("fState", infoIds[i]) == '02')
					if (infoStr == '') {
						infoStr = infoIds[i];
					} else {
						infoStr = infoStr + "," + infoIds[i];
					}
			}
			if (infoStr == '') {
				alert("请选择要未归档的件信息进行移出操作！");
				return;
			}
			var param = new justep.Request.ActionParam();
			param.setString("filedIDs", infoStr);
	
			var process = justep.Context.getCurrentProcess();
			var activity = justep.Context.getCurrentActivity();
	
			var r = justep.Request.sendBizRequest(process, activity,
					"shiftOutAction", param);
			if (!justep.Request.isBizSuccess(r))
				throw new Error(justep.Request.getServerError(r, "档案移出失败！"));
			displayUnfiled();
			alert(justep.Request.transform(justep.Request.getData(r.responseXML)));
		}
	};

		// 件提交
		  Model.prototype.btnMultiFiledDOMActivate =function(event) {
			var unfiledGrid = this.comp('grdvFliedCheck');
			var infoIds = unfiledGrid.grid.getCheckedRowIds();
			var infoStr = "";
			var data = this.comp('dvFileCheck');
			for ( var i = 0; i < infoIds.length; i++) {
				if (data.getValue("fState", infoIds[i]) == '01')
					if (infoStr == '') {
						infoStr = infoIds[i];
					} else {
						infoStr = infoStr + "," + infoIds[i];
					}
			}
			if (infoStr == '') {
				alert("请选择编制中的档案信息进行归档！");
				return;
			}
			if (confirm("将选中的编制中的档案信息进行归档,是否继续？")) {
		
				var filedInfo = (justep.Context.getCurrentDeptID() || justep.Context
						.getCurrentOgnID())
						+ ","
						+ (justep.Context.getCurrentDeptName() || justep.Context
								.getCurrentOgnName())
						+ ","
						+ justep.Context.getCurrentPersonID()
						+ ","
						+ justep.Context.getCurrentPersonMemberNameWithAgent();
				var param = new justep.Request.ActionParam();
				param.setString("filedIDs", infoStr);
				param.setString("filedInfo", filedInfo);
		
				var process = justep.Context.getCurrentProcess();
				var activity = justep.Context.getCurrentActivity();
		
				var r = justep.Request.sendBizRequest(process, activity,
						"fileSubmitAction", param);
				if (!justep.Request.isBizSuccess(r))
					throw new Error(justep.Request.getServerError(r, "档案归档失败！"));
				displayUnfiled();
			}
		};
// 卷主题
 Model.prototype.grdRollFTitleRender =function(event) {
	var imgURL = grdArchivalShowNodeImg(event);
	var status = event.cell.getValueByColId("fState");
	if (status == '11' || status == '12') {
		imgURL += "<a href=\"javascript:editRollInfo('" + event.rowId + "')\">"
				+ event.value + '</a>';
	} else if (status == '13') {
		imgURL += "<a href=\"javascript:showRollInfo('" + event.rowId + "')\">"
				+ event.value + '</a>';
	}
	return imgURL;
}
// 件主题
 Model.prototype.grdArchivalSubmitFTitleRender(event) {
	var imgURL = grdArchivalShowNodeImg(event);
	var status = event.cell.getValueByColId("fState");
	if (status == '01' || status == '02') {
		imgURL += "<a href=\"javascript:editFileInfo('" + event.rowId + "')\">"
				+ event.value + '</a>';
	} else if (status == '03') {
		imgURL += "<a href=\"javascript:showFileInfo('" + event.rowId + "')\">"
				+ event.value + '</a>';
	}
	return imgURL;
}
// 新建卷
 Model.prototype.insertRollDOMActivate = function(event) {
	dlgOperator = "creator";

	var editRollDlg = this.comp("dlgEditRoll");
	editRollDlg.initEveryTimes = true;
	editRollDlg.open();
}
// 卷修改
 Model.prototype.editRollInfo= function(aID) {
	dlgOperator = "editor";
	archivalID = aID;

	var editRollDlg = this.comp("dlgEditRoll");
	editRollDlg.initEveryTimes = true;
	editRollDlg.open();
}
// 添加件
 Model.prototype.insertFiledDOMActivate= function(event) {
	dlgOperator = "creator";

	var editFileDlg = this.comp("dlgEditFile");
	editFileDlg.initEveryTimes = true;
	editFileDlg.open();
}
// 卷浏览
 Model.prototype.showRollInfo= function(aID) {
	dlgOperator = "viewer";
	archivalID = aID;
	var showRollDlg = this.comp("dlgShowRoll");
	showRollDlg.initEveryTimes = true;
	showRollDlg.open();
}
// 发送:卷浏览
 Model.prototype.dlgShowRollSend= function(event) {
	var params = {
		"operator" : dlgOperator,
		"archivalID" : archivalID
	};
	return params;
}
// 删除卷
 Model.prototype.deleteRollDOMActivate= function(event) {
	var rollGrid = this.comp('grdvRollCheck');
	var infoIds = rollGrid.grid.getCheckedRowIds();
	var infoStr = "";
	var data = this.comp('dArchivalRoll');
	for ( var i = 0; i < infoIds.length; i++) {
		if (data.getValue("fState", infoIds[i]) == '11')
			if (infoStr == '') {
				infoStr = infoIds[i];
			} else {
				infoStr = infoStr + "," + infoIds[i];
			}
	}
	if (infoStr == '') {
		alert("请选择要删除的编制中的卷信息！");
		return;
	}
	if (confirm("将删除选中的编制中的卷信息,是否继续？")) {
		var param = new justep.Request.ActionParam();
		param.setString("filedIDs", infoStr);

		var process = justep.Context.getCurrentProcess();
		var activity = justep.Context.getCurrentActivity();

		var r = justep.Request.sendBizRequest(process, activity,
				"deleteRollAction", param);
		if (!justep.Request.isBizSuccess(r))
			throw new Error(justep.Request.getServerError(r, "案卷删除失败！"));
		displayRoll();
	}
}
// 删除件
 Model.prototype.deleteFiledDOMActivate= function(event) {
	var unfiledGrid = this.comp('grdvFliedCheck');
	var infoIds = unfiledGrid.grid.getCheckedRowIds();
	var infoStr = "";
	var data = this.comp('dvFileCheck');
	for ( var i = 0; i < infoIds.length; i++) {
		if (data.getValue("fState", infoIds[i]) == '01')
			if (infoStr == '') {
				infoStr = infoIds[i];
			} else {
				infoStr = infoStr + "," + infoIds[i];
			}
	}
	if (infoStr == '') {
		alert("请选择要删除的编制中的档案信息！");
		return;
	}
	if (confirm("将删除选中的编制中的档案信息,是否继续？")) {
		var param = new justep.Request.ActionParam();
		param.setString("filedIDs", infoStr);

		var process = justep.Context.getCurrentProcess();
		var activity = justep.Context.getCurrentActivity();

		var r = justep.Request.sendBizRequest(process, activity,
				"deleteArchivalAction", param);
		if (!justep.Request.isBizSuccess(r))
			throw new Error(justep.Request.getServerError(r, "档案删除失败！"));
		displayUnfiled();
	}
}；

	// 件浏览
	 Model.prototype.showFileInfo= function(aID) {
		dlgOperator = "viewer";
		archivalID = aID;
	
		var showFileDlg = this.comp("dlgShowFile");
		showFileDlg.initEveryTimes = true;
		showFileDlg.open();
	}

	// 件修改
	 Model.prototype.editFileInfo = function(aID) {
		dlgOperator = "editor";
		archivalID = aID;
	
		var editFileDlg = this.comp("dlgEditFile");
		editFileDlg.initEveryTimes = true;
		editFileDlg.open();
	}
	 Model.prototype.callFileInfo= function(aID) {
		var unfiledData = this.comp('dvFileCheck');
		if (unfiledData.getValue("fState", aID) == '01') {
			editFileInfo(aID);
		} else {
			showFileInfo(aID);
		}
	};
		
	// 发送:卷修改
	 Model.prototype.dlgEditRollSend= function(event) {
		var treeData = this.comp('dTreeData');
		var params = "";
		if (dlgOperator == 'creator') {
			params = {
				"operator" : dlgOperator,
				"archivalID" : "",
				"fondsID" : treeData.getValue("fFondsID"),
				"fondsName" : treeData.getValue("fFondsName"),
				"categoryID" : treeData.getValue("fCategoryID"),
				"categoryName" : treeData.getValue("fCategoryName"),
				"categoryURLName" : treeData.getValue("fCategoryURLName")
			};
		} else {
			params = {
				"operator" : dlgOperator,
				"archivalID" : archivalID,
				"fondsID" : "",
				"fondsName" : "",
				"categoryID" : "",
				"categoryName" : "",
				"categoryURLName" : ""
			};
		}
		return params;
	};

// 发送:件浏览
 Model.prototype.dlgShowFileSend= function(event) {
	var params = {
		"operator" : dlgOperator,
		"archivalID" : archivalID
	};
	return params;
};

		// 发送:件修改
		 dlgEditFileSend= function(event) {
			var treeData = this.comp('dTreeData');
			var params = "";
			if (dlgOperator == 'creator') {
				params = {
					"operator" : dlgOperator,
					"archivalID" : "",
					"fondsID" : treeData.getValue("fFondsID"),
					"fondsName" : treeData.getValue("fFondsName"),
					"categoryID" : treeData.getValue("fCategoryID"),
					"categoryName" : treeData.getValue("fCategoryName"),
					"categoryURLName" : treeData.getValue("fCategoryURLName")
				};
			} else {
				params = {
					"operator" : dlgOperator,
					"archivalID" : archivalID,
					"fondsID" : "",
					"fondsName" : "",
					"categoryID" : "",
					"categoryName" : "",
					"categoryURLName" : ""
				};
			}
			return params;
		};
	 Model.prototype.grdFolderAfterIndexChanged(event) {
		var page = this.comp('dBtnState').getValue("page");
		if (page == 'manageTab') {
			displayRoll();
		} else if (page == 'unFiledTab') {
			displayUnfiled();
		}
	};

	 Model.prototype.tabPage1XformsSelect= function(event) {
		this.comp('dBtnState').setValue("page", "manageTab");
		displayRoll();
	};

	 Model.prototype.tabPage3XformsSelect= function(event) {
		this.comp('dBtnState').setValue("page", "unFiledTab");
		displayUnfiled();
	 };

	 Model.prototype.displayRoll= function() {
		var unfiledData = this.comp('dArchivalRoll');
		var URL = this.comp('dTreeData').getRowId();
		var filterCondition = "";
		filterCondition = "(OA_AM_Archival.fState = '11' or OA_AM_Archival.fState = '12' or OA_AM_Archival.fState = '13')";
		if (URL != 'archival') {
			filterCondition = filterCondition + " and (OA_AM_Archival.fURL like '%"
					+ URL + "%')";
			unfiledData.filters.setFilter("rollFilter", filterCondition);
			unfiledData.refreshData();
		}
	};

	 Model.prototype.displayUnfiled = function(){
		var unfiledData = this.comp('dvFileCheck');
		var URL = this.comp('dTreeData').getRowId();
		var filterCondition = "";
		filterCondition = "(V_OA_AM_FiledCheck.fState = '01' or V_OA_AM_FiledCheck.fState = '02' or V_OA_AM_FiledCheck.fState = '03')";
		if (URL != 'archival') {
			filterCondition = filterCondition
					+ " and (V_OA_AM_FiledCheck.fURL like '%" + URL + "%')";
			unfiledData.filters.setFilter("unfiledFilter", filterCondition);
			unfiledData.refreshData();
			}
	};
*/



	return Model;
});