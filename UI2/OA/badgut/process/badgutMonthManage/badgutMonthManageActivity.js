define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.bSearchClick = function(event) {

		if (confirm("此操作将关闭当前月度预算执行，自动转到下个月度预算周期，是否进行结算？")) {
			var dTemp = this.comp("dTemp");
			var year = dTemp.getValue("tempYear");
			var month = dTemp.getValue("tempMonth");
			if (month >= 12) {
				month = 1;
				year = year - (-1);

			} else {
				month = month - (-1);
			}

			var params = new biz.Request.ActionParam();
			params.setParam("aYear", year.toString());
			params.setParam("aMonth", month.toString());
			var ctx = this.getContext();

			var options = {
				context : ctx,
				process : ctx.getCurrentProcess(),
				activity : ctx.getCurrentActivity(),
				action : "setConfig",
				parameters : params
			};
			if (!biz.Request.sendBizRequest(options)) {
				throw new Error(biz.Request.getServerError(options, "设置当前预算月份失败!"));
			} else {
				dTemp.setValue("tempYear", year);
				dTemp.setValue("tempMonth", month);
			}
			this.refreshData(year, month);
		}

	};

	// 涮新数据
	Model.prototype.refreshData = function(aYear, aMonth) {

		var sqlReport = "select a.FCOSTCENTERCODE, a.FCOSTCENTERNAME,a.FACCOUNTCODE,a.FACCOUNTNAME,a.FPLAN, a.FFACT, a.FYEAR,case when a.FPLAN = 0 then 0 else ((a.FFACT/a.FPLAN)*100) end AS FRATE from "
				+ "(SELECT BM.fCostCenterCode AS FCOSTCENTERCODE, BM.fCostCenterName AS FCOSTCENTERNAME,BD.fAccountCode AS FACCOUNTCODE,BD.fAccountName AS FACCOUNTNAME,BD.fPlan"
				+ aMonth
				+ " AS FPLAN, BD.fFact"
				+ aMonth
				+ " AS FFACT, BD.fYear"
				+ aMonth
				+ " AS FYEAR"
				+ " FROM OA_BG_BadgutM BM"
				+ " JOIN OA_BG_BadgutD BD ON BM = BD.fBGBadgutID WHERE BM.fYear = '"
				+ aYear
				+ "') a ";
		this.comp('dReport').setKSQL(sqlReport);
		this.comp('report').refresh();
	}

	// 加载数据
	Model.prototype.modelLoad = function(event) {
		var dTemp = this.comp("dTemp");
		var params = new biz.Request.ActionParam();
		var ctx = this.getContext();
		var resultList = "";
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "getConfig",
			parameters : params,
			callback : function(data) {// 参数有返回值的
				if (data.state) {
					resultList = data.response;
				} else {
					biz.Request.getServerError(data, "获取当前预算月份失败！");
				}
			}
		};
		if (!biz.Request.sendBizRequest(options)) {
			throw new Error(biz.Request.getServerError(options, "获取当前预算月份失败!"));
		} else {
			// justep.Request.transform(justep.Request.getData(r.responseXML)).split("-");
			var list = resultList;
			dTemp.setValue("tempYear", list.split("-")[0]);
			dTemp.setValue("tempMonth", list.split("-")[1]);
		}
		this.refreshData(list.split("-")[0], list.split("-")[1]);

	};

	return Model;
});
