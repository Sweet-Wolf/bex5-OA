define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
		this.aDList = [];
	};

	Model.prototype.modelLoad = function(event) {
		this.setCurrentTime();
	};

	Model.prototype.setCurrentTime = function() {
		var tempData = this.comp("tempData");
		tempData.setValue('fDate0', new Date());
		tempData.setValue('fWeekOrMonthCode', 'week');
		tempData.setValue('fWeekOrMonthName', '按周查看');
	};

	Model.prototype.tempDataValueChanged = function(event) {
		var colName = event.col;
		var colValue = event.value;
		if (colName === 'fDate0') {
			var flag = event.row.val('fWeekOrMonth');
			flag = flag ? flag : 'week';
			this.refreshData(flag);
		} else if (colName === 'fWeekOrMonth') {
			this.comp("showData").refreshData();
			this.checkWayChange(colValue);
		}
	};

	Model.prototype.refreshData = function(flag) {
		this.setDate(flag);
		this.drawTable(flag);
		this.putData();
	}

	Model.prototype.drawTable = function(flag) {
		this.clearRow();
		this.addRow(flag);
	};

	Model.prototype.clearRow = function() {
		$(".oa .table .tbody").empty();
	};

	Model.prototype.addRow = function(flag) {
		if (flag === 'week') {
			var $tbody = $(".oa .table .tbody");
			if ($tbody) {
				var personData = this.comp("personData");
				var self = this;
				personData.each(function(param) {
					var row = param.row;
					var $row = document.createElement('tr');
					var cell0 = document.createElement('td');
					var fExecutorName = row.val('fExecutorName');
					cell0.innerHTML = fExecutorName;
					$row.appendChild(cell0);
					for ( var i = 0; i < 7; i++) {
						var cell = document.createElement('td');
						cell.setAttribute('id', row.val('fExecutorID') + '_' + self.aDList[i]);
						cell.innerHTML = ''
						$row.appendChild(cell);
					}
					$tbody[0].appendChild($row);
				});
			}
		} else {
			this.addRowOfMonth();
		}
	};

	Model.prototype.putData = function() {
		var tempData = this.comp("tempData");
		var flag = tempData.getValue('fWeekOrMonthCode') || 'week';
		var $tbody = $(".oa .table .tbody");
		if ($tbody) {
			var showData = this.comp("showData");
			var showData = this.comp("showData");
			var tempData = this.comp("tempData");
			var self = this;
			showData.each(function(param) {
				var row = param.row;
				var fExecutorID = row.val('fExecutorID');
				var fStartDate = row.val('fDate');
				var fEndTime = row.val('fEndTime');
				var fTitle = row.val('fTitle');
				var fExecutorName = row.val('fExecutorName');
				var fBeginTimePart = row.val('fBeginTimePart');
				var fEndTimePart = row.val('fEndTimePart');
				var minDate = self.getmin_max_date()['minDate'];
				var maxDate = self.getmin_max_date()['maxDate'];
				if (fEndTime.getTime() > justep.Date.fromString(maxDate, 'yyyy-MM-dd').getTime()) {
					fEndTime = maxDate;
				}
				if (fStartDate.getTime() < justep.Date.fromString(minDate, 'yyyy-MM-dd').getTime()) {
					fStartDate = minDate;
				}
				fEndTime = justep.Date.fromString(fEndTime, 'yyyy-MM-dd');
				fStartDate = justep.Date.fromString(fStartDate, 'yyyy-MM-dd');
				if (fEndTime >= fStartDate) {
					var dateCount = justep.Date.diff(fStartDate, fEndTime);
					var fid = row.val('fExecutorID') + '_' + justep.Date.toString(fStartDate, 'yyyy-MM-dd');
					var tdEle = document.getElementById(fid);

					var title = tdEle.innerHTML;
					if (title === '&nbsp;') {
						title = '';
					}
					title = title ? (title + '\r') : title;
					title = title + '[' + fBeginTimePart + '-' + fEndTimePart + ']' + fTitle;
					tdEle.innerHTML = title;
					tdEle.setAttribute('colspan', dateCount + 1);
					tdEle.style.backgroundColor = "rgb(000,241,244)";
					tdEle.setAttribute("align", 'center')
					if (dateCount > 0) {
						// 删除多余的td
						var $rootEle = $('#' + fid);
						var $delEle = '';
						for ( var i = 0; i < dateCount; i++) {
							$delEle = $rootEle.next();
							$delEle.remove();
						}
					}
				}
			});
		}
	};

	Model.prototype.getmin_max_date = function() {
		var tempData = this.comp("tempData");
		var flag = tempData.getValue('fWeekOrMonthCode') || 'week';
		var minDate, maxDate;
		if (flag === 'week') {
			minDate = tempData.getValue('fDate1');
			maxDate = tempData.getValue('fDate2');
		} else {
			var date = tempData.getValue("fDate0");
			var months;
			var dateAry = date.split("-");
			var year = dateAry[0];
			var month = dateAry[1];
			var d = new Date(year, month, 0);
			var dayNumber = d.getDate();
			if (month <= 9) {
				months = "0" + month;
			} else {
				months = month;
			}
			maxDate = year + "-" + months + "-" + dayNumber;
			minDate = year + "-" + months + "-" + "01";
		}
		return {
			'minDate' : minDate,
			'maxDate' : maxDate
		};
	};

	Model.prototype.addRowOfMonth = function() {
		$(".oa .table .thead").empty();
		var date = this.comp("tempData").getValue('fDate0');
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var d = new Date(year, month, 0);
		var dayNumber = d.getDate();
		var dayS = null;
		var monthS = null;
		var monthAndDay = null;
		var dateArray = [ dayNumber ];
		var daeeArrayOfTH = [ dayNumber ];
		var yearMonthDay = null;
		for ( var i = 1; i <= dayNumber; i++) {
			if (i <= 9) {
				dayS = "0" + i.toString();
			} else {
				dayS = i.toString();
			}
			if (month <= 9) {
				monthS = "0" + month.toString();
			} else {
				monthS = month.toString();
			}
			monthAndDay = monthS + "月" + dayS + "日";
			yearMonthDay = year.toString() + "-" + monthS + "-" + dayS;
			daeeArrayOfTH[i - 1] = monthAndDay;
			dateArray[i - 1] = yearMonthDay;
		}
		$thead = $(".oa .table .thead");
		var row1 = document.createElement("tr");
		row1.id = "trShow";
		var th = document.createElement("th");
		th.innerHTML = "姓名";
		th.setAttribute("className", "th_tl");
		th.style.border = "black dotted";
		th.style.borderWidth = "0px 1px 1px 0px";
		row1.appendChild(th);
		for ( var i = 0; i < dayNumber; i++) {
			var th = document.createElement("td");
			th.innerHTML = daeeArrayOfTH[i];
			th.setAttribute("className", "t_br");
			row1.appendChild(th);
		}
		$thead[0].appendChild(row1);
		var $tbody = $(".oa .table .tbody");
		if ($tbody) {
			var personData = this.comp("personData");
			var self = this;
			personData.each(function(param) {
				var row = param.row;
				var $row = document.createElement('tr');
				var cell0 = document.createElement('td');
				var fExecutorName = row.val('fExecutorName');
				cell0.innerHTML = fExecutorName;
				$row.appendChild(cell0);
				for ( var i = 0; i < dayNumber; i++) {
					var cell = document.createElement('td');
					cell.setAttribute('id', row.val('fExecutorID') + '_' + dateArray[i]);
					cell.innerHTML = ''
					$row.appendChild(cell);
				}
				$tbody[0].appendChild($row);
			});
		}
	};

	Model.prototype.setDate = function(flag) {
		var tempData = this.comp("tempData");
		flag = flag || tempData.getValue('fWeekOrMonthCode');
		var fDate0 = tempData.getValue('fDate0');
		fDate0 = justep.Date.fromString(fDate0, 'yyyy-MM-dd');
		var aYear = fDate0.getFullYear();
		var currentDay = fDate0.getDay();
		if (currentDay === 0) {
			currentDay = 7;
		}
		var mondayTime = fDate0.getTime() - (currentDay - 1) * 24 * 60 * 60 * 1000;
		var sundayTime = fDate0.getTime() + (7 - currentDay) * 24 * 60 * 60 * 1000;
		var mondayDate = justep.Date.toString(new Date(mondayTime), 'yyyy-MM-dd');
		var sundayDate = justep.Date.toString(new Date(sundayTime), 'yyyy-MM-dd');
		var iWeekNum = this.getWeekNumber(fDate0);
		var dateAry = fDate0.toString().split("-");
		if (flag === 'week') {
			tempData.setValue('fDate1', mondayDate);
			tempData.setValue('fDate2', sundayDate);
			tempData.setValue('fYear', aYear);
			tempData.setValue('fWeekNum', iWeekNum);
			for (i = 0; i < 7; i++) {
				var tempDate;
				var newDate = new Date(mondayTime + (24 * 60 * 60 * 1000 * i));
				var tempDate = newDate;
				this.aDList[i] = justep.Date.toString(newDate, "yyyy-MM-dd");
				var sTemp = "week" + (i + 1);
				var ss = (tempDate.getMonth() + 1) + '月' + (tempDate.getDate()) + '日';
				document.getElementById(sTemp).innerHTML = ss + " " + this.aWList(i);
//				this.getElementByXid(sTemp).innerHTML = ss + " " + this.aWList(i);
			}
		} else {
			var date = tempData.getValue("fDate0");
			tempData.setValue('fDate0', date);
			var dateAry = date.toString().split("-");
			var year = dateAry[0];
			var month = dateAry[1];
			var d = new Date(year, month, 0);
			var dayNumber = d.getDate();
			tempData.setValue('fDate1', dateAry[0] + "-" + dateAry[1] + "-" + "01");
			tempData.setValue('fDate2', dateAry[0] + "-" + dateAry[1] + "-" + dayNumber);
			tempData.setValue('fYear', dateAry[0]);
			tempData.setValue('fWeekNum', iWeekNum);
		}
	};

	Model.prototype.checkWayChange = function(fWeekOrMonth) {
		if (fWeekOrMonth === 'month') {
			this.refreshData('month');
		} else if (fWeekOrMonth === 'week') {
			$thead = $(".oa .table .thead");
			$thead.empty();
			var row = document.createElement("tr");
			var name = document.createElement("th");
			name.innerHTML = '姓名';
			name.id = 'week0';
			row.appendChild(name);
			for ( var i = 1; i <= 7; i++) {
				var th = document.createElement("th");
				th.id = 'week' + i;
				if (i == 1) {
					th.innerHTML = '星期一';
				}
				if (i == 2) {
					th.innerHTML = '星期二';
				}
				if (i == 3) {
					th.innerHTML = '星期三';
				}
				if (i == 4) {
					th.innerHTML = '星期四';
				}
				if (i == 5) {
					th.innerHTML = '星期五';
				}
				if (i == 6) {
					th.innerHTML = '星期六';
				}
				if (i == 7) {
					th.innerHTML = '星期日';
				}
				row.appendChild(th);
			}
			$thead[0].appendChild(row);
			this.refreshData('week');
		}
	};

	/**
	 * 计算出某个日期属于这一年的第几周
	 */
	Model.prototype.getWeekNumber = function(d1) {
		var beginDate = new Date(d1.getFullYear(), 0, 1); // 今年第一天
		var n = beginDate.getDay(); // 今年第一天星期几
		var dayCount = Math.ceil((d1 - beginDate) / (24 * 60 * 60 * 1000));// 今年第几天
		if (n != 0) {
			var m = parseInt("0654321".charAt(n));
			weekNo = Math.ceil((dayCount - m) / 7) + 1;
		} else {
			weekNo = Math.ceil(dayCount / 7);
		}
		return weekNo;
	};

	Model.prototype.aWList = function(i) {
		var weekList = [ '<br /> 一', '<br /> 二', '<br /> 三', '<br /> 四', '<br /> 五', '<br /> 六', '<br /> 日' ];
		return weekList[i];
	};

	return Model;
});