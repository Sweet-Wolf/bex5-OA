define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var OpmUtils = require("$UI/SA/OPM/js/OpmUtils");
	var Model = function(){
		this.callParent();
	};

	Model.prototype.selOrgBtnClick = function(event){
	     ;
    	var dExternalUnit = this.comp('dExternalUnit');
    	var currentRowId = dExternalUnit.getCurrentRowID();
    	
    	if (!currentRowId || (currentRowId == '') || (currentRowId == 'externalUnit')) 
    		return ;
    	
    	
    	
		var dlg = this.comp('orgDialogPC');
		dlg.open();
	};

	Model.prototype.orgDialogPCReceive = function(event){
	    var rows = event.data;
	
		var dExternalUnit = this.comp('dExternalUnit');
		var row = dExternalUnit.getCurrentRow();
		for ( var i in rows) {
		    var orgID = rows[i].val('SA_OPOrg');
		    var code = rows[i].val('sCode');
		    var orgName = rows[i].val('sName');
		    row.val("fCode", code);
		    row.val("fOrgID", orgID);
		    row.val("fName", orgName);
			
		}
	};
	
    Model.prototype.canSearch = function() {
	
   };

	Model.prototype.newBtnClick = function(event){
		var dExternalUnit = this.comp('dExternalUnit');
	    var row = dExternalUnit.getCurrentRow();

		var fName = row.val("fName");
		if (fName == "") {
			alert("父节点名称不能为空!");
			return;
		}
		
		var parentID = row.getID();	
		if(!parentID) 
			parentID = "";
	 
		var parentName = fName;
		var parentURL = row.val("fOrgURL");
		var parentURLName = row.val("fOrgURLName");

		var GUID = justep.UUID.createUUID();
	
		var url = parentURL + "/" + GUID;
		var urlName = parentURLName + "/" ;
		dExternalUnit.newData({
		    parent : row,
			index : 0,
			defaultValues : [ {
				"OA_DC_ExternalUnit" : GUID,
				"fParent":parentID,
				"fParentName":parentName,
				"fOrgURL":url,
				"fOrgURLName":urlName
			} ]
		});
		
	
	};

	Model.prototype.fNameChange = function(event){
		var data = this.comp('dExternalUnit');
		var row = data.getCurrentRow();
		
		var urlName = row.val("fOrgURLName");
		var names = urlName.split("/");
		names[names.length - 1] = row.val("fName");
		row.val("fOrgURLName", names.join("/"));
	};

	Model.prototype.roleDataTablesCellRender = function(event){
	//	if (event.colName == "fCode") {
	//		event.html = "<img height='16' width='16' src='" + OpmUtils.getRoleImgURL(event.colVal, event.row.val("sValidState") != 1) + "'/>";
	//	}
	};


	Model.prototype.btnKeyWordClick = function(event){

	};


	return Model;
});