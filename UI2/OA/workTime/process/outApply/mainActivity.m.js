define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var common = require("$UI/OA/workTime/js/common");
	var IM = require("$UI/OA/workTime/js/outMessage");
	require("css!$UI/oa/common/css/pub").load();
	
	
	var Model = function(){
		this.callParent();
	};
	
	Model.prototype.backBtnClick = function(){
		justep.Portal.closeWindow();
	};
	
	Model.prototype.moreBtnClick = function(event){
		this.comp("processMenu").show();
	};
	
	Model.prototype.mainDataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	var mainData="",childData="";
	Model.prototype.modelLoad = function(event){
		mainData =this.comp("mainData");
		childData = this.comp("dOutMember");
	};	
		
	//数据改变
	Model.prototype.mainDataValueChanged = function(event){
			var data = this.comp("mainData");
			var column = event.col;
			if (column == 'fSTARTTIME' || column == 'fENDTIME') {
				var starttime = data.getValue("fSTARTTIME");
				var fEndTime = data.getValue("fENDTIME");
				if (starttime != null && fEndTime != "" && starttime != "" && fEndTime != null) {
					var hour = common.calLeaveData(starttime, fEndTime);
					if (hour >= 0) {		
						data.setValue("fHOURS", (hour % 8).toString());
						data.setValue("fDAYS", parseInt(hour / 8) > 0 ? parseInt(hour / 8) : '0');
					} else {
						alert('填入的时间不合法！');
						data.setValue("fHOURS", '0');
						data.setValue("fDAYS", '0');
					}
				}
			}
	};
	
	
	//人员选择
	Model.prototype.button1Click = function(event){
		mainData.setValue("fPERSONNEL", null);
		mainData.setValue("fNUMBER", 0);
		
		this.comp('psmDialog').open();
	};

	//人员选择返回	
	Model.prototype.psmDialogReceive = function(event){
		var rows = event.data;		
		var names="";
		var n=rows.length;
		var fID=mainData.getValue("OA_WM_outApply");
		for ( var i in rows) {
			childData.add({				
				fPersonName: rows[i].val('sName'),
				fPersonID: rows[i].val('sFID'),
				fMasterID: fID	
			});
			names+=rows[i].val('sName');
			if(i<n-1) names+=",";
		}
		mainData.setValue("fPERSONNEL", names);
		mainData.setValue("fNUMBER", n);
	};
	
	
	Model.prototype.processAdvanceCommit = function(event){
		IM.sendMsg(this, "mainData", "申请");
	};
	
	
	Model.prototype.processBackCommit = function(event){
		IM.sendMsg(this, "mainData", "回退");
	};
	
	
	Model.prototype.processAbortCommit = function(event){
		IM.sendMsg(this, "mainData", "终止");
	};
	
	
	return Model;
});