define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
	var tempData="";
	Model.prototype.modelLoad = function(event){
		tempData = this.comp("dTemp");
		tempData.setValue("tempYear", justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT).split("-")[0]);
		this.refreshData();		
	};
	
	Model.prototype.triggerDOMActivate = function(event){
		this.refreshData();		
	};

	Model.prototype.refreshData = function(event){
		var tempYear = tempData.getValue("tempYear");
		//var sql="",costid=new Array(),accountid=new Array(); 
		
		if (tempYear == "" || tempYear==undefined) {
			alert("请填写预算年度！");			
		} else {
			var tempCost = tempData.getValue("tempCostID");
			var tempAccount = tempData.getValue("tempAccountID");
			
			var sqlReport = "select OA_BG_BadgutM,OA_BG_BadgutM.fCostCenterID as fCostCenterID,OA_BG_BadgutM.fCostCenterCode as fCostCenterCode,OA_BG_BadgutM.fCostCenterName as fCostCenterName,OA_BG_BadgutM.fYear as fYear,OA_BG_BadgutM.fRemark as fRemark,OA_BG_BadgutD.fAccountCode as fAccountCode,OA_BG_BadgutD.fAccountName as fAccountName,OA_BG_BadgutD.fPlan1 as fPlan1,OA_BG_BadgutD.fPlan2 as fPlan2,OA_BG_BadgutD.fPlan3 as fPlan3,OA_BG_BadgutD.fPlan4 as fPlan4,OA_BG_BadgutD.fPlan5 as fPlan5,OA_BG_BadgutD.fPlan6 as fPlan6,OA_BG_BadgutD.fPlan7 as fPlan7,OA_BG_BadgutD.fPlan8 as fPlan8,OA_BG_BadgutD.fPlan9 as fPlan9,OA_BG_BadgutD.fPlan10 as fPlan10,OA_BG_BadgutD.fPlan11 as fPlan11,OA_BG_BadgutD.fPlan12 as fPlan12,OA_BG_BadgutD.fPlanall as fPlanall,OA_BG_BadgutD.fFact1 as fFact1,OA_BG_BadgutD.fFact2 as fFact2,OA_BG_BadgutD.fFact3 as fFact3,OA_BG_BadgutD.fFact4 as fFact4,OA_BG_BadgutD.fFact5 as fFact5,OA_BG_BadgutD.fFact6 as fFact6,OA_BG_BadgutD.fFact7 as fFact7,OA_BG_BadgutD.fFact8 as fFact8,OA_BG_BadgutD.fFact9 as fFact9,OA_BG_BadgutD.fFact10 as fFact10,OA_BG_BadgutD.fFact11 as fFact11,OA_BG_BadgutD.fFact12 as fFact12,OA_BG_BadgutD.fFactall as fFactall from OA_BG_BadgutM OA_BG_BadgutM join OA_BG_BadgutD OA_BG_BadgutD on OA_BG_BadgutM = OA_BG_BadgutD.fBGBadgutID ";
			sqlReport+=" where OA_BG_BadgutM.fYear ="+ tempYear;
			if (!(tempCost == "" || tempCost==undefined)){
				sqlReport+=" and OA_BG_BadgutM.fCostCenterID ='"+ tempCost+"'";
			}
			if (!(tempAccount == "" || tempAccount==undefined)){
				sqlReport+=" and OA_BG_BadgutD.fAccountID ='"+ tempAccount+"'";
			}
			sqlReport+=" order by OA_BG_BadgutD.fAccountCode asc";
			
			this.comp('dReport').setKSQL(sqlReport);
			this.comp("report").refresh();
			
			/*sql="OA_BG_BadgutM.fYear="+tempYear;
			
			if (!(tempCost == "" || tempCost==undefined)){
				//sql+=" and OA_BG_BadgutM.fCostCenterID = '"+tempCost+"'";
				costid=tempCost;
			} else {
				var dCost=this.comp("dCost");
				
				costid="select FID from OA_BG_CostCenter where OA_BG_CostCenter.fUseStatus=1";
			}
			if (!(tempAccount == "" || tempAccount==undefined)){
				//sql+=" and OA_BG_BadgutD.fAccountID = '"+tempAccount+"'";
				accountid=tempAccount;
			} else {
				var dAccount=this.comp("dAccount");
			
				accountid="select FID from OA_Pub_BaseCode where OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='总账科目'";
			}*/

		}
		//costid="'D9524F265A5544DD8A33336BCABD8F82','1491F33211634A6EB3F2F27228042432'";
		//accountid="'243B8B2DCCC64D469BAB9529B43CCE6D','26580F753E1D4196AC912942DF5A7E08','CBF709CFDBCF426F83EBAF13F526D7ED'";
		//costid='%';
		//accountid='%';
		//alert(costid+" ; "+accountid);
		//this.comp("dReport").setStringVar("year",tempYear);
		//this.comp("dReport").setStringVar("costid",tempCost);
		//this.comp("dReport").setStringVar("accountid",tempAccount);
		
		//this.comp("dReport").setStringVar("filter",sql);
		
		
	};
	
	return Model;
});