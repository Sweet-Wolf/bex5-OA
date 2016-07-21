define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OA = require("$UI/OA/common/js/pub");

	var Model = function() {
		this.callParent();
	};

	// 显示日程详情
	Model.prototype.windowReceiverReceive = function(event) {
		var detailData = this.comp('detailData');
		detailData.setFilter('filter1', "OA_SD_Schedule = '" + event.data.scheID + "'");
		detailData.refreshData();
		detailData.setValue('fShowTime', OA.transformDateTime(detailData.getValue('fBeginTime')));

	
		//同事的日程不能编辑，与会人不能编辑
		this.comp("editBtn").set({disabled : !(event.data.canEdit && this.comp('detailData').getValue('fCreatePsnID') == this.getContext().getCurrentPersonID())});
	};

	// 返回列表 
	Model.prototype.listBtnClick = function(event) {
		this.comp('windowReceiver').windowEnsure();
	};
	//计算显示时间
	Model.prototype.getTime = function(event) {
		if (event.getValue('fBeginTime')) {
			var startTime = justep.Date.toString(event.getValue('fBeginTime'), "yyyy-MM-dd hh:mm");
			var endTime = justep.Date.toString(event.getValue('fEndTime'), "yyyy-MM-dd hh:mm");
			if(startTime.substr(0,10) == endTime.substr(0,10)) 
				return startTime + ' - ' + endTime.substr(11,5);
			else
				return startTime + ' - ' + endTime;
		}
	};

	//进入编辑页面
	Model.prototype.editBtnClick = function(event) {
		this.comp('editDialog').open({data : this.comp('detailData').getValue('OA_SD_Schedule')});
	};
	
	//从编辑页面返回
	Model.prototype.editDialogReceive = function(event){
		this.comp("detailData").refreshData();
		
	};

	return Model;
});

