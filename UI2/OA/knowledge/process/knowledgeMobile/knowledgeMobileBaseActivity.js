define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!$UI/OA/config/pub").load();
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.addBtnClick = function(event){
		//
	};

//	Model.prototype.backBtnClick = function(event){
//		justep.Portal.closeWindow();
//	};

	Model.prototype.smartFilterFilter = function(event){
  //
		var str = event.source.searchText.get();
		this.comp('numData').setValue("findStr",str);
	};
    
    //获得list中的记录数
	Model.prototype.showlistCount = function() {
	 
		var readNO = this.comp('readlist').getBindingObjects().length;
		var noReadNO = this.comp('noReadList').getBindingObjects().length;
		
		
		this.comp('numData').setValue('readNum', readNO);
		this.comp('numData').setValue('noreadNum', noReadNO);
		
	};
	
	Model.prototype.modelLoad = function(event){
		this.showlistCount();
	};
	
	//显示详细
	Model.prototype.listClick = function(event){
	//	this.openTaskStatus = "open";
	    //debugger;
	    
		this.comp('detailDialog').open({data : {data : this.comp('KnowledgeNoRead').getValue('OA_KM_Knowledge')}});
	};
	
	//每个list的filter属性里面都调用这个方法，实现前端过滤，用搜索框中的内容过滤任务标题和任务内容
	Model.prototype.dataFilter = function(event){
		if(this.comp('numData').val('findStr')== undefined){
			return true;
		}else if(this.comp('numData').val('findStr')==''){
			return true;
		}else{
			return (event.val('fTitle').indexOf(this.comp('numData').val('findStr')) >= 0) || (event.val('fReleasePsnName').indexOf(this.comp('numData').val('findStr')) >= 0);
		}
	};
	
	
	Model.prototype.readlistClick = function(event){
		this.comp('detailDialog').open({data : {data : this.comp('KnowledgeRead').getValue('OA_KM_Knowledge')}});
	};
	
	
	Model.prototype.detailDialogClose = function(event){
		this.comp("KnowledgeNoRead").refreshData();
		this.comp("KnowledgeRead").refreshData();
	};
	
	
	Model.prototype.backBtnClick = function(event){
		this.owner.close();
	};
	
	
	return Model;
});