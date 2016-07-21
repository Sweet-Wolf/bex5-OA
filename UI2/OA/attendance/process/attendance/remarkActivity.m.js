define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
		this.status;
		this.address;
		this.time;
	};

	Model.prototype.modelParamsReceive = function(event) {
		this.comp("checkInOutDataD").newData();
		this.status = event.data.data.status;
		this.address = event.data.data.address;
		this.time = event.data.data.systemTime;

		this.comp("checkInOutDataD").setValue("fCheckInAM", this.time)
		var wifi = event.data.data.wifi;
		if (wifi) {
			this.comp("checkInOutDataD").setValue("fCheckAreaAM", wifi.slice(1,-1));
			this.comp("checkInOutDataD").setValue("fCheckSite", "wifi");
		} else {
			this.comp("checkInOutDataD").setValue("fCheckAreaAM", this.address);
			this.comp("checkInOutDataD").setValue("fCheckSite", "map");
		}
	};

	Model.prototype.modelModelConstructDone = function(event) {
		var ctx = this.getContext();
		var fPersonID = ctx.getCurrentPersonID();
		var date = new Date();

		this.comp("checkInOutDataD").setFilter(
				"queryMyself",
				"OA_ChekInOut.fPersonID='" + fPersonID + "'AND OA_ChekInOut.fCheckInAM > '" + justep.Date.toString(date, 'yyyy-MM-dd') + "' AND OA_ChekInOut.fCheckInAM < '"
						+ justep.Date.toString(justep.Date.increase(date, 1, "d"), 'yyyy-MM-dd') + "'");
	};

	Model.prototype.commitBtnClick = function(event) {
		var self = this;
		this.comp("checkInOutDataD").setValue("fIsLate", "迟到");
		this.comp("checkInOutDataD").saveData({

			"onSuccess" : function(event) {
				self.owner.send({
					"data" : ""
				});
				self.owner.close();
			}
		});

	};

	Model.prototype.modelLoad = function(event) {
		$("[xid=waitDiv]").hide()
		$("[xid=panel1]").show()
	};

	return Model;
});