define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var IM = require("$UI/OA/workLog/js/workLogMessage"); 
	var arrPersonId = new Array();
	var Model = function(){
		this.callParent();
	};

	var mainData="";
	Model.prototype.modelLoad = function(event){
		mainData =this.comp("mainData");
		arrPersonId = [];
		//加载之前的动画
		$("[xid=waitDiv]").hide();
		$("[xid=weeklyContent]").show();
	};	

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存数据成功！");
		IM.sendMsg(this, "mainData", "周", arrPersonId);
		arrPersonId = [];
	};
	
	Model.prototype.findBtnClick = function(event){
       this.comp('psmDialog').open();
	};
	
	Model.prototype.psmDialogReceive = function(event){
	var rows = event.data;		
		var names="";
		arrPersonId = [];
		var n=rows.length;
		for ( var i in rows) {
			names+=rows[i].val('sName');
			if(i<n-1) names+=",";
			arrPersonId.push(rows[i].val('sPersonID'));
		}
		//debugger;
		mainData.setValue("fReleaseScope", names);

	};
	
	return Model;
});