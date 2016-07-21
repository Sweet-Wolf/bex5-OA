define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Data = require("$UI/system/components/justep/data/data");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function(){
		this.callParent();
	};
	
	var orgData="",vacationData="",tempData="",changeData="",yearData="";
	Model.prototype.modelModelConstructDone = function(event){
		orgData=this.comp("oporgData");
		vacationData=this.comp("vacationData");
		tempData=this.comp("tempData");
		changeData=this.comp("changeData");
		yearData=this.comp("yearData");		
	};
	
	Model.prototype.modelLoad = function(event){
		changeData.deleteAllData();
		changeData.newData();

		orgData.setFilter("myFilter","SA_OPOrg.sOrgKindID ='ogn' or SA_OPOrg.sOrgKindID ='dpt' or SA_OPOrg.sOrgKindID ='pos'");
		orgData.refreshData();		
		var fdate=justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT_SHOT);
		var year=parseInt(fdate.split("-")[0]);
		for ( var i = year + 3; i >= year + 1; i--) {
			yearData.newData();
			yearData.setValue("year", i);
		}
		for ( var i = year; i >= year - 3; i--) {
			yearData.newData();
			yearData.setValue("year", i);
		}		
		//orgData.instance.store.expand("_is_root_");//展开根节点

		/* 过滤年度 */
		vacationData.setFilter("filter0", "OA_WM_Vacation.fYear='" + year + "'");
		vacationData.refreshData();
		vacationData.setFilter("filter0", "");
	};
	
	//列表双击进详细
	Model.prototype.grid1RowDblClick = function(event){
		var id = event.row.getID();
		vacationData.to(id);
		var tabs = this.comp('tabs');
		tabs.setActiveTab('nav-detail');

		var fPersonID=vacationData.getValue("fPersonID");
		var leaveApplyData = this.comp("leaveApplyData");
		if (fPersonID){
			var filter = "OA_WM_LeaveApply.fApplyPersonID='" + fPersonID + "'";
			leaveApplyData.setFilter("____dataFilter_", filter);
			leaveApplyData.refreshData(); 
		}
	};
	
	//显示下级	
	Model.prototype.checkboxChange = function(event){		
		changeData.saveData();
		this.refreshData();
	};
	
	//左边树点击
	Model.prototype.treeGridRowClick = function(event){
		//this.setSelected(this.comp("treeData").getRowByID(event.rowID));
		this.refreshData();
	};
	
	Model.prototype.refreshData = function(event){
		var connection = "";
		var sID = orgData.getCurrentRowID();		
		if (changeData.getValue('isChange') != 1) {
			connection = "fDeptID ='" + sID + "'";
		} else {
			if (sID != "_is_root_") {
				var ksql = "select t.sPersonID from SA_OPOrg t where t.sFID like '%/" + sID + "%' and t.sPersonID  is not null";
				var dataModel = "/system/data";
				var returnList="";
				var params = new biz.Request.ActionParam();
				params.setParam("ksql", ksql);
				params.setParam("dataModel", dataModel);
				var ctx = this.getContext();
				var options = {
					context : ctx,
					process : "/OA/workTime/process/Vacation/vacationProcess",
					activity : "mainActivity",
					action : "ksqlQueryAction",
					parameters : params,
					callback: function(data){
						if(data.state){
							returnList=data.response.rows;//JSON.stringify(data.response);							
						}else{
							Request.errorMessage(resultData, "执行失败！", null, null);
						}	
					}
				};		
				var r=biz.Request.sendBizRequest(options);				
				var leng=returnList.length;
				
				var fPersonID = "";
				for ( var i = 0; i < leng; i++) {					
					fPersonID += "'"+returnList[i].sPersonID.value+"',";
					//fPersonID += "'" + justep.XML.getNodeText(biz.XML.eval(returnList[i], "cell[1]", "single")) + "',";
				}
				
				if (leng > 0) {
					fPersonID = fPersonID.substring(0, fPersonID.length - 1);
					connection = "OA_WM_Vacation.fPersonID in (" + fPersonID + ")";
				} else {
					connection = "OA_WM_Vacation.fPersonID ='" + fPersonID + "'";
				}
			}
		}
		vacationData.setFilter("myFilter", connection);
		vacationData.refreshData();
	};
	
	//生成假期，弹出窗口
	Model.prototype.button4Click = function(event){
		var url=require.toUrl("$UI/OA/workTime/process/Vacation/yearActivity.w");
		var year=tempData.getValue("year");
		if (year == null || year == "" || undefined == year) {
			alert('请选择要生成假期的年度!');
		} else {
			this.comp("yearDialog").open({src:url,data:{year:year}});
		}
	};
	
	//生成假期
	Model.prototype.yearDialogReceive = function(event){
		var fEffectiveDate = event.data.effectiveDate.toString();//returnData.getValue("effectiveDate");// 生效日期
		var fExpiryDate = event.data.failureDate.toString();//returnData.getValue("failureDate");// 失效日期
		
		if (fEffectiveDate == "" || fEffectiveDate == null || fEffectiveDate == undefined || fExpiryDate == "" || fExpiryDate == null || fExpiryDate == undefined) {
			alert('生效失效日期必填！');
		} else {
			var fEffective = new Date(fEffectiveDate.split('-')[0], fEffectiveDate.split('-')[1] - 1, fEffectiveDate.split('-')[2]);
			var fExpiry = new Date(fExpiryDate.split('-')[0], fExpiryDate.split('-')[1] - 1, fExpiryDate.split('-')[2]);
			if (fExpiry - fEffective >= 0) {
				var calculationYear = tempData.getValue("year");
				var ksql = "select e,e.sName,e.sCode,e.sMainOrgID,"	+ calculationYear + "-getYear(e.sJoinDate),e.sJoinDate from SA_OPPerson e";
				var dataModel = "/system/data";
				var returnList="";
				var params = new biz.Request.ActionParam();
				params.setParam("ksql", ksql);
				params.setParam("dataModel", dataModel);
				var ctx = this.getContext();
				var options = {
					context : ctx,
					process : "/OA/workTime/process/Vacation/vacationProcess",
					activity : "mainActivity",
					action : "ksqlQueryAction",
					parameters : params,
					callback: function(data){
						if(data.state){
							returnList=data.response.rows;				
						}else{
							Request.errorMessage(resultData, "执行失败！", null, null);
						}	
					}
				};		
				var r=biz.Request.sendBizRequest(options);
				
				var year=tempData.getValue("year");
				ksql = "delete from OA_WM_Vacation o where o.fYear='" + year + "'";
				dataModel = "/OA/workTime/data";				
				params = new biz.Request.ActionParam();
				params.setParam("ksql", ksql);
				params.setParam("dataModel", dataModel);
				var ctx = this.getContext();
				var options = {
					context : ctx,
					process : "/OA/workTime/process/Vacation/vacationProcess",
					activity : "mainActivity",
					action : "ksqlUpdateAction",
					parameters : params
				};		
				r=biz.Request.sendBizRequest(options);				
				
				var result1=0;				
				for ( var i = 0; i < returnList.length; i++) {
					var fPersonID = returnList[i].e.value;//justep.XML.getNodeText(justep.XML.eval(returnList[i], "cell[1]", "single"));//人员ID
					var fPersonName = returnList[i].sName.value;//justep.XML.getNodeText(justep.XML.eval(returnList[i], "cell[2]", "single"));//人员
					var fPersonCode = returnList[i].sCode.value;//justep.XML.getNodeText(justep.XML.eval(returnList[i], "cell[3]", "single"));//人员编码
					var fDeptID = returnList[i].sMainOrgID.value;//justep.XML.getNodeText(justep.XML.eval(returnList[i], "cell[4]", "single"));//部门ID					
					var seniority = returnList[i].COM_1.value;//justep.XML.getNodeText(justep.XML.eval(returnList[i], "cell[5]", "single"));
					var cjgzrq = returnList[i].sJoinDate.value;//justep.XML.getNodeText(justep.XML.eval(returnList[i],"cell[6]", "single")); // 参加工作日期

					var vacation = 0;
					if (seniority >= 1 && seniority < 10) {
						if (seniority == 1) {
							var month, day;
							month = cjgzrq.substring(5, 7);
							day = cjgzrq.substring(8, 10);
							fEffectiveDate = calculationYear + "-" + month + "-" + day;// 改变生效日期
						}
						vacation = 5;
					} else if (seniority >= 10 && seniority < 20) {
						vacation = 10;
					} else if (seniority >= 20) {
						vacation = 15;
					}

					// 更新年假表
					var rowid = this.generateGuid();	
					var str = "null";
					if (cjgzrq != null && cjgzrq != "" && undefined != cjgzrq) {
						str = "stringToDate('" + cjgzrq + "')";
					}
					ksql = "insert into OA_WM_Vacation o (o,o.version,o.fYear,o.fPersonID,o.fPersonName,o.fPersonCode,o.fDeptID,o.fLeaveTypeName,o.fLeaveTypeID,o.fHoliday,o.fLeavingsDay,o.fLeavingsHour,o.fAlreadyDay,o.fAlreadyHour,o.fRemark,o.fEffectiveDate,o.fExpiryDate,o.fJoinInWork)"
							+ "values('"+rowid+ "',0,"+ calculationYear+ ",'"+ fPersonID+ "','"+ fPersonName+ "','"+ fPersonCode+ "','"+ fDeptID+ "','年假','nj',"+ vacation+ ","+ vacation+ ",0,0,0,null,stringToDate('"+ fEffectiveDate+ "'),stringToDate('" + fExpiryDate + "')," + str + ")";
					params = new biz.Request.ActionParam();
					params.setParam("ksql", ksql);
					params.setParam("dataModel", dataModel);
					var ctx = this.getContext();
					var options = {
						context : ctx,
						process : "/OA/workTime/process/Vacation/vacationProcess",
						activity : "mainActivity",
						action : "ksqlUpdateAction",
						parameters : params
					};		
					result1=biz.Request.sendBizRequest(options);
				
				}
				if (!result1) {
					throw new Error(biz.Request.getServerError(r, "操作失败!"));
				} else {
					alert('操作成功!');
				}
				/*
				if (justep.XML.eval(result1.responseXML, "/root/data/*")[0].text > 0) {
					alert('操作成功!');
					vacationData.refreshData();
				} else {
					alert('操作失败!');
				}*/
			} else {
				alert('生效日期必须小于失效日期！');
			}
		}
	};
	
	Model.prototype.generateGuid = function(event){
		var guid = [];
		for ( var i = 1; i <= 32; i++) {
			guid.push(Math.floor(Math.random() * 16.0).toString(16));
		}
		return guid.join("");
	}
		
	return Model;
});