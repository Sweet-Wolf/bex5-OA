define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var common = require("$UI/OA/workTime/js/common");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.mainDataSaveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};

	var mainData="",childData="";
	Model.prototype.modelLoad = function(event){
		mainData =this.comp("mainData");
		childData = this.comp("dOutMember");
	};	
		
/*
	Model.prototype.windowDialogLoad = function(event){
		return {
			getSimpleStore : function() {
				var store = new SimpleStore("spcdata", "sName");
				return store;
			},
			getShowAlias : function() {
				return null;
			},
			selectKind : 'psm',
			viewKind : 'ogn,dpt,grp,pos'
			}
	};
	*/
	//数据改变
	Model.prototype.mainDataValueChanged = function(event){
			var data = this.comp("mainData");
			var column = event.col;
			if (column == 'fAPPLYDEPTNAME') {
				data.setValue("fAPPLYPERSONID", "");
				data.setValue("fAPPLYPERSONNAME", "");
			}
			if (column == 'fSTARTTIME' || column == 'fENDTIME') {
				var starttime = data.getValue("fSTARTTIME");
				var fEndTime = data.getValue("fENDTIME");
				if (starttime != null && fEndTime != "" && starttime != "" && fEndTime != null) {
					var hour = common.calLeaveData(starttime, fEndTime);
					if (hour >= 0) {		
						data.setValue("fHOURS", (hour % 8).toString());
						data.setValue("fDAYS", parseInt(hour / 8) > 0 ? parseInt(hour / 8) : '0');
					} else {
						alert('填入的时间不合法！');
						data.setValue("fHOURS", '0');
						data.setValue("fDAYS", '0');
					}
				}
			}
	};
	
	//部门选择
	Model.prototype.orgSelectPC3ShowOption = function(event){		
		var deptID = mainData.getValue("fAPPLYDEPTID");
		var dPsm = this.comp("dPsm");
		dPsm.filters.setFilter("psmFilter", "SA_OPOrg like '%@"+deptID+"%'");
		dPsm.refreshData();
	};
	
	//人员选择
	Model.prototype.trgSelectAssetDOMActivate = function(event){
		childData.deleteData();
		mainData.setValue("fPERSONNEL", null);
		mainData.setValue("fNUMBER", 0);
		
		this.comp('orgDialogPC').open();
	};
	//人员选择返回
	Model.prototype.orgDialogPCReceive = function(event){
		var rows = event.data;		
		var names="";
		var n=rows.length;
		var fID=mainData.getValue("OA_WM_outApply");
		for ( var i in rows) {
			childData.add({				
				fPersonName: rows[i].val('sName'),
				fPersonID: rows[i].val('sFID'),
				fMasterID: fID	
			});
			names+=rows[i].val('sName');
			if(i<n-1) names+=",";
		}
		mainData.setValue("fPERSONNEL", names);
		mainData.setValue("fNUMBER", n);
	};



	return Model;
});