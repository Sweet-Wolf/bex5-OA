define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
		this.checkedArray = new Array();
	};

	Model.prototype.result = function() {
		// 这里实现返回的逻辑
	};

	Model.prototype.OKBtnClick = function(event) {
		//var selection = this.comp("dataTables").getCheckeds();
		this.comp('windowReceiver').windowEnsure(this.checkedArray);
	};



	Model.prototype.dataTablesRowChecked = function(event){
		;
		var index = this.getCheckedArrayIndex(event.row)
		if(event.checked){
			if(index == -1){
				this.checkedArray.push(event.row);
			}
		}else{
			if(index != -1){
				for (var i=index;i<this.checkedArray.length - 1;i++){
					this.checkedArray[i] = this.checkedArray[i+1]
				}
				this.checkedArray.pop();
			}
		}
	};
	
	Model.prototype.getCheckedArrayIndex = function(row){
		;
		for (var i=0;i<this.checkedArray.length;i++){
			if(this.checkedArray[i].getID() == row.getID()){
				return i
			}
		}
		return -1;
	};



	Model.prototype.mainDataAfterRefresh = function(event){
		;
		var dataTables = this.comp("dataTables");
		var me = this;
		event.source.each(function(param){
			if(me.getCheckedArrayIndex(param.row) != -1){
				dataTables.setRowChecked(param.row,true);
			}
		});
	};



	return Model;
});