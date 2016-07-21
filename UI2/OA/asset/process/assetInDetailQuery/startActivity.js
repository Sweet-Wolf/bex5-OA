define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	Model.prototype.dataTablesRowDblClick = function(event){
		var assetInID = this.comp("detailData").getValue("fMasterID");
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetInViewDialog/assetInViewDialog.w");
		this.comp("wDlgAssetInRecord").open({src:url,data:{operator:"",assetInID:assetInID}});
	};

	return Model;
});