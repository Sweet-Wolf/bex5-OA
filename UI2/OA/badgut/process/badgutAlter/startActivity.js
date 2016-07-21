define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var Model = function() {
		this.callParent();
	};


	Model.prototype.mainDataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	
	// 主数据修改
	var dValueChanging = false;
	Model.prototype.mainDataValueChanged = function(event){
		if (!dValueChanging) {
		dValueChanging = true;
		var ctx = this.getContext();

		try {
			var psnID = ctx.getCurrentPersonID();
			var psnName = ctx.getCurrentPersonName();
			var time = justep.Date.toString(new Date(),justep.Date.STANDART_FORMAT);
			
			var data = this.comp("mainData");
			data.setValue("fUpdatePsnID", psnID);
			data.setValue("fUpdatePsnName", psnName);
			data.setValue("fUpdateTime", time);
		} finally {
			dValueChanging = false;
		}
		}
	};
	// 子表数据修改
	Model.prototype.detailDataValueChanged = function(event){
		if ((dValueChanging == false)) {
			var sData = this.comp('detailData');
			var sRowid = sData.getCurrentRowID();
	
			var alter1 = sData.getValue('fAlter1');
			var alter2 = sData.getValue('fAlter2');
			var alter3 = sData.getValue('fAlter3');
			var alter4 = sData.getValue('fAlter4');
			var alter5 = sData.getValue('fAlter5');
			var alter6 = sData.getValue('fAlter6');
			var alter7 = sData.getValue('fAlter7');
			var alter8 = sData.getValue('fAlter8');
			var alter9 = sData.getValue('fAlter9');
			var alter10 = sData.getValue('fAlter10');
			var alter11 = sData.getValue('fAlter11');
			var alter12 = sData.getValue('fAlter12');
			var alterall = parseFloat(
					alter1 - (-alter2) - (-alter3) - (-alter4) - (-alter5)
							- (-alter6) - (-alter7) - (-alter8) - (-alter9)
							- (-alter10) - (-alter11) - (-alter12)).toFixed(2);
			sData.setValue('fAlterall', alterall);
		}
	};
	// 打开成本中心对话框
	Model.prototype.trgSelectAssetDOMActivate = function(event){
		var selectCostCenter = this.comp("dlgSelectCostCenter");
		selectCostCenter.initEveryTimes = true;
		selectCostCenter.open();
	};

	// 成本中心对话框返回结果
	Model.prototype.dlgSelectCostCenterReceive = function(obj){
		var data = this.comp('mainData');
		data.setValue('fCostCenterID', obj.data.fID);
		data.setValue('fCostCenterCode', obj.data.fCode);
		data.setValue('fCostCenterName', obj.data.fName);
	};

	
	// 打开预算计划对话框
	Model.prototype.addBtnClick = function(event){
		var sData = this.comp('mainData');
		var dData = this.comp('detailData');
		if (!sData.isChanged() && !dData.isChanged()) {
			var selectBadgut = this.comp("dlgSelectBadgut");
			selectBadgut.initEveryTimes = true;
			selectBadgut.open();
		} else {
			alert("请先保存变更单据信息！");
		}
	};
	
	// 预算计划对话框请求
	Model.prototype.dlgSelectBadgutLoad = function(event){
		var data = this.comp('mainData');
		var costCenterID = data.getValue('fCostCenterID');
		var year = data.getValue('fYear');
		var params = {
			"costCenterID" : costCenterID,
			"year" : year
		};
		return params;
	};
	
	// 预算计划对话框返回结果
	Model.prototype.dlgSelectBadgutReceive = function(event){
		dValueChanging = true;
		var mData = this.comp('mainData');
		var sData = this.comp('detailData');
		var sDoc = event.data;
		if (sDoc != "") {
			var params = new biz.Request.ActionParam();
			params.setParam("badgutIDs", sDoc);
			params.setParam("alterID", mData.getCurrentRowID());
			var ctx = this.getContext();
			
			var options = {
			   context : ctx,
			   process : ctx.getCurrentProcess(),
			   activity : ctx.getCurrentActivity(),
			   action : "getBadgutData",
			   parameters : params
		};
			if (!biz.Request.sendBizRequest(options)) {
			   throw new Error(biz.Request.getServerError(r, "添加预算信息失败!"));
			  } else {
			   sData.refreshData(false);
			   }
		}
		dValueChanging = false;
	};

	//model 加载
	Model.prototype.modelModelConstructDone = function(event){
		/*var data = this.comp('mainData');
		var sData1 = ctx.getProcessData1();
		if (sData1 == null || sData1 == undefined) {
			data.newData();
		} else {
			data.filters.setFilter("flowFilter", "OA_BG_AlterM='" + sData1 + "'");
			data.refreshData();
		}*/
	};

	//
	Model.prototype.processBeforeAdvanceQuery = function(event){
		/*var sData = this.comp('detailData');
		var len = sData.getCount();
		if (len == 0) {
			data.cancel = true;
			alert("详细信息为空，请填写！");
		}*/
	};

	
	return Model;
});