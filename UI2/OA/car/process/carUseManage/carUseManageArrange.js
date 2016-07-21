define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');

	var Model = function() {
		this.callParent();
		this.ct;
	};


	


	// 弹出
	Model.prototype.selectCarClick = function(event){
		this.comp("dlgSelectCars").open();
	};

	// 接受我弹出页的数据
	Model.prototype.dlgSelectCarsReceive = function(event){
		var row = event.data.row;
		var sData = this.comp("dCarUseManageArrange");
		var len = sData.getCount();
		if (len == 0) {
			sData.newData();
		}
		sData.setValue("fCarID", row["OA_CA_CarBasicInfo"]);
		sData.setValue("fCode", row["fCode"]);
		sData.setValue("fName", row["fName"]);
		sData.setValue("fCarKindID", row["fCarKindID"]);
		sData.setValue("fCarKindName", row["fCarKindName"]);
		sData.setValue("fCarDriverID", row["fCarDriverID"]);
		sData.setValue("fCarDriverName", row["fCarDriverName"]);
		sData.setValue("fEffect", "1");
	};
	Model.prototype.dCarUseManageBeforeSave = function(event){
		var data = this.comp("dCarUseManage");
		var row = data.getCurrentRow();
		var sData = this.comp("dCarUseManageArrange");
		var sRow = sData.getCurrentRow();
		var id = sData.getValue("fCarID", sRow);
		var code = sData.getValue("fCode", sRow);
		var beginTime = data.getValue("fBeginTime",row);
		var endTime = data.getValue("fEndTime",row);
		var reslut = this.carTime(id, beginTime, endTime);
		if (parseInt(reslut) > 0) {
			event.cancel = true;
			throw new Error("该时间段：" + code + " 已经被占用，不能安排!");
		}
	};
	
	// 时间验证
	Model.prototype.carTime = function carTime(id, beginTime, endTime) {
		var sData = this.comp("dCarUseManageArrange");
		var sRowid = sData.getCurrentRowID();

		var params = new biz.Request.ActionParam();
		params.setString("fCarID", id);
		params.setString("fBeginTime", beginTime);
		params.setString("fEndTime", endTime);
		params.setString("fArrangeID", sRowid);
		var reslut = "0";
		biz.Request.sendBizRequest({
			"context": this.getContext(),
			"action": "checkCarUsedAction",
			"directExecute":true,
			"parameters": params,
			"callback": function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					// 代码
					reslut = callbackData.response;
				}
			}
		});	
		return reslut;
	};
	
	Model.prototype.modelModelConstructDone = function(event){
	   
		var operator = this.getContext().getRequestParameter("operator");
		var id = this.getContext().getRequestParameter("id");

		var data = this.comp("dCarUseManage");
		if (operator == "edit") {
			data.filters.setFilter("applyFilter", "OA_CA_CarManage='" + id + "'");
			data.refreshData();	
		} else if (operator == "new") {
			data.newData();
		}
	};
	
	return Model;
});