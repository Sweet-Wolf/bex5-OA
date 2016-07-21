define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function(){
		this.callParent();
	};
	
	
	Model.prototype.distinct=function(arr){
		//先排序
	    arr.sort();
	    //将排序后数组的第一个元素放入结果数组中
	    var result=[arr[0]];
	    //从第二个元素开始遍历原数组
	    for(var i= 1;i<arr.length;i++){
	        //如果数组中的当前元素不等于结果集中最后一个元素
	        if(arr[i]!=result[result.length-1]){
	            result.push(arr[i]);
        	}
    	}
    	return result;
	}
	Model.prototype.contains=function(arr, obj) {
        for (var i = 0; i < arr.length; i++) {
            if (arr[i] === obj) {
                return true;
            }
        }
        return false;
    }
    
    Model.prototype.hasCode=function(arr){
    	var result=[]
    	for(key in arr){
    		result.push(key)
    	}
    	if(result.length>0){
    		return true;
    	}else{
    		return false;
    	}
    }
    
    Model.prototype.showAndHide=function(sScheDay,self){
		var workLogCountData=this.comp("workLogCountData");
		var approvalData=this.comp("approvalData");
		var signPersonData=this.comp("signPersonData");
		var approvalStaData=this.comp("approvalStaData");
    	this.getRequest(sScheDay,"queryOA_WorkLogAction","workLogCountData","PersonName");
		this.getRequest(sScheDay,"querySignPersonAction", "signPersonData","sign");
		this.getRequest(sScheDay, "queryWorkCalendarAction", "approvalData", "approval");
		if(workLogCountData.getCount()>0||signPersonData.getCount()>0||approvalData.getCount()>0){
			if(workLogCountData.getCount()>0){
				$("[xid=workLogDiv]").show();
				$("[xid=countSpan]").html(workLogCountData.getCount());
				$("[xid=workLogContent]").show();
				$("[xid=workLogPrompt]").hide();
			}else{
				$("[xid=workLogDiv]").hide();
			}
			if(signPersonData.getCount()>0){
				$("[xid=signDiv]").show();
				$("[xid=divSign]").show()
				$("[xid=pSign]").hide()
				
			}else{
				$("[xid=signDiv]").hide()
			}
			
			var approval=[],approvalType=[],approvalName=[];
			approvalData.each(function(obj){
 				if(!approval[obj.row.val("fApplyType")]){
					approval[obj.row.val("fApplyType")]=[];
				}
				approval[obj.row.val("fApplyType")].push(obj.row.val("fApplyPsnName"))
				approval[obj.row.val("fApplyType")]=self.distinct(approval[obj.row.val("fApplyType")])
			})
			
			if(self.hasCode(approval)){
				approvalStaData.clear();
				for(var key in approval){
					approvalStaData.loadData([{"fApplyType":key,"fApplyPsnName":approval[key].join(","),"fCount":approval[key].length}],true);
				}
				
				$("[xid=approvalDiv]").show();
				$("[xid=pApproval]").hide();
				$("[xid=approvalList]").show();
			}else{
				$("[xid=approvalDiv]").hide();
			}
		}else{
			$("[xid=workLogDiv]").show();
			$("[xid=workLogPrompt]").show();
			$("[xid=workLogContent]").hide();
			
			$("[xid=signDiv]").show();
			$("[xid=pSign]").show();
			$("[xid=divSign]").hide();
			
			$("[xid=approvalDiv]").show();
			$("[xid=pApproval]").show();
			$("[xid=approvalList]").hide();
		}
    }
	
	
	
	
	Model.prototype.modelLoad = function(event){
		var self=this;
		$("div[id$='_title1']")[0].innerHTML=$(".cal-day-today")[0].children[0].dataset.calDate.replace(/-/g,"/");
		var sScheDay=justep.Date.toString(new Date(), 'yyyy-MM-dd');
		this.showAndHide(sScheDay,self);
		
		$("[xid=waitDiv]").hide()
		$("[xid=content1]").show()
	};

	Model.prototype.calendarEventsSelected = function(event){
		console.log(justep.Date.toString(event.begin,"yyyy-MM-dd"));
	};


	Model.prototype.calendarClick = function(event){
		var sScheDay;
		var self=this;
		$("div[__cid='cbUruiu']").removeClass("cal-day-today");
		if(event.target.nodeName=="DIV"){
			$(event.target).addClass("cal-day-today");
		}else if(event.target.nodeName=="SPAN"){
			$(event.target.parentNode).addClass("cal-day-today");
		}
		var time=$("div.cal-day-today")[0].firstElementChild.getAttribute("data-cal-date").replace(/-/g,"/");
		this.comp("scheTitleBar").set({"title":time})
		sScheDay=time.replace(/\//g,"-");
		
		this.showAndHide(sScheDay,self);
	};

	

	//显示上个月的日程
	Model.prototype.prevBtnClick = function(event){
		this.comp('calendar').navigate("prev");
		var date=new Date($("div[id$='_title1']")[0].innerHTML);
		date.setMonth(date.getMonth()-1);
		var strDate=date.toLocaleDateString().split("/");
		strDate[1]<10&&(strDate[1]="0"+strDate[1]);
		strDate[2]<10&&(strDate[2]="0"+strDate[2]);
		strDate=strDate.join("/");
		$("div[id$='_title1']")[0].innerHTML=strDate;
	};

	//显示下个月的日程
	Model.prototype.nextBtnClick = function(event){
		this.comp('calendar').navigate("next");
		var date=new Date($("div[id$='_title1']")[0].innerHTML);
		date.setMonth(date.getMonth()+1);
		var strDate=date.toLocaleDateString().split("/");
		strDate[1]<10&&(strDate[1]="0"+strDate[1]);
		strDate[2]<10&&(strDate[2]="0"+strDate[2]);
		strDate=strDate.join("/");
		$("div[id$='_title1']")[0].innerHTML=strDate;
	};

	Model.prototype.btnLogClick = function(event){
		this.comp("logDialog").open();
	};


	Model.prototype.getRequest = function(sScheDay,action,dataName,type) {
		var params = new biz.Request.ActionParam();
		var ctx = this.getContext();
		params.setParam('strDate', sScheDay);
		var self = this;
		biz.Request.sendBizRequest({
			contentType : 'application/json',
			dataType : "json",
			"context" : ctx,
			"action" : action,
			"parameters" : params,
			"callback" : function(data) {
				if (data.state) {
					var resultData = data.response[type];
					if (resultData) {
						self.comp(dataName).clear();
						self.comp(dataName).loadData(resultData);
					}
				}
			}
		});

	}
	
	Model.prototype.btnApprovalClick = function(event){
		this.comp("approvalDialog").open();
	};	

	Model.prototype.locationDialogClose = function(event){
		this.comp("signPersonData").refreshData();
	};
	
	Model.prototype.signPersonDataCustomRefresh = function(event){
		this.getRequest($("div.cal-day-today")[0].firstElementChild.getAttribute("data-cal-date"),"querySignPersonAction", "signPersonData","sign");
	};
	
	
	Model.prototype.approvalDataCustomRefresh = function(event){
		this.getRequest($("div.cal-day-today")[0].firstElementChild.getAttribute("data-cal-date"), "queryWorkCalendarAction", "approvalData", "approval");
	};
	
	
	Model.prototype.workLogCountDataCustomRefresh = function(event){
		this.getRequest($("div.cal-day-today")[0].firstElementChild.getAttribute("data-cal-date") ,"queryOA_WorkLogAction","workLogCountData","PersonName");
	};
	
	
	return Model;
});