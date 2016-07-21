define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	//var IM = require("./../../../../chat/js/im");
	var IM = require("$UI/OA/workLog/js/workLogMessage"); 
	var arrPersonId = new Array();
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		
		justep.Util.hint("保存数据成功！");
		IM.sendMsg(this, "mainData", "日", arrPersonId);
		arrPersonId = [];
	};
	
	var mainData="";
	
	Model.prototype.modelLoad = function(event){
		mainData =this.comp("mainData");
		arrPersonId = [];
		//加载之前的动画
		$("[xid=waitDiv]").hide();
		$("[xid=dailyContent]").show();
	};	
	
	Model.prototype.psmDialogReceive = function(event){
		var rows = event.data;		
		var names="";
		var n=rows.length;
		arrPersonId = [];
		for ( var i in rows) {
			names+=rows[i].val('sName');
			if(i<n-1) names+=",";
			arrPersonId.push(rows[i].val('sPersonID'));
		}
		mainData.setValue("fReleaseScope", names);
	};
	
	
	Model.prototype.findBtnClick = function(event){
		mainData.setValue("fReleaseScope", null);
		this.comp('psmDialog').open();
	};
	
	
	return Model;
});