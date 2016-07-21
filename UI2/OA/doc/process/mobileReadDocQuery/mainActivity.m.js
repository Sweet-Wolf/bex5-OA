define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!$UI/OA/config/pub").load();
	var common = require("$UI/OA/common/js/common");
	var Model = function(){
		this.callParent();
	};
    
    Model.prototype.dataFilter = function(event){
		if(this.comp('numData').val('findStr')== undefined){
			return true;
		}else if(this.comp('numData').val('findStr')==''){
			return true;
		}else{
			return (event.val('fTitle').indexOf(this.comp('numData').val('findStr')) >= 0) || (event.val('fCreatePsnName').indexOf(this.comp('numData').val('findStr')) >= 0);
		}
	};
	Model.prototype.smartFilter1Filter = function(event){
		var str = event.source.searchText.get();
		this.comp('numData').setValue("findStr",str);
	};
	
	 //获得list中的记录数
	Model.prototype.showlistCount = function() {
	 
		var readNO = this.comp('readlist').getBindingObjects().length;
		var noReadNO = this.comp('noReadList').getBindingObjects().length;
		
		
		this.comp('numData').setValue('readNum', readNO);
		this.comp('numData').setValue('noreadNum', noReadNO);
		
	};
	
	Model.prototype.refreshData = function(){
		var DocRead = this.comp("dDocRead");
	    var DocNoRead = this.comp("dDocNoRead");
	    debugger;
	    var smartFilter = ""
	    var findStr = this.comp('numData').val('findStr');
 	    if(findStr != "" && findStr != undefined)
 	    	smartFilter =  "( fTitle like '%"+findStr+"%' or fCreatePsnName like '%"+findStr+"%')";
	    
	    var personId = this.getContext().getCurrentPersonID();
		var currentPersonMemberFID = this.getContext().getCurrentPersonMemberFID();
		var personFilter = common.getCurrentMembersURLFilter(this.getContext(),'r.fRangeURL');
		var personFilters = personFilter.split(' OR');
		var filters = [];
		for(var i=0;i<personFilters.length;i++){
			var subFilter = personFilters[i];
			while(subFilter.indexOf('(') >= 0){
				subFilter = subFilter.replace('(', '');
			}
			while(subFilter.indexOf(')') >= 0){
				subFilter = subFilter.replace(')', '');
			}
			filters[i] = "("+ subFilter +")";
		}
		var filter = filters.join(' OR ');
	    
		noReadfilter   = "OA_DC_Doc in (select distinct d from OA_DC_Doc d join OA_DC_ReaderRange r on d = r.fMasterID and ("+ filter +")) and ('"+personId+"' in (select t.fPersonID from OA_DC_ReaderRange t where t.fMasterID = OA_DC_Doc)) and (not(OA_DC_Doc.fReaderIDs like '%"+personId+"%') or OA_DC_Doc.fReaderIDs is null)";
	    
	    readfilter = "OA_DC_Doc in (select distinct d from OA_DC_Doc d join OA_DC_ReaderRange r on d = r.fMasterID and ("+ filter +")) and ('"+personId+"' in (select t.fPersonID from OA_DC_ReaderRange t where t.fMasterID = OA_DC_Doc)) and (OA_DC_Doc.fReaderIDs like '%"+personId+"%')";
	    
	    if(smartFilter != ""){
	    	readfilter = readfilter + " and "+filter;
	    	noReadfilter = noReadfilter + " and "+filter;
	    }
	   
	    DocRead.setFilter("filter", readfilter); 
	    DocNoRead.setFilter("filter", noReadfilter) ;
	    DocRead.refreshData();
	    DocNoRead.refreshData();
	};
	
	Model.prototype.modelLoad = function(event){
	   //过滤未阅、已阅数据
	    this.refreshData();
		this.showlistCount();
	};
	Model.prototype.backBtnClick = function(event){
		justep.Portal.closeWindow();
	};
	Model.prototype.listClick = function(event){
	   debugger;
        this.comp('detailDialog').open({data : {data : this.comp('dDocNoRead').getValue('OA_DC_Doc')}});
	};
	Model.prototype.readlistClick = function(event){
	     debugger;
		 this.comp('detailDialog').open({data : {data : this.comp('dDocRead').getValue('OA_DC_Doc')}});
	};
	Model.prototype.detailDialogClose = function(event){
		 this.refreshData();
	};
	return Model;
});