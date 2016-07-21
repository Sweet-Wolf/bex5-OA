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
			var fPLACE = self.comp(mainData).getValue("fPLACE"); //出差地点
			var fSTARTTIME = self.comp(mainData).getValue("fSTARTTIME"); //开始时间
			
			
			var fENDTIME = self.comp(mainData).getValue("fENDTIME"); //结束时间
			var fDAYS = self.comp(mainData).getValue("fDAYS"); //出差时长
			 
			var fREASON = self.comp(mainData).getValue("fREASON"); //出差事由
			
		 
			var msg = fAPPLYPERSONNAME + "的出差申请\n" //(" + fPLACE +")
			       + "出差地点：" + fPLACE + "\n"
			       + "出差周期：" + IM.getDateRangeDesciption(fSTARTTIME, fENDTIME, "日")  + "\n";
			      /* + "开始时间：" + fSTARTTIME + "\n";
			if (fENDTIME){
				msg += "结束时间：" + fENDTIME + "\n";
			}        */
			if (fDAYS != 0){
				msg += "出差时长：" + fDAYS + "\n";
			}       
			   
			msg += "出差事由：" + fREASON + "\n";
			//以上获取申请单基本信息。
			if(actionStep == "申请" || actionStep == "审批" || actionStep == "回退"){
				//查找当前环节的执行者。
				var sheetId = self.comp(mainData).getValue("OA_WM_EvecApply");
				var activityName = self.comp("mainData").getValue("fCurrentActivities").replace(/(^\s*)|(\s*$)/g, "");
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
