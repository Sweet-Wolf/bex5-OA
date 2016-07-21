define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.saveCommit = function(event) {
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	
		Model.prototype.grid3RowClick = function(event){
		
		var row = this.comp("mainData").getCurrentRow();
		if (!row) {
			return;
		}
		this.openDetail(row.getID());
		
	};
	
	Model.prototype.openDetail = function(id) {
        var ctx = this.getContext();
        var data = this.comp('mainData');
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var url = "";
//    	var fFuncURL ="$UI/OA/badgut/process/badgutHistoryQuery/detailActivity.w";
    	var fFuncURL = data.getValue("fFuncURL");
    	var fBusinessID = data.getValue("fBusinessID");
//    	url = "$UI/OA/badgut/process/badgutAlterDetail/detailActivity.w?process="+ process + "&activity=" + activity + "&id=" + id ;
    	url = "$UI"+fFuncURL+"?process="+ process + "&activity=" + activity + "&id=" + fBusinessID ;
  
//    	justep.Portal.openWindow(url,{title:"预算历史流水明细"});
    	justep.Portal.openWindow(url,{title:data.getValue("fKindName") +"明细"});
 
    };
  	

	Model.prototype.statusSelectUpdateValue = function(event){

		var data = this.comp("mainData");
		var status = event.source.value;
		
		if(status=="" || status == null){
			
			data.filters.setFilter("statefilter", " 1=1 ");
		}else{
			status = status.replace(/\,/g, "','" ); 
			data.filters.setFilter("statefilter", "OA_BG_History.fBizState in('"+status+"') ");
		}
		data.refreshData();
	};
  	

	Model.prototype.orgFilterFilter = function(event){
		this.orgCondition = event.source.selectedValue.get();
	};
  	

	return Model;
});