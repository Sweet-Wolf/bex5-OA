define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.dataTablesRowDblClick = function(event) {
		var row = event.row;
		if (row) {
			var fMasterID = row.val('fMasterID');
			var url = require.toUrl("$UI/OA/asset/process/dialog/assetBuyRecord/assetBuyRecord.w");
			this.comp("buyApplyDialog").open({
				src : url,
				data : {
					operator : "",
					assetInID : fMasterID
				}
			});
		}
	};

	return Model;
});