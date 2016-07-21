function setItemsInfo() {
	for (var i = 0; i < jsonAry.length; i++) {
		if (jsonAry[i].value != "") {
			if (jsonAry[i].type == 'talk') {
				var obj = document.getElementById(jsonAry[i].id);
				if (obj)
					obj.innerText = jsonAry[i].value;
			} else {
				var itemIDs = jsonAry[i].value.split(",");
				for (var j = 0; j < itemIDs.length; j++) {
					var obj = document.getElementById(itemIDs[j]);
					if (obj)
						obj.checked = "checked";
				}
			}
		}
	}
}

function saveSurvey() {
	var saveInfo = new justep.Request.MapParam();
	for (var i = 0; i < jsonAry.length; i++) {
		if (jsonAry[i].type == 'talk') {
			var obj = document.getElementById(jsonAry[i].id);
			if (obj) {
				if (obj.innerText != jsonAry[i].value) {
					jsonAry[i].value = obj.innerText;
					var text = obj.innerText.replace(/\\/g, "\\\\").replace(
							/\r/g, "\\r").replace(/\n/g, "\\n").replace(/\'/g,
							"\\'").replace(/\t/g, "\\t");
					// saveInfo.put(jsonAry[i].id, text);
					text = xmlEncode(text);
					saveInfo.put(jsonAry[i].id, new justep.Request.SimpleParam(
							text, justep.XML.Namespaces.XMLSCHEMA_STRING));
				}
			}
		} else if (jsonAry[i].type == 'signal') {
			var signalInfo = "";
			var obj = document.getElementsByName(jsonAry[i].question);
			if (obj)
				for (var j = 0; j < obj.length; j++) {
					if (obj.item(j).checked == true) {
						signalInfo = obj.item(j).id;
						break;
					}
				}
			if (signalInfo != jsonAry[i].value) {
				jsonAry[i].value = signalInfo;
				saveInfo.put(jsonAry[i].id, new justep.Request.SimpleParam(
						signalInfo, justep.XML.Namespaces.XMLSCHEMA_STRING));
			}
		} else if (jsonAry[i].type == 'mutilate') {
			var mutilateInfo = "";
			var obj = document.getElementsByName(jsonAry[i].question);
			if (obj)
				for (var j = 0; j < obj.length; j++) {
					if (obj.item(j).checked == true) {
						if (mutilateInfo == "") {
							mutilateInfo = obj.item(j).id;
						} else {
							mutilateInfo = mutilateInfo + "," + obj.item(j).id;
						}
					}
				}
			if (mutilateInfo != jsonAry[i].value) {
				jsonAry[i].value = mutilateInfo;
				saveInfo.put(jsonAry[i].id, new justep.Request.SimpleParam(
						mutilateInfo, justep.XML.Namespaces.XMLSCHEMA_STRING));
			}
		}
	}
	if (saveInfo.toString() != '<xbiz:map></xbiz:map>') {
		var param = new justep.Request.ActionParam();
		param.setMap("saveInfo", saveInfo);
		var r = justep.Request.sendBizRequest(
				"/OA/survey/process/surveyAnswer/surveyAnswerProcess",
				"surveyAnswerActivity", "saveSurvey", param);
		if (!justep.Request.isBizSuccess(r)) {
			throw new Error(justep.Request.getServerError(r, "保存失败!"));
		} else {
			alert('保存成功！');
		}
	}
}

function commitSurvey(taskID) {
	saveSurvey();
	var param = new justep.Request.ActionParam();
	param.setString("taskID", taskID);
	var r = justep.Request.sendBizRequest(
			"/OA/survey/process/surveyAnswer/surveyAnswerProcess",
			"surveyAnswerActivity", "commitSurvey", param);
	if (!justep.Request.isBizSuccess(r)) {
		throw new Error(justep.Request.getServerError(r, "提交失败!"));
	} else {
		window.location.replace(window.location.href);
		// window.location.reload();
		alert("提交成功！");
	}
}

function xmlEncode(str) {
	str = str.replace(/&/g, "&amp;");
	str = str.replace(/</g, "&lt;");
	str = str.replace(/>/g, "&gt;");
	str = str.replace(/'/g, "&apos;");
	str = str.replace(/"/g, "&quot;");
	return str;
}
