define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event){
		var srcd = this.comp('bizDataSelected');
		if(event.data && event.data.otherFolderIDs){
			var ids = "('" + event.data.otherFolderIDs.replace(/(,)/g, "','") + "')";
			srcd.filters.setFilter("kwFolderFilter", "OA_KM_Folder in " + ids);
			srcd.refreshData();
			//放入静态data中
			var dataSelected = this.comp('dataSelected');
			var defaultValue = {};
			srcd.each(function(param){
				defaultValue['fFolderID'] = param.row.val('OA_KM_Folder');
				defaultValue['fName'] = param.row.val('fName');
				defaultValue['fFolderFullID'] = param.row.val('fFullID');
			});
			//dataSelected.clear();
			//dataSelected.newData({defaultValues:[defaultValue]});
		}
	};
	
	
	Model.prototype.selectBtnClick = function(event){
		;
		var dFolder = this.comp('dFolder');
		var dataSelected = this.comp('dataSelected');
		var folderName = dFolder.getValue('fName');
		if (!this.isSelected(dataSelected,folderName)) {
			var folderID = dFolder.getCurrentRowID();
			var folderFullID = dFolder.getValue('fFullID');
			var defaultValue = {};
			defaultValue['fFolderID'] = folderID;
			defaultValue['fName'] = folderName;
			defaultValue['fFolderFullID'] = folderFullID;
			dataSelected.newData({defaultValues:[defaultValue]});
		}
	};
	Model.prototype.isSelected = function(data,name) {
		var b = false;
		data.eachAll(function(param) {
			if (param.row.val('fName') == name) {
				b = true;
				return;
			}
		});
		return b;
	};
	
	Model.prototype.cancelBtnClick = function(event){
		var dataSelected = this.comp('dataSelected');
		dataSelected.confirmDelete = false;
		dataSelected.deleteData(dataSelected.getCurrentRow());
	};
	Model.prototype.cancleAllBtnClick = function(event){
		;
		var dataSelected = this.comp('dataSelected');
		dataSelected.confirmDelete = false;
		dataSelected.deleteAllData();
	};
	Model.prototype.ensureBtnClick = function(event){
		;
		var dataSelected = this.comp('dataSelected');
		this.comp('windowReceiver').windowEnsure(dataSelected);
	};
	return Model;
});