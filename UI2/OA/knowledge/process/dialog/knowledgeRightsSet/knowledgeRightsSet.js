define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
		this.rt_kw_kwid;
		this.rt_kw_isInheritRights;
	};

	Model.prototype.orgDialogPCReceive = function(event){
		;
		var dRights = this.comp('dRights');
		var rows = event.data;
		for ( var i in rows) {
			var fKWKind = "Knowledge";
			var orgKind = rows[i].val('sOrgKindID');
			var orgID = rows[i].val('sPersonID');
			if (orgID == "")
				orgID = rows[i].getID();
			var orgName = rows[i].val("sName");
			var orgFID = rows[i].val("sFID");
			var orgFName = rows[i].val("sFName");
			
			if (!this.havaPerson(orgFID)) {
				var options = {
					defaultValues : [
			 			{fKWKind:fKWKind,
			 			fKWID:this.rt_kw_kwid,
			 			fOrgKind:orgKind,
			 			fOrgID:orgID,
			 			fOrgName:orgName,
			 			fOrgFID:orgFID,
			 			fOrgFName:orgFName,
			 			fIsInherit:'0'},
		 			]
				};	
				dRights.newData(options);
			}
		}
	};
	
	Model.prototype.havaPerson = function(id) {
		var b = false;
		var dRights = this.comp('dRights');
		dRights.eachAll(function(param) {
			if (param.row.val('fOrgFID') == id) {
				b = true;
				return;
			}
		});
		return b;
	};

	Model.prototype.OKBtnClick = function(event){
		;
		this.comp('dRights').saveData();
		this.comp('windowReceiver').windowEnsure();
	};

	Model.prototype.windowReceiverReceive = function(event){
		;
		this.rt_kw_kwid = event.data.kwid;
		this.rt_kw_isInheritRights = event.data.isInheritRights;
		/*
		 * if (rt_kw_isInheritRights == '1') { setCheckboxChecked('inheritChb'); }
		 */
	
		var data = this.comp('dRights');
		data.filters.setFilter("RightsFilter", "fKWID = '" + this.rt_kw_kwid
				+ "' and fKWKind = 'Knowledge'");
		data.refreshData();
	};

	return Model;
});