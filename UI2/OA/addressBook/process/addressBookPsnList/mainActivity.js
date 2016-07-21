define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.newBtnClick = function(event) {
		this.openWindow({
			'operator' : 'new'
		});
	};

	Model.prototype.dataTables1RowDblClick = function(event) {
		var rowID = event.rowID;
		if (rowID) {
			this.openWindow({
				'rowID' : rowID
			});
		}
	};

	Model.prototype.openWindow = function(params) {
		var url = new justep.URL(require.toUrl('$UI/OA/addressBook/process/addressBookPsnList/detailActivity.w'));
		url.setParam({
			'activity' : this.getContext().getActivity()
		});
		url.setParam({
			'process' : this.getContext().getProcess()
		});
		url.setParam(params);
		justep.Portal.openWindow(url.toString(), {
			title : '通讯录详细信息'
		});
	};

	Model.prototype.modelActive = function(event) {
		this.comp("mdMain").refreshData();
	};

	Model.prototype.dataTables1CellRender = function(event) {
		var colName = event.colName;
		if (colName === 'fCreatePsnID') {
			var operatorID = this.getContext().getSystemParameter('operatorID');
			if (event.colVal === operatorID) {
				event.html = "共享";
			} else {
				event.html = '未共享';
			}
		}
	};

	Model.prototype.isCanShare = function() {
		return this.getContext().getCurrentPersonID() === this.comp("mdMain").getValue('fCreatePsnID');
	};

	Model.prototype.modelLoad = function(event) {
		var data = this.comp("mdMain");
		var context = this.getContext();
		data.filters.clear();
		var options = {};
		var currentPsnID = context.getCurrentPersonID();
		var currentPsnFID = context.getCurrentPersonMemberFID();
		var param = new biz.Request.ActionParam();
		param.setString("fCurrentPsnFid", currentPsnFID);
		options.process = context.getProcess();
		options.activity = context.getActivity();
		options.parameters = param;
		options.action = "AddressBookShareQueryAction";
		var result = biz.Request.sendBizRequest(options).responseJSON;
		if (!biz.Request.isBizSuccess(result)) {
			throw new Error(biz.Request.getServerError(result, "查询通讯录失败!"));
		}
		var fcondition = "";
		if (result.data.value == "" || result.data.value == null) {
			fcondition = "(OA_AB_AddressBook.fCreatePsnID='" + currentPsnID + "')";
		} else {
			fcondition = "OA_AB_AddressBook in (" + result + ")" + " OR (OA_AB_AddressBook.fCreatePsnID='" + currentPsnID + "')";
		}
		// data.setFilter("detailFilter", fcondition);
		// data.refreshData();
	};

	Model.prototype.btnAddressBookClick = function(event) {
		var dlg = this.comp("windowDialog");
		var rowid = this.comp("mdMain").getCurrentRowID();
		dlg.open({
			data : {
				"operator" : "View",
				"id" : rowid
			}
		});
	};

	return Model;
});