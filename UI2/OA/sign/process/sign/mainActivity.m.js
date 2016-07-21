define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var util = require("$UI/system/lib/base/util");

	require("cordova!cordova-plugin-geolocation");

	var Model = function() {
		this.callParent();
		this.lng = justep.Bind.observable();
		this.lat = justep.Bind.observable();
	};

	var signTime, signAddr;

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
		var ctx = this.getContext();
		var personName = ctx.getCurrentPersonName();
		$("[xid=personName]").html(personName);
		this.comp("personData").clear();
		this.comp("personData").loadData([ {
			"fPersonName" : personName
		} ], true);
		this.detailDialogClose();

		var date = new Date();
		var week = this.transWeek(date);
		$("[xid=weekSpan]").html("星期" + week);
		var time = justep.Date.toString(date, "yyyy-MM-dd");
		$("[xid=dateSpan]").html(time);
		$("[xid=timeSpan]").html(justep.Date.toString(date, "hh:mm"));
		signTime = justep.Date.toString(date, "hh:mm");
		
		$("[xid=waitDiv]").hide();
		$("[xid=content1]").show();
	};

	Model.prototype.signImageClick = function(event) {
		signAddr = this.comp("statusData").getValue("address");
		if (signAddr) {
			this.comp("detailDialog").open({
				"data" : [ signTime, signAddr ]
			});
		} else {
			util.hint("请等待获取地理位置!")
		}
	};

	Model.prototype.detailDialogClose = function(event) {
		this.comp("mainData").refreshData();
	};

	Model.prototype.mainDataCustomRefresh = function(event) {
		var append = event.options && event.options.append;
		var ctx = this.getContext();
		var self = this;
		var params = new biz.Request.ActionParam();
		var date = new Date();
		var time = justep.Date.toString(date, "yyyy-MM-dd");
		params.setParam('strDate', time);
		biz.Request.sendBizRequest({
			contentType : 'application/json',
			dataType : "json",
			"context" : ctx,
			"action" : "querySignCountAction",
			"parameters" : params,
			"callback" : function(data) {
				if (data.state) {
					var resultData = data.response["signData"];
					if (resultData) {
						event.source.loadData(resultData, append);
					}
				}
			}
		});
	};

	Model.prototype.loadBMap = function(addr, addrPoint) {
		var id = this.getIDByXID("baiduMap");
		var self = this;

		var mainData = this.comp("statusData");
		window._baiduInit = function() {
			var longitude, latitude;
			var map = new BMap.Map(id); // 创建地图对象，可以设置地图缩放最大最小级别，设置是否显示POI点击
			var geoc = new BMap.Geocoder(); // 116.468439,39.871337
			var geol = new BMap.Geolocation()
			if (addrPoint) {
				var nowPoint = new BMap.Point(addrPoint.lng, addrPoint.lat);
				map.centerAndZoom(new BMap.Point(addrPoint.lng, addrPoint.lat), 17);
				map.setCurrentCity("北京");
				map.disableDragging();// 禁止拖拽地图
				map.disableDoubleClickZoom()// 禁止双击方法地图你
				var marker = new BMap.Marker(nowPoint);
				map.addOverlay(marker);
				geoc.getLocation(nowPoint, function(rs) {
					mainData.setValue("address", addr);
				})
			} else {
				var success = function(data) {
					var coorType = data.coorType || "gps";
					var longitude = data.coords.longitude
					var latitude = data.coords.latitude;
					if(coorType == "bd09ll"){
						var nowPoint = new BMap.Point(longitude, latitude);
						map.centerAndZoom(nowPoint, 17);
						map.setCurrentCity("北京");
						map.disableDragging();// 禁止拖拽地图
						map.disableDoubleClickZoom()// 禁止双击放大地图你
						var marker = new BMap.Marker(nowPoint);
						map.addOverlay(marker);
						geoc.getLocation(nowPoint, function(rs) {
							mainData.setValue("address", rs.address + rs.surroundingPois[0].title);
						})
					}else if(coorType == "gps"){
						$.ajax({
							method: "GET",
							url:"/baas/bmap/api/convertLocation",
							cache:false,
							data:{
								longitude:longitude,
								latitude:latitude
							}
						}).done(function(result) {
							var bmapResult = JSON.parse(result);
							var lon = bmapResult.result[0].x;
							var lat = bmapResult.result[0].y;
							var nowPoint = new BMap.Point(lon, lat);
							map.centerAndZoom(nowPoint, 17);
							map.setCurrentCity("北京");
							map.disableDragging();// 禁止拖拽地图
							map.disableDoubleClickZoom()// 禁止双击放大地图你
							var marker = new BMap.Marker(nowPoint);
							map.addOverlay(marker);
							geoc.getLocation(nowPoint, function(rs) {
								mainData.setValue("address", rs.address + rs.surroundingPois[0].title);
							})
						})
					}
				};

				var fail = function(e) {
					justep.Util.hint("获取地理位置失败，暂时采用默认地址");
					var map = new BMap.Map(id);
					map.centerAndZoom(new BMap.Point(116.468497,39.871319), 17);
					map.setCurrentCity("北京");
					map.disableDragging();// 禁止拖拽地图
					map.disableDoubleClickZoom()// 禁止双击方法地图你
					var marker = new BMap.Marker(new BMap.Point(116.468497,39.871319));
					map.addOverlay(marker);
					geoc.getLocation(new BMap.Point(116.468497,39.871319), function(rs) {
						mainData.setValue("address", rs.address + rs.surroundingPois[0].title);
					})
				};
				navigator.geolocation.getCurrentPosition(success, fail);

			}

		}
		require([ 'http://api.map.baidu.com/api?v=2.0&ak=o9pzum8sF8s3wqodZnt9S5OsKlLdjOil&callback=_baiduInit' ], function() {
			if (window.BMap && window.BMap.Map) {
				window._baiduInit();
			}
		});

		$("[xid=mapBtn]").click(function() {
			self.comp("mapDialog").open();
		})

		$("[xid=baiduMap]").css({
			"width" : "100%",
			"height" : "150px;"
		})
		
	}

	Model.prototype.mapDialogReceive = function(event) {
		var addrStr = event.data.data[0];// 微调后的地址信息
		var addrPoint = event.data.data[1];// 微调后的经纬度对象

		this.loadBMap(addrStr, addrPoint);
	};

	Model.prototype.modelParamsReceive = function(event) {
		this.comp("statusData").setValue("address", "");
		this.loadBMap();
	};

	Model.prototype.personIDDataCustomRefresh = function(event) {
		var fpersonID = this.getContext().getCurrentPersonID();
		var data = this.comp("personIDData");
		data.loadData([ {
			"fpersonID" : fpersonID
		} ], true);
	};

	Model.prototype.statisticsClick = function(event){
		justep.Shell.showPage("$UI/OA/sign/process/sign/statisticsActivity.m.w?process=/OA/sign/process/sign/signProcess&activity=statisticsActivity")
	};

	return Model;
});