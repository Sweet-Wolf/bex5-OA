define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.dlgDetailReceive = function(event){
		var dFees = this.comp("dFees");
		if (event.data.action === "new") {
			var id = event.data.row[dFees.idColumn];
			this.comp('dFees').loadData({
				rows : [ event.data.row ]
			}, true);
			dFees.to(id);
		} else {
			$.each(dFees.defCols, function(col) {
				if (event.data.row[col]) {
					dFees.setValue(col, event.data.row[col]);
				}
			});
		}
	};

	Model.prototype.newBtnClick = function(event){
		var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var operator = "new";
    	var url = "$UI/OA/car/process/carFeesRegister/carFeesDetailActivity.w?process="
    		+ process +"&activity=" + activity + "&operator=" + operator ;
    	justep.Portal.openWindow(url,{title:"用车费用详细"});
	
	};

	Model.prototype.dFeesSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};



	Model.prototype.button3Click = function(event){
		debugger;
		var dFees = this.comp('dFees');
		var dTemp = this.comp('dTemp');
		var year = dTemp.getValue('year');
		var month = dTemp.getValue('month');
		if (year == '') {
			alert('请输入年份！');
			return;
		}
		if (month == '') {
			alert('请输入月份！');
			return;
		}
		if (!confirm("是否确定初始化数据？")) {
			return;
		} else {
			if (!confirm("初始化数据会将原有数据清空，确定初始化？")) {
				return;
			} else {
				var count = dFees.getCount();
				for (var j = 0; j < count; j++) {
				// dFees.removeByIndex(0);
					dFees.deleteData(0);
				}
				dFees.saveData();
			}
		}
		var dCar = this.comp('dCarInfo');
		dCar.filters.setFilter('dCarFilter', "fUseStatus = 1");
		dCar.refreshData();
		var len = dCar.getCount();
		
		dCar.each(function(options) {
			var row = options.row;
			
			dFees.newData();
			dFees.setValue('fCarID', row.getID());
			dFees.setValue('fCarNO', row.val('fCode'));
			dFees.setValue('fCarName', row.val('fName'));
			dFees.setValue('fYear', year);
			dFees.setValue('fMonth', month);
			
			
		});
		dFees.saveData();
	
	};

     Model.prototype.filterData = function() {
    	 var dFees = this.comp('dFees');
    	 var dTemp = this.comp('dTemp');
    	 var year = dTemp.getValue('year');
    	 var month = dTemp.getValue('month');
    	 var yearFilter = "", monthFilter = "", filter = "", join = "";
    	 if (year != '') {
    		 yearFilter = "fYear = " + year;
    	 }
    	 if (month != '') {
    		 monthFilter = "fMonth = " + month;
    	 }
    	 if (year != '' && month != '') {
    		 join = " AND ";
    	 }
    	 filter = yearFilter + join + monthFilter;
    	 dFees.filters.setFilter("timeFilter", filter);
    	 dFees.refreshData();
     };

	Model.prototype.modelLoad = function(event){
	   ;
		var dTemp = this.comp('dTemp');
		var currentYear = "", currentMonth = "";
		currentYear =(new Date()).getFullYear();
		currentMonth = (new Date()).getMonth()+1;
		
		dTemp.newData({
			index : 0,
			defaultValues : [ {
				"year" : currentYear,
			    "month":currentMonth
				
			} ]
		});

	};



	Model.prototype.input2Change = function(event){
		this.filterData();
	};



	Model.prototype.input3Change = function(event){
		this.filterData();
	};



	Model.prototype.feesDTCellRender = function(event){
		if(event.colName == "show"){
	       event.html = "<a  href='#' class='toDetail'>查看</a>";
	   		  
	   }
	};

     Model.prototype.openFeesDetailDialog = function(id) {
    	var id = this.comp("dFees").getCurrentRowID();
		
		var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var operator = "edit";
    	var url = "$UI/OA/car/process/carFeesRegister/carFeesDetailActivity.w?process="
    		+ process +"&activity=" + activity + "&operator=" + operator + "&id=" + id;
    	justep.Portal.openWindow(url,{title:"用车费用详细"});
    	
    }

	Model.prototype.feesDTRowClick = function(event){
          var domButton = $(event.domEvent.target);//获取点击的元素
         if(domButton.hasClass("toDetail")){
        	  this.openFeesDetailDialog(event.rowID);
          }
	};

	return Model;
});