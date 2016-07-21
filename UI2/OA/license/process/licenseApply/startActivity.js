define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};
	
	Model.prototype.addBtnClick = function(event){
		var dlgLicenseInfo = this.comp("dlgLicenseInfo");
		dlgLicenseInfo.open();
	};

	Model.prototype.dlgLicenseInfoReceive = function(event){
		//返回数据
		var subData = this.comp("detailData");
		var fApplyID = this.comp("mainData").getCurrentRowID();
		$.each(event.data, function(i, row) {
		  
		    subData.newData({
			index : 0,
			defaultValues : [ {
				"fApplyID" : fApplyID,
			    "fLicenseID":row.getID(),
				"fLicenseName":row.val("fLicenseName"),
				"fLicenseNo":row.val("fLicenseNo"),
				"fSerialNumber":row.val("fSerialNumber")
			  } ]
		   });
            
			
		});
	
	};

	return Model;
});