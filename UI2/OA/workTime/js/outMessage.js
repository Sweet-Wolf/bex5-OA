define(function(require) {
	var IM = require("$UI/OA/common/js/sendMessage");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	return {
		//需要的参数 self 当前model；mainData 主表data
		//actionStep 描述单据的动作："申请"：即申请人流转到审批人的动作
		//"审批"：即审核人的审批动作；"回退"：当前环节的审批人回退给上一环节的审批人；“终止”即当前环节的审批人终止申请。
		sendMsg : function(self, mainData, actionStep) {
			self.comp(mainData).refreshData();
			//}
			var personId = self.comp(mainData).getValue("fAPPLYPERSONID");
			var fAPPLYPERSONNAME = self.comp(mainData).getValue("fAPPLYPERSONNAME");
			 
			var fSTARTTIME = self.comp(mainData).getValue("fSTARTTIME"); //开始时间
			var fENDTIME = self.comp(mainData).getValue("fENDTIME"); //结束时间
			var fDAYS = self.comp(mainData).getValue("fDAYS"); //外出天数
			var fHOURS = self.comp(mainData).getValue("fHOURS"); //外出小时数
			var fPERSONNEL = self.comp(mainData).getValue("fPERSONNEL");  //外出人员 
			var fNUMBER  = self.comp(mainData).getValue("fNUMBER");//外出人数
			//var persons = fPERSONNE.replace(fAPPLYPERSONNAME, "");
			var msg = fAPPLYPERSONNAME + "的外出申请\n"  //(随行：" + persons +")
				   + "外出周期：" + IM.getDateRangeDesciption(fSTARTTIME, fENDTIME)  + "\n" 	
			       /*+ "开始时间：" + fSTARTTIME + "\n" 
				   + "结束时间：" + fENDTIME + "\n" */
			       + "外出时长：";
			if (fDAYS && fDAYS != "0"){
				msg += fDAYS + "天";
			}
			if (fHOURS && fHOURS != "0"){
				msg += fHOURS + "小时";
			}
			msg += "\n"; 
			
			if (fPERSONNEL){
				msg += "外出人员：" + fPERSONNEL + "\n";	
			} 
			if (fNUMBER && fNUMBER != "0"){
				msg += "外出人数：" + fNUMBER + "\n";	
			} 
			
			//以上获取申请单基本信息。
			if(actionStep == "申请" || actionStep == "审批" || actionStep == "回退"){
				//查找当前环节的执行者。
				var sheetId = self.comp(mainData).getValue("OA_WM_outApply");
				var activityName = self.comp(mainData).getValue("fCurrentActivities").replace(/(^\s*)|(\s*$)/g, "");
				//通过请假和出差判断：最后一个环节完成后，因为上面刷新了mainData，所以activityName = ''
				//所以可以判断如activityName 为空，那么直接发给申请人。
				if(actionStep == "审批"){
					msg += "状态：" + self.getContext().getCurrentPersonName()  + "已审批";
				} else if (actionStep == "回退") {
					msg += "状态：" + self.getContext().getCurrentPersonName()  + "回退了此申请";
				} 
				if(activityName){
					IM.sendExamineMessage(self.getContext(), sheetId, activityName, msg);
				} else {
					IM.sendMsgToPerson(personId,msg);  
				}
				
				
			} else if(actionStep == "终止"){
				//只发给申请人。
				msg += "状态：" + self.getContext().getCurrentPersonName()  + "终止了此申请";
				IM.sendMsgToPerson(personId,msg);  
			}

			//return returnValue;
		}  
	};
});
