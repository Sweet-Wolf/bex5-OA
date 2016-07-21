define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');

	var Model = function() {
		this.callParent();
	};
	// 新建
	Model.prototype.newBtnClick = function(event) {
		this.gotoDetail('new');

	};

	Model.prototype.gotoDetail = function(operator){
		var data = this.comp('mainData');
		var id = data.getCurrentRowID();
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var url = "$UI/OA/officeSupplyConsumables/process/officeSupplyUseRegisterDetail/officeSupplyUseRegisterDetail.a?process=" + process + "&activity=" + activity + "&operator=" + operator
				+ "&id=" + id;
		justep.Portal.openWindow(url, {
			title : '办公用品领用登记'
		});
	};
	Model.prototype.DataSaveCommit = function(event) {
		justep.Util.hint("保存成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	};
	Model.prototype.detailDataValueChanged = function(event) {
		var data = this.comp('detailData');
		if (event.column == "fDemandNum") {
			var fConsultPrice = data.getValue("fConsultPrice");
			var fDemandNum = data.getValue("fDemandNum");
			var fConsultAmount = parseFloat((fDemandNum * fConsultPrice).toFixed(2));
			data.setValue("fFactNum", fDemandNum);
			data.setValue("fConsultAmount", fConsultAmount);
			data.setValue("fFactAmount", fConsultAmount);
			totalAmount();
		} else if (event.column == "fFactNum") {
			var fFactPrice = data.getValue("fFactPrice");
			var fFactNum = data.getValue("fFactNum");
			var fFactAmount = parseFloat((fFactNum * fFactPrice).toFixed(2));
			data.setValue("fFactAmount", fFactAmount);
			totalAmount();
		}
	};

	Model.prototype.totalAmount = function() {
		var data = this.comp('detailData');
		var sum = 0, factSum = 0;
		data.each(function(param) {
			var fConsultAmount = param.row.val("fFactAmount");
			var fFactAmount = param.row.val("fFactAmount");
			if (fConsultAmount > 0) {
				sum += parseFloat(fConsultAmount);
				if (fConsultAmount == fFactAmount) {
					sum += parseFloat(fConsultAmount);
					factSum = sum;
				} else {
					sum += parseFloat(fConsultAmount);
					factSum += parseFloat(fFactAmount);
				}

			}
		})
		this.comp('mainData').setValue("fConsultAmount", sum);
		this.comp('mainData').setValue("fFactAmount", factSum);

	}

	Model.prototype.addBtnClick = function(event) {
		var DialogList = this.comp("DialogList");
		DialogList.open();
	};

	Model.prototype.mainTablesRowDblClick = function(event){
		this.gotoDetail('edit');
	};

	Model.prototype.btnProvideClick = function(event){
		;
		var data = this.comp('mainData');
		var bizID = data.getCurrentRowID();
		var fBizState = data.getValue("fBizState");
		if(fBizState == "bsFinished"){
			alert("已完成的记录,不能再发放!");
		}else{
			var result = this.sendUseRequestAction(bizID);
			if(result != "OK"){
				event.cancel = true;
				alert("发放失败!");
			}else{
				alert("发放成功!");
			}
			data.refreshData();
		}
		
	};
	
	Model.prototype.sendUseRequestAction = function(bizID){
		;
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var params = new biz.Request.ActionParam();
		params.setString("bizID", bizID);
		var result;
		biz.Request.sendBizRequest({
			"context": this.getContext(),
			"process":process,
			"activity":activity,
			"action": "useRegisterAction",
			"parameters": params,
			"callback": function(callbackData) {
				callbackData.ignoreError = false;
				if (callbackData.state) {
					// 代码
					result = callbackData.response;
				}else{
					throw new Error( "发放失败!:" + callbackData.response );
				}
			}
		});	
		return result;
	
	}

	return Model;
});