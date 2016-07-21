define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event){
		this.comp("mainData").newData();
		var signTime=event.data.data[0];
		var addr=event.data.data[1];
		$("[xid=fSignTime]").html(signTime)
		this.comp("mainData").setValue("fSignAddress",addr);
	};
	Model.prototype.mainDataAfterSave = function(event){
		this.owner.send({state : 1});
		this.owner.close();
	};

	Model.prototype.modelLoad = function(event){
		$("[xid=waitDiv]").hide();
		$("[xid=content3]").show();
	};

	return Model;
});