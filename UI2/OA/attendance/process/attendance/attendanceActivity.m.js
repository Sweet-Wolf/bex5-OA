define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var bizUtil = require("$UI/system/lib/base/bizUtil");
	var util = require("$UI/system/lib/base/util");

	require("cordova!cordova-plugin-geolocation");
	require("cordova!cordova-plugin-wifi");

	var Model = function() {
		this.callParent();
		this.date;
		this.systemTime;
		this.timer;
		this.address;
		// this.countTimeData;
		// this.startAMa;
		// this.endAMa;
		// this.startPMa;
		// this.endPMa;
		// this.startAMb;
		// this.endAMb;
		// this.startPMb;
		// this.endPMb;
		this.startTime;
		this.wifiName;
		this.wifiAddr;
	};

	Model.prototype.transWeek = function(date) {
		var week = date.getDay();
		switch (week) {
		case 1:
			week = "一";
			break;
		case 2:
			week = "二";
			break;
		case 3:
			week = "三";
			break;
		case 4:
			week = "四";
			break;
		case 5:
			week = "五";
			break;
		case 6:
			week = "六";
			break;
		case 0:
			week = "日";
			break;
		}
		;
		return week;
	}

	Model.prototype.modelLoad = function(event) {
		this.systemTime = bizUtil.getSystemDatetime();

		var timedata = this.comp("mainData");
		this.countTimeData = timedata.count();

		// this.startAMa = timedata.getValueByID("fStartAM", 1);
		// this.endAMa = timedata.getValueByID("fEndAM", 1);
		// this.startPMa = timedata.getValueByID("fStartPM", 1);
		// this.endPMa = timedata.getValueByID("fEndPM", 1);
		//
		// if (this.countTimeData == 2) {
		// this.startAMb = timedata.getValueByID("fStartAM", 2);
		// this.endAMb = timedata.getValueByID("fEndAM", 2);
		// this.startPMb = timedata.getValueByID("fStartPM", 2);
		// this.endPMb = timedata.getValueByID("fEndPM", 2);
		// }

		// if(this.countTimeData===0){
		// $("[xid=tipSpan]").html("还未安排班次");
		// }
		//		
		// if (this.countTimeData == 2 &&
		// this.comp("checkInOutData").getValue("fCheckInAM") < this.startAMb) {
		// $("[xid = EndTimeSpan]").html("下班时间:" + this.endPMb);
		// } else {
		// $("[xid = EndTimeSpan]").html("下班时间:" + this.endPMa);
		// }

		if (justep.Date.toString(this.systemTime, "HH:mm:ss") > $(this.getElementByXid("tipSpan")).html().split("：")[1]) {
			$("[xid=buttonCheck]").attr("style", "background:orange");
			$("[xid=stateSpan]").html("迟到打卡");
		}

		if (justep.Date.toString(this.systemTime, "hh:mm:ss") < $(this.getElementByXid("EndTimeSpan")).html().split("：")[1]) {
			$("[xid=buttonCheckOut]").attr("style", "background:orange");
			$("[xid=span4]").html("早退打卡");
		}

		var date = new Date();
		var week = this.transWeek(date);
		var time = justep.Date.toString(date, "yyyy年MM月dd日");
		$("[xid=weekSpan]").html("星期" + week);
		$("[xid=dateSpanc]").html(time);

		this.comp("datePicker").setValue(date);
		// 取系统时间，设置计时
		var deadLine = this.systemTime;
		this.timer = window.setInterval(function() {
			$("[xid=systemTime]").html(justep.Date.toString(deadLine, "hh:mm:ss"));
			$("[xid=systemTime2]").html(justep.Date.toString(deadLine, "hh:mm:ss"));
			deadLine = justep.Date.increase(deadLine, 1, "s");
		}, 1000)

		$("[xid=waitDiv]").hide()
		$("[xid=content1]").show()
	};

	Model.prototype.selPickerClick = function(event) {
		this.comp("datePicker").show();
	};

	// 切换日期
	Model.prototype.datePickerOK = function(event) {
		var date = event.source.getValue();
		if (date > bizUtil.getSystemDatetime()) {
			util.hint("只能选择今天或之前的时间", {
				"type" : "danger"
			});
			return;
		}
		this.date = date;
		$("[xid=dateSpanc]").html(justep.Date.toString(date, "yyyy年MM月dd日"));
		var week = this.transWeek(date);
		$("[xid=weekSpan]").html("星期" + week);

		var fPersonID = this.getContext().getCurrentPersonID();
		this.comp("checkInOutData").setFilter(
				"queryMyself",
				"OA_ChekInOut.fPersonID='" + fPersonID + "'AND OA_ChekInOut.fCheckInAM > '" + justep.Date.toString(date, 'yyyy-MM-dd') + "' AND OA_ChekInOut.fCheckInAM < '"
						+ justep.Date.toString(justep.Date.increase(date, 1, "d"), 'yyyy-MM-dd') + "'");
		this.comp("checkInOutData").refreshData();
		if (justep.Date.toString(date, "yyyy-MM-dd") < justep.Date.toString(bizUtil.getSystemDatetime(), "yyyy-MM-dd")) {
			$("[xid=tipSpan]").hide();
			$("[xid=changeStatus]").hide();
			if (this.comp("checkInOutData").count() == 0) {
				$("[xid=col11]").hide();
				$("[xid=tipOutRow]").hide();
				$("[xid=tipInfoRow]").show();
				// 缺少周末判断
			} else if (!this.comp("checkInOutData").val("fCheckOutPM")) {
				$("[xid=tipInfoRow]").hide();
				$("[xid=checkOut]").hide();
			} else {
				$("[xid=tipOutRow]").hide();
				$("[xid=tipInfoRow]").hide();
			}
		} else if (justep.Date.toString(date, "yyyy-MM-dd") == justep.Date.toString(bizUtil.getSystemDatetime(), "yyyy-MM-dd")) {
			if (!this.comp("checkInOutData").val("fCheckInAM")) {
				$("[xid=col11]").show();
			}
			if (this.comp("checkInOutData").val("fCheckOutPM")) {
				$("[xid=changeStatus]").show();
			}
			$("[xid=tipOutRow]").hide();
			$("[xid=tipInfoRow]").hide();
		}
	};

	Model.prototype.modelInactive = function(event) {
		window.clearInterval(this.timer);
	};

	Model.prototype.modelParamsReceive = function(event) {
		var self = this;
		if (window.plugins && window.plugins.WifiAdmin) {
			var wf = window.plugins.WifiAdmin;
			wf.getWifiInfo(function(data) {
				var wifiConnected = data['activity'];
				if (wifiConnected["SSID"]) {
					self.wifiName = wifiConnected["SSID"];
					self.wifiAddr = wifiConnected["BSSID"];
				}
			})
		}

		require([ 'http://api.map.baidu.com/api?v=2.0&ak=o9pzum8sF8s3wqodZnt9S5OsKlLdjOil&callback=_baiduInit' ], function() {
			if (window.BMap && window.BMap.Map) {
				window._baiduInit();
			}
		});
		window._baiduInit = function() {
			var geoc = new BMap.Geocoder();
			var success = function(data) {
				var longitude = data.coords.longitude;
				var latitude = data.coords.latitude;
				var coorType = data.coorType || "gps";
				if (coorType == "bd09ll") {
					geoc.getLocation(new BMap.Point(longitude, latitude), function(rs) {
						self.address = rs.address + rs.surroundingPois[0].title;
					})
				} else if (coorType == "gps") {
					$.ajax({
						method : "GET",
						url : "/baas/bmap/api/convertLocation",
						cache : false,
						data : {
							longitude : longitude,
							latitude : latitude
						}
					}).done(function(result) {
						var bmapResult = JSON.parse(result);
						var lon = bmapResult.result[0].x;
						var lat = bmapResult.result[0].y;
						geoc.getLocation(new BMap.Point(lon, lat), function(rs) {
							self.address = rs.address + rs.surroundingPois[0].title;
						})
					})
				}
			}

			var error = function(e) {
				justep.Util.hint("获取地理位置失败，暂时采用默认地址");
				// 经纬度116.468497,39.871319
				// 地址 -- 北京市朝阳区东三环南路98号高和蓝峰大厦18层
				// 名称 -- 北京起步科技有限公司
				var lon = 116.468497;
				var lat = 39.871319;
				self.address = "北京市朝阳区东三环南路98号高和蓝峰大厦18层,北京起步科技有限公司";
			}

			navigator.geolocation.getCurrentPosition(success, error);

		}
	};

	// self=this xid=元素xid str打卡状态说明
	Model.prototype.wifiOrAddr = function(self, xid, str, dialog) {
		var mainData = self.comp("mainData");
		var sysTime = justep.Date.toString(bizUtil.getSystemDatetime(), "HH:mm:ss");
		var date = $(self.getElementByXid(xid)).html().split("：")[1];
		if (mainData.val("wifiName")) {
			if (self.wifiName && mainData.val("wifiAddr").indexOf(self.wifiAddr) != -1) {
				if (xid == "tipSpan" ? sysTime > date : sysTime < date) {
					self.comp(dialog).set({
						"title" : str
					});
					self.comp(dialog).open({
						"data" : {
							"systemTime" : bizUtil.getSystemDatetime(),
							"address" : "",
							"wifi" : self.wifiName
						}
					})
				} else {
					if (dialog == "remarkDialog") {
						self.comp("checkInOutData").newData();
						self.comp("checkInOutData").setValue("fCheckInAM", bizUtil.getSystemDatetime());
						self.comp("checkInOutData").setValue("fCheckAreaAM", self.wifiName);
						self.comp("checkInOutData").setValue("fCheckSite", "wifi");
						self.comp("checkInOutData").saveData();
					} else {
						self.comp("checkInOutData").setValue("fCheckOutPM", bizUtil.getSystemDatetime());
						self.comp("checkInOutData").setValue("fCheckAreaPM", self.wifiName.slice(1, -1));
						self.comp("checkInOutData").saveData();
					}
				}
			} else {
				if (self.address) {
					if (xid == "tipSpan" ? sysTime > date : sysTime < date) {
						self.comp(dialog).set({
							"title" : str
						});
						self.comp(dialog).open({
							"data" : {
								"systemTime" : bizUtil.getSystemDatetime(),
								"address" : self.address,
								"wifi" : ""
							}
						})
					} else {
						if (dialog == "remarkDialog") {
							self.comp("checkInOutData").newData();
							self.comp("checkInOutData").setValue("fCheckInAM", bizUtil.getSystemDatetime());
							self.comp("checkInOutData").setValue("fCheckAreaAM", self.address);
							self.comp("checkInOutData").setValue("fCheckSite", "map");
							self.comp("checkInOutData").saveData();
						} else {
							self.comp("checkInOutData").setValue("fCheckOutPM", bizUtil.getSystemDatetime());
							self.comp("checkInOutData").setValue("fCheckAreaPM", self.address);
							self.comp("checkInOutData").saveData();
						}
					}
				}
			}
		} else {
			if (self.address) {
				if (xid == "tipSpan" ? sysTime > date : sysTime < date) {
					self.comp(dialog).set({
						"title" : str
					});
					self.comp(dialog).open({
						"data" : {
							"systemTime" : bizUtil.getSystemDatetime(),
							"address" : self.address,
							"wifi" : ""
						}
					})
				} else {
					if (dialog == "remarkDialog") {
						self.comp("checkInOutData").newData();
						self.comp("checkInOutData").setValue("fCheckInAM", bizUtil.getSystemDatetime());
						self.comp("checkInOutData").setValue("fCheckAreaAM", self.address);
						self.comp("checkInOutData").setValue("fCheckSite", "map");
						self.comp("checkInOutData").saveData();
					} else {
						alert("come")
						self.comp("checkInOutData").setValue("fCheckOutPM", bizUtil.getSystemDatetime());
						self.comp("checkInOutData").setValue("fCheckAreaPM", self.address);
						self.comp("checkInOutData").saveData();
					}
				}
			}
		}
	}

	// 签到按钮判断
	Model.prototype.buttonCheckInClick = function(event) {
		if (this.comp("mainData").count() === 0) {
			util.hint("还未安排班次，请与管理员联系");
			return;
		}
		this.wifiOrAddr(this, "tipSpan", "迟到打卡", "remarkDialog");
	};

	Model.prototype.buttonCheckOutClick = function(event) {
		this.wifiOrAddr(this, "EndTimeSpan", "早退打卡", "remarkOutDialog");
	};

	Model.prototype.remarkDialogReceived = function(event) {
		var fPersonID = this.getContext().getCurrentPersonID();
		var date = new Date();
		this.comp("checkInOutData").setFilter(
				"queryMyself",
				"OA_ChekInOut.fPersonID='" + fPersonID + "'AND OA_ChekInOut.fCheckInAM > '" + justep.Date.toString(date, 'yyyy-MM-dd') + "' AND OA_ChekInOut.fCheckInAM < '"
						+ justep.Date.toString(justep.Date.increase(date, 1, "d"), 'yyyy-MM-dd') + "'");
		this.comp("successDialog").show();
		this.comp("checkInOutData").refreshData();
	};

	Model.prototype.remarkOutDialogReceived = function(event) {
		var fPersonID = this.getContext().getCurrentPersonID();
		var date = new Date();
		this.comp("checkInOutData").setFilter(
				"queryMyself",
				"OA_ChekInOut.fPersonID='" + fPersonID + "'AND OA_ChekInOut.fCheckInAM > '" + justep.Date.toString(date, 'yyyy-MM-dd') + "' AND OA_ChekInOut.fCheckInAM < '"
						+ justep.Date.toString(justep.Date.increase(date, 1, "d"), 'yyyy-MM-dd') + "'");
		this.comp("successOutDialog").show();
		this.comp("checkInOutData").refreshData();
	};

	Model.prototype.changeStatusClick = function(event) {
		alert(this.comp("checkInOutData").getValue("fCheckSite"));
		if (this.comp("checkInOutData").getValue("fCheckSite") == "wifi") {
			this.comp("remarkOutDialog").set({
				"title" : "更换打卡"
			})
			this.comp("remarkOutDialog").open({
				"data" : {
					"systemTime" : bizUtil.getSystemDatetime(),
					"address" : "",
					"wifi" : this.wifiName,
					"standTime" : $(this.getElementByXid("EndTimeSpan")).html().split("：")[1]
				}
			});
		} else {
			this.comp("remarkOutDialog").set({
				"title" : "更换打卡"
			})
			this.comp("remarkOutDialog").open({
				"data" : {
					"systemTime" : bizUtil.getSystemDatetime(),
					"address" : this.address,
					"wifi" : "",
					"standTime" : $(this.getElementByXid("EndTimeSpan")).html().split("：")[1]
				}
			});
		}
	};

	Model.prototype.modelModelConstruct = function(event) {
		var ctx = this.getContext();
		var fPersonID = ctx.getCurrentPersonID();
		var date = new Date();
		this.comp("checkInOutData").setFilter(
				"queryMyself",
				"OA_ChekInOut.fPersonID='" + fPersonID + "'AND OA_ChekInOut.fCheckInAM > '" + justep.Date.toString(date, 'yyyy-MM-dd') + "' AND OA_ChekInOut.fCheckInAM < '"
						+ justep.Date.toString(justep.Date.increase(date, 1, "d"), 'yyyy-MM-dd') + "'");
	};

	Model.prototype.attenContentsActiveChange = function(event) {
		var to = event.to;
		if (to == 1) {
			$('.x-window-container', this.comp('attenContents').$domNode).css('display', 'none');
			this.comp('navContainer').$domNode.css('display', 'block');
			this.comp("navContainer").refresh();
		}
	};

	Model.prototype.AttendanceAdminBtnClick = function(event) {
		var url = "$UI/OA/attendance/process/attendance/AttendanceManagerActivity.m.w?process=/OA/attendance/process/attendance/attendanceProcess&Activity=AttendanceManagerActivity";
		justep.Shell.showPage(url);
	};

	Model.prototype.mainDataCustomRefresh = function(event) {
		var params = new biz.Request.ActionParam();
		var ctx = this.getContext();
		var self = this;
		params.setParam("personID", ctx.getCurrentPersonID());
		biz.Request.sendBizRequest({
			contentType : 'application/json',
			dataType : "json",
			"context" : ctx,
			"action" : "queryOA_AttendanceGroupAction",
			"parameters" : params,
			"callback" : function(data) {
				if (data.state) {
					var resultData = data.response["AttendanceInfo"];
					if (resultData) {
						self.comp("mainData").clear();
						self.comp("mainData").loadData(resultData);
					}
				}
			}
		});
	};

	Model.prototype.getStartTime = function() {
		var data = this.comp("mainData");
		data.refreshData();
		var date = justep.Date.toString(bizUtil.getSystemDatetime(), "HH:mm:ss");
		if (data.count() > 0) {
			var time = data.val("fAMPM").split("   ");
			time.sort();
			this.startTime = []
			for (var i = 0; i < time.length; i++) {
				this.startTime.push(time[i].split("-"));
			}

			var str = "";
			for (var i = 0; i < this.startTime.length; i++) {
				if (this.startTime[i][0] > date) {
					str = "上班时间：" + this.startTime[i][0];
				}
			}
			if (str) {
				return str
			} else {
				return "上班时间：" + this.startTime[this.startTime.length - 1][0];
			}

		} else if (data.count() == 0) {
			return "你未被安排考勤组,请联系管理员";
		}
	}

	Model.prototype.getEndTime = function() {
		if ($(this.getElementByXid("tipSpan")).html().split("：").length > 1) {
			var start = $(this.getElementByXid("tipSpan")).html().split("：")[1];
			for (var i = 0; i < this.startTime.length; i++) {
				if (start == this.startTime[i][0]) {
					return "下班时间：" + this.startTime[i][1];
				}
			}
		} else {
			return "你未被安排考勤组,请联系管理员";
		}
	}

	return Model;
});