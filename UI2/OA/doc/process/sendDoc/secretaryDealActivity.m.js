define(function(require){
	var $ = require("jquery");
	var biz = require("$UI/system/lib/biz");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.DeptExecutorClick = function(event){
		alert("click");
		debugger;
		//this.comp("DeptExecutor").filter = " 1<> 1";
	};
	Model.prototype.div16Click = function(event){
		this.trgClick("fExtendPsnIDs1","deptMeetingActivity","wDlgPsnIDs1");
	};
	Model.prototype.div21Click = function(event){
		this.trgClick("fExtendPsnIDs2","reviewActivity","wDlgPsnIDs2");
	};
	Model.prototype.div23Click = function(event){
		this.trgClick("fExtendPsnIDs3","signActivity","wDlgPsnIDs3");
	};
	
	Model.prototype.trgClick = function(fExtendPsnID,fActivity,wDlgID){
	//调用Action获取有环节权限的人员

    	var dDoc = this.comp('dDoc');
    	var row = dDoc.getCurrentRow();
    	var fExtendPsnIDValue = row.val(fExtendPsnID);
    	var selectedPsnIDs = [];
    	if(fExtendPsnIDValue)
    		selectedPsnIDs = fExtendPsnIDValue.split(",");
	

    	var spLeaders = this.comp(wDlgID);
    	spLeaders.set({filter:this.getOrgFilter(fActivity)});

    	spLeaders.open({data:{selected:{kind:'sPersonID',value:selectedPsnIDs}}});
    };
    
	Model.prototype.wDlgPsnIDs1Receive = function(event){
		var dExecutors = event.data;
		this.wDlgReceiveData("fExtendPsnIDs1","fExtendPsnNames1","fExtendNum4","deptMeetingActivity",dExecutors);
	};
    
	Model.prototype.wDlgPsnIDs2Receive = function(event){
		var dExecutors = event.data;
		this.wDlgReceiveData("fExtendPsnIDs2","fExtendPsnNames2","fExtendNum5","reviewActivity",dExecutors);
	};
    
	Model.prototype.wDlgPsnIDs3Receive = function(event){
		var dExecutors = event.data;
		this.wDlgReceiveData("fExtendPsnIDs3","fExtendPsnNames3","fExtendNum3","signActivity",dExecutors);
	};
    
    Model.prototype.wDlgReceiveData = function(fExtendPsnID,fExtendPsnName,fExtendNum,fActivity,dExecutors){
        ;
		var dDoc = this.comp('dDoc');
		var fMasterID = dDoc.getCurrentRowID();
		var docrow = dDoc.getCurrentRow();
	
		var fExtendPsnIDs = docrow.val(fExtendPsnID);
		var fExtendNum5 = docrow.val(fExtendNum);
		var fExtendPsnIDs1 = "";
		var fExtendPsnNames1 = "";
		var fCounterSignIDs = "";
		var signers = "";
		for(var i=0; i<dExecutors.length; i++){
			var row = dExecutors[i];
	    
			var personID = row.val("sPersonID");
		
			fExtendPsnIDs1 += personID + ",";
			var personName = row.val("sName");
			fExtendPsnNames1 += personName + ",";
		}
		fCounterSignIDs = fExtendPsnIDs1.substring(0,fExtendPsnIDs1.length-1);

		docrow.val(fExtendPsnID,fCounterSignIDs);
		docrow.val(fExtendPsnName,fExtendPsnNames1.substring(0,fExtendPsnNames1.length-1));
		dDoc.saveData();
		this.insertCounterSigner(fCounterSignIDs,fExtendNum5,fActivity);
	};
	
	Model.prototype.insertCounterSigner = function(fCounterSignIDs,isAdd,fActivity){
        ;
    	var dDoc = this.comp('dDoc');
    	var sData1 = dDoc.getCurrentRowID();
    	var ctx = this.getContext();

        var activity = ctx.getCurrentActivity();
	   
	    var process = ctx.getCurrentProcess();
	    var param = new biz.Request.ActionParam();
	    
    	param.setString('sData1',sData1);
    	param.setString('activity',fActivity);
    	param.setString('fCounterSignIDs',fCounterSignIDs);
    	param.setString('isAdd',isAdd);
    	biz.Request.sendBizRequest({
				"context" : ctx,
				"action" : "insertSignPsnAction",
				"parameters" : param, 
				"callback" : function(data) {
					    
					data.ignoreError = false;
					
				}
			});
			
    	
    };
    Model.prototype.getCActivityOrgUnit = function(fActivity){
	   var returnValue = null;
       var ctx = this.getContext();

       var activity = ctx.getCurrentActivity();
	   
	   var process = ctx.getCurrentProcess();
	   var param = new biz.Request.ActionParam();
	   param.setString('activity',fActivity);
	   param.setString('process',process);
	   
	   biz.Request.sendBizRequest({
				"context" : ctx,
				"action" : "getCActivityOrgUnitAction",
				"parameters" : param, 
				"callback" : function(data) {
					    
					data.ignoreError = false;
					if (data.state) {
						returnValue = data.response;
					}
				}
			});
			

	   return returnValue;
   };
   
	 Model.prototype.getOrgFilter = function(fActivity){
        ;
    	var str = this.getCActivityOrgUnit(fActivity);
	    var strs = str.split(",");
	    var sFIDFilter = "";
	    for(var i=0; i<strs.length; i++){
	    	sFIDFilter += "'" + strs[i] + "' like concat(SA_OPOrg.sFID, '%') or ";
	    }
	    sFIDFilter = sFIDFilter.substring(0,sFIDFilter.length-3);
	    return sFIDFilter;
    };
    
	return Model;
});