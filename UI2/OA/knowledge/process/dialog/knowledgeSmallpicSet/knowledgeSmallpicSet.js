define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.kwID;
	};

	Model.prototype.OKBtnClick = function(event){
		;
		var data = this.comp('dKnowledge');
		if (data.isChanged()) {
			data.saveData();
		}
		this.comp('windowReceiver').windowEnsure(this.kwID);
	};

	Model.prototype.windowReceiverReceive = function(event){
		;
		var dKnowledge = this.comp('dKnowledge');
		this.kwID = event.data.kwID;
		dKnowledge.filters.setFilter("dKnowledgeFilter", "OA_KM_Knowledge = '"
				+ this.kwID + "'");
		dKnowledge.refreshData();
		if(dKnowledge.count() == 0){
			var options = {
					defaultValues : [
			 			{OA_KM_Knowledge: this.kwID}
		 			]
				};	
			dKnowledge.newData(options);
		}
	};

	return Model;
});