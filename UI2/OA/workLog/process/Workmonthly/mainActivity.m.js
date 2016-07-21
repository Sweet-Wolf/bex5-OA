define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var IM = require("$UI/OA/workLog/js/workLogMessage"); 
	var mainData="";
	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存数据成功！");
		IM.sendMsg(this, "mainData", "月", arrPersonId);
		arrPersonId = [];
	};
	
	Model.prototype.modelLoad = function(event){
		mainData =this.comp("mainData");
		arrPersonId = [];
		//加载之前的动画
		$("[xid=waitDiv]").hide();
		$("[xid=monthlyContent]").show();
	};
	
	//人员选择
	Model.prototype.findBtnClick = function(event){
		this.comp('psmDialog').open();
		
	};
	
	//人员返回
	Model.prototype.orgDialog1Receive = function(event){
		var rows = event.data;		
		var names="";
		arrPersonId = [];
		var n=rows.length;
		for ( var i in rows) {
			names+=rows[i].val('sName');
			arrPersonId.push(rows[i].val('sPersonID'));
			if(i<n-1) names+=",";
		}
		mainData.setValue("fReleaseScope", names);
	};
	
	
	
	return Model;
});