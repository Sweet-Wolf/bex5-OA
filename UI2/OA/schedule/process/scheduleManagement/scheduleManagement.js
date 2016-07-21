define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	var Model = function() {
		this.callParent();
	};

	Model.prototype.showSchedule = function(param) {
		var url = new justep.URL(require.toUrl('$UI/OA/schedule/process/schedule/schedule.w'));
		url.setParam({
			activity : this.getContext().getActivity()
		});
		url.setParam({
			process : this.getContext().getProcess()
		});
		url.setParam(param);
		justep.Portal.openWindow(url.toString(),{title:'日程安排'});
	};

	Model.prototype.modelActive = function(event) {
		this.refreshData("dList");
	};
	
	Model.prototype.refreshData = function(dataxid){
		var data = this.comp(dataxid);
		var refresh = data.confirmRefresh;
		data.confirmRefresh = false;
		data.refreshData();
		data.confirmRefresh = refresh;
	}
	
	Model.prototype.newData = function(event) {
		this.showSchedule({
			action : 'new'
		})
	};

	Model.prototype.openDetail = function(event) {
		this.showSchedule({
			rowid : event.rowID
		});
	};

	Model.prototype.deleteSchedule = function(event) {
		var ensureDeleteAlert = this.comp("ensureDeleteAlert");
		var self = this;
		ensureDeleteAlert.show({
			callback : function(param) {
				if (param.button === 'yes') {
					var mainInstance = self.comp("dList");
					var fCreatePsnID = mainInstance.getValue('fCreatePsnID');
					var currentPsnID = self.getContext().getCurrentPersonID();
					if (fCreatePsnID !== currentPsnID) {
						self.showAlert({
							text : '您没有删除权限！',
							type : 'warning'
						})
						return;
					}
					var rowid = mainInstance.getCurrentRowID();
					self.callDeleteSchedule(rowid);
					self.refreshData("dList");
				}
			}
		});
	};

	Model.prototype.callDeleteSchedule = function(fID) {
		var options = {};
		var process = this.getContext().getProcess();
		var activity = this.getContext().getActivity();
		var param = new biz.Request.ActionParam();
		var action = "deleteScheduleAction";
		param.setString('fID', fID);
		options.activity = activity;
		options.process = process;
		options.action = action;
		options.parameters = param;
		var r = biz.Request.sendBizRequest(options);
		if (!biz.Request.isBizSuccess(r.responseJSON)) {
			throw new Error(biz.Request.getServerError(r, "删除日程失败"));
		}else{
			this.showAlert({text:'删除成功！'});
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
	}

	return Model;
});