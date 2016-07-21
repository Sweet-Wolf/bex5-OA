define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.rowID = justep.Bind.observable();
	};

	Model.prototype.setAddrDialogReceive = function(event){
		var addrData = event.data.data;
		var addr = addrData[0].split(",")
		var point = addrData[1];
		
		var options = {
				  defaultValues : [
					  {fLongitude:point.lng,
					  fLatitude:point.lat,
					  fAddressDetail:addr[1],
					  fAttenAddrName:addr[0],
					  fAttendanceAdminID:this.rowID.get()
					  }
				  ] 
			}; 
			
		this.comp("OA_AttendanceMap").newData(options);		
	}
	
	Model.prototype.modelParamsReceive = function(event){
		var self = this;
		this.rowID.set(self.params.rowID);
		var rows = self.comp("OA_AttendanceAdmin").find(["OA_AttendanceAdmin"],[self.params.rowID])
		self.comp("fEffectiveRange").val(rows[0].val("fEffectiveRange"));
		var ctx = this.getContext();
		var params = new biz.Request.ActionParam();
		params.setParam("rowID",self.params.rowID);
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
						self.comp("DepartData").clear();
						self.comp("DepartData").loadData(resultData)
					}
				}
			}
		});
	}
	
	Model.prototype.mapDialogReceive = function(event){
		this.comp("setAddrDialog").open({"data":event.data.data});
	}
	
	Model.prototype.saveBtnClick = function(event){
		var range = this.comp("fEffectiveRange").val();
		var mapData = this.comp("OA_AttendanceMap");
		var mainData = this.comp("OA_AttendanceAdmin");
		var weekData = this.comp("weekData");
		if(range && mapData.count()>0){
			mainData.setValueByID("fEffectiveRange", range, this.rowID.get())
			mapData.saveData();
			mainData.saveData();
			weekData.saveData();
			this.owner.close();
			this.comp("wifiData").saveData();
		}
	};
	
	Model.prototype.removeAddrBtnClick = function(event){
		var row = event.bindingContext.$object;
		this.comp("OA_AttendanceMap").deleteData(row);
	};
	
	Model.prototype.addAddrClick = function(event){
		this.comp("mapDialog").open();
	};
	
	Model.prototype.modelModelConstruct = function(event){
		this.comp("OA_AttendanceMap").setFilter("filter","fAttendanceAdminID='"+this.params.rowID+"'");
		this.comp("wifiData").setFilter("filter","fAttendanceAdminID='"+this.params.rowID+"'");
		this.comp("weekData").setFilter("filter","fAttendanceAdminID='"+this.params.rowID+"'");
	};
	
	Model.prototype.removeWifiClick = function(event){
		var row = event.bindingContext.$object;
		this.comp("wifiData").deleteData(row);
	};


	Model.prototype.addWifiClick = function(event){
		var wifiList = [];
		var wifiData = this.comp("wifiData");
		if (window.plugins && window.plugins.WifiAdmin) {
			var wf = window.plugins.WifiAdmin;
			wf.getWifiInfo(function(data){
				var list = data["available"];
				while(list.length>0){
					var item = list.shift();
					var rows = wifiData.find([ "fMacAddress" ], [ item["BSSID"] ]);
					if (rows.length <= 0) {
						wifiList.push(item);
					}
				}
			});
		}
		this.comp("wifiDialog").open({data:wifiList});
	};


	Model.prototype.wifiDialogReceive = function(event){
		var data = event.data.data;
		for (var i = 0; i < data.length; i++) {
			this.comp("wifiData").newData({
				defaultValues : [ {
					fAttendanceAdminID:this.params.rowID,
					fWifiName : data[i].val("wifiName"),
					fMacAddress : data[i].val("wifiMac")
				} ]
			})
		}
	};


	Model.prototype.setAttenTimeClick = function(event){
		this.comp("WeekDialog").open({data:this.params.rowID});
	};


	Model.prototype.WeekDialogReceive = function(event){
		var data = event.data.data;
		var weekData = this.comp("weekData");
		weekData.setValue("fMonday", data.val("fMonday"));
		weekData.setValue("fTuesday", data.val("fTuesday"));
		weekData.setValue("fWednesday", data.val("fWednesday"));
		weekData.setValue("fThursday", data.val("fThursday"));
		weekData.setValue("fFriday", data.val("fFriday"));
		weekData.setValue("fSaturday", data.val("fSaturday"));
		weekData.setValue("fSunday", data.val("fSunday"));
		weekData.setValue("fDepart", data.val("fDepart"));
		weekData.setValue("fDepartTime", data.val("fDepartTime"));
	};


	return Model;
});