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
        debugger;
        var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var url = "";
    	
    	url = "$UI/OA/workTime/process/repairQuery/detailActivity.w?process="+ process + "&activity=" + activity + "&id=" + id ;
  
    	justep.Portal.openWindow(url,{title:"补签申请详细信息"});
    };
  	

	Model.prototype.statusSelectUpdateValue = function(event){

		var data = this.comp("mainData");
		var status = event.source.value;
		
		if(status=="" || status == null){
			
			data.filters.setFilter("statefilter", " 1=1 ");
		}else{
			status = status.replace(/\,/g, "','" ); 
			data.filters.setFilter("statefilter", "OA_WM_repairApply.fBizState in('"+status+"') ");
		}
		data.refreshData();
	};
  	

	Model.prototype.orgFilterFilter = function(event){
		this.orgCondition = event.source.selectedValue.get();
	};
  	

	return Model;
});