define(function(require){
	var $ = require("jquery");
	var biz = require('$UI/system/lib/biz');
	var Model = function(){
		this.callParent();
	};
	Model.prototype.modelModelConstructDone = function(event){
		;
		var data = this.comp('mainData');
		var sData1 = this.getContext().getProcessData1();
		if (sData1 == null || sData1 == undefined) {
			data.newData();
		} else {
//			data.refreshData();
			if ((data.getValue("fArrBoardroomID") == "")
					|| (data.getValue("fArrBoardroomID") == null)) {
				data.setValue("fArrBoardroomID", data.getValue("fBoardroomID"));
				data.setValue("fArrBoardroom", data.getValue("fBoardroom"));
			}
			if ((data.getValue("fArrBeginTime") == "")
					|| (data.getValue("fArrBeginTime") == null))
				data.setValue("fArrBeginTime", data.getValue("fBeginTime"));
			if ((data.getValue("fArrEndTime") == "")
					|| (data.getValue("fArrEndTime") == null))
				data.setValue("fArrEndTime", data.getValue("fEndTime"));
			if ((data.getValue("fArrOgnID") == "")
					|| (data.getValue("fArrOgnID") == null)) {
				data.setValue("fArrOgnID", this.getContext().getCurrentOgnID());
				data.setValue("fArrOgnName", this.getContext().getCurrentOgnName());
			}
			if ((data.getValue("fArrDeptID") == "")
					|| (data.getValue("fArrDeptID") == null)) {
				data.setValue("fArrDeptID", this.getContext().getCurrentDeptID()
						|| this.getContext().getCurrentOgnID());
				data.setValue("fArrDeptName", this.getContext().getCurrentDeptName() || this.getContext().getCurrentOgnName());
			}
			if ((data.getValue("fArrPsnID") == "")
					|| (data.getValue("fArrPsnID") == null)) {
				data.setValue("fArrPsnID", this.getContext().getCurrentPersonID());
				data.setValue("fArrPsnName", this.getContext().getCurrentPersonName());
				data.setValue("fArrPsnFID", this.getContext()
						.getCurrentPersonMemberFID());
				data.setValue("fArrPsnFName", this.getContext()
						.getCurrentPersonMemberFName());
			}
			if ((data.getValue("fArrTime") == "")
					|| (data.getValue("fArrTime") == null))
				data.setValue("fArrTime", justep.Date.toString(new Date(),
						justep.Date.STANDART_FORMAT));
						
			data.saveData();
		}
			
	};

	Model.prototype.processBeforeAdvanceQuery = function(event){
		;
		var checkResult = this.checkBoardroomUsed(this.comp("mainData"));
		if (checkResult == "true") {
			alert("会议室已经被占用!")
			// ;
			event.cancel = true;
			return false;
		}
	};
	
	Model.prototype.checkBoardroomUsed = function(data) {
		;
		var options = {};
		var process = this.getContext().getProcess();
		var activity = this.getContext().getActivity();
		var param = new biz.Request.ActionParam();
		param.setString('fBoardroomID', data.getValue("fBoardroomID"));
		param.setString('fBeginTime', data.getValue("fBeginTime"));
		param.setString('fEndTime', data.getValue("fEndTime"));
		param.setString('fArrangeID', data.getCurrentRowID());
		options.process = process;
		options.activity = activity;
		options.parameters = param;
		options.context = this.getContext();
		options.action = "checkBoardroomUsedAction";
		var r = biz.Request.sendBizRequest(options);
		if (!biz.Request.isBizSuccess(r.responseJSON)) {
			throw new Error(biz.Request.getServerError(r, "会议室占用检查失败!"));
		}
		var dVal = r.responseJSON.data.value;
		return dVal;
	};

	return Model;
});
