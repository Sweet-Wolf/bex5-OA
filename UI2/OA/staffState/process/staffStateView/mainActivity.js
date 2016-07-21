define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	var eXcell_ro = function(){
		this.callParent();
	};
	
	var mygrid = null;
	Model.prototype.modelLoad = function(event){
		// xforms.Calendar.show(xfinput, xforms.Calendar.ONLY_DATE);
		// 扩展dhtmlxgrid能力
		// 第一列改为红色，后面列根据数值修改成不同颜色
		
		
		eXcell_ro.prototype.setValue = function(val) {
	
			debugger;
			if (val != "") {
				if (this.cell.sourceIndex == 1) {
					// sourceIndex 原来我要修改第二列的颜色，但是第一列为了调整行高，加料4个元素 ，所以为6
				} else if (this.cell.sourceIndex == 7 || this.cell.sourceIndex == 8) {
					this.setBgColor('#b3daff');
				} else {
					this.setBgColor('yellow');
				}
			}
	
			this.cell.val = val;
			if (val && typeof (val) != "number") {
				val = val.replace(/\&/gm, "&amp;").replace(/\>/gm, "&gt").replace(/\</gm, "&lt;");
			}
			if ((typeof (val) != "number")
					&& (!val || val.toString()._dhx_trim() == "")) {
				val = "&nbsp;";
				this.cell._clearCell = true;
			} else
				this.cell._clearCell = false;
	
			var grid = this.grid.getGlobalGrid();
			if (grid.bindColFormats) {
				var colId = this.grid.getColumnId(this.cell._cellIndex);
				val = grid.formatBindValue(colId, val);
			}
	
			if (val.indexOf('_justep_') != -1) {
	
				var stateList = val.split('_justep_');
				val = "";
				this.cell.honverValue = "";
				for ( var part = 0; part < stateList.length; part++) {
					if (stateList[part].indexOf('|') != -1) {
						var cellValue = stateList[part].split('|')[0];
						var cellHonver1 = stateList[part].split('|')[1];
						var a = cellHonver1.split("_lt_");
						var cTime = "";
						if (a.length > 1) {
							cTime = a[0];
							cellHonver = a[1];
						} else {
							cellHonver = a[0];
						}
	
						// if(!(cellHonver=="没有填写原因")){
						if (this.cell.honverValue == "") {
							this.cell.honverValue += "----------------";
						}
						if (cTime != "") {
							this.cell.honverValue = this.cell.honverValue ? this.cell.honverValue
									+ "<br/>"
									+ cellValue+cTime
									+ "事由:"
									+ "<br/>" + cellHonver
									: cellValue + cellHonver;
						} else {
							this.cell.honverValue = this.cell.honverValue ? this.cell.honverValue
									+ "<br/>"
									+ cellValue
									+ "事由:"
									+ "<br/>"
									+ cellHonver
									: cellValue + cellHonver;
						}
	
						val += cellValue + "<br/>";
					}
	
				}
				$(this.cell).hover(
						function() {
							$(this).append(
									$("<span style='display:none'>" + $(this).attr("honverValue") + "</span>"));
						}, function() {	
							$(this).find("span:last").remove();
						});
			}
	
			if (this.cell.sourceIndex == 1) {
				this.setCValue(val);
				$(this.cell).prepend("<b></b><br/>");
				$(this.cell).append("<br/><b>--</b>");
			} else {
				this.setCValue(val);
			}
			// append 必须在setCValue之后才生效
	
		};
		var currentDate = justep.Date.toString(new Date(), justep.Date.STANDART_FORMAT);//xforms.I8N.format(new Date(), "yyyy-MM-dd");
		this.comp('queryDateData').setValue('dateArg', currentDate);
	
		var personName = this.getContext().getRequestParameter('personName');//justep.Request.URLParams.personName;
		this.comp('queryDateData').setValue('personName', personName);
		//alert(personName);
		var orgName = this.getContext().getRequestParameter('orgName');//justep.Request.URLParams.orgName;
		this.comp('queryDateData').setValue('orgName', orgName);
	};
	
	
	Model.prototype.staffStateQuery = function(event){
		var queryData=this.comp('queryDateData');
		debugger;
		/**
		 * 获取要查询的日期
		 */
		// var dateRangValue=justep.xbl('input3').getValue();
		var dateRangValue = queryData.getValue('dateArg');
		if (!dateRangValue && !date) {
			return;
		} else if (!dateRangValue && date) {
			dateRangValue = date;
		}
		var begin = justep.Date.toString(dateRangValue, justep.Date.STANDART_FORMAT);//justep.Date.fromString(dateRangValue, 'yyyy-MM-dd');
		if (begin.getDay() == 0) {
			begin = justep.Date.decrease(begin, 6, 'd');
		} else {
			begin = justep.Date.decrease(begin, begin.getDay() - 1, 'd');
		}
		var end = justep.Date.increase(begin, 1, 'w');
		
		var searchPersonName = queryData.getValue('personName');
		var searchOrgName = queryData.getValue('orgName');
		/**
		 * 获取调用Action返回的对象
		 */
		/*var param = new justep.Request.ActionParam();
		param.setString('begin', begin);
		param.setString('end', end);
		param.setString('searchPersonName', searchPersonName);
		param.setString('searchOrgName', searchOrgName);
	
		var process = justep.Context.getCurrentProcess();
		var activity = justep.Context.getCurrentActivity();
	
		var r = justep.Request.sendBizRequest(process, activity,
				'staffStateQueryAction', param, null, null, true);
*/
		var code="";
		var params = new biz.Request.ActionParam();
		params.setParam("begin", begin);
		params.setParam("end", end);
		params.setParam("searchPersonName", searchPersonName);
		params.setParam("searchOrgName", searchOrgName);
		var ctx = this.getContext();
		var options = {
			context : ctx,
			process : ctx.getCurrentProcess(),
			activity : ctx.getCurrentActivity(),
			action : "staffStateQueryAction",
			parameters : params
		};		
		var r=biz.Request.sendBizRequest(options);
		/*
		if (!justep.Request.isBizSuccess(r)) {
			throw new Error(justep.Request.getServerError(r, "查询人员状态信息失败!"));
		} else {
*/
		if (!biz.Request.sendBizRequest(options)) {
			throw new Error(biz.Request.getServerError(r, "查询人员状态信息失败!"));
		} else {
			mygrid = new dhtmlXGridObject('gridbox');
			
			mygrid.imgURL = "/UIServer/3.14156d32a5c9a5d9548e985e68847da95ffbd/form/dhtmlx/dhtmlxGrid/imgs/";
			// 修改展示逻辑后header不从后台java中取 ，利用前台js拼写了
			var header = "#rspan,#rspan,#rspan,#rspan,";
			var header = "#rspan,#rspan,#rspan,";
			for ( var index = 0; index < 7; index++) {
				var dayInWeek = xforms.I8N.format(justep.Date.increase(begin,
						index, 'd'), "yyyy-MM-dd");
	
				switch (index + 1) {
				case 7:
					header += "(" + dayInWeek + "),";
					break;
				case 1:
					header += "(" + dayInWeek + "),";
					break;
				case 2:
					header += "(" + dayInWeek + "),";
					break;
				case 3:
					header += "(" + dayInWeek + "),";
					break;
				case 4:
					header += "(" + dayInWeek + "),";
					break;
				case 5:
					header += "(" + dayInWeek + "),";
					break;
				case 6:
					header += "(" + dayInWeek + "),";
					break;
				}
			}
	        debugger;
			//mygrid.setHeader("序号,排序,组织路径,姓名,星期一,星期二,星期三,星期四,星期五,星期六,星期日,");
			mygrid.setHeader("序号,组织路径,姓名,星期一,星期二,星期三,星期四,星期五,星期六,星期日,");
			mygrid.attachHeader(header);
	    
			mygrid.setInitWidths("30,*,*,*,*,*,*,*,*,*,*");
			mygrid.setColAlign("center,center,center,center,center,center,center,center,center,center");
			mygrid.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro,ro");
			mygrid.setColSorting("int,str");
			mygrid.setSkin("justep");
			
			// mygrid.setSkin("light");
			// mygrid.setSkin("kdb");
			mygrid.enableRowsHover(true, 'grid_hover');
			// mygrid.enableAutoSizeSaving();
			mygrid.enableMultiline(true);
			mygrid.init();
	
	
			// 装载数据
			//var rows = justep.Request.transform(justep.Request.getData(r.responseXML));
			var rows = justep.XML.eval(r.responseXML, "//rows")[0].xml;
	
			//var rows = "<rows title='排序,组织路径,姓名,星期一,星期二,星期三,星期四,星期五,星期六,星期日,'><row><cell>1</cell><cell>/002</cell><cell>集团总公司</cell><cell>起步OA</cell><cell/><cell/><cell/><cell/><cell/><cell/><cell/></row></rows>";
	
	
			
			mygrid.loadXMLString(rows);
			mygrid.sortRows(0, "int", "asc");
			mygrid.enableLightMouseNavigation(true);
	     
	       // mygrid.setColumnHidden(1, true);
			//mygrid.setColumnHidden(11, true);
	
			mygrid.enableSmartRendering(true);
			
			// addContextMenu();
			// mygrid.enableHeaderMenu();
		}
	};
	
	Model.prototype.input1Change = function(event){
		this.staffStateQuery();
	};
	
	Model.prototype.personNameChange = function(event){
		var dateArg = this.comp('queryDateData').getValue('dateArg');
		var personName = this.comp('queryDateData').getValue('personName');		
		this.staffStateQuery();
	};
	
	Model.prototype.orgNameChange = function(event){
		this.staffStateQuery();
	};

    Model.prototype.dateArgChange = function(event){

	};

	Model.prototype.personNameChange = function(event){

	};

	Model.prototype.orgNameChange = function(event){

	};
	return Model;
});


define(function(require){
	var $ = require("jquery");
	var Model = function(){
		this.callParent();
	};
	Model.prototype.modelLoad = function(event){

	};

	return Model;
});
