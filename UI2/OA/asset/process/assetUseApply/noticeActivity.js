define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.trgSelectAssetClick = function(event){
		kindID = this.comp('mainData').getValue("fKindID");
		kind = this.comp('mainData').getValue("fKind");
		isFilter = "yes"
		var wDlgAssetCard = this.comp("wDlgAssetCard");
		wDlgAssetCard.initEveryTimes = true;
		wDlgAssetCard.open();

	};

	return Model;
});
