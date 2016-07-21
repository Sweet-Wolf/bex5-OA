define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var archival = require("$UI/OA/archival/js/archival");
	
	var Model = function() {
		this.callParent();
	};
	var mainData ="",detailData="";
	var dValueChanging = false;
	Model.prototype.modelLoad = function(event){
		mainData = this.comp("mainData");
		detailData = this.comp("detailData");
	};
	
	//借阅人过滤
	Model.prototype.orgSelectPC3ShowOption = function(event){		
		var deptID = mainData.getValue("fBorrowDeptID");
		var perData = this.comp("dPsm");
		perData.setFilter("filter0", "SA_OPOrg.sParent ='" + deptID + "'");
		perData.refreshData();
	};

	Model.prototype.mainDataValueChanged = function(event){
		if (!dValueChanging) {
			dValueChanging = true;	
			if (event.column == "fBorrowDeptID") {
				mainData.setValue("fBorrowPsnID", '');
				mainData.setValue("fBorrowPsnName", '');
			}	
			try {
				var psnID = this.getContext().getCurrentPersonID();//justep.Context.getCurrentPersonID();
				var psnName = this.getContext().getCurrentPersonName();//justep.Context.getCurrentPersonName();
				var time = justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT);//justep.Date.toString(justep.System.datetime(),justep.Date.STANDART_FORMAT);
				mainData.setValue("fUpdatePsnID", psnID);
				mainData.setValue("fUpdatePsnName", psnName);
				mainData.setValue("fUpdateTime", time);
			} finally {
				dValueChanging = false;
			}
		}
	};
	
	//添加
	Model.prototype.insertFiledDOMActivate = function(event){
		var url=require.toUrl("$UI/OA/archival/process/dialog/archivalMultipleDialog/archivalMultipleDialog.w");
		this.comp("windowDialog").open({src:url});
	};

	//添加返回值
	Model.prototype.dlgSelectArchivalReceive = function(event){
		var archivalId = event.data.archivalID;
		detailData = this.comp("detailData");

		var result="";
		var params = new biz.Request.ActionParam();
		params.setParam("fArchivalID", archivalId);
		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "getBorrowInfoAction",
			parameters : params,
			callback: function(data){
				if(data.state){
					result=data.response;					
				}else{
					Request.errorMessage(data, "执行失败！", null, null);
				}	
			}
		};		
		var r=biz.Request.sendBizRequest(options);		
		if (!biz.Request.sendBizRequest(options)) {
			throw new Error(biz.Request.getServerError(r, "档案借阅选择档案失败!"));
		}

		var archivalInfo = result.split(",");
		var mID=mainData.getValue("OA_AM_BorrowApplyM");
		if ((archivalInfo != "") && (archivalInfo != null)) {
			for ( var j = 0; j < archivalInfo.length; j++) {
				var filedInfo = archivalInfo[j].split("|");
				//if (detailData.locate( [ filedInfo[0] ], [ "fArchivalID" ], false,false, false) == 0) {
					detailData.newData();					
					detailData.setValue("fArchivalID", filedInfo[0]);
					detailData.setValue("fArchivalNO", filedInfo[1]);
					detailData.setValue("fState", filedInfo[3]);
					if (filedInfo[4] != 'null' && filedInfo[4] != null)
						detailData.setValue("fAMYear", filedInfo[4]);
					detailData.setValue("fCarry", filedInfo[5]);
					detailData.setValue("fFileDeptName", filedInfo[6]);
					detailData.setValue("fResponsibleName", filedInfo[7]);
					detailData.setValue("fIsRoll", filedInfo[8]);
					detailData.setValue("fTitle", filedInfo[2]);
	
					if (detailData.getValue("fCarry") == '电子') {
						detailData.setValue("fBorrowKind", "查阅");
					} else {
						detailData.setValue("fBorrowKind", "原件");
					}
					
				//}
			}
		}
		
	};

	Model.prototype.dataTables1CellRender = function(event){
		detailData.to(event.row.getID());
		var isRoll = detailData.getValue("fIsRoll");
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
		var archivalID=detailData.getValue("fArchivalID");
		
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
			this.comp("archivalDialog").set({"title":title});
			this.comp("archivalDialog").open({src:url,data:{archivalID:archivalID,operator:operator}});
		}
	};

	return Model;
});