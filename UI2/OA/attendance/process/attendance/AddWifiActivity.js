define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/OA/common/js/util");

	var Model = function() {
		this.callParent();
		this.wifiArr = [];
	};

	Model.prototype.modelParamsReceive = function(event) {
		var data =this.params.data;
		data = util.arrRepeat(data);
		var mainData = this.comp("mainData");
		while (data.length > 0) {
			var item = data.shift();
			mainData.newData({
				defaultValues : [ {
					wifiName : item["SSID"],
					wifiMac : item["BSSID"]
				} ]
			})
		}
	};

	Model.prototype.checkbox1Change = function(event) {
		if (event.value) {
			this.wifiArr.push(event.bindingContext.$object);
		}
	};

	Model.prototype.okBtnClick = function(event) {
		if (this.wifiArr.length > 0) {
			this.owner.send({
				data : this.wifiArr
			});
			this.owner.close();
		}else{
			justep.Util.hint("请选择办公wifi！");
		}
	};

	return Model;
});