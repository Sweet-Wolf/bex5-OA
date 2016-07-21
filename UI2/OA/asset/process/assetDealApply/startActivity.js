define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.trgSelectAssetDOMActivate = function(event){
			isFilter = "no";
			var wDlgAssetCard = this.comp("wDlgAssetCard");
			wDlgAssetCard.initEveryTimes = true;
			wDlgAssetCard.open();
			
	};




	Model.prototype.wDlgAssetCardReceive = function(event){
		var data = this.comp('mainData');
		data.setValue("fAssetID",event.data.card.fAssetID);
		data.setValue("fCode",event.data.card.fCode);
		
		data.setValue("fName", event.data.card.fName);
		data.setValue("fSpecType", event.data.card.fSpecType);
		data.setValue("fKindID", event.data.card.fKindID);
		data.setValue("fKind", event.data.card.fKind);
		data.setValue("fServiceYear", event.data.card.fServiceYear);
		data.setValue("fEvaluateValue", event.data.card.fRemainValue);
	};

	Model.prototype.mainDataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	var mainDataValueChanging = false;
	Model.prototype.mainDataValueChanged = function(event){
		if (!mainDataValueChanging) {
		mainDataValueChanging = true;
		try {
			var psnID = this.getContext().getCurrentPersonID();
			var psnName = this.getContext().getCurrentPersonName();
			var time = justep.Date.toString(new Date(),justep.Date.STANDART_FORMAT);
			var data = this.comp("mainData");

			if (event.column == "fApplyDeptID") {
				var rowid = data.getCurrentRowId();
				data.setValue("fApplyPsnID", "", rowid);
				data.setValue("fApplyPsnName", "", rowid);
			}

			data.setValue("fUpdatePsnID", psnID);
			data.setValue("fUpdatePsnName", psnName);
			data.setValue("fUpdateTime", time);
		} finally {
			mainDataValueChanging = false;
		}
	}
	};

	Model.prototype.processBeforeAdvanceQuery = function(event){
		var mainData = this.comp('mainData')
		if(!mainData.getValue('fCode')){
		    alert("请选择资产");
		    event.cancel = true;
			//throw new Error('没有选择资产');
		}
	};

	return Model;
});
