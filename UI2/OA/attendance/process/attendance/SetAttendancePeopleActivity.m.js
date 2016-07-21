define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var util = require("$UI/system/lib/base/util");

	var Model = function(){
		this.callParent();
		this.setPeopleID=[] //负责人ID
		this.setPeopleName=[]  //负责人
		this.joinPeopleID=[] //参与人ID
		this.joinPeopleName=[] //参与人
		this.rowID = justep.Bind.observable();
		this.openID = "";
	};
	
	Array.prototype.indexOf = function(val) {
		for (var i = 0; i < this.length; i++) {
		if (this[i] == val) return i;
		}
		return -1;
	};
	
	Model.prototype.AttendancePersonClick = function(event){
		var self = this;
		var personID = this.comp("AttendanceAdminData").getValueByID("fAttendancePersonID", this.params.rowID).split(",");
		this.comp("AttendanceOrgDialog").open({"data":{
				selected : {
					kind : "sPersonID",
					value :self.openID? self.openID.split(",") : personID
				}
		}});
	};

	Model.prototype.AttendanceOrgDialogReceive = function(event){
		var self = this;
		this.joinPeopleID=[]
		this.joinPeopleName=[];
		var personArr = event.data;
		for(var i = 0 ; i<personArr.length ; i++){
			this.joinPeopleName.push(personArr[i].val("sName"));
			this.joinPeopleID.push(personArr[i].val("sPersonID"))
		}
		var result;
		var id = this.joinPeopleID.join(",");
		var ctx = this.getContext();
		var params = new biz.Request.ActionParam();this.params.rowID
		params.setParam("rowID",self.params.rowID)
		params.setParam('person', id);
		biz.Request.sendBizRequest({
			contentType : 'application/json',
			dataType : "json",
			"context" : ctx,
			"action" : "queryPersonAction",
			"parameters" : params,
			"callback" : function(data) {
				if (data.state) {
					var resultData = data.response["person"];
					if (resultData) {
						result = resultData.rows;
					}
				}
			}
		});
		
		var resultArr=[]
		if (result.length > 0) {
			var message = "";
			var adminData = this.comp("AttendanceAdminData");
			result.length==1 && (message=result[0].fPersonName.value) 
			result.length>1 && (message=result[0].fPersonName.value+"等"+result.length+"人"); 
			this.comp("replaceDialog").show({
				message :  message + "已在别的考勤组，是否移到此考勤组",
				callback : function(o) {
					if (o.button == "ok") {
						var row,nameValue,IDvalue;
						for(var i=0;i<result.length;i++){
							row = adminData.getRowByID(result[i].userdata.id.value);
							nameValue =adminData.getValue("fAttendancePersonName", row)
							IDvalue = adminData.getValue("fAttendancePersonID", row)
							if(IDvalue.indexOf(result[i].fPersonID.value) != 0){
								IDvalue=IDvalue.replace(","+result[i].fPersonID.value,"");
								adminData.setValue("fAttendancePersonID", IDvalue, row);
								nameValue=nameValue.replace(","+result[i].fPersonName.value,"");
								adminData.setValue("fAttendancePersonName", nameValue, row);
							}else{
								IDvalue=IDvalue.replace(result[i].fPersonID.value+"," ,"");
								adminData.setValue("fAttendancePersonID", IDvalue, row);
								self.openID=IDvalue;
								nameValue=nameValue.replace(result[i].fPersonName.value+",","");
								adminData.setValue("fAttendancePersonName", nameValue, row);
							}
						}
					}else if(o.button=="cancel"){
						for(var i=0;i<result.length;i++){
							var index =self.joinPeopleID.indexOf(result[i].fPersonID.value)
							if(index != -1){
								self.joinPeopleID.splice(index,1);
								self.joinPeopleName.splice(index,1);
								self.comp("AttendancePerson").val(self.joinPeopleID.length + "人")
							}
						}
					}
				}
			})
		}
		
		this.comp("AttendancePerson").val(this.joinPeopleName.length+"人")
	};

	Model.prototype.attendanceResponsiblePersonClick = function(event){
		var setPersonID = this.comp("AttendanceAdminData").getValueByID("fAttendanceTeamManagerID", this.params.rowID).split(",");
		if(this.comp("fAttendanceGroupNameInput").val()){
			this.comp("ManagersOrgDialog").open({"data":{
				selected : {
					kind : "sPersonID",
					value : setPersonID
				}
			}});
		}else{
			justep.Util.hint("请先填写考勤组名称！");
		}
		
	};

	Model.prototype.ManagersOrgDialogReceive = function(event){
		var arr = event.data;//返回的负责人信息
		this.setPeopleID=[]
		this.setPeopleName=[]
		for(var i=0;i<arr.length;i++){
			this.setPeopleID.push(arr[i].val("sPersonID"))
			this.setPeopleName.push(arr[i].val("sName"))
		}
		this.comp("attendanceResponsiblePerson").val(this.setPeopleID.length+"人")
	};

	Model.prototype.saveBtnClick = function(event){
		var data = this.comp("AttendanceAdminData");
		
		var name = this.comp("fAttendanceGroupNameInput").val();
		
		var setPeople = this.setPeopleName.join(",");
		var setPeopleID = this.setPeopleID.join(",");
		var joinPeople = this.joinPeopleName.join(",");
		var joinPeopleID = this.joinPeopleID.join(",");
		if(name){
			data.setValueByID("fAttendanceGroupName",name,this.rowID.get());
		}else{
			justep.Util.hint("请填写考勤组名称");
		}
		setPeople && data.setValueByID("fAttendanceTeamManager",setPeople,this.rowID.get());
		setPeopleID && data.setValueByID("fAttendanceTeamManagerID",setPeopleID,this.rowID.get());
		joinPeople && data.setValueByID("fAttendancePersonName",joinPeople,this.rowID.get());
		joinPeopleID && data.setValueByID("fAttendancePersonID",joinPeopleID,this.rowID.get());
		
		data.saveData();
		this.owner.close();
	};


	Model.prototype.modelParamsReceive = function(event){
		this.rowID.set(this.params.rowID);
		var rows = this.comp("AttendanceAdminData").find(["OA_AttendanceAdmin"],[this.params.rowID]);
		if(rows.length){
			var name = rows[0].val("fAttendanceGroupName");
			var  radio = rows[0].val("fAttendanceClass") == 1?"固定班制":"阶段考勤班制";
			var setPeople = rows[0].val("fAttendanceTeamManager").split(",").length + "人";
			var joinPeople = rows[0].val("fAttendancePersonName").split(",").length + "人";
		}
		if(radio = "固定班制"){
			$("[xid=div8]").html("<h4>固定班制(考勤时间都一样)</h4>")
		}else{
			$("[xid=div8]").html("<h4>阶段考勤班制(考勤时间不一样)</h4>")
		}
		this.comp("AttendancePerson").val(joinPeople)
		this.comp("attendanceResponsiblePerson").val(setPeople)
		this.comp("fAttendanceGroupNameInput").val(name)
	};


	return Model;
});