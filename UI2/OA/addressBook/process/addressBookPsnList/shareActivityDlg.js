define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.result = function(){
		//这里实现返回的逻辑
	};

	Model.prototype.OKBtnClick = function(event){
		this.comp('wReceiver').windowEnsure(this.result());
	};

	Model.prototype.addExecutorsClick = function(event){
		this.comp('orgDlgSingleDept').open();
	};

	Model.prototype.orgDlgSingleDeptReceive = function(event){
		var rows = event.data;
		var subMain = this.comp("subMain");
		var defaultValues = [];
		var sharedPsnID = subMain.getValue('fSharedPsnID');
		$.each(rows,function(i,row){
			if(sharedPsnID !== row.getID())
			defaultValues.push({'fSharedPsnID' : row.getID(),'fSharedPsnName':row.val('sName'),'fSharedPsnFID':row.val('sFID'),'fSharedPsnFName' : row.val('sFName')});
		});
		if(defaultValues.length >0)
		subMain.newData({defaultValues:defaultValues});
	};

	return Model;
});