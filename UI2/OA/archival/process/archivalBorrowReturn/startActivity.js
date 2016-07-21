define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var archival = require("$UI/OA/archival/js/archival");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	
	var mainData="";
	Model.prototype.dataTables1CellRender = function(event){
		mainData=this.comp("mainData");
		mainData.to(event.row.getID());
		var isRoll=mainData.getValue("fIsRoll");
		var sign=mainData.getValue("fSign");
		var state=mainData.getValue("fState");
		var imgUrl=archival.grdArchivalShowNodeImg(isRoll,sign,state);
		if(event.colName=="fTitle"){
			event.html=imgUrl+"<a href='javascript:;' class='detail'>"+mainData.getValue("fTitle")+"</a>";
		}
	};

	Model.prototype.dataTables1RowClick = function(event){
		var link=$(event.domEvent.target);
		var operator="search";
		var fCloseTime = mainData.getValue("fCloseTime");
		var currentTime = justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT);
		var archivalID=mainData.getValue("fArchivalID");

		if(link.hasClass("detail")){
			var isRoll = mainData.getValue("fIsRoll");
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
	
	//归还
	Model.prototype.btnReturnClick = function(event){
		var rowId = mainData.getCurrentRowID();
		var url=require.toUrl("$UI/OA/archival/process/dialog/archivalReturnDialog/archivalReturnDialog.w");
		this.comp("dlgBorrowReturn").open({src:url,data:{historyId:rowId}});
	};
	
	//归还返回
	Model.prototype.dlgBorrowReturnReceive = function(event){
		mainData.refreshData();
	};

	return Model;
});