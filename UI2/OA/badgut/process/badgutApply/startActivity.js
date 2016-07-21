define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function() {
		this.callParent();
	};
	
	
	//点击应用科目模板操作
	Model.prototype.trgApplicationClick = function(event){
		data = this.comp('mainData');
		if (data.isChanged()) {
			// data.saveData();
			alert("请先保存预算计划申请信息！");
		} else {
			if (confirm("应用模板会清空现有计划信息,是否继续？")) {
				var params = new biz.Request.ActionParam();
				params.setParam("applyID", data.getCurrentRowID());
				
				var ctx = this.getContext();
				var resultList="";
				var options = {
				   context : ctx,
				   process : ctx.getCurrentProcess(),
				   activity : ctx.getCurrentActivity(),
					action : "applicationTemplate",
					parameters : params
//					callback: function(data){
//					if(data.state){
//						resultList=data.response;
//					}else{
//						Request.errorMessage(resultData, "应用模板失败！", null, null);
//					}	
//				}
			};
			
			if (!biz.Request.sendBizRequest(options)) {
			   throw new Error(biz.Request.getServerError(r, "应用模板失败!"));
			  } else {
			   this.comp("detailData").refreshData(false);
			   }
			}
		}
	};
	
	//主表数据改变
	var dBuyApplyValueChanging = false;
	Model.prototype.mainDataValueChanged = function(event){
		if (!dBuyApplyValueChanging) {
			dBuyApplyValueChanging = true;
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
				dBuyApplyValueChanging = false;
			}
		}
	};
	
	//打开成本中心对话框
	Model.prototype.trgSelectAssetDOMActivate = function(event){
		var baseInfoDlg = this.comp("dlgCost");
		baseInfoDlg.initEveryTimes = true;
		baseInfoDlg.open();
	};
	//对话框返回接收处理
	Model.prototype.dlgCostReceive = function(obj){
		var data = this.comp("mainData");
		data.setValue("fCostCenterID", obj.data.fID);
		data.setValue("fCostCenterCode", obj.data.fCode);
		data.setValue("fCostCenterName", obj.data.fName);
	};

	//打开科目对话框
	Model.prototype.addBtnClick = function(event){
		var baseInfoDlg = this.comp("dlgAccount");
		baseInfoDlg.initEveryTimes = true;
		baseInfoDlg.open();
	};
		
	//对话框返回接收处理
	Model.prototype.dlgAccountReceive = function(event){
		var doc = event.data;
		var data = this.comp('detailData');
		var len = doc.length;
		var flag = 0;
//		var flag = data.locate([doc.getRowId(i)], ["fAccountID"], true, false,false);
		if (len > 0) {
			for (var i = 0; i < len; i++) {
				if ( flag == 0) {
					data.newData();
					data.setValue('fAccountCode', doc[i].val('fCode'));
					data.setValue('fAccountName', doc[i].val('fName'));
				}
			}
		}
	};


	//model加载完成
	Model.prototype.modelModelConstructDone = function(event){
	/*	var data = this.comp("mainData");
		var sData1 = this.getContext().getProcessData1();
		if (sData1 == null || sData1 == undefined) {
			data.newData();
		} else {
			data.filters.setFilter("flowFilter", "OA_BG_ApplyM='" + sData1 + "'");
			data.refreshData();
		}*/
	};


	//流程查询
	Model.prototype.processBeforeAdvanceQuery = function(event){
	/*	var subData = this.comp("detailData");
		var len = subData.getCount();
		if (len == 0) {
			data.cancel = true;
			alert("预算科目不能为空，请填写！");
		}*/
	};


	//子表数据改变
	Model.prototype.detailDataValueChanged = function(event){

//		if (event.col != "fAccountName" && event.col != "fAccountCode"
//				&& event.col != "fAccountID" && event.col != "fPlanall")
				if (event.col != "fAccountName" && event.col != "fAccountCode"
				) {
			var data = this.comp("detailData");
			var id = data.getCurrentRowID();
			var totlePlan = data.getValue("fPlan1")
					- (-data.getValue("fPlan2"))
					- (-data.getValue("fPlan3"))
					- (-data.getValue("fPlan4"))
					- (-data.getValue("fPlan5"))
					- (-data.getValue("fPlan6"))
					- (-data.getValue("fPlan7"))
					- (-data.getValue("fPlan8"))
					- (-data.getValue("fPlan9"))
					- (-data.getValue("fPlan10"))
					- (-data.getValue("fPlan11"))
					- (-data.getValue("fPlan12"));
			data.setValue("fPlanall", totlePlan);
		}
	};

	Model.prototype.mainDataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	return Model;
});