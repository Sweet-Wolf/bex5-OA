define(function(require) {
	var $ = require("jquery");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.trgSelectAssetDOMActivate = function(event) {
		isFilter = "no";
		var wDlgAssetCard = this.comp("wDlgAssetCard");
		wDlgAssetCard.initEveryTimes = true;
		wDlgAssetCard.open();

	};

	Model.prototype.wDlgAssetCardReceive = function(event) {
		var mainData = this.comp('mainData');
		
		mainData.setValue("fAssetID", event.data.card.fAssetID);
		mainData.setValue("fCode", event.data.card.fCode);
		mainData.setValue("fName", event.data.card.fName);
		mainData.setValue("fSpecType", event.data.card.fSpecType);
		mainData.setValue("fKindID", event.data.card.fKindID);
		mainData.setValue("fKind", event.data.card.fKind);
		mainData.setValue("fServiceYear", event.data.card.fServiceYear);
		mainData.setValue("fUsedYear", event.data.card.fUsedYear);
		mainData.setValue("fRemainValue", event.data.card.fRemainValue);
		
		//alert(mainData.getValue("fKindID"));
		//mainData.saveData();
		//mainData.refreshData();
	};

	return Model;
});
