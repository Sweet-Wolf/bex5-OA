define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!$UI/OA/common/css/pub").load();
	var Model = function(){
		this.callParent();
	};

	Model.prototype.closeBtnClick = function(event){
		
		this.comp("windowReceiver").windowEnsure();
	};

	Model.prototype.dealBtnClick = function(event){
		//阅文处理
		var data = this.comp("dDoc");
		if (data) {
			var dlgReaderOpinion = this.comp("dlgOpinion");
			var docId = data.getCurrentRowID();
			if (docId) {
				var options = {
					"docId" : docId
				};
				dlgReaderOpinion.open({data:options});
			}
		}
	};

	Model.prototype.moreBtnClick = function(event){
		this.comp("processMenu").show();
	};

	Model.prototype.windowReceiverReceive = function(event){
	   debugger;
		this.rowid = event.data.data;
		
		
		var data = this.comp("dDoc");
		var personId = this.getContext().getCurrentPersonID();
		if (this.rowid) {
		    debugger;
			data.filters.setFilter("docDetailFilter", "OA_DC_Doc = '" + this.rowid + "'");
			data.refreshData();
			var fReaderIDs = data.getValue("fReaderIDs");
			fReaderIDs = fReaderIDs || '';
			if(fReaderIDs.indexOf(personId)!=-1){
			
				this.getElementByXid('dealBtn').style.display = "none";
			}else
				this.getElementByXid('dealBtn').style.display = "block";
			
		}

		var taskData = this.comp("taskData");
			taskData.filters.setFilter("Filter1", "SA_Task.sData1='" + this.rowid + "'");
			taskData.refreshData();
	};

	return Model;
});