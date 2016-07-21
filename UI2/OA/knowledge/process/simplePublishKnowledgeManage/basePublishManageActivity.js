define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var date = require("$UI/system/components/justep/input/js/datePicker");
	var Model = function(){
		this.callParent();
	};
	
	
	// 发布知识
	Model.prototype.relaseKnowledge = function(event){
		
		var data = this.comp('dKnowledge');
		if (data) {
			try {
				var kwid = data.getCurrentRowID();
				if (kwid) {
					//appCommon.DataUtils.refreshDataByRowIds(data, kwid);
					var releaseStatus = data.getValue("fReleaseStatus");
					if (releaseStatus == '1') {
						alert("该知识已经发布!");
						return;
					}
					var cfm = window.confirm('确定要发布吗?');
					if (cfm) {
						var fReleaseOgnID = this.getContext().getCurrentOgnID();
						var fReleaseOgnName = this.getContext().getCurrentOgnName();
						var fReleaseDeptID = this.getContext().getCurrentDeptID() || this.getContext().getCurrentOgnID();
						var fReleaseDeptName = this.getContext().getCurrentDeptName() || this.getContext().getCurrentOgnName();
						var fReleasePsnID = this.getContext().getCurrentPersonID();
						var fReleasePsnName = this.getContext().getCurrentPersonMemberNameWithAgent();
						                                     
						var fReleasePsnFID = this.getContext().getCurrentPersonMemberFID();
						var fReleasePsnFName = this.getContext().getCurrentPersonMemberFNameWithAgent();
						/*var fReleaseTime = justep.Date.toString(justep.System
								.datetime(), justep.Date.STANDART_FORMAT);*/
						//var fReleaseTime = date.getDate();
						//var fReleaseTime = new Date().toLocaleString();
						var fReleaseTime = justep.Date.toString(new Date(),
								justep.Date.STANDART_FORMAT);
						data.setValue('fReleaseOgnID',fReleaseOgnID);
						data.setValue('fReleaseOgnName',fReleaseOgnName);
						data.setValue('fReleaseDeptID',fReleaseDeptID);
						data.setValue('fReleaseDeptName',fReleaseDeptName);
						data.setValue('fReleasePsnID',fReleasePsnID);
						data.setValue('fReleasePsnName',fReleasePsnName);
						data.setValue('fReleasePsnFID',fReleasePsnFID);
						data.setValue('fReleasePsnFName',fReleasePsnFName);
						data.setValue('fReleaseTime',fReleaseTime);
						data.setValue('fReleaseStatus','1');
						data.setValue('fReleaseStatusName','已发布');
						data.saveData();
						alert("发布成功!");
					}
				} else {
					alert("当前没有可供发布的知识!");
					return;
				}
			} catch (e) {
				alert("发布知识出错!");
			}
		}
	};

	Model.prototype.cancelRelaseKnowledge = function(event){
		
		var data = this.comp('dKnowledge');
		if (data) {
			try {
				var kwid = data.getCurrentRowID();
				if (kwid) {
					//appCommon.DataUtils.refreshDataByRowIds(data, kwid);
					var releaseStatus = data.getValue("fReleaseStatus");
					if (releaseStatus == '0') {
						alert("该知识还未发布!");
						return;
					} else if (releaseStatus == '2') {
						alert("该知识已经取消发布!");
						return;
					}
					var cfm = window.confirm('确定要取消发布吗?');
					if (cfm) {
						data.setValue("fReleaseStatus", "2");
						data.setValue("fReleaseStatusName", "已取消");
						data.saveData();
						alert('取消发布成功!');
					}
				} else {
					alert("当前没有可供取消的知识!");
					return;
				}
			} catch (e) {
				alert("取消发布失败! ");
			}
		}
	};

	


	Model.prototype.orgFilterFilter = function(event){
		
		this.orgCondition = event.source.selectedValue.get();
	};

	Model.prototype.statusSelectUpdateValue = function(event){
		event.source.value;
	};

	return Model;
});