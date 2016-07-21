define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	

	Model.prototype.trgStartUseClick = function(event){
		try {
			var data = this.comp('dCarBasicInfo');
			var row = data.getCurrentRow();
			if (data.getValue("fUseStatus", row) == '1') {
				this.show("已经启用过!");
			} else {
				data.setValue("fUseStatus", '1', row);
				data.setValue("fUseStatusName", '启用', row);
				data.saveData();
			}
		} catch (e) {
			//this.show("对不起,启用失败!");
		}
	
	};

	Model.prototype.trgStopUseClick = function(event){
		try {
			var data = this.comp('dCarBasicInfo');
			var row = data.getCurrentRow();
			if (data.getValue("fUseStatus", row) == '2') {
				this.show("已经停用了!");
			} else {
				data.setValue("fUseStatus", '2', row);
				data.setValue("fUseStatusName", '停用', row);
				data.saveData();
			}
		} catch(e) {
			//this.show("对不起,停用失败!");
		}
	
	};

	Model.prototype.show = function(msg) {
		justep.Util.hint(msg, {
			type : 'success',
			parent : this.getRootNode()
		});
	};

	Model.prototype.dCarBasicInfoSaveCommit = function(event){
		
		justep.Util.hint("成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	
	};

	Model.prototype.trgYearClick = function(event){
		this.btnClickGotoPage(event,this.comp("dlgCarYearCheckInfo"));
	};
	
	Model.prototype.btnClickGotoPage = function(event,dialog){
		var dlgOperator,carBasicInfoID;
		var dCarBasicInfo = this.comp("dCarBasicInfo");
		if (dCarBasicInfo.getValue("fUseStatus") == '1') {
			dlgOperator = "view";
		} else {
			dlgOperator = "edit";
		}
		carBasicInfoID = dCarBasicInfo.getCurrentRowID();
		var options = {
			operator : dlgOperator,
			carBasicInfoID:carBasicInfoID
		};
		dialog.open({
				data : options
		});
	}

	Model.prototype.trgSafeClick = function(event){
		this.btnClickGotoPage(event,this.comp("dlgCarSafetyInfo"));
	};

	Model.prototype.dlgselectAssetCardReceive = function(event){
		;
		this.action = event.data.action;
		var dCarBasicInfo = this.comp('dCarBasicInfo');
		if (event.data.action === "new"){
			dCarBasicInfo.clear();
			dCarBasicInfo.newData();
		}else{
			/*dCarBasicInfo.loadData({rows: [event.data.row]}, false);
			dCarBasicInfo.first();*/
			var row = dCarBasicInfo.getCurrentRow();
			var newRow = event.data.row;
			dCarBasicInfo.setValue("fEquipmentNo", newRow.fCode, row);
			dCarBasicInfo.setValue("fOriginValue", newRow.fOriginValue, row);
			dCarBasicInfo.setValue("fRemainValue", newRow.fRemainValue, row);
		}
	
	};

	Model.prototype.modelModelConstructDone = function(event){
		var operator = this.getContext().getRequestParameter("operator");
		var id = this.getContext().getRequestParameter("id");
		
		var mainData = this.comp('dCarBasicInfo');
		if (operator === "new"){
			
			mainData.newData();
		}else{
			mainData.filters.setFilter("applyFilter", "OA_CA_CarBasicInfo='" + id + "'");
			mainData.refreshData();	
		}
	};

	Model.prototype.dlgselectAssetCardOpen = function(event){
		this.comp('dlgselectAssetCard').open();
	};

	return Model;
});