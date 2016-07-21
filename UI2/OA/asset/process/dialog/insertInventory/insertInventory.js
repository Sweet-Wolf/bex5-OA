define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.result = function(){
		//这里实现返回的逻辑
	};
	
	var assetID='',dlgOperator='',mainData = "",detailData = "", assetIDArray = new Array(), fInventoryIDArray=new Array();
		
	Model.prototype.wReceiverReceive = function(event){
		dlgOperator=event.data.dlgOperator;
		assetID=event.data.assetID;

		mainData = this.comp("dJoinInventory");
		detailData = this.comp("dInventory");
		
		if(dlgOperator=="new"){
			detailData.newData();
		} else if(dlgOperator=="edit"){
			detailData.filters.setFilter("RMFilter","OA_AS_Inventory='" + assetID + "'");			
			detailData.refreshData();
		} else if(dlgOperator=="news"){
			assetIDArray = assetID.split(",");
			for(var i=0; i<assetIDArray.length; i++){
				detailData.newData();
				fInventoryIDArray.push(detailData.getValue("OA_AS_Inventory"));
			}
		}
	};
	
	Model.prototype.OKBtnClick = function(event){
		if (dlgOperator == "news") {
			var len = assetIDArray.length;
			var fRemark=detailData.getValue("fRemark");
			var fDescription=detailData.getValue("fDescription");
			
			for (var i = 0; i < len; i++) {					
				mainData.newData();				
				mainData.setValue("fAssetID", assetIDArray[i]);
				mainData.setValue("fInventoryID", fInventoryIDArray[i]);
				var row=detailData.find(["OA_AS_Inventory"],[fInventoryIDArray[i]],true,true,true);
				detailData.setValue("fRemark", fRemark, row[0]);		
				detailData.setValue("fDescription", fDescription, row[0]);
			}
		} else if (dlgOperator == "new") {
			mainData.newData();
			mainData.setValue("fAssetID", assetID);
			mainData.setValue("fInventoryID", detailData.getValue("OA_AS_Inventory"));
		}
		
		detailData.saveData();
		mainData.saveData();

		this.comp('wReceiver').windowEnsure(this.result());
	};


	return Model;
});