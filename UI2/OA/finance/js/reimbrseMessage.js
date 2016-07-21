define(function(require) {
	var IM = require("$UI/OA/common/js/sendMessage");
	var biz = require("$UI/system/lib/biz");
	return {
		//需要的参数 self 当前model；mainData 主表data
		//actionStep 描述单据的动作："申请"：即申请人流转到审批人的动作
		//"审批"：即审核人的审批动作；"回退"：当前环节的审批人回退给上一环节的审批人；“终止”即当前环节的审批人终止申请。
		sendMsg : function(self, mainData, actionStep) {
			
			self.comp(mainData).refreshData();
			//}
			var personId = self.comp(mainData).getValue("fLoanPsnID");
			var fLoanPsnName = self.comp(mainData).getValue("fLoanPsnName");
			var fReiEvent = self.comp(mainData).getValue("fReiEvent"); //报销事项
			
			var fReimAmt = self.comp(mainData).getValue("fReimAmt"); //报销金额
			var fRemark = self.comp(mainData).getValue("fRemark"); //报销明细
			 
		 
			var msg = fLoanPsnName + "的报销申请\n"
			       + "报销事项：" + fReiEvent + "\n"
			       + "报销金额：" + fReimAmt + "\n"
			       + "报销明细：" + fRemark + "\n";
			 
			//以上获取申请单基本信息。
			if(actionStep == "申请" || actionStep == "审批" || actionStep == "回退"){
				//查找当前环节的执行者。
				var sheetId = self.comp(mainData).getValue("OA_FC_ReimbApplyM");
				var activityName = self.comp(mainData).getValue("fCurrentActivities").replace(/(^\s*)|(\s*$)/g, "");
				
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
