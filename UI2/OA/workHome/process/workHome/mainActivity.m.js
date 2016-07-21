define(function(require) {
	var $ = require("jquery");
	var util = require("$UI/system/lib/base/util");  
	var justep = require("$UI/system/lib/justep");
	
	var Model = function() {
		this.callParent();
		this.labelStr = justep.Bind.observable("");
	};

	// 单击跳转相应页面事件
	Model.prototype.applyListClick = function(event) {
		var btn = this.comp("compileBtn");
		if (btn.get("label") == "编辑") {
			var row = event.bindingContext.$object;
			var url = row.row.fUrl.value.latestValue;
			var process = row.row.fProcess.value.latestValue;
			var activity = row.row.fActitvty.value.latestValue;
			url = url + '?' + 'process=' + process + '&activity=' + activity;
			justep.Shell.showPage(url);
		}
	};

	Model.prototype.removeBtnClick = function(event) {
		var ctx = this.getContext();
		var personID = ctx.getCurrentPersonID();
		var data = this.comp("applyBizData");
		data.deleteData(event.bindingContext.$object);
		var count = this.comp('applyBizData').count(function(ev){
			var v = ev.source.getValue('fPresonID',ev.row);
			return v.indexOf(personID)==0;
	    });
	    var btn = this.comp("compileBtn");
		if(count == 0){
			btn.set({
				"label" : "编辑",
				"icon" : "dataControl dataControl-pencill"
			})
		}
	};

	Model.prototype.compileBtnClick = function(event) {
		var btn = this.comp("compileBtn");
		var ctx = this.getContext();
		var personID = ctx.getCurrentPersonID();
		var data = this.comp("applyBizData");
		var count = data.count(function(ev){
			var v = ev.source.getValue('fPresonID',ev.row);
			return v.indexOf(personID)==0;
	    });
	    
	    if(count == 0){
	    	util.hint("请先添加功能...")
	    }else{
	    	if (btn.get("label") == "编辑") {
				btn.set({
					"label" : "确定",
					"icon" : "dataControl dataControl-selected"
				})
				$("[xid=removeBtn]").fadeIn(700);
			} else {
				btn.set({
					"label" : "编辑",
					"icon" : "dataControl dataControl-pencill"
				})
				$("[xid=removeBtn]").fadeOut(700);
			}
	    }
	    
	};

	Model.prototype.funcsDialogReceive = function(event) {
		var data = this.comp("applyBizData");
		var ctx = this.getContext();
		if (event.data != []) {
			var selectArr = event.data;
			for (var i = 0; i < selectArr.length; i++) {
				var option = {
					defaultValues : [ {
						"fActitvty" : selectArr[i].activity,
						"fLabel" : selectArr[i].label,
						"fProcess" : selectArr[i].process,
						"fUrl" : selectArr[i].url,
						"fPresonID" : ctx.getCurrentPersonID(),
						"fDevicesType" : "m",
						"fIcon" : selectArr[i].iconClass,
						"fColor" : selectArr[i].iconColor
					} ]
				}
				data.newData(option)
			}
			data.saveData();
			data.refreshData();
		}
	}

	Model.prototype.ShowItemListAfterRender = function(event){
		var self = this;
		$("[xid=addMoreDiv]").click(function(e){
			var ctx = self.getContext();
			var str = "";
			self.comp("applyBizData").each(function(obj) {
				if (obj.row.val("fPresonID") == ctx.getCurrentPersonID()) {
					str += obj.row.val("fLabel") + ",";
				}
			})
			
			self.labelStr.set(str);
			
		})
	};
	
	Model.prototype.modelLoad = function(event){
		var self = this;
		$("[xid=addMoreDiv]").click(function(){
			self.comp("funcsDialog").open();
		})
		//加载之前的动画
		$("[xid=waitDiv]").hide()
		$("[xid=panel2]").show()
	};
	
	return Model;
});