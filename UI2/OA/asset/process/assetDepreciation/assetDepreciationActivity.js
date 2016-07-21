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
	
	var deprecitionData="", CardData="", year="", month="";
	Model.prototype.trgDepreciationClick = function(event){
	    debugger;
		deprecitionData = this.comp('mainData');
		CardData = this.comp('CardData');
		
	//	this.comp("filterDepreYear").searchText
		year = this.comp("filterDepreYear").searchText.get();
		month = this.comp("filterDepreMonth").searchText.get();
		
		if(year==""){
			if(month==""){
				alert("请输入折旧年度、月份!");
			}else{
				alert("请输入折旧年度!");
			}
		}else{
			if(month==""){
				alert("请输入折旧月份!");
			}else{
				this.refreshData();
				if(deprecitionData.getCount() > 0){
					if(confirm(year+"年"+month+"月份资产已折旧，是否需要重新计算折旧?")){
						this.insertDepreciation();
						var updateResult = this.updateDepreciation();
						if(updateResult==true){
							this.refreshData();
							alert("折旧计算完成！");
						}
					}
				}else{
					var insertResult = this.insertDepreciation();
					if(insertResult==true){
						this.refreshData();
						if(deprecitionData.getCount()>0){
							updateResult = this.updateDepreciation();
							if(updateResult==true){
								this.refreshData();
								alert("折旧计算完成！");
							}
						}
					}
				}

			}
		}
	};
	
	Model.prototype.refreshData=function(){
		var filter = "('integer:1' = 'integer:1')";
		if (year == "") {
			if(month == ""){
				alert("请输入折旧年度、月份!");		
			}else{
				alert("请输入折旧年度!");	
			}				
		} else if (year != "") {
			if (month == "") {
				filter = "fDepreYear='"+ year+"'";
			} else {
				filter = "fDepreYear='" + year + "' and fDepreMonth='" + month+"'";
			}
			deprecitionData.filters.setFilter("RMFilter", filter);
			deprecitionData.refreshData();
		}
	}
	
	Model.prototype.insertDepreciation = function(){
		var params = new biz.Request.ActionParam();//new justep.Request.ActionParam();
		params.setParam("year", year);
		params.setParam("month", month);
		
		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "insertDepreciationAction",
			parameters : params
		};
		var r=biz.Request.sendBizRequest(options);
		if (!biz.Request.sendBizRequest(options)) {
			throw new Error(biz.Request.getServerError(r, "插入资产折旧数据失败!"));
		}

		return true;
	}

	Model.prototype.updateDepreciation = function(){
		
		var params = new biz.Request.ActionParam();//new justep.Request.ActionParam();
		params.setParam("year", year);
		params.setParam("month", month);
		
		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "updateDepreciationAction",
			parameters : params
		};
		var r=biz.Request.sendBizRequest(options);
		if (!biz.Request.sendBizRequest(options)) {
			throw new Error(biz.Request.getServerError(r, "更新资产折旧数据失败!"));
		}

		return true;
	}

	return Model;
});