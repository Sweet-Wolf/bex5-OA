define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};




	Model.prototype.chart2BtnClick = function(event){
		var process = this.comp("process");
		process.showChart(this.getContext().getProcess(), this.comp("dCarUseApplyDetail").getCurrentRowID(), null);
	};

	Model.prototype.printBtnClick = function(event){
	    var row = this.comp("dCarUseApplyDetail").getCurrentRow();
		var id = row.getID()

		
		var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var operator = "view";
    	var url = "$UI/OA/car/process/carUseReport/carUseReport.w?process="
    		+ process +"&activity=" + activity + "&id=" + id;
    	justep.Portal.openWindow(url,{title:"车辆报表"});
    	
    
	
	};

	Model.prototype.modelModelConstructDone = function(event){

		this.action = this.getContext().getRequestParameter("operator");
		var id = this.getContext().getRequestParameter("id");
		var dCarUseApplyDetail = this.comp('dCarUseApplyDetail');
		var dCarUseArrangeDetail = this.comp('dCarUseArrangeDetail');
		if (this.action === "new"){
			dCarUseApplyDetail.clear();
			dCarUseApplyDetail.newData();
		}else{
			dCarUseApplyDetail.filters.setFilter("applyFilter", "OA_CA_CarUseApply='" + id + "'");
			dCarUseApplyDetail.refreshData();
			//dCarUseArrangeDetail.refreshData();
			//设置master
		}
	};

	return Model;
});