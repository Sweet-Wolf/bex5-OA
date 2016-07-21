define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
		this.departs;
		this.row;
	};

	Model.prototype.editButtonClick = function(event) {
		var self = this;
		var row = event.bindingContext.$object;
		var fStartAM = row.val("fStartAM");
		var fStartPM = row.val("fStartPM");
		var fEndAM = row.val("fEndAM");
		var fEndPM = row.val("fEndPM");
		var fDepart = row.val("fDepart");
		justep.Shell.showPage("$UI/OA/attendance/process/attendance/departAActivity.m.w", {
			"rowID": self.params.data,
			"fStartAM" : fStartAM,
			"fStartPM" : fStartPM,
			"fEndAM" : fEndAM,
			"fEndPM" : fEndPM,
			"fDepart" : fDepart
		});
	};

	Model.prototype.rowClick = function(event) {
		var code = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'L', 'J', 'K', 'L', 'M', 'N', 'O' ];
		var counts = $("[xid=showList]>li").length;
		var count = code[counts];
		this.comp("timeDlg").open({
			"src" : "$UI/OA/attendance/process/attendance/departBActivity.m.w",
			'data' : {
				"fDepart" : count
			}
		});
	};

	Model.prototype.modelLoad = function(event) {
		var self = this;
		var ctx = this.getContext();
		var params = new biz.Request.ActionParam();
		params.setParam("rowID","");
		biz.Request.sendBizRequest({
			contentType : 'application/json',
			dataType : "json",
			"context" : ctx,
			"action" : "queryAttendanceTimeAction",
			"parameters" : params,
			"callback" : function(data) {
				if (data.state) {
					var resultData = data.response["DepartData"];
					if (resultData) {
						self.comp("showData").clear();
						self.comp("showData").loadData(resultData)
					}
				}
			}
		});

	};

	Model.prototype.saveButtonClick = function(event) {
		var self = this;
		var row = null;
		var time = "";
		var departSign = "";
		$("input[name=choose]").each(function(index, obj) {
			if (obj.nodeName == "INPUT") {
				if (obj.checked) {
					self.comp("showData").each(function(obj) {
						if (obj.index == index) {
							row = this;
						}
					});
				}
			}
		});
		// try {
		departSign = row.val("fDepart");
		time = row.val("fTime");
		// } catch (e) {
		// justep.Util.hint("请选择班次");
		// }
		if (departSign) {
			this.owner.send({
				"departSign" : departSign,
				"time" : time
			});
			this.close();
		}
	};

	Model.prototype.timeDlgReceive = function(event) {
		var self = this;
		var params = new biz.Request.ActionParam();
		var ctx = this.getContext();
		params.setParam("rowID","");
		biz.Request.sendBizRequest({
			contentType : 'application/json',
			dataType : "json",
			"context" : ctx,
			"action" : "queryAttendanceTimeAction",
			"parameters" : params,
			"callback" : function(data) {
				if (data.state) {
					var resultData = data.response["DepartData"];
					if (resultData) {
						self.comp("showData").clear();
						self.comp("showData").loadData(resultData)
					}
				}
			}
		});
		
	};

	return Model;
});