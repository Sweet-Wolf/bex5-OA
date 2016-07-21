define(function(require) {
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var KnowledgeInterface = require("$UI/OA/knowledge/js/knowledgeInterface");
	var Data = require("$UI/system/components/justep/data/data");
	
	var defBeginTimeAM = "8:30";
	var defEndTimeAM = "12:00";
	var defBeginTimePM = "13:00";
	var defEndTimePM = "17:30";
	var num =0;
	// 取上下班时间
	// function setSpecDayHours(beginDate){
	// var ksql = "select
	// e.fMorningBeginDate,e.fMorningendDate,e.fAfternoonBeginDate,e.fAfternoonendDate
	// from OA_WM_TimeEnactment e where e.fYear="+parseInt(beginDate.substring(0,
	// 4), 10);
	// var dataModel = "/OA/workTime/data";
	// var param = new justep.Request.ActionParam();
	// param.setString('ksql', ksql);
	// param.setString('dataModel', dataModel);
	// var result = justep.Request.sendBizRequest(
	// "/OA/workTime/process/leave/leaveProcess", "mainActivity",
	// "ksqlQueryAction", param, null, null, true);
	// var resultList = justep.XML.eval(result.responseXML,
	// "//rows/row");
	// for(var i=0;i<resultList.length;i++){
	// defBeginTimeAM = justep.XML.getNodeText(justep.XML.eval(
	// resultList[i], "cell[1]", "single"));
	// defEndTimeAM = justep.XML.getNodeText(justep.XML.eval(
	// resultList[i], "cell[2]", "single"));
	// defBeginTimePM = justep.XML.getNodeText(justep.XML.eval(
	// resultList[i], "cell[3]", "single"));
	// defEndTimePM = justep.XML.getNodeText(justep.XML.eval(
	// resultList[i], "cell[4]", "single"));
	// }
	//	
	// }
	return {
		// 计算周末天数
		removeWeek : function(beginDate, endDate) {
			var begin =new Date(beginDate.toString().split('-')[0],Number(beginDate.toString().split('-')[1])-1,beginDate.toString().split('-')[2]);
			var end =new Date(endDate.toString().split('-')[0],Number(endDate.toString().split('-')[1])-1,endDate.toString().split('-')[2]);
		    var	less=end-begin;
			var beginDay=begin.getDay();
			var endDay=end.getDay();
			var number=Math.floor(less / (1000 * 60 * 60) / 24 + 1);
			if (number == 1) {
				return 0;
			}
			var day1 = beginDay ? (7 + 1 - beginDay) : 1;// 第一周的天数
			var day2 = endDay ? endDay : 7;// 最后一周的天数
			var num1 = number - day1 - day2;// 中间的天数
			if (num1 < 0) {
				if(endDay == 0){
					if(beginDay==6){
						return 1;
					}else{
						return 2;
					}
				}else if(endDay == 6){
					return 1;
				}else{
					return 0;
				}
			}
			total = parseInt(num1 / 7) * 2 + (day1 ==1 ? 1 : 2)
					+ (day2 <=5 ? 0 : day2-5);
			return total;
		},
		
		// 计算请假天数		
		calLeaveData : function(beginTime, endTime) {			
			var beginDate = this.getDateFormDateTime(beginTime);
			var endDate = this.getDateFormDateTime(endTime);
			var bTime = this.getTimeFormDateTime(beginTime);
			var eTime = this.getTimeFormDateTime(endTime);
			
			var hour = 0;
			if(beginDate == endDate) {
				 var flag = this.isHoliday(beginDate); // 判断该日为休息
				 if(flag) {
				 hour = 0;
				 } else {
					hour = this.getSpecDayHour(bTime,eTime);
				 }				 
			} else {
				var week=this.removeWeek(beginDate,endDate);
				
				var bHour = 0; 
				var itvHour = 0; 
				var eHour = 0;
				 if(!this.isHoliday(beginDate)) {
					bHour = this.getSpecDayHour(bTime,defEndTimePM);
				 }
				
				 if(!this.isHoliday(endDate)) {
					eHour = this.getSpecDayHour(defBeginTimeAM,eTime);
				 }
				var arrBDate = beginDate.split("-");
				var arrEDate = endDate.split("-");
				var bDate = new Date();
				var eDate = new Date();
				bDate.setFullYear(arrBDate[0],arrBDate[1]*1-1,arrBDate[2]);
				eDate.setFullYear(arrEDate[0],arrEDate[1]*1-1,arrEDate[2]);
				itvHour = ((eDate - bDate)/(3600*24*1000)- 1) * 8;
				var reArray = this.getHolidays(itvHour,beginDate,endDate);
				// itvHour = itvHour - holidays * 8;
				hour = bHour + reArray["itvHour"] + eHour-(week*8)+(num*8);
				num=0;
			}
			return hour;
			
		},
		// isHoliday(date) : 判断某一天是否为假期,返回值类型:布尔值
		// getHolidays(beginDate,endDate) 获取某日期段内的休息日天数，返回类型:数值
		// 注意：getHolidays 的查询条件应该是 (fDate > beginDate) and (fDate < endDate)
		// 伪ksql: select count(xx) from xx where (fDate > beginDate) and (fDate <
		// endDate)
		
		
		// 计算小时(只计算同一天)
		getSpecDayHour : function(bTime,eTime) {
			var hour = 0;
			var rBTime = this.getRealBTime(bTime);
			var rETime = this.getRealETime(eTime);
			return this.calHour(rBTime,rETime);
		},
		// 判断是否是节假日
		getHolidays : function(itvHour,beginDate,endDate){
			var datetime1=new Date(beginDate.toString().split("-")[0],Number(beginDate.toString().split("-")[1])-1,beginDate.toString().split("-")[2]);
			var time1=new Date(datetime1.getTime()+24 * 60 * 60 * 1000);
			var s1=time1.getFullYear()+"-"+(time1.getMonth()+1)+"-"+time1.getDate();
			
			var datetime2=new Date(endDate.toString().split("-")[0],Number(endDate.toString().split("-")[1])-1,endDate.toString().split("-")[2]);
			var time2=new Date(datetime2.getTime()-24 * 60 * 60 * 1000);
			var s2=time2.getFullYear()+"-"+(time2.getMonth()+1)+"-"+time2.getDate();
			
			var ksql = "select e.fDate,e.fState from OA_WM_Holiday e where  e.fDate between stringToDate('"+s1+"') and stringToDate('"+s2+"')";																										 
			var dataModel = "/OA/workTime/data";
			/*var param = new justep.Request.ActionParam();
			param.setString('ksql', ksql);
			param.setString('dataModel', dataModel);
			var result = justep.Request.sendBizRequest(
					"/OA/workTime/process/leave/leaveProcess", "mainActivity",
					"ksqlQueryAction", param, null, null, true);
			var resultList = justep.XML.eval(result.responseXML,
			"//rows/row");*/
			var resultList="";
			var params = new biz.Request.ActionParam();
			params.setParam("ksql", ksql);
			params.setParam("dataModel", dataModel);
			//var ctx = this.getContext();
			var options = {
				//context : ctx,
				process : "/OA/workTime/process/leave/leaveProcess",
				activity : "mainActivity",
				action : "ksqlQueryAction",
				parameters : params,
				callback: function(data){
					if(data.state){
						resultList=data.response;
					}//else{
					//	Request.errorMessage(resultData, "执行失败！", null, null);
					//}	
				}
			};		
			var r=biz.Request.sendBizRequest(options);
			
			var fLeaveTypeID;
			var fDate="";
			var count=0;
			var num1=0;
			var reArray = new Array();
			var date = new Date();
			for(var i=0;i<resultList.length;i++){
				fLeaveTypeID = justep.XML.getNodeText(justep.XML.eval(
						resultList[i], "cell[2]", "single"));
				fDate = justep.XML.getNodeText(justep.XML.eval(
						resultList[i], "cell[1]", "single"));
				var arrBDate = fDate.split("-");
				date.setFullYear(arrBDate[0],arrBDate[1]*1-1,arrBDate[2]);
				if(fLeaveTypeID =='2'){// 上班
					if(date.getDay()=="0" ||date.getDay()=="6"){// 并且是周末
						num++;
						num1++;
					}  
				}
				if(fLeaveTypeID =='1'){// 休息
					if(date.getDay()!="0" && date.getDay()!="6"){// 并且不是周末
					  count++;
					  num1--;
					}
				}
			}
			itvHour=itvHour-(count*8);
			reArray["itvHour"] = (itvHour);
			reArray["num1"] = (num1);
			return reArray;
		},
		//
				
		calHour : function(bTime,eTime) {
			var result = 0;
			var arrT1 = bTime.split(":");
			var arrT2 = eTime.split(":");
			var h1 = parseInt(arrT1[0].replace(/^[0]/g,""));
			var h2 = parseInt(arrT2[0].replace(/^[0]/g,"")); 
			var m1 = parseInt(arrT1[1].split(":")[0].replace(/^[0]/g,""));
			var m2 = parseInt(arrT2[1].split(":")[0].replace(/^[0]/g,""));
			if(this.compareTime(bTime,defEndTimeAM) && this.compareTime(defBeginTimePM,eTime)) {
				result =  Math.ceil(((h2*60+m2) - (h1*60+m1) - this.calMinute(defEndTimeAM,defBeginTimePM))/60);
			} else  {
				result = Math.ceil(((h2*60+m2) - (h1*60+m1))/60); 
			}
			return result;
		},
		// 判断某一天是否为假期
		isHoliday : function(beginDate){
			var ksql = "select e.fState from OA_WM_Holiday e where e.fDate = stringToDate('"+beginDate+"')";
			var dataModel = "/OA/workTime/data";
			/*var param = new justep.Request.ActionParam();
			param.setString('ksql', ksql);
			param.setString('dataModel', dataModel);
			var result = justep.Request.sendBizRequest(
					"/OA/workTime/process/leave/leaveProcess", "mainActivity",
					"ksqlQueryAction", param, null, null, true);
			var resultList = justep.XML.eval(result.responseXML,
			"//rows/row");*/
			var resultList="";
			var params = new biz.Request.ActionParam();
			params.setParam("ksql", ksql);
			params.setParam("dataModel", ksql);
			//var ctx = this.getContext();
			var options = {
				//context : ctx,
				process : "/OA/workTime/process/leave/leaveProcess",
				activity : "mainActivity",
				action : "ksqlQueryAction",
				parameters : params,
				callback: function(data){
					if(data.state){
						resultList=data.response;
					}	
				}
			};		
			var r=biz.Request.sendBizRequest(options);

			var fState="";
			for(var i=0;i<resultList.length;i++){
				 fState = justep.XML.getNodeText(justep.XML.eval(
						resultList[i], "cell[1]", "single"));
				    var arrBDate = beginDate.split("-");
					var bDate = new Date();
					bDate.setFullYear(arrBDate[0],arrBDate[1]*1-1,arrBDate[2]);
					if(fState =='1'){// 休息
						return true;
					}else if(fState =='2'){// 上班
						if(bDate.getDay()=="0" ||bDate.getDay()=="6"){// 并且是周末
					       num++;
						}
						return false;
					}
			}
		},
		
		isHoliday1 : function(beginDate){			
			var ksql = "select e.fState from OA_WM_Holiday e where e.fDate = stringToDate('"+beginDate+"')";
			var dataModel = "/OA/workTime/data";
			/*var param = new justep.Request.ActionParam();
			param.setString('ksql', ksql);
			param.setString('dataModel', dataModel);
			var result = justep.Request.sendBizRequest(
					"/OA/workTime/process/leave/leaveProcess", "mainActivity",
					"ksqlQueryAction", param, null, null, true);
			var resultList = justep.XML.eval(result.responseXML,
			"//rows/row");*/
			var resultList="";
			var params = new biz.Request.ActionParam();
			params.setParam("ksql", ksql);
			params.setParam("dataModel", ksql);
			//var ctx = this.getContext();
			var options = {
				//context : ctx,
				process : "/OA/workTime/process/leave/leaveProcess",
				activity : "mainActivity",
				action : "ksqlQueryAction",
				parameters : params,
				callback: function(data){
					if(data.state){
						resultList=data.response;
					}	
				}
			};		
			var r=biz.Request.sendBizRequest(options);
			var fState="";
			for(var i=0;i<resultList.length;i++){
				 fState = justep.XML.getNodeText(justep.XML.eval(
						resultList[i], "cell[1]", "single"));
			}
			var arrBDate = beginDate.toString().split("-");
			var bDate = new Date();
			bDate.setFullYear(arrBDate[0],arrBDate[1]*1-1,arrBDate[2]);
			if(fState =='1'){
				if(bDate.getDay()!="0" && bDate.getDay()!="6"){
					return true;
				}
			}
			if(fState =='2'){
				if(bDate.getDay()=="0" || bDate.getDay()=="6"){
					return false;
				}
			}
		},
		
		calMinute : function(bTime,eTime) {
			var result = 0;
			var arrT1 = bTime.split(":");
			var arrT2 = eTime.split(":");
			var h1 = parseInt(arrT1[0].replace(/^[0]/g,""));
			var h2 = parseInt(arrT2[0].replace(/^[0]/g,"")); 
			var m1 = parseInt(arrT1[1].split(":")[0].replace(/^[0]/g,""));
			var m2 = parseInt(arrT2[1].split(":")[0].replace(/^[0]/g,""));
			return ((h2*60+m2) - (h1*60+m1));
		},
		
		// 获得实际开始时间
		getRealBTime : function(bTime) {
			var rBTime = "";
			if(!this.compareTime(defBeginTimeAM,bTime)) {
				rBTime = defBeginTimeAM;
			} else if(!this.compareTime(defEndTimeAM,bTime)) {
				rBTime = bTime;
			} else if(!this.compareTime(defBeginTimePM,bTime)) {
				rBTime = defBeginTimePM;
			} else if(!this.compareTime(defEndTimePM,bTime)) {
				rBTime = bTime;
			} else {
				rBTime = defEndTimePM;
			}
			return rBTime;
		},
		
		// 获得实际结束时间
		getRealETime : function(eTime) {
			var rETime = "";
			if(!this.compareTime(defBeginTimeAM,eTime)) {
				rETime = defBeginTimeAM;
			} else if(this.compareTime(defEndTimePM,eTime)) {
				rETime = defEndTimePM;
			} else if(this.compareTime(defEndTimeAM,eTime) && (!this.compareTime(defBeginTimePM,eTime))) {
				rETime = defEndTimeAM;
			} else {
				rETime = eTime;
			}
			
			return rETime;
		},
		// time1 <= time2 则返回true,否则返回false
		// time格式：08:30 或 12:30:30
		compareTime : function(time1,time2) {
			var arrT1 = time1.split(":");
			var arrT2 = time2.split(":");
			
			var h1 = parseInt(arrT1[0].replace(/^[0]/g,""));
			var h2 = parseInt(arrT2[0].replace(/^[0]/g,"")); 
			var m1 = parseInt(arrT1[1].split(":")[0].replace(/^[0]/g,""));
			var m2 = parseInt(arrT2[1].split(":")[0].replace(/^[0]/g,""));
			
			if(h2 > h1) {
				return true;
			} else if(h2 < h1) {
				return false;
			} else {
				if(m2 >= m1) {
					return true;
				} else {
					return false;
				}
			}
		},
		
		getDateFormDateTime : function(dateTime) {			
			var date = "";
			try {
				date = dateTime.toString().split(" ")[0];
			} catch(e){}
			
			return date;
		},
		
		getTimeFormDateTime : function(dateTime) {
			var time = "";
			try {
				time = (dateTime.toString().split(" ")[1]).substring(0,5);
			} catch(e){}
			
			return time;
		}
	
	};
});