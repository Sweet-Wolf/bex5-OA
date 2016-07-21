define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.saveCommit = function(event) {
		justep.Util.hint("保存成功！", {
			type : 'success',
			parent : this.getRootNode()
		});
	};
	// 新建
	Model.prototype.newBtnClick = function(event) {
/*		var masterID = this.comp("mainData").getCurrentRowID();
		var options = {
			action : "new",
			masterID : masterID,
		};
		this.comp("windowDialog").open({
			data : options
		});*/
		
		this.gotoDetil('new');
	};
	
	Model.prototype.gotoDetil = function(operat){
		var mainData = this.comp('mainData');
		var process = this.getContext().getCurrentProcess();
		var activity = this.getContext().getCurrentActivity();
		var rowID = mainData.getCurrentRowID();
		var url = "$UI/OA/officeSupplyConsumables/process/officeSupplyBaseInfo/baseInfoDailog.w"
		 + "?process=" + process + "&activity=" + activity
		 + "&rowID="+ rowID
		 + "&operat="+ operat;
		justep.Portal.openWindow(url,{title:'办公用品详细'});
	};
	Model.prototype.windowDialogReceive = function(event) {
		var mainData = this.comp("mainData");
		mainData.refreshData();

	};
	// 编辑
	Model.prototype.editBtnClick = function(event) {
		
		/*var masterID = this.comp("mainData").getCurrentRowID();
		var options = {
			action : "edit",
			masterID : masterID,
		};

		this.comp("windowDialog").open({
			data : options
		});*/
		this.gotoDetil('edit');
	};

	// 启用
	Model.prototype.trgStartUseClick = function(event) {
		
		try {
			var data = this.comp('mainData');
			var row = data.getCurrentRow();
			if (data.getValue("fUseStatus", row) == '1') {
				this.show("已经启用过!");
			} else {
				data.setValue("fUseStatus", '1', row);
				data.setValue("fUseStatusName", '启用', row);
				data.saveData();
			}
		} catch (e) {
			this.show("对不起,启用失败!");
		}
	};
	// 全部启用
	Model.prototype.trgAllUseClick = function(event) {
		try {
			var data = this.comp('mainData');
			data.eachAll(function(param) {
				var useFlag = param.row.val('fUseStatus');
				var row = param.row;
				if (useFlag == '2' || useFlag == '0') {
					data.setValue("fUseStatus", '1', row);
					data.setValue("fUseStatusName", '启用', row);
				}
			});
			data.saveData();
		} catch (e) {
			this.show("对不起,全部启用失败!");
		}
	};
	// 停用
	Model.prototype.trgStopUseClick = function(event) {
		try {
			var data = this.comp('mainData');
			var row = data.getCurrentRow();
			if (data.getValue("fUseStatus", row) == '2') {
				this.show("已经停用了!");
			} else {
				data.setValue("fUseStatus", '2', row);
				data.setValue("fUseStatusName", '停用', row);
				data.saveData();
			}
		} catch (e) {
			this.show("对不起,停用失败!");
		}
	};
	
	Model.prototype.show = function(msg) {
		justep.Util.hint(msg, {
			type : 'success',
			parent : this.getRootNode()
		});
	};

	return Model;
});