define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.result = function(){
		//这里实现返回的逻辑
	};
	var data = "", card="";
	Model.prototype.gridRowDblClick = function(event){
		this.returnData(event);
	
	};
	
	Model.prototype.OKBtnClick = function(event){
		this.returnData(event);
	};
	
	Model.prototype.returnData = function() {
		var data = this.comp("dBadgut");
//		var infoIDs = data.getStore().getCheckedRowIds();
		var infoIDs = this.comp('grid').getCheckeds();
		var selectBadgut = "";
		var len = infoIDs.length;
		if (len != 0) {
			for ( var i = 0; i < len; i++) {
				var rowid = infoIDs[i];
				if (selectBadgut == "") {
					selectBadgut = rowid;
				} else {
					selectBadgut += "," + rowid;
				}
			}
			this.comp('wReceiver').windowEnsure(selectBadgut);

		}
}

	

	return Model;
});