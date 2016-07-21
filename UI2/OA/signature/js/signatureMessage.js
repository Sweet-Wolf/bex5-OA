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
			var personId = self.comp(mainData).getValue("fApplyPsnID");
			var fApplyPsnName = self.comp(mainData).getValue("fApplyPsnName");
	 
			var fSignatureTypeName = self.comp(mainData).getValue("fSignatureTypeName"); //申请印章 
			var fUseDate = justep.Date.toString(self.comp(mainData).getValue("fUseDate"), "MM月dd日HH时mm分");//用印时间
			var fSake = self.comp(mainData).getValue("fSake");  
 
			 
			 
			var msg = fApplyPsnName + "的" + fSignatureTypeName + "使用申请\n"  
			       + "申请印章 ：" + fSignatureTypeName + "\n"  
			       + "用印时间：" + fUseDate + "\n";
			if (fSake) {
				msg += "用印事由："  + fSake + "\n";
			}
			
			//以上获取申请单基本信息。
			if(actionStep == "申请" || actionStep == "审批" || actionStep == "回退"){
				//查找当前环节的执行者。
				var sheetId = self.comp(mainData).getValue("OA_SL_Signature");
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
