define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event){
	    var data = event.data;
		var srcd = this.comp('dInfo');
		var folderData = this.comp('dFolder');
		if (data.fTitle != null)
			srcd.setValue("fTitle", data.fTitle);
		if (data.fOtherFolderIDs != null)
			srcd.setValue("fOtherFolderIDs", data.fOtherFolderIDs);
		if (data.fOtherFolderNames != null)
			srcd.setValue("fOtherFolderNames", data.fOtherFolderNames);
		if (data.fFolderID != null) {
		    folderData.defTreeOption.option.rootFilter = "OA_KM_Folder = '" + data.fFolderID + "'";
		//	folderData.setTreeRootFilter("OA_KM_Folder = '" + data.fFolderID + "'");
		    folderData.refreshData();
			srcd.setValue("fFolderID", data.fFolderID);
		}
	};

	Model.prototype.btnOtherFoldersClick = function(event){
	   var otherFolderIDs = this.comp('dInfo').getValue('fOtherFolderIDs');

	    var param = {
					"otherFolderIDs" : otherFolderIDs
					
			};
			
		var dlg = this.comp("dlgOtherFolders");
		dlg.open({data:param});
	};

	Model.prototype.dlgOtherFoldersReceive = function(event){
	    ;
		var grdReturn = event.data;
		var otherFoldersName = "";
		var otherFolderIDs = "";
		
		
		var len = grdReturn.count();
		for (var i = 0; i < len; i++) {
			otherFolderIDs = otherFolderIDs + ","
				+ grdReturn.datas.get(0)[i].val("fFolderID");
			if (i < 6)
				otherFoldersName = otherFoldersName + " "
					+ grdReturn.datas.get(0)[i].val("fName");
			if (i == 6)
				otherFoldersName = otherFoldersName + "等栏目";
		}
		otherFolderIDs = otherFolderIDs.replace(",", "");
		otherFoldersName = otherFoldersName.replace(" ", "");
		this.comp('dInfo').setValue('fOtherFolderIDs', otherFolderIDs);
		this.comp('dInfo').setValue('fOtherFolderNames', otherFoldersName);
	};

	Model.prototype.okBtnClick = function(event){
		var data = this.comp("dInfo");
		this.comp("windowReceiver").windowEnsure(data);
	};

	Model.prototype.grid1IndexChanged = function(event){
		var srcd = this.comp('dInfo');
		srcd.setValue("fFolderID", event.rowId);
	};

	return Model;
});