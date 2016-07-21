define(function(require) {
	var IM = require("$UI/OA/common/js/sendMessage");
	var biz = require("$UI/system/lib/biz");
	var justep = require("$UI/system/lib/justep");
	return {
		//需要的参数 self 当前model；mainData 主表data
		//actionStep 描述单据的动作："申请"：即申请人流转到审批人的动作
		//"审批"：即审核人的审批动作；"回退"：当前环节的审批人回退给上一环节的审批人；“终止”即当前环节的审批人终止申请。
		sendMsg : function(self, mainData, actionStep) {
	
			self.comp(mainData).refreshData();
			//}
			var personId = self.comp(mainData).getValue("fLoanPsnID");
			var fLoanPsnName = self.comp(mainData).getValue("fLoanPsnName");
			var fLoanTypeName = self.comp(mainData).getValue("fLoanTypeName"); //借款类型
			
			
			var fLoanDate =  justep.Date.toString(self.comp(mainData).getValue("fLoanDate"), "yyyy年MM月dd日"); //借款日期
			var fReturnDate = justep.Date.toString(self.comp(mainData).getValue("fReturnDate"), "yyyy年MM月dd日"); //归还日期
			 
			var fLoanAmt = self.comp(mainData).getValue("fLoanAmt"); //借款金额
			var fLoanPurpose = self.comp(mainData).getValue("fLoanPurpose"); //借款用途
		 
			var msg = fLoanPsnName + "的借款申请\n"
			       //+ "借款类型：" + fLoanTypeName + "\n"
			       + "借款日期：" + fLoanDate + "\n"
			       + "归还日期：" + fReturnDate + "\n"
			       + "借款金额：" + fLoanAmt + "元\n"
			       + "借款用途：" + fLoanPurpose + "\n";
			 
			//以上获取申请单基本信息。
			if(actionStep == "申请" || actionStep == "审批" || actionStep == "回退"){
				//查找当前环节的执行者。
				var sheetId = self.comp(mainData).getValue("OA_FC_LoanApply");
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
