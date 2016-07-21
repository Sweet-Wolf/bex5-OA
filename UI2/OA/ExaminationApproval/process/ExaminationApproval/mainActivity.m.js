define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var allData=require("./js/loadData");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.refreshCount = function(event){
		var messageAction = "$UI/portal/mobile/main/main.j";
		var url = new justep.URL(require.toUrl(messageAction));
		url.setParam('bsessionid', justep.URL.getBSessionID());
		
        var result = $.ajax({
            type: "GET",
            url: url.toString(),
            async: false,
            cache:false
        });
        
        if(result.responseJSON.flag){
        	var table = result.responseJSON.data.value;
        	this.comp("mainData").loadData(table);
        }
       
	}
	
	Model.prototype.skipDataCustomRefresh = function(event){
		 var url = require.toUrl("$UI/OA/ExaminationApproval/process/ExaminationApproval/json/skipData.json");
         allData.loadDataFromFile(url,event.source,true);
	};
	
	Model.prototype.headSkipDataCustomRefresh = function(event){
		 var url = require.toUrl("$UI/OA/ExaminationApproval/process/ExaminationApproval/json/headSkipData.json");
         allData.loadDataFromFile(url,event.source,true);
	};
	
	
	Model.prototype.modelLoad = function(event){
		var iconClass = this.comp("headSkipData").getValueByID("fIconClass", 2);
		var color = this.comp("headSkipData").getValueByID("fColor", 2);
		var label = this.comp("headSkipData").getValueByID("fLabel", 2);
		this.comp("launchBtn").set({
			"label" : label,
			"icon" : iconClass,
		})
		this.comp("launchBtn").setCSS({"color" : color});
		this.refreshCount(event);
		
		//加载之前的动画
		$("[xid=waitDiv]").hide();
		$("[xid=content1]").show();
	};

	Model.prototype.modelActive = function(event){
		this.comp("backBtn").set({
	       	"disabled":true
	    })
		this.refreshCount(event);
		this.comp("backBtn").set({
        	"disabled":false
        })
	};

	Model.prototype.leaveBtnClick = function(event){
		var row = event.bindingContext.$object;
		var url = row.row.fUrl.value.latestValue;
		var process = row.row.fProcess.value.latestValue;
		var activity = row.row.fActivity.value.latestValue;
		url=url+'?'+'process='+process+'&activity='+activity;
		justep.Shell.showPage(require.toUrl(url));
	};
	
	Model.prototype.waitMeBtnClick = function(event){
		var url = this.comp("headSkipData").getValueByID("fUrl", 1);
		var process = this.comp("headSkipData").getValueByID("fProcess", 1);
		var activity = this.comp("headSkipData").getValueByID("fActivity", 1);
		url=url+'?'+'process='+process+'&activity='+activity;
		justep.Shell.showPage(require.toUrl(url));
	};
	
	
	Model.prototype.launchBtnClick = function(event){
		var url = this.comp("headSkipData").getValueByID("fUrl", 2);
		var process = this.comp("headSkipData").getValueByID("fProcess", 2);
		var activity = this.comp("headSkipData").getValueByID("fActivity", 2);
		url=url+'?'+'process='+process+'&activity='+activity;
		justep.Shell.showPage(require.toUrl(url));
	};

	return Model;
});