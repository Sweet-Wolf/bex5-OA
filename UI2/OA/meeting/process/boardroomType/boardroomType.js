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

	Model.prototype.mainDataValueChanged = function(event) {
		var psnID = this.getContext().getCurrentPersonID();
		var psnName = this.getContext().getCurrentPersonName();
		var time = justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT);
		var data = this.getDataComp();
		data.setValue("fUpdatePsnID", psnID);
		data.setValue("fUpdatePsnName", psnName);
		data.setValue("fUpdateTime", time);
	};

	Model.prototype.getDataComp = function() {
		return this.comp("mainData");
	}

	Model.prototype.btnStartUseClick = function(event) {
		var data = this.getDataComp();
		var row = data.getCurrentRow();
		try {
			data.setValue("fUseStatus", '1', row);
			data.setValue("fUseStatusName", '启用', row);
			data.saveData({
				"onSuccess" : function(event) {
					event.source.refreshData();
				}
			});
		} catch (e) {
			justep.Util.hint("对不起,启用失败！", {
				type : 'danger',
				parant : this.getRootNode()
			});
		}
	};

	Model.prototype.btnAllUseClick = function(event) {
		var data = this.getDataComp();
		try {
			data.each(function(param) {
				var row = param.row;
				var useFlag = data.getValue("fUseStatus", row);
//				if (useFlag === '0' || useFlag === '') {
					data.setValue("fUseStatus", '1', row);
					data.setValue("fUseStatusName", '启用', row);
//				}
			});
			data.saveData({
				"onSuccess" : function(event) {
					event.source.refreshData();
				}
			});
		} catch (e) {
			justep.Util.hint("对不起,全部启用失败！", {
				type : 'danger',
				parant : this.getRootNode()
			});
		}
	};

	Model.prototype.btnStopUseClick = function(event) {
		var data = this.getDataComp();
		var row = data.getCurrentRow();
		try {
			data.setValue("fUseStatus", '2', row);
			data.setValue("fUseStatusName", '停用', row);
			data.saveData({
				"onSuccess" : function(event) {
					event.source.refreshData();
				}
			});
		} catch (e) {
			justep.Util.hint("对不起,停用失败！", {
				type : 'danger',
				parant : this.getRootNode()
			});
		}
	};

	Model.prototype.newBtnClick = function(event){
		var data = this.getDataComp();
		data.newData();
		data.first();
	};

	return Model;
});