define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function() {
		this.callParent();
	};
/*	
	Model.prototype.newBtnClick = function(event) {
		var mainData = this.comp("mainData");
		mainData.newData();
		this.goTotab();
	};

	Model.prototype.goTotab = function() {
		var tabs = this.comp("tabs");
		tabs.setActiveTab("nav-detail");
	}

	Model.prototype.orderTablesRowDblClick = function(event){
		var mainData = this.comp("mainData");
		mainData.to(event.bindingContext.$object);
		this.goTotab();
		var url = require.toUrl("$UI/OA/asset/process/assetIn/detailActivity.w?process=/OA/asset/process/assetIn/assetInProcess&activity=startActivity&data=" + mainData.getCurrentRowID());
		justep.Portal.openWindow(url, {title: "资产入库管理详细"});
	};
	*/
	Model.prototype.DataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	
	Model.prototype.mainDataAfterDelete = function(event){
		justep.Util.hint("删除成功！", {type: 'success', parent: this.getRootNode()});
		var tabs = this.comp("tabs");
		tabs.setActiveTab("nav-list");
	};
	
	Model.prototype.newBtnMClick = function(event){
		var url=require.toUrl("$UI/OA/asset/process/dialog/selectBuyApplyDialog/selectBuyApplyDialog.w");
		justep.URL(url);
	};
	
	var mainData="",detailData="",checkedIDs="";
		
	Model.prototype.modelLoad = function(event){
		mainData=this.comp("mainData");
		detailData=this.comp("detailData");
		var type = this.getContext().getRequestParameter("t");
		if(type=="new"){
			mainData.newData();
		} else {
			var data = this.getContext().getRequestParameter("data");
			
			if (data){
				var filter = "OA_AS_InM='" + data + "'";
				mainData.setFilter("____dataFilter_", filter);
				mainData.refreshData(); 
			}
		}
	};
	
	Model.prototype.dPsmMousedown = function(event){		
		var dutyDeptID = mainData.getValue("fDutyDeptID");
		var personData = this.comp('dPsm');
		personData.filters.setFilter("psmFilter", "SA_OPOrg.sPersonID like '%/" + dutyDeptID + "%'");
		personData.refreshData();
	};

	/*下拉隐藏
	Model.prototype.kindSelectHideOption = function(event){
		var code=detailData.getValue("fCode");
		var data=this.comp('kindData');
		var date = justep.Date.toString(new Date(), "YYYYMMDD");
		data.setValue('fCode', "临时："+date+"-"+data.getValue("fCode")+"-"+code);
	};
	*/
	//采购列表
	Model.prototype.trgInsertBtnClick = function(event){
		var url=require.toUrl("$UI/OA/asset/process/dialog/selectBuyApplyDialog/selectBuyApplyDialog.w");
		this.comp("dlgBuyApply").open({src:url});
	};
	//采购信息返回参数
	Model.prototype.dlgBuyApplyReceive = function(event){
		var rows=event.data.rows;
		var len=rows.length;
		var fno=mainData.val('fNO');
		var kindData=this.comp('kindData');
		var allAmount=0;
		for(var i=0; i<len; i++){
			var n=rows[i].val("fBuyNum");
			for(var j=0; j<n; j++){
				detailData.newData();
				//var code=detailData.getValue("fCode");				
				//var date = justep.Date.toString(new Date(), "YYYYMMDD");	
				//detailData.setValue('fCode', "临时："+date+"-"+rows[i].val("fKindCode")+"-"+code);
				detailData.setValue("fName",rows[i].val("fName"));
				detailData.setValue("fSpecType",rows[i].val("fSpecType"));//规格型号
				detailData.setValue("fKindID",rows[i].val("fKindID"));
				detailData.setValue("fKind",rows[i].val("fKind"));//资产类别
				detailData.setValue("fUnitID",rows[i].val("fUnitID"));
				detailData.setValue("fUnit",rows[i].val("fUnit"));
				//detailData.setValue("fPrice",rows[i].val("fPrice"));//单价				
				detailData.setValue("fAmount",rows[i].val("fPrice"));//金额
				detailData.setValue("fBuyApplyID",rows[i].val("fMasterID"));//采购单id
				detailData.setValue("fBuyApplyNO",rows[i].val("fNO"));//采购单号	
				allAmount+=rows[i].val("fPrice");
			}
		}
		mainData.setValue("fAmount", allAmount);
		detailData.saveData();
		mainData.saveData();
	};
		
	//验收
	Model.prototype.trgCheckClick = function(event){
		checkedIDs = this.comp('detailGrid').getCheckeds();
		var length = checkedIDs.length;
		if (length == '0') {
			alert("请先选择要验收的资产信息！");
		} else {
			var assetInDlg = this.comp("dlgInCheck");
			var url=require.toUrl("$UI/OA/asset/process/dialog/assetInCheck/assetInCheck.w");
			assetInDlg.initEveryTimes = true;			
			assetInDlg.open({src:url,data:{obj:detailData,infoIDs:checkedIDs}});	
		}
	};
	
	//验收返回参数
	Model.prototype.dlgInCheckReceive = function(event){
		var fIDArray=event.data.idArray;
		var fNOArray=event.data.noArray;		
		for(var i=0; i<checkedIDs.length; i++){
			var row=detailData.getRowByID(checkedIDs[i]);
			detailData.setValue("fIsCheck", "1", row);
			detailData.setValue("fIsCheckName", "已验收", row);//验收状态
			detailData.setValue("fCheckID", fIDArray[i], row);//验收单id
			detailData.setValue("fCheckNO", fNOArray[i], row);//验收单
		}
		detailData.saveData();
		detailData.refreshData();
	};
	
	//入库
	Model.prototype.trgInClick = function(event){
		checkedIDs = this.comp('detailGrid').getCheckeds();
		if (mainData.isChanged()) {
			mainData.saveData();
		} else if (detailData.isChanged()) {
			detailData.saveData();
		}
		var inIDs = new Array();
		var length = checkedIDs.length;
		if (length == '0') {
			alert("请先选择要入库的资产信息！");
		} else {
			for (var i = 0; i < length; i++) {
				var isIn =detailData.getValue("fIsIn", detailData.getRowByID(checkedIDs[i]));
				if ((isIn == '0')) {
					inIDs.push(checkedIDs[i]);
				}
			}
			if (inIDs != "") {
				assetInIDs = inIDs;
				var assetInDlg = this.comp("dlgInDate");
				var url=require.toUrl("$UI/OA/asset/process/dialog/assetInDate/assetInDate.w");
				assetInDlg.initEveryTimes = true;
				assetInDlg.open({src:url,data:{infoIDs:checkedIDs}});
			} else {
				alert("所选资产已入库！");
			}
		}
	};

	//入库返回参数
	Model.prototype.dlgInDateReceive = function(event){
		var inDate=event.data.inDate;
		var len=checkedIDs.length;
		for(var i=0;i<len;i++){
			checkedIDs[i]="'"+checkedIDs[i]+"'";
		}
		var params = new biz.Request.ActionParam();
		params.setString("assetInDate", inDate);
		params.setString("assetInIDs", checkedIDs);
		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "assetIn",
			parameters : params
		};
		var r=biz.Request.sendBizRequest(options);
		if (!biz.Request.sendBizRequest(options)) {
			throw new Error(biz.Request.getServerError(r, "资产入库失败!"));
		} else {
			detailData.refreshData();
			var id = mainData.getRowID();
			mainData.filters.setFilter("assetInMFilter", "OA_AS_InM='" + id + "'");
			mainData.refreshData();
			if (mainData.getValue("fState") == '1') {
				//callBackFun();
			}
			//alert(justep.Request.transform(justep.Request.getData(r.responseXML)));	
		}
				
	};

	Model.prototype.detailGridCellRender = function(event){
		var row=detailData.find(["OA_AS_InD"],[event.row.getID()],true,true,true);
		if(event.colName=="fCheckNO"){//验收单号
			var text=detailData.getValue("fCheckNO",row[0]);
			if(text==undefined){
				text="";
			}
			event.html="<a href='javascript:;' class='check'>"+text+"</a>";
		} else if(event.colName=="fBuyApplyNO"){//采购单号
			var text=detailData.getValue("fBuyApplyNO",row[0]);
			if(text==undefined){
				text="";
			}
			event.html="<a href='javascript:;' class='buyApply'>"+text+"</a>";
		}
	};
	Model.prototype.detailGridRowClick = function(event){
		var link=$(event.domEvent.target);
		var row=detailData.find(["OA_AS_InD"],[event.row.getID()],true,true,true);
		if(link.hasClass("check")){
			var checkObj = this.comp("dlgInCheckInfo");
			this.openCheck(detailData.getValue("fCheckID",row[0]),checkObj);
		}
		if(link.hasClass("buyApply")){//采购单号
			var buyApplyObj = this.comp("dlgInBuyInfo");
			this.openBuyApply(detailData.getValue("fBuyApplyID",row[0]),buyApplyObj);			
		}
	};
	Model.prototype.openCheck = function(checkID,checkObj){
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetInCheckInfo/assetInCheckInfo.w");
		checkObj.initEveryTimes = true;
		checkObj.open({src:url,data:{operator:"",assetInID:checkID}});
	}
	Model.prototype.openBuyApply = function(buyApplyID,buyApplyObj){
		var url=require.toUrl("$UI/OA/asset/process/dialog/assetBuyRecord/assetBuyRecord.w");
		buyApplyObj.initEveryTimes = true;
		buyApplyObj.open({src:url,data:{operator:"",assetInID:buyApplyID}});
	}

	Model.prototype.deleteBtnClick = function(event){
		checkedIDs = this.comp('detailGrid').getCheckeds();
		
		var deleteIDs = new Array();
		var length = checkedIDs.length;
		if (length == '0') {
			alert("请先选择要删除的资产信息！");
		} else {
			for (var i = 0; i < length; i++) {			
				if (detailData.getValue("fIsIn", detailData.getRowByID(checkedIDs[i])) == '0'){
					deleteIDs.push(checkedIDs[i]);	
				}
			}
			if (deleteIDs.length > 0) {
				for(var i=0; i<deleteIDs.length; i++){
					detailData.deleteData(detailData.getRowByID(deleteIDs[i]));			
				}
				this.totleAmount();
			} else {
				alert("所选资产已入库,不可删除！");
			}			
		}
	};	
	//计算总金额
	Model.prototype.totleAmount = function(event){
		var totle = 0;
		var length = detailData.getCount();
		for (var i = 0; i < length; i++) {
			var mID = detailData.getCurrentRow();
			//alert(mID);
			if (typeof mID == "undefined") {
				continue;
			}
			var fAmount = detailData.getValue("fAmount", mID);
			totle = parseFloat(totle - (-fAmount)).toFixed(2);
		}
		mainData.setValue("fAmount", totle);
	}
	
	return Model;
});