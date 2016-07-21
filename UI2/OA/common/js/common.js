define(function(require){
	var justep = require("$UI/system/lib/justep");
	var biz = require("$UI/system/lib/biz");

	//var KnowledgeInterface = require("$UI/OA/knowledge/js/knowledgeInterface");
	
	return {
		createNextSeqString : function(key,format,ctx){
			var returnValue = null;
			var params = new biz.Request.ActionParam();
			params.setString("key", key);
			params.setString("format", format);
			
			biz.Request.sendBizRequest({
				"context" : ctx,
				"action" : "createNextSeqStringAction",
				"parameters" : params, 
				"callback" : function(data) {
					    
					data.ignoreError = false;
					if (data.state) {
						returnValue = data.response;
					}else{
						   alert("添加文件关联失败");
					}
				}
			});
			
			
			return returnValue;
		},
		
		num2ChMoney : function(num) {
			var numberValue = new String(Math.round(num * 100)); // 数字金额
			var chineseValue = ""; // 转换后的汉字金额
			var String1 = "零壹贰叁肆伍陆柒捌玖"; // 汉字数字
			var String2 = "万仟佰拾亿仟佰拾万仟佰拾元角分"; // 对应单位
			var len = numberValue.length; // numberValue 的字符串长度
			var Ch1; // 数字的汉语读法
			var Ch2; // 数字位的汉字读法
			var nZero = 0; // 用来计算连续的零值的个数
			var String3; // 指定位置的数值
			if (len > 15) {
				alert("超出计算范围");
				return "";
			}
			if (numberValue == 0) {
				chineseValue = "零元整";
				return chineseValue;
			}
			String2 = String2.substr(String2.length - len, len); // 取出对应位数的STRING2的值
			for ( var i = 0; i < numberValue.length; i++) {
				String3 = parseInt(numberValue.substr(i, 1), 10); // 取出需转换的某一位的值
				// //alert(String3);
				if (i != (len - 3) && i != (len - 7) && i != (len - 11)
						&& i != (len - 15)) {
					if (String3 == 0) {
						Ch1 = "";
						Ch2 = "";
						nZero = nZero + 1;
					} else if (String3 != 0 && nZero != 0) {
						Ch1 = "零" + String1.substr(String3, 1);
						Ch2 = String2.substr(i, 1);
						nZero = 0;
					} else {
						Ch1 = String1.substr(String3, 1);
						Ch2 = String2.substr(i, 1);
						nZero = 0;
					}
				} else { // 该位是万亿，亿，万，元位等关键位
					if (String3 != 0 && nZero != 0) {
						Ch1 = "零" + String1.substr(String3, 1);
						Ch2 = String2.substr(i, 1);
						nZero = 0;
					} else if (String3 != 0 && nZero == 0) {
						Ch1 = String1.substr(String3, 1);
						Ch2 = String2.substr(i, 1);
						nZero = 0;
					} else if (String3 == 0 && nZero >= 3) {
						Ch1 = "";
						Ch2 = "";
						nZero = nZero + 1;
					} else {
						Ch1 = "";
						Ch2 = String2.substr(i, 1);
						nZero = nZero + 1;
					}
					if (i == (len - 11) || i == (len - 3)) { // 如果该位是亿位或元位，则必须写上
						Ch2 = String2.substr(i, 1);
					}
				}
				chineseValue = chineseValue + Ch1 + Ch2;
			}
			if (String3 == 0) { // 最后一位（分）为0时，加上“整”
				chineseValue = chineseValue + "整";
			}
			return chineseValue;
		},
		
		createTempNextSeqString : function(key, format) {
			var param = new justep.Request.ActionParam();
			param.setString("key", key);
			param.setString("format", format);

			var r = justep.Request.sendBizRequest(justep.Context.getCurrentProcess(),
					justep.Context.getCurrentActivity(),
					"createTempNextSeqStringAction", param);
			if (!justep.Request.isBizSuccess(r)) {
				throw new Error(justep.Request.getServerError(r, "编号生成失败"));
			}
			return justep.XML.getNodeText(r.responseXML, "/root/data/*");
		},
		xmlEncode : function(str) {
			if(str == undefined)
				str = "";
			str = str.replace(/&/g, "&amp;");
			str = str.replace(/</g, "&lt;");
			str = str.replace(/>/g, "&gt;");
			str = str.replace(/'/g, "&apos;");
			str = str.replace(/"/g, "&quot;");
			return str;
		},
		
		refreshDataByRowIds : function(data, rowIds, callback) {
		/*	if (typeof (data) == "string")
				data = justep.xbl(data);

			var rowIdArray = [];
			if (typeof (rowIds) == "string")
				rowIdArray = rowIds.split(',');
			else if (Object.prototype.toString.apply(rowIds) == "[object Array]")
				rowIdArray = rowIds;
			else {
				data.refreshData();
				return;
			}

			// 备份过滤条件
			var filterListBak = appCommon.DataUtils.copyDataFilterList(data);
			// 记录数据原位置
			var indexBak = {};
			for ( var i = 0; i < rowIdArray.length; i++) {
				var rowId = rowIdArray[i];
				indexBak[rowId] = data.getIndex(rowId);
			}

			// 构造过滤条件
			var rowIdFilter = data.getConceptAliasName() + " IN ('"
					+ rowIdArray.join("','") + "')";
			try {
				// 删除数据
				for ( var i = 0; i < rowIdArray.length; i++) {
					data.getStore().deleteRow(rowIdArray[i]);
				}
				// 修改过滤条件
				data.filters.clear();
				data.filters.setFilter("rowIdFilter", rowIdFilter);
				// 刷新数据
				data._doRefreshData(0, -1, true, callback);
				// 恢复数据位置
				for ( var i = 0; i < rowIdArray.length; i++) {
					var rowId = rowIdArray[i];
					if (indexBak[rowId] >= 0)
						data.getStore().moveRowPro(
								indexBak[rowId] - data.getIndex(rowId), rowId);
					data.setIndex(data.getIndex(rowId));
				}
			} finally {
				// 恢复过滤条件
				data.filters.clear();
				appCommon.DataUtils.setDataFilterList(data, filterListBak);
			}*/
		},
		
		/**
		 * 生成多选过滤条件
		 * 
		 * @field 过滤的字段
		 * @values 过滤的数值，字符串或字符串数组
		 * @split 分隔符，默认逗号分隔
		 */
		getMuiltSelectFilter : function(field, values, split) {
			return getInFilter(field, values, split);
		},
		
		getInFilter : function(field, values, split) {
			if (!split || split == "")
				split = ",";

			var valueArray = [];
			if (typeof (values) == "string")
				valueArray = values.split(split);
			else if (Object.prototype.toString.apply(values) == "[object Array]")
				valueArray = values;
			else
				throw new Error("无效的values");

			if (valueArray.length == 0)
				return "1 = 0";
			else
				return (field + " IN ('" + valueArray.join("','") + "')");
		},
		
		joinFilter : function(filter1, filter2, operator) {
			if (!operator)
				operator = "and";

			if (filter1 && filter2)
				return "(" + filter1 + ") " + operator + " (" + filter2 + ")";
			else
				return (filter1 ? filter1 : "") + (filter2 ? filter2 : "");
		},

		getBizConfig : function(fileFullName, process, activity,ctx) {
			if (!process)
				process = ctx.getCurrentProcess();
			if (!activity)
				activity = ctx.getCurrentActivity();
     
			var param = new biz.Request.ActionParam();
			param.setString("fileFullName", fileFullName);
            
			biz.Request.sendBizRequest({
				"context" : ctx,
				"action" : "getBizConfigAction",
				"parameters" : params, 
				"callback" : function(data) {
					    
					data.ignoreError = false;
					if (data.state) {
						returnValue = data.responseXML;
					}else{
						   alert("获取过程配置失败");
					}
				}
			});
			
		
			return justep.XML.eval(returnValue, "/root/data/*/*", "single");
		},
		
		getStringConfigItem : function(doc, nodePath,
				defaultValue) {
			return justep.XML.getNodeText(doc, nodePath, defaultValue);
		},
		
		getCurrentMembersURLFilter : function(ctx,urlField) {
			var filter = "";

			var psmFIDs = ctx.getAllPersonMemberFIDs();
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
						filter = this.joinFilter(filter, condition,
								"OR");
				}
			}
			return filter;
		},
		
		getMultiLikeFilter : function(fields, value, split) {
			;
			if (!split)
				split = ",";

			var fieldArray = [];
			if (typeof (fields) == "string")
				fieldArray = fields.split(split);
			else if (Object.prototype.toString.apply(fields) == "[object Array]")
				fieldArray = fields;
			else
				throw new Error("无效的fields");
			
			if(value == "" || value == undefined)
				return "";
			
			value = value.toUpperCase();
			
			var filter = "";
			for ( var i = 0; i < fieldArray.length; i++) {
				filter = appCommon.FilterUtils.joinFilter(filter, "UPPER("
						+ fieldArray[i] + ") LIKE '%" + value + "%'", "OR");
			}
			return filter;
		},
		
		removeArrEle : function(arr, index) {
			var result = [];
			for (var i = 0; i < arr.length; i++) {
				if (i != index) {
					result.push(arr[i]);
				}
			}
			return result;
		}
		
		
	}
});