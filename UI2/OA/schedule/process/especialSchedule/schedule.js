define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		var action = this.getContext().getRequestParameter('action');
		var dSchedule = this.comp("dSchedule");
		if (action === 'new') {
			dSchedule.newData();
		} else {
			var rowid = this.getContext().getRequestParameter('rowid');
			dSchedule.setFilter('_filter_row_', "OA_SD_ScheduleEsp = '" + rowid + "'");
			var refresh = dSchedule.confirmRefresh;
			dSchedule.confirmRefresh = false;
			dSchedule.refreshData();
			dSchedule.confirmRefresh = refresh;
		}
	};

	Model.prototype.addExecutors = function(event) {
		var windowDialog = this.comp("orgDlgSingleDept");
		var mianData = this.comp("dSchedule");
		var fBeginDatePart = mianData.getValue("fBeginDatePart");
		var fBeginTimePart = mianData.getValue("fBeginTimePart");
		var fEndDatePart = mianData.getValue("fEndDatePart");
		var fEndTimePart = mianData.getValue("fEndTimePart");
		if (fBeginDatePart != "" || fEndDatePart != "") {
			if (fBeginDatePart.getTime() > fEndDatePart.getTime()) {
				alert("开始日期必须小于结束日期");
			} else if (fBeginDatePart.getTime() == fEndDatePart.getTime()) {
				if (fBeginTimePart >= fEndTimePart) {
					alert("开始时间必须小于结束时间");
				} else {
					var fBeginTime = fBeginDatePart + 'T' + fBeginTimePart + ':00.000Z';
					var fEndTime = fEndDatePart + 'T' + fEndTimePart + ':00.000Z';
					mianData.setValue("fBeginTime", fBeginTime);
					mianData.setValue("fEndTime", fEndTime);
					windowDialog.open();
				}
			} else if ((fBeginDatePart.getTime() < fEndDatePart.getTime())) {
				var fBeginTime = fBeginDatePart + 'T' + fBeginTimePart + ':00.000Z';
				var fEndTime = fEndDatePart + 'T' + fEndTimePart + ':00.000Z';
				mianData.setValue("fBeginTime", fBeginTime);
				mianData.setValue("fEndTime", fEndTime);
				windowDialog.open();
			}
		}
	};

	Model.prototype.orgDlgSingleDeptReceive = function(event) {
		var rows = event.data;
		this.clearExecutors();
		var dSchedule = this.comp("dSchedule");
		var executorData = this.comp("dExecutor");
		if (rows.length === 0)
			return;
		var defaultValues = [];
		var executors = '';
		var self = this;
		var exitsExecutors = '';
		$.each(rows, function(i, row) {
			var fExecutorID = row.val('fExecutorID');
			var fExecutorName = row.val('fExecutorName');
			if (self.checkPersonSchedule(fExecutorName)) {
				executors += fExecutorName + ',';
				defaultValues.push({
					'fExecutorID' : fExecutorID,
					'fExecutorName' : fExecutorName
				});
			} else {
				exitsExecutors += fExecutorName + ',';
			}
		});
		if (defaultValues.length > 0) {
			executorData.newData({
				defaultValues : defaultValues
			});
			dSchedule.setValue('fExecutors', executors.substring(0, executors.length - 1));
		}
		if (exitsExecutors.length > 0) {
			justep.Util.hint(exitsExecutors.substring(0, exitsExecutors.length - 1) + ':已经存在于选择的时间段内', {
				type : 'warning',
				parent : this.getRootNode()
			});
		}
	};

	Model.prototype.checkPersonSchedule = function(executor) {
		var dScheduleData = this.comp("dSchedule");
		var executorsStr = dScheduleData.getValue("fExecutors");
		var beginDate = dScheduleData.getValue("fBeginTime");
		var endDate = dScheduleData.getValue("fEndTime");
		var title = dScheduleData.getValue("fTitle");
		var param = new biz.Request.ActionParam();
		param.setString('beginDate', beginDate);
		param.setString('title', title);
		param.setString("name", executor);
		param.setString('endDate', endDate);
		var options = {
			'process' : this.getContext().getProcess(),
			'activity' : this.getContext().getActivity(),
			'action' : 'checkPersonScheduleAction',
			'parameters' : param
		}
		var r = biz.Request.sendBizRequest(options);
		if (!biz.Request.isBizSuccess(r.responseJSON)) {
			throw new Error(biz.Request.getServerError(r.responseJSON, '查询日程人员失败'));
		}
		if ($.trim(r.responseJSON.data.value)) {
			return false
		} else {
			return true;
		}
	};

	Model.prototype.clearExecutors = function() {
		var fMasterID = this.comp("dSchedule").getCurrentRowID();
		var param = new biz.Request.ActionParam();
		param.setString('fMasterID', fMasterID);
		var options = {
			'process' : this.getContext().getProcess(),
			'activity' : this.getContext().getActivity(),
			'action' : 'deleteScheduleExecutorsAction',
			'parameters' : param
		}
		var r = biz.Request.sendBizRequest(options);
		if (!biz.Request.isBizSuccess(r.responseJSON)) {
			throw new Error(biz.Request.getServerError(r.responseJSON, '删除日程人员失败'));
		}
		return true;
	};

	Model.prototype.dScheduleBeforeSave = function(event) {
		event.cancel = true;
		var dList = event.source;
		var fBeginDatePart = dList.getValue('fBeginDatePart');
		var fBeginTimePart = dList.getValue('fBeginTimePart');
		var fEndDatePart = dList.getValue('fEndDatePart');
		var fEndTimePart = dList.getValue('fEndTimePart');
		if (fBeginDatePart != "" || fEndDatePart != "") {
			if (fBeginDatePart > fEndDatePart) {
				alert("开始日期必须小于结束日期");
				event.cancel = true;
			} else if (fBeginDatePart == fEndDatePart) {
				if (fBeginTimePart >= fEndTimePart) {
					alert("开始时间必须小于结束时间");
					event.cancel = true;
				}
			}
			dList.setValue('fBeginTime', this.concatDateAndTime(fBeginDatePart, fBeginTimePart));
			dList.setValue('fEndTime', this.concatDateAndTime(fEndDatePart, fEndTimePart));
			event.cancel = false;
		}
	};

	Model.prototype.concatDateAndTime = function(datePartValue, timePartValue) {
		if (datePartValue == "" || timePartValue == "")
			return "";
		var dateAndTime = datePartValue + 'T' + timePartValue + ':00.000Z';
		return dateAndTime;
	}

	Model.prototype.isValidScheduleDateTime = function(self) {
		var instance = self.comp("dSchedule");
		var fBeginDatePart = instance.getValue("fBeginDatePart");
		var fBeginTimePart = instance.getValue("fBeginTimePart");
		var fEndDatePart = instance.getValue("fEndDatePart");
		var fEndTimePart = instance.getValue("fEndTimePart");
		if (fBeginDatePart > fEndDatePart) {
			alert("开始日期必须小于结束日期");
			return false;
		} else if (fBeginDatePart == fEndDatePart) {
			if (fBeginTimePart >= fEndTimePart) {
				alert("开始时间必须小于结束时间");
				return false;
			}
		}
		return true;
	}

	return Model;
});