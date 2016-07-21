define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.deleteEspecialPerson = function(event){
		var rows = this.comp("especialPersonList").getSelection() || this.comp("especialPersonData").getCurrentRow();
		this.comp("especialPersonData").deleteData(rows);
	};

	Model.prototype.addEspecialPerson = function(event){
		this.comp("selectPersonDlg").open();
	};

	Model.prototype.selectPersonDlgReceive = function(event){
		var rows = event.data;
		var especialPersonData = this.comp("especialPersonData");
		var defaultValues = [];
		$.each(rows,function(i,row){
			var personID = row.val('sPersonID');
			var executorName = row.val('sName');
			var returnRows = especialPersonData.find(['fExecutorID'], [personID], true, true, true, true);
			if(returnRows.length === 0){
				defaultValues.push({'fExecutorID' : personID,'fExecutorName' : executorName});
			}
		});
		if(defaultValues.length > 0)
		especialPersonData.newData({defaultValues : defaultValues});
	};

	Model.prototype.especialPersonDataSaveCommit = function(event){
		justep.Util.hint('保存数据成功', {type:'success',parent:this.getRootNode()});
	};

	return Model;
});