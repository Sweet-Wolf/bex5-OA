define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	//var IM = require("./../../../../chat/js/im");
	var IM = require("$UI/OA/officeSupplyConsumables/js/useApplyMessage");
	//var IM = require("../../../js/useApplyMessage.js");
	require("css!$UI/OA/common/css/pub").load();

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.isRootProcess = function() {
		return this.getContext().getActivity() === 'startActivity' || this.getContext().getActivity() === 'useApplyActivity'; 
	};
	
	Model.prototype.backBtnClick = function() {
		justep.Portal.closeWindow();
	};

	Model.prototype.moreBtnClick = function(event) {
		this.comp("processMenu").show();
	};

	Model.prototype.newPlaceClick = function(event) {
		this.comp("selectItemDlg").open();
	};

	Model.prototype.selectItemClick = function(event) {

		// this.comp("detailData").newData();
	};
	
	Model.prototype.selectItemDlgReceive = function(event) {
		var data = event.data;
		var findrow = 0;
		for(var i=0;i<data.length;i++){
				findrow = this.comp("detailData").find(['fName'],[data[i]],true,true,true);
				if(findrow.length>0){
					continue;
				}else{
					this.comp("detailData").newData({
						defaultValues : [ {
							"fName" : data[i]
						} ]
					});
				}
		}
		
	};

	Model.prototype.processBeforeAdvanceQuery = function(event) {
		var detailCount = this.comp("detailData").getCount();
		event.cancel = detailCount < 0 ? true : false;
	};

	Model.prototype.minusNum = function(event) {
		this.operateNum("minus", event.bindingContext.$object);
	};

	Model.prototype.plusNum = function(event) {
		this.operateNum("plus", event.bindingContext.$object);
	};

	Model.prototype.operateNum = function(type, row) {
		var detailData = this.comp("detailData");
		var currentNum = row.val("fDemandNum");
		var num = 0;
		if (type === "plus") {
			num = currentNum + 1;
		} else {
			if (currentNum == 1) {
				this.deleteData({
					data : detailData,
					row : row,
					message : "当前数量为1，继续操作，将删除该条记录，是否继续？"
				});
				return;
			}
			num = currentNum - 1;
		}

		detailData.setValue("fDemandNum", num, row)
	}

	Model.prototype.deleteData = function(params) {
		var data = params.data;
		this.comp("messageDialog").show({
			message : params.message,
			callback : function(param) {
				var button = param.button;
				if (button == "ok") {
					var confireDel = data.confirmDelete;
					data.confirmDelete = false;
					data.deleteData(params.row);
					data.confirmDelete = confireDel;
				}
			}
		});
	};

	Model.prototype.delData = function(event) {
		
		this.deleteData({
			data : this.comp("detailData"),
			row : event.bindingContext.$object,
			message : "要删除该行记录吗"
		});
		
	};
   
   Model.prototype.btnreadOnly = function(btn){
        var btnstate = true; 
        var ctx = this.getContext();
        var activity = ctx.getCurrentActivity();
	     if(btn == "backButton"){ //选择来问单位按钮
	        if(activity == "startActivity" || activity == "useApplyActivity"){
	        	btnstate = false;
	        
	         }
	      
	    }
	    
		return btnstate;
	};

	 

	 
	Model.prototype.processAdvanceCommit = function(event){
		IM.sendMsg(this, "mainData", "detailData", "申请");
	};

	Model.prototype.processBackCommit = function(event){
		IM.sendMsg(this, "mainData", "detailData", "回退");
	};

	Model.prototype.processAbortCommit = function(event){
		IM.sendMsg(this, "mainData", "detailData", "终止");
	};

	Model.prototype.modelLoad = function(event){
			//加载之前的动画
		$("[xid=waitDiv]").hide();
		$("[xid=officeContent]").show();
	};

	return Model;
});