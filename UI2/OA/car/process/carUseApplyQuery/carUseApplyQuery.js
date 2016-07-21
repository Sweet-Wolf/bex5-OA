define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.windowDialogReceive = function(event){
		var dCarUseApplyQuery = this.comp("dCarUseApplyQuery");
		if (event.data.action === "new") {
			var id = event.data.row[dCarUseApplyQuery.idColumn];
			this.comp('dCarUseApplyQuery').loadData({
				rows : [ event.data.row ]
			}, true);
			dCarUseApplyQuery.to(id);
		} else {
			$.each(dCarUseApplyQuery.defCols, function(col) {
				if (event.data.row[col]) {
					dCarUseApplyQuery.setValue(col, event.data.row[col]);
				}
			});
		}
	};

	Model.prototype.editBtnClick = function(event){
	
		var row = this.comp("dCarUseApplyQuery").getCurrentRow();
		var id = row.getID()

		
		var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var operator = "view";
    	var url = "$UI/OA/car/process/carUseApplyQuery/carUseApplyDetail.w?process="
    		+ process +"&activity=" + activity + "&operator=" + operator + "&id=" + id;
    	justep.Portal.openWindow(url,{title:"用车申请详细"});
	};



	Model.prototype.statusSelectUpdateValue = function(event){
		var data = this.comp("dCarUseApplyQuery");
		var dStatusSelect = this.comp("conditionData");
		var status = event.source.value;
		
		if(status=="" || status == null){
			//dStatusSelect.setValue("status", "bsEditing,bsExecuting");
			//dStatusSelect.setValue("statusName", "编辑中,处理中");
			data.filters.setFilter("statefilter", " 1=1 ");
		}else{
			status = status.replace(/\,/g, "','" ); 
			data.filters.setFilter("statefilter", "OA_CA_CarUseApply.fBizState in('"+status+"') ");
		}
		data.refreshData();
	};

	return Model;
});