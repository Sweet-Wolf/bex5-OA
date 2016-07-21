define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};


	

	Model.prototype.getDlgData = function() {
		return this.comp("dBoardroom");
	}

	Model.prototype.modelModelConstructDone = function(event){
		var operator = this.getContext().getRequestParameter("operator");
		var id = this.getContext().getRequestParameter("id");

		var data = this.comp("dBoardroom");
		if (operator == "new") {
			data.newData();
		} else  {
		    data.filters.setFilter("Filter", "OA_MT_Boardroom='" + id + "'");
			data.refreshData();	
			
		}
	};
	
	Model.prototype.dataReadonly = function(self) {
		var operator = self.getContext().getRequestParameter("operator");
		if(operator === 'new'){
			return false;
		}else {
			return true;
		}
	}
	
	return Model;
});