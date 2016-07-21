define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.readOnly = true;
	};


	Model.prototype.addBtnClick = function(event){
		if(this.readOnly){
			return;
		}
		var sData = this.comp('dCarSafetyInfo');
		sData.newData();
		sData.setValue("fMasterID", this.comp('dUseStatus')
				.getValue("carBasicInfoID"));
			
	
	};

	Model.prototype.windowReceiverReceive = function(event){
		var operator = event.data.operator;
		var carBasicInfoID = event.data.carBasicInfoID;
	
		var sData = this.comp("dCarSafetyInfo");
		var uData = this.comp('dUseStatus');
		if (operator == "edit") {
			this.readOnly = false;
			uData.setValue("useStatus", '0');
			uData.setValue("carBasicInfoID", carBasicInfoID);
	
			sData.filters.setFilter("dataFilter", "OA_CA_CarSafetyInfo.fMasterID='"
					+ carBasicInfoID + "'");
			sData.refreshData();
		} else if (operator == "view") {
			this.readOnly = true;
			uData.setValue("useStatus", '1');
			uData.setValue("carBasicInfoID", carBasicInfoID);
	
			sData.filters.setFilter("dataFilter", "OA_CA_CarSafetyInfo.fMasterID='"
					+ carBasicInfoID + "'");
			sData.refreshData();
		}
		
	};

	
	Model.prototype.isReadOnly = function(){
		return this.readOnly;
	};
	return Model;
});