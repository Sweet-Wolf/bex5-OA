define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.DataSaveCommit = function(event) {
		justep.Util.hint("保存成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	};
	Model.prototype.detailDataValueChanged = function(event) {
		var data = this.comp('detailData');

		if (event.col == "fDemandNum") {
			var fConsultPrice = data.getValue("fConsultPrice");
			var fDemandNum = data.getValue("fDemandNum");
			var fConsultAmount = parseFloat((fDemandNum * fConsultPrice).toFixed(2));
			data.setValue("fFactNum", fDemandNum);
			data.setValue("fConsultAmount", fConsultAmount);
			data.setValue("fFactAmount", fConsultAmount);
			this.totalAmount();
		} else if (event.col == "fFactNum") {
			var fFactPrice = data.getValue("fFactPrice");
			var fFactNum = data.getValue("fFactNum");
			var fFactAmount = parseFloat((fFactNum * fFactPrice).toFixed(2));
			data.setValue("fFactAmount", fFactAmount);
			this.totalAmount();
		}
	};

	Model.prototype.totalAmount = function() {
		var data = this.comp('detailData');
		var sum = 0;
		var factSum = 0;
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

	Model.prototype.modelModelConstructDone = function(event) {
		var operator = this.getContext().getRequestParameter("operator");
		var id = this.getContext().getRequestParameter("id");

		var data = this.comp('mainData');
		if (operator == "new") {
			data.newData();
			data.setValue("fIsProcess", "0");
		}
		if (operator == "edit") {
			data.filters.setFilter("useApplyFilter", "OA_OSC_UseApplyM='" + id + "'");
			data.refreshData();
		}
	};

	return Model;
});