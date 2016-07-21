define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.result = function(){
		//这里实现返回的逻辑
	};
	
	var mainData="", detailData="", infoIDs="", len=0, fIDArrayM=new Array(), fNOArrayM=new Array();
	
	Model.prototype.wReceiverReceive = function(event){
		mainData=this.comp("mainData");
		detailData=this.comp("detailData");
		var obj = event.data.obj;
		infoIDs = event.data.infoIDs;
		len = infoIDs.length;

		for(var i=0; i<len; i++){
			mainData.newData();
			fIDArrayM.push(mainData.getValue("OA_AS_CheckM"));
			fNOArrayM.push(mainData.getValue("fNO"));
		}
		
	};

	var dlen=0, d1=new Array(), d2=new Array(), d3=new Array(), detailNull=new Array();
	Model.prototype.OKBtnClick = function(event){
		var fCheckDepts=mainData.getValue("fCheckDepts");
		var fCheckPsns=mainData.getValue("fCheckPsns");
		var fRemark=mainData.getValue("fRemark");
		
		for (var i = 0; i < len; i++) {
			var row=mainData.find(["OA_AS_CheckM"],[fIDArrayM[i]],true,true,true);
			mainData.setValue("fCheckDepts", fCheckDepts, row[0]);
			mainData.setValue("fCheckPsns", fCheckPsns, row[0]);
			mainData.setValue("fRemark", fRemark, row[0]);
			
			row=detailData.find(["fMasterID"],[fIDArrayM[i]],false,true,true);
			if(row.length>0){
				dlen=row.length;
				for(var j=0; j<dlen; j++){
					d1.push(detailData.getValue("fCheckItem",row[j]));
					d2.push(detailData.getValue("fDescription",row[j]));
					d3.push(detailData.getValue("fRemark",row[j]));
				}
			} else {
				detailNull.push(i);
			}
		}
		if(detailNull.length>0){
			this.addDetail(dlen,detailNull);
		}
		mainData.saveData();	
		detailData.saveData();

		this.comp('wReceiver').windowEnsure({idArray:fIDArrayM,noArray:fNOArrayM});
		
	};

	Model.prototype.addDetail = function(dlen,detailNull){
		for (var i = 0; i < detailNull.length; i++) {
			var n=detailNull[i];
			var fMID = fIDArrayM[n];
			var row = mainData.find([ "OA_AS_CheckM" ], [ fMID ], true, true, true);
			mainData.to(row[0]);

			for ( var j = 0; j < dlen; j++) {
				var options = {
					defaultValues : [ {
						fCheckItem : d1[j],
						fDescription : d2[j],
						fRemark : d3[j]
					} ]
				};
				detailData.newData(options);
			}
		}
	}


	return Model;
});