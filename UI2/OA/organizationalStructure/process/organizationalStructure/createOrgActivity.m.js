define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
		this.states = 1;
	};

	Model.prototype.delBtnClick = function(event) {
		if (this.states == 1) {
			$("[xid=delSpan]").text("编辑");
			if(!$("[xid=checkbox]").hasClass('hide')){
				$("[xid=checkbox]").addClass('hide');
			}
			this.states = 2;
		} else {
			$("[xid=delSpan]").text("删除组织");
			$("[xid=checkbox]").removeClass('hide');
			//这里可以进行删除组织的操作------------------------------------------------------------------
			
			
			this.states = 1;
		}
	};

	Model.prototype.modelLoad = function(event){
		$("[xid=delSpan]").text("编辑");
	};

//	Model.prototype.tree2CustomLoadChildren = function(event){
//		console.log(this.comp("createOrgData"));
//	};

	Model.prototype.createOrgDataDataChange = function(event){
		this.comp("createOrgData").each(function(param){
			console.log(param.row.val('SORGKINDID'));
			if(param.row.val('SORGKINDID')=='ogn'){
				$("[xid=classImage]").attr("src","$UI/OA/organizationalStructure/process/organizationalStructure/orgKind/ogn.gif");   
			}else if(param.row.val('SORGKINDID')=='dpt'){
				$("[xid=classImage]").attr("src","$UI/OA/organizationalStructure/process/organizationalStructure/orgKind/dpt.gif");   
			}else if(param.row.val('SORGKINDID')=='ops'){
				$("[xid=classImage]").attr("src","orgKind/ops.gif");   
			}else{
				$("[xid=classImage]").attr("src","orgKind/psm.gif");   
			}
		});
		if(this.comp("createOrgData").each){}
	};

	return Model;
});