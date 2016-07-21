define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var windowContainer = require("$UI/system/components/justep/windowContainer/windowContainer");
	var common = require("$UI/OA/common/js/common");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.saveCommit = function(event) {
		justep.Util.hint("保存成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	};

	Model.prototype.mainTablesCellRender = function(event) {
	     debugger;
		var fieldName = event.colName;
		if (fieldName == "fReceiveOgnIDs") {
		   
			if (event.colVal == "") {
				event.html = "未收";
			} else {
				event.html = "已收";
			}
		}
	};

	Model.prototype.modelModelConstructDone = function(event) {
		// this.getElementByXid("btnDocReceive").style.display = 'none';
		// this.comp("btnDocReceive").setCSS({'display' : 'none'})
	};

	Model.prototype.btnDocReceiveClick = function(event) {
	   
		var data = this.comp("dDoc");
		var docId = data.getCurrentRowID();
		if (!docId || docId == "") {
			return;
		}
		var receiveOgnIDs = data.getValue("fReceiveOgnIDs");
		var currentOgnId = this.getContext().getCurrentOgnID();
		var receiveOgnIDs = receiveOgnIDs ? receiveOgnIDs : "";
		if (receiveOgnIDs.indexOf(currentOgnId) > -1 && !confirm("此文本单位已经接收过，要再次接收吗？"))
			return;
//		var url = new justep.URL(require.toUrl('$UI/OA/doc/process/receiveDoc/startActivity.w'))
		var process = "/OA/doc/process/receiveDoc/receiveDocProcess";
		var activity = "startActivity";
//		url.setParam({'process' : process});
//		url.setParam({'activity' : activity});
//		url.setParam({'operate' : '1'});
//		url.setParam({'docId' : docId});
		var url = require.toUrl("$UI/OA/doc/process/receiveDoc/startActivity.w?process=" + process + "&activity=" + activity + "&operate=1&docId=" + docId);
		justep.Portal.openWindow(url);
	};

	Model.prototype.modelLoad = function(event) {
	   debugger;
		var data = this.comp("dDoc");
		var currentPsnFId = this.getContext().getCurrentPersonMemberFID();
		var personFilter = common.getCurrentMembersURLFilter(this.getContext(), 'r.fRangeURL');
		var personFilters = personFilter.split(' OR');
		var filters = [];
		for ( var i = 0; i < personFilters.length; i++) {
			var subFilter = personFilters[i];
			while (subFilter.indexOf('(') >= 0) {
				subFilter = subFilter.replace('(', '');
			}
			while (subFilter.indexOf(')') >= 0) {
				subFilter = subFilter.replace(')', '');
			}
			filters[i] = "(" + subFilter + ")"
		}
	
		var filter = filters.join(' OR ');
		var filter1 = "OA_DC_Doc in (select distinct d from OA_DC_Doc d join OA_DC_ReceiveRange r on d = r.fMasterID and (" + filter + "))";
		 data.setFilter("preFilter", filter1);
		data.refreshData();
	};

	return Model;
});