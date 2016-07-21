define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var common = require("$UI/OA/common/js/common");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelLoad = function(event){
		debugger;
		var data = this.comp("dDoc");
		var personId = this.getContext().getCurrentPersonID();
		var currentPersonMemberFID = this.getContext().getCurrentPersonMemberFID();
		//data.filters.setFilter("preFilter", "'" + currentPersonMemberFID + "' like concat(OA_DC_ReaderRange.fRangeURL,'%')");
		//var filter2 = appCommon.FilterUtils.getCurrentMembersURLFilter('OA_DC_ReaderRange.fRangeURL');
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
		//var filter1 = "OA_DC_Doc in (select distinct d from OA_DC_Doc d join OA_DC_ReaderRange r on d = r.fMasterID and ("+ filter +"))";
		var filter1 = "OA_DC_Doc in (select distinct d from OA_DC_Doc d join OA_DC_ReaderRange r on d = r.fMasterID and ("+ filter +")) and ('"+personId+"' in (select t.fPersonID from OA_DC_ReaderRange t where t.fMasterID = OA_DC_Doc)) and (not(OA_DC_Doc.fReaderIDs like '%"+personId+"%') or OA_DC_Doc.fReaderIDs is null)";
		data.filters.setFilter("preFilter1", filter1);
		data.refreshData();
	};


	Model.prototype.dtDocfReaderIDsRender = function(readIDs) {
		
		var fReaderIDs = readIDs;//row.val('fReaderIDs');
			fReaderIDs = fReaderIDs || '';
		var personId = this.getContext().getCurrentPersonID();
		if (fReaderIDs.indexOf(personId) == -1) {
			return "未阅";
		} else {
			return "已阅";
		}
	};
	

	Model.prototype.dtDocRowDblClick = function(event){
		;
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var dDoc = this.comp("dDoc");
		var rowid = dDoc.getCurrentRowID();
		var docType = dDoc.getValue("fDocType");
		if (rowid) {
			var url = "$UI/OA/doc/process/readDocQuery/readDocDetailQuery.w"
				+ "?process=" + process + "&activity=" + activity
				+ "&docType="+ docType
				+ "&rowid="+ rowid;
			justep.Portal.openWindow(url,{title:'详细信息'});
		}
	};

	Model.prototype.gsReadFilterHideOption = function(event){
	    ;
		var dReadFilter = this.comp("dReadFilter");
		var state = dReadFilter.getValue("readValue");
		var data = this.comp("dDoc");
		var row = data.getCurrentRow();
		var fReaderIDs = data.getValue("fReaderIDs");
		fReaderIDs = fReaderIDs?fReaderIDs:'';
		fReaderIDs = fReaderIDs.replace(",","','");
		fReaderIDs = "'"+fReaderIDs+"'";
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
		
		;
		if(state=="0"){
		    debugger;
			filter = "OA_DC_Doc in (select distinct d from OA_DC_Doc d join OA_DC_ReaderRange r on d = r.fMasterID and ("+ filter +")) and ('"+personId+"' in (select t.fPersonID from OA_DC_ReaderRange t where t.fMasterID = OA_DC_Doc)) and (not(OA_DC_Doc.fReaderIDs like '%"+personId+"%') or OA_DC_Doc.fReaderIDs is null)";
			data.filters.setFilter("preFilter1", filter);
			data.refreshData();
		}else if(state=="1"){
			filter = "OA_DC_Doc in (select distinct d from OA_DC_Doc d join OA_DC_ReaderRange r on d = r.fMasterID and ("+ filter +")) and ('"+personId+"' in (select t.fPersonID from OA_DC_ReaderRange t where t.fMasterID = OA_DC_Doc)) and (OA_DC_Doc.fReaderIDs like '%"+personId+"%')";
			data.filters.setFilter("preFilter1", filter);
			data.refreshData();
		}else{
			filter = "OA_DC_Doc in (select distinct d from OA_DC_Doc d join OA_DC_ReaderRange r on d = r.fMasterID and ("+ filter +")) and ('"+personId+"' in (select t.fPersonID from OA_DC_ReaderRange t where t.fMasterID = OA_DC_Doc))";
			data.filters.setFilter("preFilter1", filter);
			data.refreshData();
		}
	
	};



	Model.prototype.queryDateFilter = function(event){
       
	};



	Model.prototype.queryStateFilter = function(event){
	//	;
      // var ev = event;
	};



	return Model;
});