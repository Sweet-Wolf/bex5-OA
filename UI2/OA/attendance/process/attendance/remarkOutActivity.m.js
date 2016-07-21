define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.status;
		this.address;
		this.time;
		this.standTime;
	};

	Model.prototype.modelParamsReceive = function(event){
		this.status=event.data.data.status;
		this.address=event.data.data.address;
		this.time=event.data.data.systemTime;
		this.standTime=event.data.data.standTime;
		
		
		this.comp("checkInOutDataDOut").setValue("fCheckOutPM", this.time)
		
		var wifi = event.data.data.wifi;
		if (wifi) {
			this.comp("checkInOutDataDOut").setValue("fCheckAreaPM", wifi.slice(1,-1));
			this.comp("checkInOutDataDOut").setValue("fCheckSite", "wifi");
		} else {
			this.comp("checkInOutDataDOut").setValue("fCheckAreaPM", this.address);
			this.comp("checkInOutDataDOut").setValue("fCheckSite", "map");
		}
	};

	Model.prototype.modelModelConstructDone = function(event){
		var ctx = this.getContext();
		var fPersonID = ctx.getCurrentPersonID();
		var date = new Date();

		this.comp("checkInOutDataDOut").setFilter(
				"queryMyself",
				"OA_ChekInOut.fPersonID='" + fPersonID + "'AND OA_ChekInOut.fCheckInAM > '" + justep.Date.toString(date, 'yyyy-MM-dd') + "' AND OA_ChekInOut.fCheckInAM < '"
						+ justep.Date.toString(justep.Date.increase(date, 1, "d"), 'yyyy-MM-dd') + "'");
	};

	
	Model.prototype.commitBtnClick = function(event){
		var self = this;
		if(justep.Date.toString(this.time, "HH:mm:ss")>this.standTime){
			this.comp("checkInOutDataDOut").setValue("fIsLeaving", "");
		}else{
			this.comp("checkInOutDataDOut").setValue("fIsLeaving", "早退");
		}
		
		this.comp("checkInOutDataDOut").saveData({
		
			"onSuccess" :function(event){
			self.owner.send({"data":""});
			self.owner.close();
			}
		});
		
	};

	Model.prototype.modelLoad = function(event){
		$("[xid=waitDiv]").hide()
		$("[xid=panel1]").show()
	};

	return Model;
});