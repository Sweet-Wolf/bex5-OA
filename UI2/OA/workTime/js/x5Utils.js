define(function(require) {
	var _activity = "mainActivity";
	
	//var x5Utils = {
	return {
		/**
		 * 发送查询ksql语句
		 */
		executeQuery : function(process, ksql, dataModel) {		
			/*
			var param = new justep.Request.ActionParam();
			param.setString('ksql', ksql);
			param.setString('dataModel', dataModel);
			var result = justep.Request.sendBizRequest(process, _activity,
					"KSQLQuery", param, null, null, true);
			var flag = justep.Request.isBizSuccess(result);
			if (flag == "false") {
				alert("操作失败:"
						+ justep.XML.getNodeText(result.responseXML,
								"/root/message"));
			} else {
				return result;
			}*/
			var result="";
			var params = new biz.Request.ActionParam();
			params.setParam("ksql", ksql);
			params.setParam("dataModel", ksql);
			var options = {
				process : process,
				activity : _activity,
				action : "KSQLQuery",
				parameters : params,
				callback: function(data){
					if(data.state){
						result=data.response;
					}	
				}
			};		
			var r=biz.Request.sendBizRequest(options);
			if (!biz.Request.sendBizRequest(options)) {
				throw new Error(biz.Request.getServerError(r, "操作失败!"));
			} else {
				return result;
			}
		},
		dateTimeLess : function(begin, end) {
			if (begin.length <= 0 || end.length <= 0)
				return 0;			
			var beginYear = parseInt(begin.toString().split("-")[0]);//parseInt(begin.substring(0, 4), 10);
			var beginMonth = parseInt(begin.toString().split("-")[1]);//parseInt(begin.substring(5, 7), 10);
			var beginDay = parseInt(begin.toString().split("-")[2]);//parseInt(begin.substring(8, 10), 10);
			var beginHour = begin.toString().split(" ").length > 10 ? parseInt(begin.toString().split(" ")[1].split(":")[0]) : 0;
			//var beginHour = begin.length > 10 ? parseInt(begin.substring(11, 13), 10) : 0;			
			var beginDate = new Date(beginYear, beginMonth - 1, beginDay, beginHour);			
			var endYear = parseInt(end.toString().split("-")[0]);//parseInt(end.substring(0, 4), 10);
			var endMonth = parseInt(end.toString().split("-")[1]);//parseInt(end.substring(5, 7), 10);
			var endDay = parseInt(end.toString().split("-")[2]);//parseInt(end.substring(8, 10), 10);
			var endHour =end.toString().split(" ").length > 10 ? parseInt(end.toString().split(" ")[1].split(":")[0]) : 0;
			//var endHour = end.length > 10 ? parseInt(end.substring(11, 13), 10) : 0;
			var endDate = new Date(endYear, endMonth - 1, endDay, endHour);
			var less = endDate - beginDate;
			return parseInt(less / (1000 * 60 * 60));
		}
	
	};

});
