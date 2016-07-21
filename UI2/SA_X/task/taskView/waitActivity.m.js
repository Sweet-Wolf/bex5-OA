define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
//	var btnClickNum = 0;
	var Model = function() {
		this.callParent();
	};
	// 待我审批的LI的click事件
	Model.prototype.li2Click = function(event) {
		var row = event.bindingContext.$object;
		var task = row.val("SA_Task");
		var process = row.val("sProcess");
		var activity = row.val("sActivity");

		var pattern = ((row.val("sKindID") == "tkNotice") ? "readonly" : "write");
		var url = row.val("sEURL");
		if (url.charAt(0) === "/") {
			if (url.indexOf(".a") !== -1) {
				url = "$UI" + url;
			} else {
				url = "$model/UI" + url;
			}
		}
		url += ((url.indexOf("?") == -1) ? "?" : "&");
		url += "_pagePattern=" + pattern + "&process=" + process + "&activity=" + activity + "&task=" + task;

		var status = row.val("sStatusID");
		if (status === "tesReady") {
			var params = new biz.Request.ActionParam();
			params.setString("task", task);
			params.setString("executor", row.val("sExecutorFID"));
			var options = {};
			options.context = this.getContext();
			options.action = "executeTaskAction";
			options.parameters = params;
			options.directExecute = true;
			options.contentType = biz.Request.JSON_TYPE;
			options.dataType = biz.Request.JSON_TYPE;
			options.process = process;
			options.activity = activity;
			var self = this;
			options.callback = function(options) {
				if (options.state) {
					justep.Shell.showPage({
						url : url,
						title : row.val("sName"),
						executor : options.response || ""
					});
				} else {
					options.ignoreError = false;
				}
			};
			biz.Request.sendBizRequest(options);
		} else {
			justep.Shell.showPage({
				url : url,
				title : row.val("sName"),
				executor : row.val("sExecutorFID") || ""
			});
		}
	};
	//model上的事件
	Model.prototype.modelActive = function(event) {
		var data = this.comp("taskData");
		if (data) {
			data.refreshData();
		}
	};
	//返回键事件
	Model.prototype.backBtnClick = function(event) {
		this.close();
//		justep.Shell.closePage();
//							  require.toUrl("$UI/OA/workTime/process/leave/detailActivity.m.w")
	};
	// 控制显示listDiv
	Model.prototype.approvedBtnClick = function(event) {
		$("#listDiv").removeClass("hideListDiv");
	};
	// 控制隐藏listDiv并设置后缀
	Model.prototype.detailBtnGroupClick = function(event) {
		
		$("#listDiv").addClass("hideListDiv");
		if (event.target.nodeName == "A") {
			this.getElementByXid("lastSpan").innerHTML = event.target.getElementsByTagName("span")[0].innerHTML;
		}
		if (event.target.nodeName == "DIV") {
			this.getElementByXid("lastSpan").innerHTML = event.target.getElementsByTagName("span")[0].innerHTML;
		}
		if (event.target.nodeName == "SPAN") {
			this.getElementByXid("lastSpan").innerHTML = event.target.innerHTML;
		}
	};

	// 以下是点击listDiv中的按钮跳转到相应页面的过程-------------------------------------------------------------------------------------------------
//	var btnClickNum = 0;// 1请假，2报销，3出差，4外出，5物品领用，6办公室申请，7借款，8印章
	Model.prototype.leaveBtnClick = function(event) {
	//		btnClickNum = 1;
		var params = new biz.Request.ActionParam();
		params.setParam('type', "clo");
		params.setParam('tableName', "OA_WM_LeaveApply");
		params.setParam('sProcess', "/OA/workTime/process/leave/leaveProcess");
		params.setParam('notInActivities', "'listActivity'");
		params.setParam('DataModel', "/OA/workTime/data");
			
		this.getRequest("clo", "closeData" ,params);
		this.comp("detailDialog").set({
			"src" : require.toUrl("$UI/OA/workTime/process/leave/detailActivity.m.w"),
				
		});
	};
	Model.prototype.reimbursementBtnClick = function(event) {
	//		btnClickNum = 2;
		var params = new biz.Request.ActionParam();
		params.setParam('type', "clo");
		params.setParam('tableName', "OA_FC_ReimbApplyM");
		params.setParam('sProcess', "/OA/finance/process/financeReimbrseApply/financeReimbrseApplyProcess");
		params.setParam('notInActivities', "'listActivity'");
		params.setParam('DataModel', "/OA/finance/data");
		this.getRequest("clo", "closeData",params);
		this.comp("detailDialog").set({
			"src" : require.toUrl("$UI/OA/finance/process/financeReimbrseApply/detailActivity.m.w"),
				
		});
	};
	Model.prototype.businessBtnClick = function(event) {
	//		btnClickNum = 3;
		var params = new biz.Request.ActionParam();
		params.setParam('type', "clo");
		params.setParam('tableName', "OA_WM_EvecApply");
		params.setParam('sProcess', "/OA/workTime/process/evection/evectionProcess");
		params.setParam('notInActivities', "'listActivity'");
		params.setParam('DataModel', "/OA/workTime/data");
		this.getRequest("clo", "closeData",params);
		this.comp("detailDialog").set({
			"src" : require.toUrl("$UI/OA/workTime/process/evection/detailActivity.m.w"),
				
		});
	};
	Model.prototype.outBtnClick = function(event) {
	//		btnClickNum = 4;//外出
		var params = new biz.Request.ActionParam();
		params.setParam('type', "clo");
		params.setParam('tableName', "OA_WM_outApply");
		params.setParam('sProcess', "/OA/workTime/process/outApply/outApplyProcess");
		params.setParam('notInActivities', "'listActivity'");
		params.setParam('DataModel', "/OA/workTime/data");
		this.getRequest("clo", "closeData",params);
		this.comp("detailDialog").set({
			"src" : require.toUrl("$UI/OA/workTime/process/outApply/detailActivity.m.w"),
				
		});
	};
	Model.prototype.articleCollarBtnClick = function(event) {
	//		btnClickNum = 5;
		var params = new biz.Request.ActionParam();
		params.setParam('type', "clo");
		params.setParam('tableName', "OA_OSC_UseApplyM");
		params.setParam('sProcess', "/OA/officeSupplyConsumables/process/officeSupplyUseApply/officeSupplyUseApplyProcess");
		params.setParam('notInActivities', "'listActivity'");
		params.setParam('DataModel', "/OA/officeSupplyConsumables/data");
		this.getRequest("clo", "closeData",params);
		this.comp("detailDialog").set({
			"src" : require.toUrl("$UI/OA/officeSupplyConsumables/process/officeSupplyUseApplyQuery/detailActivity.m.w"),
				
		});
	};
	Model.prototype.conferenceRoomBtnClick = function(event) {
	//		btnClickNum = 6;
		var params = new biz.Request.ActionParam();
		params.setParam('type', "clo");
		params.setParam('tableName', "OA_MT_UseApply");
		params.setParam('sProcess', "/OA/meeting/process/boardroomUseApply/boardroomUseApplyProcess");
		params.setParam('notInActivities', "'listActivity'");
		params.setParam('DataModel', "/OA/meeting/data");
		this.getRequest("clo", "closeData",params);
		this.comp("detailDialog").set({
			"src" : require.toUrl("$UI/OA/meeting/process/boardroomUseApply/detailActivity.m.w"),
				
		});
	};
	Model.prototype.loanBtnClick = function(event) {
	//		btnClickNum = 7;
		var params = new biz.Request.ActionParam();
		params.setParam('type', "clo");
		params.setParam('tableName', "OA_FC_LoanApply");
		params.setParam('sProcess', "/OA/finance/process/financeLoanApply/financeLoanApplyProcess");
		params.setParam('notInActivities', "'listActivity'");
		params.setParam('DataModel', "/OA/finance/data");
//		closeDataCustomRefresh(params);
		this.getRequest("clo", "closeData",params);
//		debugger;
		this.comp("detailDialog").set({
			"src" : require.toUrl("$UI/OA/finance/process/financeLoanApply/detailActivity.m.w"),
				
		});
	};
	Model.prototype.sealBtnClick = function(event) {
//		btnClickNum = 8;
//		debugger;
		var params = new biz.Request.ActionParam();
		params.setParam('type', "clo");
		var self = this;
		biz.Request.sendBizRequest({
			process : "/OA/signature/process/signatureApplyQuery/signatureApplyQueryProcess",
			activity : "startActivity",
			"action" : "querySLSignatureExAction",
			"parameters" : params,
			"callback" : function(data) {
				if (data.state) {
					var resultData = data.response["clo"];
					if (resultData) {
						self.comp("closeData").clear();
						self.comp("closeData").loadData(resultData);
					}
				}
			}
		});
		this.comp("detailDialog").set({
			"src" : require.toUrl("$UI/OA/signature/process/signatureApply/detailActivity.m.w"),
		});
	};

	// 用来获得JSP页面提交的表单数据
	Model.prototype.getRequest = function(type, dataxid, params) {
		// debugger
		var ctx = this.getContext();
		var self = this;
		biz.Request.sendBizRequest({
			"context" : ctx,
			"action" : "querylistDataExAction",
			"parameters" : params,
			"callback" : function(data) {
				if (data.state) {
					var resultData = data.response[type];
					if (resultData) {
						self.comp(dataxid).clear();
						self.comp(dataxid).loadData(resultData,true);
					}
				}
			}
		});
	}

	// 每行的详情（与dialog相连），点击的同时传递数据。
	Model.prototype.cloListClick = function(event) {
//		debugger;
		//alert(this.comp('closeData').getCurrentRowID());
		if(this.comp('closeData').getCurrentRowID()==null){
			return;
		}
		this.comp("detailDialog").open({
			data : {
				data : this.comp('closeData').getCurrentRowID(),
				type : 'detail'
			}
		});
	};

	Model.prototype.modelLoad = function(event){
		//加载之前的动画
		$("[xid=waitDiv]").hide();
		$("[xid=waitContent]").show();
		$("[xid=waitBottom]").show();
	};

	Model.prototype.contents1ActiveChange = function(event){
		if(event.to == 1){
			$("#listDiv").removeClass("hideListDiv");
		}
	};

	Model.prototype.approvedContentInactive = function(event){
		this.getElementByXid("lastSpan").innerHTML = "";
	};

	return Model;
});
