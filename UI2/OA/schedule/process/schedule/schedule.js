define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
		this.isReadonly = false;
	};

	Model.prototype.modelLoad = function(event) {
		var action = this.getContext().getRequestParameter('action');
		var dSchedule = this.comp("dSchedule");
		if (action === 'new') {
			dSchedule.newData();
		} else {
			var rowid = this.getContext().getRequestParameter('rowid');
			dSchedule.setFilter('_filter_row_', "OA_SD_Schedule = '" + rowid + "'");
			var refresh = dSchedule.confirmRefresh;
			dSchedule.confirmRefresh = false;
			dSchedule.refreshData();
			dSchedule.confirmRefresh = refresh;
		}
	};

	Model.prototype.addExecutors = function(event) {
		if (!this.isValidScheduleDateTime())
			return false;
		var windowDialog = this.comp("orgDlgSingleDept");
		windowDialog.open();
	};

	Model.prototype.orgDlgSingleDeptReceive = function(event) {
		var rows = event.data;
		var eData = this.comp("dExecutor");
		var sNames = '';
		$.each(rows, function(i, row) {
			var sPersonID = row.val('sPersonID');
			var sName = row.val('sName');
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
			var fExecutors = this.comp("dSchedule").getValue('fExecutors') || '';
			fExecutors = fExecutors ? fExecutors + ',' : fExecutors;
			this.comp("dSchedule").setValue('fExecutors', fExecutors + sNames.substring(0, sNames.length - 1));
		}
	};

	Model.prototype.dScheduleBeforeSave = function(event) {
		event.cancel = true;
		var dList = event.source;
		var fBeginDatePart = dList.getValue('fBeginDatePart');
		var fBeginTimePart = dList.getValue('fBeginTimePart');
		var fEndDatePart = dList.getValue('fEndDatePart');
		var fEndTimePart = dList.getValue('fEndTimePart');
		dList.setValue('fBeginTime', this.concatDateAndTime(fBeginDatePart, fBeginTimePart));
		dList.setValue('fEndTime', this.concatDateAndTime(fEndDatePart, fEndTimePart));
		event.cancel = false;
	};

	Model.prototype.concatDateAndTime = function(datePartValue, timePartValue) {
		if (datePartValue == "" || timePartValue == "")
			return "";
		var dateAndTime = datePartValue + 'T' + timePartValue + ':00.000Z';
		return dateAndTime;
	}

	Model.prototype.isValidScheduleDateTime = function() {
		debugger
		var instance = this.comp("dSchedule");
		var fBeginDatePart = instance.getValue("fBeginDatePart");
		var fBeginTimePart = instance.getValue("fBeginTimePart");
		var fEndDatePart = instance.getValue("fEndDatePart");
		var fEndTimePart = instance.getValue("fEndTimePart");
		if (fBeginDatePart != "" || fEndDatePart != "") {
			if (fBeginDatePart.getTime() > fEndDatePart.getTime()) {
				this.showAlert({
					text : '开始日期必须小于结束日期',
					type : 'warning'
				});
				return false;
			} else if (fBeginDatePart.getTime() == fEndDatePart.getTime()) {
				if (fBeginTimePart >= fEndTimePart) {
					this.showAlert({
						text : '开始时间必须小于结束时间',
						type : 'warning'
					});
					return false;
				}
			}
		}
		return true;
	}

	Model.prototype.showAlert = function(param) {
		var text = param.text;
		var type = param.type || 'success';
		justep.Util.hint(text, {
			type : type,
			parent : this.getRootNode()
		});
	};

	Model.prototype.gridSelect2UpdateValue = function(event){
		if (!this.isValidScheduleDateTime()) {
			this.comp("dSchedule").setValue('fEndTimePart', '');
		}
	};

	return Model;
});