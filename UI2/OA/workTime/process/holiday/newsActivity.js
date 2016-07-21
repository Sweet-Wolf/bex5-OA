define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.result = function(){
		//这里实现返回的逻辑
	};

	Model.prototype.OKBtnClick = function(event){
		var data=this.comp("tempData");
		var beginDate = data.getValue('fBeginDate');
		var fEndDate = data.getValue('fEndDate');
		var fLeaveTypeID = data.getValue('fLeaveTypeID');
		var fLeaveTypeName = data.getValue('fLeaveTypeName');
		var fState = data.getValue('fState');
		var fStateName = data.getValue('fStateName');
		var fName = data.getValue('fName');		

		this.comp('wReceiver').windowEnsure({fName:fName,fLeaveTypeID:fLeaveTypeID,fLeaveTypeName:fLeaveTypeName,fState:fState,fStateName:fStateName,fBeginDate:beginDate,fEndDate:fEndDate});
	};

	return Model;
});