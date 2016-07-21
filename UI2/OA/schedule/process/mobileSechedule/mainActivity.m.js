define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!$UI/OA/config/pub").load();
	var biz = require('$UI/system/lib/biz');

	var Model = function(){
		this.callParent();
		this.loaded = false;//没有加载数据，不能显示日程
		this.publicScheduleID;
	};
	//打开功能，显示当月日程
	Model.prototype.modelLoad = function(event){
		this.loaded = true;

		var now = new Date();
		this.comp("calData").setValue("monthFirstDay", new Date(now.setDate(1)));
		this.comp("scheTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("monthFirstDay"), "yyyy年MM月") );

		this.comp('calendar').navigate("today");
		
		$("[xid=waitDiv]").hide()
		$("[xid=content3]").removeClass("opa").addClass("show");
	};
	
	//显示当月的日程
	Model.prototype.todayBtnClick = function(event){
		var now = new Date();
		this.comp("calData").setValue("monthFirstDay", new Date(now.setDate(1)));
		this.comp("scheTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("monthFirstDay"), "yyyy年MM月") );

		this.comp("scheduleData").refreshData();
		var row = this.comp("scheduleData").getCurrentRow();
		this.comp('calendar').navigate("today");
		this.comp('scrollView').scroller.scrollTo(0,0);
	};
	
	//显示上个月的日程
	Model.prototype.prevBtnClick = function(event){
		this.comp("calData").setValue("monthFirstDay", justep.Date.decrease(this.comp("calData").getValue("monthFirstDay"), 1, 'm'));
 		this.comp("scheTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("monthFirstDay"), "yyyy年MM月") );

		this.comp("scheduleData").refreshData();
		this.comp('calendar').navigate("prev");
		this.comp('scrollView').scroller.scrollTo(0,0);
	};

	//显示下个月的日程
	Model.prototype.nextBtnClick = function(event){
		this.comp("calData").setValue("monthFirstDay", justep.Date.increase(this.comp("calData").getValue("monthFirstDay"), 1, 'm'));
 		this.comp("scheTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("monthFirstDay"), "yyyy年MM月") );

		this.comp("scheduleData").refreshData();
		this.comp('calendar').navigate("next");
		this.comp('scrollView').scroller.scrollTo(0,0);
	};
	
	//查询日程前，传入查询月、查询人，不传人则使用当前人
	Model.prototype.scheduleDataRefreshCreateParam = function(event){
		var sScheMonth;
		if(this.comp("calData").getValue("monthFirstDay") == undefined){
			scheMonth = new Date();
		}else{
			scheMonth = this.comp("calData").getValue("monthFirstDay")
		}
		event.param.setString("scheMonth", justep.Date.toString( scheMonth, "yyyy-MM"));
		event.param.setString("schePerson", this.getContext().getCurrentPersonID());
	};
	
	//在日历组件上标注
	Model.prototype.calendarEventsLoad = function(event){
		return this.calendarLoadEvents("scheduleData");
	};
	
	Model.prototype.calendarLoadEvents = function(dataID){
		if(!this.loaded) return;

		var arrSche = new Array(); 
		var data = this.comp(dataID);
		if(data.getCount() > 0){
			var sScheDay , mTime;
			data.each(function(options) {
				if(options.row.val("fIsTitle") == "1"){
					mTime = (new Date(options.row.val("fScheDay"))).getTime(); //得到毫秒数
					sScheDay = "{start:" + mTime + "}";
					sScheDay = eval("("+sScheDay+")");
					arrSche.push(sScheDay);
				}
			});		
			return arrSche;
		}else
			return [];
	};
	
	//点击日程的某天，让scrollView定位到日程的某天
	Model.prototype.calendar1EventsSelected = function(event){
		//判断是否存在某天的日程
		var sScheDay = justep.Date.toString(event.begin,"yyyy-MM-dd");;
		if($('li[flag="' + sScheDay + '"]')[0] != undefined){
			this.comp('scrollView').scroller.scrollToElement($('li[flag="' + sScheDay + '"]')[0], 100);
		}
	};
	
	// 新建日程
	Model.prototype.addBtnClick = function(event) {
		this.comp('newDialog').open();
	};
	
	//新增后，重新计算日程
	Model.prototype.newDialogReceive = function(event){
		this.comp("scheduleData").refreshData();
		this.comp('calendar').refresh();
	};
	
	//显示详情
	Model.prototype.scheduleListClick = function(event){
		if(this.comp('scheduleData').getValue('fScheID') != undefined){
			this.comp('detailDialog').open({data : {scheID : this.comp('scheduleData').getValue('fScheID'),canEdit : true}});

		}
	};
	
	//从详情返回，重新计算日程，可以增加判断是否修改过
	Model.prototype.detailDialogReceive = function(event) {
		this.comp("scheduleData").refreshData();
		this.comp('calendar').refresh();
	};
	
	//关闭功能
//	Model.prototype.backBtnClick = function(event) {
//		justep.Portal.closeWindow();
//	};
		

	//根据日历的高度改变top的高度
	Model.prototype.calendarAfterViewLoad = function(event){
		if(!this.loaded) return;
		var newHeight = $('#'+this.getIDByXID("calendar")).height() + 50;
		$('#'+this.getIDByXID("topArea")).height(newHeight);
		$('#'+this.getIDByXID("contentArea")).css('top',newHeight);
	};

	//选择同事
	Model.prototype.publicScheduleBtnClick = function(event){
		this.comp('orgDialog').open();
	};

	//显示同事日程
	Model.prototype.orgDialogReceive = function(event){
		this.publicScheduleID = event.data[0].val('sPersonID');
		var now = new Date();
		this.comp("calData").setValue("cMonthFirstDay", new Date(now.setDate(1)));
		this.comp("publicScheduleTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("cMonthFirstDay"), "yyyy年MM月") );

		this.comp("publicScheduleData").refreshData();
		this.comp("contents").to("publicSchedule");
		this.comp("publicScheduleCalendar").refresh();
	};

	Model.prototype.publicScheduleDataRefreshCreateParam = function(event){
		var sScheMonth;
		if(this.comp("calData").getValue("cMonthFirstDay") == undefined){
			scheMonth = new Date();
		}else{
			scheMonth = this.comp("calData").getValue("cMonthFirstDay")
		}
		event.param.setString("scheMonth", justep.Date.toString( scheMonth, "yyyy-MM"));
		event.param.setString("schePerson", this.publicScheduleID);

	};

	//返回自己的日程
	Model.prototype.publicScheduleBackBtnClick = function(event){
		this.comp("contents").to("list");
	};

	//显示上个月的日程
	Model.prototype.publicSchedulePrevBtnClick = function(event){
		this.comp("calData").setValue("cMonthFirstDay", justep.Date.decrease(this.comp("calData").getValue("cMonthFirstDay"), 1, 'm'));
 		this.comp("publicScheduleTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("cMonthFirstDay"), "yyyy年MM月") );

		this.comp("publicScheduleData").refreshData();
		this.comp('publicScheduleCalendar').navigate("prev");
		this.comp('publicScheduleScrollView').scroller.scrollTo(0,0);

	};

	//显示下个月的日程
	Model.prototype.publicScheduleNextBtnClick = function(event){
		this.comp("calData").setValue("cMonthFirstDay", justep.Date.increase(this.comp("calData").getValue("cMonthFirstDay"), 1, 'm'));
 		this.comp("publicScheduleTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("cMonthFirstDay"), "yyyy年MM月") );

		this.comp("publicScheduleData").refreshData();
		this.comp('publicScheduleCalendar').navigate("next");
		this.comp('publicScheduleScrollView').scroller.scrollTo(0,0);
	};

	//在日历组件上标注
	Model.prototype.publicScheduleCalendarEventsLoad = function(event){
		var aa = this.calendarLoadEvents("publicScheduleData"); 
		return aa;
	};

	//点击日程的某天，让scrollView定位到日程的某天
	Model.prototype.publicScheduleCalendar1EventsSelected = function(event){
		//判断是否存在某天的日程
		var sScheDay = justep.Date.toString(event.begin,"yyyy-MM-dd");;
		if($('li[cflag="' + sScheDay + '"]')[0] != undefined){
			this.comp('publicScheduleScrollView').scroller.scrollToElement($('li[cflag="' + sScheDay + '"]')[0], 100);
		}
	};

	//根据日历的高度改变top的高度
	Model.prototype.publicScheduleCalendarAfterViewLoad = function(event){
		var newHeight = $('#'+this.getIDByXID("publicScheduleCalendar")).height() + 50;
		$('#'+this.getIDByXID("publicScheduleTopArea")).height(newHeight);
		$('#'+this.getIDByXID("publicScheduleContentArea")).css('top',newHeight);
	};

	//显示详情
	Model.prototype.publicScheduleListClick = function(event){
		if(this.comp('publicScheduleData').getValue('fScheID') != undefined)
			this.comp('detailDialog').open({data : {scheID : this.comp('publicScheduleData').getValue('fScheID'),canEdit : false}});
	};

	Model.prototype.orgDialogleadReceive = function(event){
		this.publicScheduleID = event.data[0].val('sPersonID');
		var now = new Date();
		this.comp("calData").setValue("cMonthFirstDay", new Date(now.setDate(1)));
		this.comp("leadScheduleTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("cMonthFirstDay"), "yyyy年MM月") );

		this.comp("leadScheduleData").refreshData();
		this.comp("contents").to("leadSchedule");
		this.comp("leadScheduleCalendar").refresh();
	};
//领导日程
	Model.prototype.leadBtnClick = function(event){
	   //dlg.open({data:{selected:{kind:'sName',value:[]}}});
	    var lead = this.comp("leaderData");
	    lead.refreshData();
	    var leads = "";
	    lead.each(function(options) {
			var row = options.row;
			if(leads == "")
				leads = "'" + row.val("fExecutorID") + "'";
		    else
		    	leads = leads +",'" + row.val("fExecutorID") + "'";
		});
	//	this.comp('orgDialoglead').open();
	 //   this.comp('orgDialoglead').open({data:{selected:{kind:'sName',value:['刘然']}}});
		this.comp('orgDialoglead').open({data:{selected:{kind:'sPersonID',value:[leads]}}});  //过滤未起作用？
	};

	Model.prototype.leadScheduleCalendarEventsLoad = function(event){
		var aa = this.calendarLoadEvents("leadScheduleData"); 
		return aa;
	};

	Model.prototype.leadScheduleCalendarEventsSelected = function(event){
		//判断是否存在某天的日程
		var sScheDay = justep.Date.toString(event.begin,"yyyy-MM-dd");;
		if($('li[cflag="' + sScheDay + '"]')[0] != undefined){
			this.comp('leadScheduleScrollView').scroller.scrollToElement($('li[cflag="' + sScheDay + '"]')[0], 100);
		}
	};

	Model.prototype.leadScheduleCalendarAfterViewLoad = function(event){
		var newHeight = $('#'+this.getIDByXID("leadScheduleCalendar")).height() + 50;
		$('#'+this.getIDByXID("leadScheduleTopArea")).height(newHeight);
		$('#'+this.getIDByXID("leadScheduleContentArea")).css('top',newHeight);
	};

	Model.prototype.leadSchedulePrevBtnClick = function(event){
		this.comp("calData").setValue("cMonthFirstDay", justep.Date.decrease(this.comp("calData").getValue("cMonthFirstDay"), 1, 'm'));
 		this.comp("leadScheduleTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("cMonthFirstDay"), "yyyy年MM月") );

		this.comp("leadScheduleData").refreshData();
		this.comp('leadScheduleCalendar').navigate("prev");
		this.comp('leadScheduleScrollView').scroller.scrollTo(0,0);
	};

	Model.prototype.leadScheduleNextBtnClick = function(event){
		this.comp("calData").setValue("cMonthFirstDay", justep.Date.increase(this.comp("calData").getValue("cMonthFirstDay"), 1, 'm'));
 		this.comp("leadScheduleTitleBar").setTitle(justep.Date.toString( this.comp("calData").getValue("cMonthFirstDay"), "yyyy年MM月") );

		this.comp("leadScheduleData").refreshData();
		this.comp('leadScheduleCalendar').navigate("next");
		this.comp('leadScheduleScrollView').scroller.scrollTo(0,0);
	};

	Model.prototype.list2Click = function(event){
		if(this.comp('publicScheduleData').getValue('fScheID') != undefined)
			this.comp('detailDialog').open({data : {scheID : this.comp('publicScheduleData').getValue('fScheID'),canEdit : false}});
	};

	return Model;
});

