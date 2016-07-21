define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var biz = require('$UI/system/lib/biz');

	var Model = {
		/**
		 * 生成当前操作员所有人员成员的URL过滤条件
		 * 
		 * @urlField string
		 */
		getCurrentMembersURLFilter : function(me,urlField) {
		
			var filter = "";
			var psmFIDs = me.getContext().getAllPersonMemberFIDs();
			for ( var i = 0; i < psmFIDs.length; i++) {
				var psmFID = psmFIDs[i];
				var psmFIDSplit = psmFID.split("/");

				var psmFIDPart = "";
				for ( var j = 0; j < psmFIDSplit.length; j++) {
					var splitID = psmFIDSplit[j];
					if (splitID == "")
						continue;

					if (psmFIDPart == "") {
						psmFIDPart = "/" + splitID;
					} else {
						psmFIDPart = psmFIDPart + "/" + splitID;
					}

					var condition = "(" + urlField + " = '" + psmFIDPart + "')";
					if (filter.indexOf(condition) < 0)
						filter = this.joinFilter(filter, condition, "OR");
				}
				return filter;
			}
			return filter;
		},
		/**
		 * 联合过滤条件
		 */
		joinFilter : function(filter1, filter2, operator) {
			if (!operator)
				operator = "and";
		
			if (filter1 && filter2)
				return "(" + filter1 + ") " + operator + " (" + filter2 + ")";
			else
				return (filter1 ? filter1 : "") + (filter2 ? filter2 : "");
		}
	};
	return Model;
});