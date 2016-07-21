define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var common = require("$UI/OA/common/js/common");
	var biz = require("$UI/system/lib/biz");
	var Model = function() {
		this.callParent();
		this.dlgOperator = "";
		this.BoardroomID = "";
		this.dlgTitle = "会议室信息";

		this.dlgArrangeOperator = "";
		this.arrangeID = "";
		this.dlgArrangeTitle = "会议室安排";
	};

	Model.prototype.dataTables1CellRender = function(event) {
		if (event.colName == 'fEffect') {
			event.html = event.colVal == '0' ? '已取消' : '已安排';
		}
		
		if (event.colName == 'fBoardroom') {
			event.html = "<a  href='#' class='toDetail'>"+event.colVal+"</a>";
		}
		
	};

	Model.prototype.modelLoad = function(event) {
		this.setRefreshFilter()
	};

	Model.prototype.setRefreshFilter = function() {
		var dFilter = this.comp("dFilter");
		var mainData = this.comp("dList");
		var roomID = dFilter.getValue("roomIDs");
		var status = dFilter.getValue("status");
		var keyword = dFilter.getValue("keyword");
		var filter = common.getMultiLikeFilter("fMeetName", keyword, ",");

		if (roomID != "" && roomID != null && roomID != undefined) {
			var idFilter = common.getMuiltSelectFilter("fBoardroomID", roomID, ",");
			mainData.setFilter("roomFilter", idFilter);
		}
		if (status == "0")
			mainData.setFilter("effectFilter", "fEffect=0");
		else if (status == "1")
			mainData.setFilter("effectFilter", "fEffect=1");
		mainData.setFilter("likeFilter", filter);
		mainData.refreshData();
	}

	Model.prototype.btnArrangeClick = function(event) {
		this.arrangeID = "";
		this.dlgArrangeOperator = "new";
		var params = {
			"operator" : this.dlgArrangeOperator,
			"arrangeID" : this.arrangeID,
			"title" : this.dlgArrangeTitle,
			'boardRoom' : this.comp("dList").getCurrentRow(),
		};
		this.comp("dlgArrangeInfo").open({data:params});
	};

	Model.prototype.dlgArrangeInfoReceive = function(event) {
		this.comp('dList').refreshData();
	};

	Model.prototype.btnRearrangeClick = function(event) {
		this.arrangeID = this.comp("dList").getCurrentRowID();
		this.dlgArrangeOperator = "view";
		var params = {
			"operator" : this.dlgArrangeOperator,
			"arrangeID" : this.arrangeID,
			"title" : this.dlgArrangeTitle
		};
		this.comp("dlgArrangeInfo").open({data:params});
		//this.comp("dlgArrangeInfo").open(params);
	};

	Model.prototype.btnCancelClick = function(event) {
	   ;
		var fEffect = this.comp("dList").getValue("fEffect");
		if (fEffect == 0 || fEffect == '0') {
			alert("该会议室尚未安排!");
			justep.Util.hint("该会议室尚未安排！", {
				parent : this.getRootNode(),
				type : 'warning'
			});
			return false;
		}
		this.comp("dList").setValue("fEffect", 0);
		this.comp("dList").saveData();
		var rt = this.callDeleteScheduleByBiz();
		if (rt != null && rt != undefined)
			justep.Util.hint("取消成功！", {
				parent : this.getRootNode(),
				type : 'success'
			});
	};

	Model.prototype.callDeleteScheduleByBiz = function() {
		var options = {};
		var action = "deleteScheduleByBizAction";
		var param = new biz.Request.ActionParam();
		param.setString('fBizID', this.comp("dList").getCurrentRowID());
		param.setString('fBizType', "会议安排");
		options.context = this.getContext();
		options.action = 'deleteScheduleByBizAction';
		options.parameters = param;
		var r = biz.Request.sendBizRequest(options).responseJSON;
		if (!biz.Request.isBizSuccess(r)) {
			throw new Error(biz.Request.getServerError(r, "删除日程失败"));
		}
		return r;
	}

	Model.prototype.btnSearchClick = function(event) {
	
		var fID = this.comp("dList").getValue("fBoardroomID");
		var process = this.getContext().getProcess();
		var activity = this.getContext().getActivity();
		var url = new justep.URL(require.toUrl('$UI/OA/meeting/process/boardroomArrangeQuery/boardroomArrangeQuery.w'));
		url.setParam({'process' : process});
		url.setParam({'activity' : activity});
		url.setParam({'roomID' : fID});
//		var url = require.toUrl("$UI/OA/meeting/process/boardroomArrangeQuery/boardroomArrangeQuery.w?process=" 
//		+ process + "&activity="+ activity + "&roomID=" + fID);
		justep.Portal.openWindow(url.toString());
	};

	Model.prototype.mainTablesRowClick = function(event){
		var domButton = $(event.domEvent.target);//获取点击的元素
        if(domButton.hasClass("toDetail")){
        	  this.openDetail(event.rowID);
         }
	};
    
    Model.prototype.openDetail = function(id){
		var mainData = this.comp("dList");
	    var row = mainData.getRowByID(id);
		
		var roomID = row.val("fBoardroomID");
		var ctx = this.getContext();
        
    	var process = ctx.getCurrentProcess();
    	var activity = ctx.getCurrentActivity();
    	var operator = "view";
    	var url = "$UI/OA/meeting/process/boardroomDetail/boardroomDetail.w?process="
    		+ process +"&activity=" + activity + "&operator=" + operator + "&id=" + roomID;
    	justep.Portal.openWindow(url,{title:"会议室信息"});
	}
	
	return Model;
});