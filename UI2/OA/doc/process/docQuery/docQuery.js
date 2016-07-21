define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.grdDocRowDblClick = function(event){
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var dDoc = this.comp("dDoc");
		var rowid = dDoc.getCurrentRowID();
		var docType = dDoc.getValue("fDocType");
		if (rowid && (rowid != "")) {
			var fDocKindName = dDoc.getValue("fDocKindName");
			var dlg;
			var options;
			if(fDocKindName == "电话记录"){
				dlg = this.comp('dlgDocQueryTelephone');
				options = {
					rowid:rowid
				};
			}else{
				dlg = this.comp('dlgDocDetailQuery');
				options = {
					rowid:rowid,
					docType:docType
				};
			}
			dlg.set({
				process:process,
				activity:activity
			});
			dlg.open({data:options})
		}
	};

	return Model;
});