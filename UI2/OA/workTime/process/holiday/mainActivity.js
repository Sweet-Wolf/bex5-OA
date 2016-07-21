define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	
	var mainData ="";
	Model.prototype.modelModelConstructDone = function(event){
		mainData = this.comp('mainData');		
	};
		
	//数据改变,判断日期不能重复
	Model.prototype.mainDataValueChanged = function(event){
		var fDate = mainData.getValue('fDate');		
		var id = mainData.getCurrentRowID();
		if(event.col=='fDate' && fDate!="" && id!=""){			
			var falg = this.checkDate1(fDate, id);
			if (falg == true) {
				alert('日期重复！');
				mainData.setValue('fDate', "");
			} else {
				mainData.setValue('fYear', fDate.toString().split("-")[0]);
			}
		}
	};	
	//自定函数,判断日期不能重复
	Model.prototype.checkDate1 = function(date, id){
		var params = new biz.Request.ActionParam();
		params.setParam("date", date.toString());
		params.setParam("id", id);	
		var code="";	
		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "checkAction",
			parameters : params,
			callback: function(data){
				if(data.state){
					code=data.response;
				}else{
					Request.errorMessage(resultData, "执行失败！", null, null);
				}	
			}
		};		
		var falg=biz.Request.sendBizRequest(options);
		return code;
	};	

	//类型选择类型事件
	Model.prototype.typeSelectUpdateValue = function(event){
		var fid = mainData.getCurrentRow();
		var type = mainData.getValue('fLeaveTypeName', fid);
		var fState = mainData.getValue('fState', fid);
		if (type == '正常上班') {
			mainData.setValue('fMultiple', 0);
			mainData.setValue('fStateName', '休息');
			mainData.setValue('fState', '1');			
		} else if (type == '法定假日') {
			mainData.setValue('fMultiple', 3);
			mainData.setValue('fStateName', '上班');
			mainData.setValue('fState', '2');
		} else {
			mainData.setValue('fMultiple', 0);
			mainData.setValue('fStateName', '上班');
			mainData.setValue('fState', '2');				
		}
	};
	
	//状态选择类型事件
	Model.prototype.stateSelectUpdateValue = function(event){		
		var fid = mainData.getCurrentRow();
		var type = mainData.getValue('fLeaveTypeName', fid);
		var fState = mainData.getValue('fState', fid);
		if (type == '法定假日' && fState == '2') {
			mainData.setValue('fMultiple', 3);
		} else {
			mainData.setValue('fMultiple', 0);
		}
	};

	//删除事件
	Model.prototype.deleteBtnClick = function(event){
		var list = this.comp("mainGrid").getCheckeds();
		if (list.length > 1) {
			for(var i=0; i<list.length; i++){
				mainData.deleteData(mainData.getRowByID(list[i]));
			}
		} else {
			mainData.deleteData(mainData.getCurrentRow());
		}
	};

	//批量添加
	Model.prototype.newsBtnClick = function(event){
		var url=require.toUrl("$UI/OA/workTime/process/holiday/newsActivity.w");
		this.comp("newsDialog").open({src:url});
	};

	//批量添加返回值
	Model.prototype.newsDialogReceive = function(event){
		var beginDate = event.data.fBeginDate;
		var fEndDate = event.data.fEndDate;
		var fLeaveTypeID = event.data.fLeaveTypeID;
		var fLeaveTypeName = event.data.fLeaveTypeName;
		var fState = event.data.fState;
		var fStateName = event.data.fStateName;
		var fName = event.data.fName;

		var begin = new Date(beginDate.toString().split("-")[0], beginDate.toString().split("-")[1]-1, beginDate.toString().split("-")[2]);		
		var end = new Date(fEndDate.toString().split("-")[0], fEndDate.toString().split("-")[1]-1, fEndDate.toString().split("-")[2]);
		var less = end - begin;

		var array = new Array();
		var crrentTime = begin;
		while (crrentTime <= end) {
			array.push(crrentTime);
			crrentTime = new Date(crrentTime.getTime() + 24 * 60 * 60 * 1000);
		}

		var falg = "";
		for ( var i = 0; i < array.length; i++) {			
			var fdate=justep.Date.toString(array[i], justep.Date.STANDART_FORMAT_SHOT);
			var fyear=parseInt(fdate.split("-")[0]);
			falg=this.checkDate1(fdate, " ");

			if (falg == false) {
				if (fState == '2') {
					if (fLeaveTypeName == '正常上班') {					
						if (array[i].getDay() != '0' && array[i].getDay() != '6') {
							mainData.newData();
							mainData.setValue("fName", fName, mainData.getCurrentRow());
							mainData.setValue("fDate", fdate, mainData.getCurrentRow());
							mainData.setValue("fLeaveTypeID", fLeaveTypeID, mainData.getCurrentRow());
							mainData.setValue("fLeaveTypeName", fLeaveTypeName, mainData.getCurrentRow());
							mainData.setValue("fMultiple", 0, mainData.getCurrentRow());
							mainData.setValue("fStateName", fStateName, mainData.getCurrentRow());
							mainData.setValue("fState", fState, mainData.getCurrentRow());
							mainData.setValue("fYear", fyear, mainData.getCurrentRow());
						}
					} else if (fLeaveTypeName == '法定假日') {
						if (array[i].getDay() == '0' || array[i].getDay() == '6') {
							mainData.newData();
							mainData.setValue("fName", fName, mainData.getCurrentRow());
							mainData.setValue("fDate", fdate, mainData.getCurrentRow());
							mainData.setValue("fLeaveTypeID", fLeaveTypeID, mainData.getCurrentRow());
							mainData.setValue("fLeaveTypeName", fLeaveTypeName, mainData.getCurrentRow());
							mainData.setValue("fMultiple", 3, mainData.getCurrentRow());
							mainData.setValue("fStateName", fStateName, mainData.getCurrentRow());
							mainData.setValue("fState", fState, mainData.getCurrentRow());
							mainData.setValue("fYear", fyear, mainData.getCurrentRow());
						}
					} else {
						if (array[i].getDay() == '0' || array[i].getDay() == '6') {
							mainData.newData();
							mainData.setValue("fName", fName, mainData.getCurrentRow());
							mainData.setValue("fDate", fdate, mainData.getCurrentRow());
							mainData.setValue("fLeaveTypeID", fLeaveTypeID, mainData.getCurrentRow());
							mainData.setValue("fLeaveTypeName", fLeaveTypeName, mainData.getCurrentRow());
							mainData.setValue("fMultiple", 0, mainData.getCurrentRow());
							mainData.setValue("fStateName", fStateName, mainData.getCurrentRow());
							mainData.setValue("fState", fState, mainData.getCurrentRow());
							mainData.setValue("fYear", fyear, mainData.getCurrentRow());
						}
					}
				} else {
					if (array[i].getDay() != '0' && array[i].getDay() != '6') {
						mainData.newData();
						mainData.setValue("fName", fName, mainData.getCurrentRow());
						mainData.setValue("fDate", fdate, mainData.getCurrentRow());
						mainData.setValue("fLeaveTypeID", fLeaveTypeID, mainData.getCurrentRow());
						mainData.setValue("fLeaveTypeName", fLeaveTypeName, mainData.getCurrentRow());
						mainData.setValue("fMultiple", 0, mainData.getCurrentRow());
						mainData.setValue("fStateName", fStateName, mainData.getCurrentRow());
						mainData.setValue("fState", fState, mainData.getCurrentRow());
						mainData.setValue("fYear", fyear, mainData.getCurrentRow());
					}
				}
			}
		}	
		mainData.saveData();
		mainData.refreshData();
	};

	

	

	return Model;
});

