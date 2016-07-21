define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.addBtnClick = function(event) {
		var DialogList = this.comp("DialogList");
		DialogList.open();
	};

	Model.prototype.detailDataValueChanged = function(event) {
		var detailData = this.comp("detailData");
		// var id = detailData.getCurrentRowID();
		var fConsultPrice = detailData.getValue("fConsultPrice");
		var fFactPrice = detailData.getValue("fFactPrice");
		var fDemandNum = detailData.getValue("fDemandNum");
		var fApprovalNum = detailData.getValue("fApprovalNum");
		var fFactNum = detailData.getValue("fFactNum");
		var fFactAmount = "", fConsultAmount = "";

		if (event.col == "fDemandNum") {
			fConsultAmount = parseFloat((fDemandNum * fConsultPrice).toFixed(2));
			detailData.setValue("fApprovalNum", fDemandNum);
			detailData.setValue("fConsultAmount", fConsultAmount);
		}
		if (event.col == "fApprovalNum") {
			detailData.setValue("fFactNum", fApprovalNum);
			fFactAmount = parseFloat((fApprovalNum * fConsultPrice).toFixed(2));
			detailData.setValue("fFactAmount", fFactAmount);
		}
		if (event.col == "fFactPrice") {
			fFactAmount = parseFloat((fFactNum * fFactPrice).toFixed(2));
			detailData.setValue("fFactAmount", fFactAmount);
		}
		if (event.col == "fConsultPrice") {
			fConsultAmount = parseFloat((fDemandNum * fConsultPrice).toFixed(2));
			fFactAmount = parseFloat((fFactNum * fConsultPrice).toFixed(2));
			detailData.setValue("fConsultAmount", fConsultAmount);
			detailData.setValue("fFactAmount", fFactAmount);
		}
		if (event.col == "fFactAmount") {
			this.totalAmount();
		}
	};

	Model.prototype.totalAmount = function() {
		var data = this.comp('detailData');
		var sum = 0;
		data.each(function(param) {
			var fConsultAmount = param.row.val("fFactAmount")
			if (fConsultAmount > 0) {
				sum += parseFloat(fConsultAmount);
			}
		})
		this.comp('mainData').setValue("fConsultAmount", sum);

	}

	Model.prototype.DialogListReceive = function(event) {
	//	;
		var data = this.comp('detailData');
		var doc = event.data;
		var len = event.data.length;
		if (len > 0) {
			for ( var i = 0; i < len; i++) {
				
				var options = {
					index : i,
					defaultValues : [ {
						"fItemID" : doc[i].val("OA_OSC_BaseInfo"),
						"fCode" : doc[i].val("fCode"),
						"fName" : doc[i].val("fName"),
						"fSpecType" : doc[i].val("fSpecType"),
						"fKindID" : doc[i].val("fKindID"),
						"fKindName" : doc[i].val("fKindName"),
						"fUnitID" : doc[i].val("fUnitID"),
						"fUnitName" : doc[i].val("fUnitName"),
						"fConsultPrice" : doc[i].val("fPrice"),
						"fConsultAmount" : doc[i].val("fPrice"),
						"fFactPrice" : doc[i].val("fPrice"),
						"fFactAmount" : doc[i].val("fPrice")
					} ]
				};
				data.newData(options);
				
				
			}
			this.totalAmount();
		}
	};

	return Model;
});