define(function(require) {
	var IM = require("$UI/OA/common/js/sendMessage");
	var biz = require("$UI/system/lib/biz");
	//发送消息   docUtils.recordReaded(me.getContext(),me.docId);
	return {
		//需要的参数 self 当前model；mainData 主表data；detailData 子表data；
		//actionStep 描述单据的动作："申请"：即申请人流转到审批人的动作
		//"审批"：即审核人的审批动作；"回退"：当前环节的审批人回退给上一环节的审批人；“终止”即当前环节的审批人终止申请。
		sendMsg : function(self, mainData, detailData, actionStep) {
			//发送消息；消息格式：
			//xxx的办公用品申请 需求日期，申请原因，
			//if(actionStep == "申请"){ //当申请时需要重新刷新数据以获取状态。
			self.comp(mainData).refreshData();
			//}
			var personId = self.comp(mainData).getValue("fApplyPsnID");
			var fApplyPsnName = self.comp(mainData).getValue("fApplyPsnName");
			var msg = fApplyPsnName + "的办公用品申请\n";
			var date = self.comp(mainData).getValue("fApplyDate");
			if(date){
				msg += "需求日期：" + date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate() + "日\n";
			}
			var reason = self.comp(mainData).getValue("fApplyReason");
			if(reason){
				msg += "申请原因：" + reason + "\n";
			}
			var manifest=[];
			//遍历detail
			var data = self.comp(detailData);
			data.each(function(param){
			  manifest.push(param.row.val('fName'));
			});
			if(manifest.length > 0){
				msg += "申领清单：" + manifest.join(",") + "\n";
			}
			//以上获取申请单基本信息。
			if(actionStep == "申请" || actionStep == "审批" || actionStep == "回退" || actionStep == "签收"){
				//查找当前环节的执行者。
				var sheetId = self.comp(mainData).getValue("OA_OSC_UseApplyM");
				var activityName = self.comp("mainData").getValue("fCurrentActivities").replace(/(^\s*)|(\s*$)/g, "");
				if(actionStep == "审批"){
					msg += "状态：" + self.getContext().getCurrentPersonName()  + "已审批";
				} else if (actionStep == "回退") {
					msg += "状态：" + self.getContext().getCurrentPersonName()  + "回退了此申请";
				} else if (actionStep == "签收") {
					msg += "状态：" + self.getContext().getCurrentPersonName()  + "已签收";
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
