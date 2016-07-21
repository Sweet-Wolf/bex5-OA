define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var common = require("$UI/OA/workTime/js/common");
	var IM = require("$UI/OA/workTime/js/evectionMessage");
	
	require("css!$UI/oa/common/css/pub").load();
	var x5Utils = require("$UI/OA/workTime/js/x5Utils");
	
	
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

	var mainData=""/*,childData="";*/
	Model.prototype.modelLoad = function(event){
		mainData =this.comp("mainData");
		/*childData = this.comp("childData");*/
			//加载之前的动画
		$("[xid=waitDiv]").hide();
		$("[xid=evecsureContent]").show();
	};	
		
	//数据改变后
	Model.prototype.mainDataValueChanged = function(event){	
		var column = event.col;
		if (column == 'fAPPLYDEPTNAME') {
			mainData.setValue("fAPPLYPERSONID", "");
			mainData.setValue("fAPPLYPERSONNAME", "");
		} else if (column == 'fSTARTTIME' || column == 'fENDTIME') {			
			var begin = mainData.getValue("fSTARTTIME");
			var end = mainData.getValue("fENDTIME");
			if (begin !=undefined && end !=undefined) {			
				var i = 0;
				var flag = common.isHoliday1(begin);
				var flag1 = common.isHoliday1(end);
				if (begin != end) {
					if (flag == true) {
						i--;
					} else if (flag == false) {
						i++;
					}
					if (flag1 == true) {
						i--;
					} else if (flag1 == false) {
						i++;
					}
				} else {
					if (flag == true) {
						i--;
					} else if (flag == false) {
						i++;
					}
				}
				
				var less = x5Utils.dateTimeLess(begin, end);
				var num = (less / 24) + 1;
				var week = common.removeWeek(begin, end);
				num = num - week;
				var reArray = common.getHolidays(num, begin, end);
				num = num + reArray["num1"] + i;
				if (less < 0) {
					alert("开始时间不能早于结束时间！");
					mainData.setValue("fSTARTTIME", null);
					return;
				}
				mainData.setValue("fDAYS", num);
				mainData.setValue("fFACTDAYS", num);
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
	 
	/*	var rows = event.data;		
		var names="";
		var n=rows.length;
		var fID=mainData.getValue("OA_WM_EvecApply");
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
		mainData.setValue("fNUMBER", n);*/
	};
	
	Model.prototype.btnreadOnly = function(btn){
        var btnstate = true; 
        var ctx = this.getContext();
        var activity = ctx.getCurrentActivity();
	     if(btn == "backButton"){ //选择来问单位按钮
	        if(activity == "mainActivity" || activity == "bizActivity1"){
	        	btnstate = false;
	        
	         }
	      
	    }
	    
		return btnstate;
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