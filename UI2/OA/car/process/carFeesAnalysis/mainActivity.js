define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.bSearchClick = function(event){
		debugger;
		var dTemp = this.comp('dTemp');
		var year = dTemp.getValue('year');
		var month1 = dTemp.getValue('month1');
		var month2 = dTemp.getValue('month2');
		if(year.value == ''){
			alert('请输入完整年份！');
			return;
		}
		if (month1.value == '' || month2.value == '') {
			alert('请输入完整月范围！');
			return;
		} else if (month2 < month1) {
			alert('起始月份必须小于等于终止月份！');
			return;
		}
		var d1 = this.comp('d1');
		d1.setStringVar("year", year);
		d1.setStringVar("month1", month1);
		d1.setStringVar("month2", month2);
		this.comp('report').refresh();
	
	};

	return Model;
});