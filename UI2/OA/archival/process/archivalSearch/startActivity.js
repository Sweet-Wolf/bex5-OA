define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var archival = require("$UI/OA/archival/js/archival");
	
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

	Model.prototype.grid2CellRender = function(event){
		archivalData.to(event.row.getID());
		var isRoll=archivalData.getValue("fIsRoll");
		var sign=archivalData.getValue("fSign");
		var state=archivalData.getValue("fState");
		var imgUrl=archival.grdArchivalShowNodeImg(isRoll,sign,state);
		if(event.colName=="fTitle"){
			event.html=imgUrl+"<a href='javascript:;' class='detail'>"+archivalData.getValue("fTitle")+"</a>";
		}
	};

	Model.prototype.grid2RowClick = function(event){
		var link=$(event.domEvent.target);
		var operator="search";
		var archivalID=archivalData.getValue("OA_AM_Archival");
		
		if(link.hasClass("detail")){
			var isRoll = archivalData.getValue("fIsRoll");
			var url="",title="";
			if (isRoll == '0') {
				url=require.toUrl("$UI/OA/archival/process/dialog/archivalFileDetail/archivalFileDetail.w");
				title="件信息";
			} else if (isRoll == '1') {
				url=require.toUrl("$UI/OA/archival/process/dialog/archivalRollDetail/archivalRollDetail.w");
				title="案卷信息";
			}
			this.comp("windowDialog").set({"title":title});
			this.comp("windowDialog").open({src:url,data:{archivalID:archivalID,operator:operator}});
		}
	};

	return Model;
});