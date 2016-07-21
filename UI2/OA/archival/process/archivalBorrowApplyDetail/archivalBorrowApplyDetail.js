define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var archival = require("$UI/OA/archival/js/archival");
	
	var Model = function(){
		this.callParent();
	};
	
	var mainData="",detailData="";
	Model.prototype.modelLoad = function(event){
		mainData = this.comp("mainData");
		detailData = this.comp("detailData");
		var data = this.getContext().getRequestParameter("id");
		if (data){
			var filter = "OA_AM_BorrowApplyM='" + data + "'";
			mainData.setFilter("____dataFilter_", filter);
			mainData.refreshData(); 
		}
	};
	
	Model.prototype.chartBtnClick = function(event){
		var process = this.comp("process");
		process.showChart("$UI/OA/archival/process/archivalBorrowApply/archivalBorrowApplyProcess", mainData.getCurrentRowID(), null);
	};

	Model.prototype.processBtn = function(event){		
		var id = mainData.getRowID();
        var process=this.comp("process");
        process.processRecord(null, null, id);
	};

	Model.prototype.dataTables1CellRender = function(event){
		detailData.to(event.row.getID());
		var isRoll=detailData.getValue("fIsRoll");
		var sign=detailData.getValue("fSign");
		var state=detailData.getValue("fState");
		var imgUrl=archival.grdArchivalShowNodeImg(isRoll,sign,state);
		if(event.colName=="fTitle"){
			event.html=imgUrl+"<a href='javascript:;' class='detail'>"+detailData.getValue("fTitle")+"</a>";
		}
	};

	Model.prototype.dataTables1RowClick = function(event){
		var link=$(event.domEvent.target);
		var operator="search";
		var fBizState = mainData.getValue("fBizState");
		var fCloseTime = detailData.getValue("fCloseTime");
		var currentTime = justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT);
		var archivalID=detailData.getValue("fArchivalID");
		if(fBizState=='bsFinished'){
			if(fCloseTime>=currentTime){
				operator = "down";
			}
		}
		if(link.hasClass("detail")){
			var isRoll = detailData.getValue("fIsRoll");
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