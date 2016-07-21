define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.saveCommit = function(event){
		justep.Util.hint("保存成功！", {type: 'success', parent: this.getRootNode()});
	};
	
	var mainData="";
	Model.prototype.modelLoad = function(event){
		mainData=this.comp("mainData");
	};
	
	//新增
	Model.prototype.newBtnClick = function(event){
		var url = require.toUrl("$UI/OA/survey/process/surveySend/detailActivity.w?process=/OA/survey/process/surveySend/surveySendProcess&activity=surveySendActivity&type=new&data=" + mainData.getCurrentRowID());
		justep.Portal.openWindow(url, {title: "问卷调查发布"});
	};
	
	//详细
	Model.prototype.dataTables1RowDblClick = function(event){
		var url = require.toUrl("$UI/OA/survey/process/surveySend/detailActivity.w?process=/OA/survey/process/surveySend/surveySendProcess&activity=surveySendActivity&type=edit&data=" + mainData.getCurrentRowID());
		justep.Portal.openWindow(url, {title: "问卷调查发布详细"});
	};
	
	//复制问卷
	Model.prototype.copyBtnClick = function(event){
		var mainData=this.comp("mainData");
		var paperID = mainData.getCurrentRowID();
		if (paperID != "") {		
			var code="";
			var params = new biz.Request.ActionParam();
			params.setParam("paperID", paperID);
			var ctx = this.getContext();
			var options = {
				context : ctx,
				process : ctx.getCurrentProcess(),
				activity : ctx.getCurrentActivity(),
				action : "copyPaperAction",
				parameters : params
			};		
			var r=biz.Request.sendBizRequest(options);
			if (!r) {
				throw new Error(biz.Request.getServerError(r, "复制问卷失败!"));
			}			
			mainData.refreshData();
		} else {
			alert("请选择要复制的问卷信息！");
		}
	};

	

	

	

	return Model;
});