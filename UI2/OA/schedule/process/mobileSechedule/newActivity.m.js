define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.windowReceiverReceive = function(event) {
		this.comp("scheduleData").clear();
		if (event.data) {
			var detailData = this.comp('scheduleData');
			detailData.setFilter('filter1', "OA_SD_Schedule = '" + event.data + "'");
			detailData.refreshData();
			this.comp("titleBar").setTitle("日程编辑");
		}else {
			this.comp("scheduleData").newData();
			this.comp("titleBar").setTitle("新建日程");
		}
	};

	// 返回前询问是否取消操作
	Model.prototype.listBtnClick = function(event) {
		this.comp("closeMsgDlg").show();
	};

	// 不保存
	Model.prototype.closeMsgDlgClose = function(event) {
		if (event.button == 'yes') {
			this.comp('windowReceiver').windowCancel();
		}
	};

	// 判断与会认是否修改了，保存成功后，返回
	Model.prototype.saveBtnClick = function(event) {
		var data = this.comp('scheduleData');

		if (data.saveData())
			this.comp('windowReceiver').windowEnsure();
	};
	

	
	
	//必填验证
	//fRepeat不是none，fRepeatFrequency必填
//	fRepeat是每周，fWeekRepeat必填
	Model.prototype.scheduleDataBeforeSave = function(event){
		event.cancel = true;
		var dList = this.comp("scheduleData");
		
		
		var startTime = justep.Date.toString(dList.getValue('fBeginTime'), "yyyy-MM-dd hh:mm");
		var endTime = justep.Date.toString(dList.getValue('fEndTime'), "yyyy-MM-dd hh:mm");
	
		dList.setValue('fBeginDatePart',startTime.substr(0,10));
		dList.setValue('fBeginTimePart',startTime.substr(11,5));
		dList.setValue('fEndDatePart',endTime.substr(0,10));
		dList.setValue('fEndTimePart',endTime.substr(11,5));
		
		
		event.cancel = false;
	};
	

	Model.prototype.selectCreatorChange = function(event){
	   debugger;
		var rows = event.value;
		
		var eData = this.comp("dExecutor");
		var sNames = '';
		$.each(rows, function(i, row) {
			var sPersonID = row.val('sPersonID');
			var sName = row.val('sPersonName');
			var returnRows = eData.find([ 'fExecutorID' ], [ sPersonID ], true, true, true, false);
			if (returnRows.length === 0) {// 不添加已添加过的人
				eData.newData({
					defaultValues : [ {
						'fExecutorID' : sPersonID,
						'fExecutorName' : sName
					} ]
				});
				sNames += sName + ',';
			}
		});
		if (sNames) {
			var fExecutors = this.comp("scheduleData").getValue('fExecutors') || '';
			fExecutors = fExecutors ? fExecutors + ',' : fExecutors;
			this.comp("scheduleData").setValue('fExecutors', fExecutors + sNames.substring(0, sNames.length - 1));
		}
		
	};

	return Model;
});


