define(function(require) {
	var IM = require("$UI/OA/common/js/sendMessage");
	var biz = require("$UI/system/lib/biz");
	var justep = require("$UI/system/lib/justep");
	return {
		//需要的参数 self 当前model；mainData 主表data
		//actionStep 描述单据的动作："申请"：即申请人流转到审批人的动作
		//"审批"：即审核人的审批动作；"回退"：当前环节的审批人回退给上一环节的审批人；“终止”即当前环节的审批人终止申请。
		sendMsg : function(self, mainData, actionStep) {
			//发送消息；消息格式：
			//xxx的办公用品申请 需求日期，申请原因，
			//if(actionStep == "申请"){ //当申请时需要重新刷新数据以获取状态。
			self.comp(mainData).refreshData();
			
			//}
			var personId = self.comp(mainData).getValue("fApplyPersonID");
			var fApplyPsnName = self.comp(mainData).getValue("fApplyPersonName");
			var fLeaveTypeName = self.comp(mainData).getValue("fLeaveTypeName");
			
			var fLeaveDays = self.comp(mainData).getValue("fLeaveDays");
			var fLeaveHours = self.comp(mainData).getValue("fLeaveHours");
			var leaveLength = "(";
			if(fLeaveDays && fLeaveDays != "0"){
				leaveLength += fLeaveDays + "天";
			}
			if(fLeaveHours && fLeaveHours != "0"){
				leaveLength += fLeaveHours + "小时";
			}
			
			leaveLength +=  ")";
			var msg = fApplyPsnName + "的" + fLeaveTypeName + "申请" + leaveLength +"\n";
			
			var dateBegin = self.comp(mainData).getValue("fStartTime");
			var dateEnd = self.comp(mainData).getValue("fEndTime");
			
			hint = IM.getDateRangeDesciption(dateBegin,dateEnd);
			
			msg += "请假周期：" + hint + "\n";
			 
			
			/*if(dateBegin){
				msg += "请假周期：" + justep.Date.toString(dateBegin, "yyyy年MM月dd日HH时mm分\n");
			}
			var dateEnd = self.comp(mainData).getValue("fEndTime");
			if(dateEnd){
				msg += "至：" + dateEnd.getFullYear()+"年"+(dateEnd.getMonth()+1)+"月"+dateEnd.getDate() + "日"
				  + dateEnd.getHours() + "时" + dateEnd.getMinutes() + "分\n";
			}*/
			   
			//暂时没有原因
			/*var reason = self.comp(mainData).getValue("fApplyReason");
			if(reason){
				msg += "申请原因：" + reason + "\n";
			}*/
			//以上获取申请单基本信息。
			if(actionStep == "申请" || actionStep == "审批" || actionStep == "回退"){
				//查找当前环节的执行者。
				var sheetId = self.comp(mainData).getValue("OA_WM_LeaveApply");
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
