define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
	var archivalData="";
	Model.prototype.modelLoad = function(event){
		archivalData = this.comp('archivalData');
	};
	
	Model.prototype.grid1RowClick = function(event){
		var URL = this.comp('treeData').getRowID();		
		if (URL != 'archival') {			
			var filter = "OA_AM_Archival.fURL like '%"+ URL + "%'";
			archivalData.filters.setFilter("____dataFilter_", filter);
			archivalData.refreshData(); 
		}
	};

	Model.prototype.OKBtnClick = function(event){		
		var archivalID = "";
		var checkedIDS=this.comp("gridTables").getCheckeds();
		var len=checkedIDS.length;
		for( var i=0; i<len; i++){
			if(i<len-1){	
				archivalID += "'"+ checkedIDS[i] + "',";
			} else {
				archivalID += "'"+ checkedIDS[i] + "'";				
			}
		}
		if(archivalID == ""){
			alert("请选择要借阅的档案信息！");
			return;
		}
		this.comp("windowReceiver").windowEnsure({archivalID:archivalID});
	};

	return Model;
});