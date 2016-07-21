define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	
	var Model = function(){
		this.callParent();
	};
	
	var mainData="";
	Model.prototype.modelLoad = function(event){
		mainData=this.comp("mainData");
	};
	
	//新建类目
	Model.prototype.newBtnClick = function(event){
		var parent = mainData.getValue("fParentID");		
		if (parent == "undefined" || parent==undefined) {
			var options = {
				defaultValues : [ {
					fParentID : "_is_root_",
					fCategoryName : "新建类目",
					fCategoryURL : ""
				} ]
			};
			mainData.newData(options);
			mainData.setValue("fCategoryURL", mainData.getCurrentRowID());
		} else {
			var url = mainData.getValue("fCategoryURL");
			var parentID = mainData.getCurrentRowID();
			var options = {
				defaultValues : [ {
					fParentID : parentID,
					fCategoryName : "新建类目",
					fCategoryURL : ""
				} ]
			};
			mainData.newData(options);
			mainData.setValue("fCategoryURL", url+"/"+mainData.getCurrentRowID());			
		}
	};
	
	//启用
	Model.prototype.StartUseBtnClick = function(event){
		try {
			var data = this.comp('mainData');			
			data.setValue("fUseStatus", '1');
			data.setValue("fUseStatusName", '启用');
			data.saveData();
		} catch (e) {
			alert("对不起,启用失败!");
		}
	};
	
	//全部启用
	Model.prototype.AllUseBtnClick = function(event){
		try {
			var data = this.comp('mainData');

			data.each(function(param) {
				var row = param.row;
				var useFlag = data.getValue("fUseStatus", row);

				if (useFlag === '0' || useFlag === '') {
					data.setValue("fUseStatus", '1', row);
					data.setValue("fUseStatusName", '启用', row);
				}
			});
			data.saveData({
				"onSuccess" : function(event) {
					event.source.refreshData();
				}
			});
		} catch (e) {
			alert("对不起,全部启用失败!");
		}
	};
	
	//停用
	Model.prototype.StopUseBtnClick = function(event){
		try {
			var data = this.comp('mainData');
			var row = data.getCurrentRow();
			data.setValue("fUseStatus", '0',row);
			data.setValue("fUseStatusName", '未启用',row);
			data.setValue("fStopDate", justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT), row);
			data.saveData();
		} catch (e) {
			alert("对不起,停用失败!");
		}
	};
	
	//修复路径
	Model.prototype.trgRepairClick = function(event){
		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "repairCategroyURLNameAction",
			parameters : null
		};		
		var r=biz.Request.sendBizRequest(options);
		
		if (!biz.Request.sendBizRequest(options)) {
			throw new Error(biz.Request.getServerError(r, "类目URL赋值失败!"));
		} else {
			alert("修改类目路径成功！");
			return;
		}
	};

	//保存
	Model.prototype.mainDataSaveCommit = function(event){
		var params = new biz.Request.ActionParam();
		params.setParam("url", url);
		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "setCategroyURLAction",
			parameters : params
		};		
		var r=biz.Request.sendBizRequest(options);
		
		if (!biz.Request.sendBizRequest(options)) {
			throw new Error(biz.Request.getServerError(r, "类目URL赋值失败!"));
		} else {
			return;
		}	
	};
	
	//数据改变
	var url = "";
	var categroyValueChanging = false;
	Model.prototype.mainDataValueChanged = function(event){
		if (!categroyValueChanging) {
			categroyValueChanging = true;
			try {				
				var fOldCategoryName = "";
				var fOldCategoryURLName = "";
				var fCategoryURL = "";
				var fName = "";
				var rowid = "";
				if (event.col == "fCategoryName") {
					rowid = mainData.getCurrentRowID();
					fOldCategoryName = event.originalValue;
					fCategoryURL = mainData.getValue('fCategoryURL');
					var ids = fCategoryURL.split("/");
					for ( var i = 0; i < ids.length; i++) {
						if (ids[i]) {							
							mainData.to(ids[i]);
							var pFName = mainData.getValue('fCategoryName');
							fName += "/" + pFName;
						}
					}
					fOldCategoryURLName = fName.substring(0, fName.lastIndexOf("/")) + "/" + fOldCategoryName;
					if (url == "") {
						url = fCategoryURL;
					} else {
						url = url + ";" + fCategoryURL;
					}
				}
			} finally {
				categroyValueChanging = false;
			}
		}
	};

	return Model;
});