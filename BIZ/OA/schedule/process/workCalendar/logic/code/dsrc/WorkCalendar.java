import java.math.*;
import java.sql.*;
import java.util.*;

import org.dom4j.*;

import com.alibaba.fastjson.JSONObject;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.*;

public class WorkCalendar {


	public static JSONObject queryWorkCalendar(String strDate){
		Map<String, String> sysParams = (Map<String, String>) ContextHelper.getSysParams();
		String spersonID = sysParams.get("currentPersonID");
		JSONObject json = new JSONObject();
		
		Table resultTable = TableUtils.createTable(null, "fID","String","fApplyPsnName","String","fApplyType","String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "fID");
		
//		查询我发起的审批
		String creator_ksql = "SELECT s.* FROM SA_Task s WHERE s.sCreatorPersonID = '"+spersonID+"' and DateToString(dateTimeToDate(s.sCreateTime))='"+strDate+"'"
				+ " order by s.sCreateTime desc";
		
		Iterator<Row> creator_iterator = KSQL.select(creator_ksql, null, "/system/data", null).iterator();
		while (creator_iterator.hasNext()) {
			Row taskInfo = creator_iterator.next();
			getDataModel(resultTable, taskInfo, "creator", strDate);
		}
		
//		查询我审批过的
		String close_ksql = "SELECT s.* FROM SA_Task s WHERE s.sExecutorPersonID = '"+spersonID+"' AND s.sStatusID = 'tesFinished' "
					+ " order by s.sCreateTime desc";
		
		Iterator<Row> close_iterator = KSQL.select(close_ksql, null, "/system/data", null).iterator();
		while (close_iterator.hasNext()) {
			Row taskInfo = close_iterator.next();
			getDataModel(resultTable, taskInfo, "close", strDate);
		}
		json.put("approval", resultTable);
		return json;
	}
	
	
	private static Table getDataModel(Table resultTable, Row taskInfo, String strType, String strDate){
		String tableName = "";
		String DataModel = "";
		
		String sData1 = taskInfo.getString("sData1");
		String strProcess = taskInfo.getString("sProcess");
		
		String ksql = "" ;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fid", sData1);
		
		if(strProcess.equals("/OA/workTime/process/leave/leaveProcess")){
//			请假
			tableName = "OA_WM_LeaveApply";
			DataModel = "/OA/workTime/data";
			if (strType.equals("close")){
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o = :fid and DateToString(dateTimeToDate(o.fStartTime))<= '"+strDate+"' and DateToString(dateTimeToDate(o.fEndTime))>='"+strDate+"'" ;
			}else{
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o = :fid" ;
			}
			Iterator<Row> rows = KSQL.select(ksql, map, DataModel, null).iterator();
			if(rows.hasNext()){
				Row rowID = resultTable.getRow("fID", sData1);
				if(rowID==null || !rowID.getString("fID").equals(sData1)){
					Row appendRow = resultTable.appendRow();
					appendRow.setString("fID", sData1);
					appendRow.setString("fApplyPsnName", taskInfo.getString("sCreatorPersonName"));
					appendRow.setString("fApplyType", "请假");
					appendRow.setState(ModifyState.NONE);
				}
			}

		}else if (strProcess.equals("/OA/finance/process/financeLoanApply/financeLoanApplyProcess")){
//			借款
			tableName = "OA_FC_LoanApply";
			DataModel = "/OA/finance/data";
			if (strType.equals("close")){
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o = :fid and o.fLoanDate= '"+strDate+"'";
			}else{
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o = :fid" ;
			}
			Iterator<Row> rows = KSQL.select(ksql, map, DataModel, null).iterator();
			if(rows.hasNext()){
				Row rowID = resultTable.getRow("fID", sData1);
				if(rowID==null || !rowID.getString("fID").equals(sData1)){
					Row appendRow = resultTable.appendRow();
					appendRow.setString("fID", sData1);
					appendRow.setString("fApplyPsnName", taskInfo.getString("sCreatorPersonName"));
					appendRow.setString("fApplyType", "借款");
					appendRow.setState(ModifyState.NONE);
				}
			}

		}else if (strProcess.equals("/OA/meeting/process/boardroomUseApply/boardroomUseApplyProcess")){
//			会议室申请
			tableName = "OA_MT_UseApply";
			DataModel = "/OA/meeting/data";
			
			if (strType.equals("close")){
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o = :fid and DateToString(dateTimeToDate(o.fBeginTime))<= '"+strDate+"' and DateToString(dateTimeToDate(o.fEndTime))>='"+strDate+"'" ;
			}else{
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o = :fid" ;
			}
			Iterator<Row> rows = KSQL.select(ksql, map, DataModel, null).iterator();
			if(rows.hasNext()){
				Row rowID = resultTable.getRow("fID", sData1);
				if(rowID==null || !rowID.getString("fID").equals(sData1)){
					Row appendRow = resultTable.appendRow();
					appendRow.setString("fID", sData1);
					appendRow.setString("fApplyPsnName", taskInfo.getString("sCreatorPersonName"));
					appendRow.setString("fApplyType", "会议室申请");
					appendRow.setState(ModifyState.NONE);
				}
			}
		}else if (strProcess.equals("/OA/officeSupplyConsumables/process/officeSupplyUseApply/officeSupplyUseApplyProcess")){
//			物品领用
			tableName = "OA_OSC_UseApplyM";
			DataModel = "/OA/officeSupplyConsumables/data";
			if (strType.equals("close")){
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o = :fid and o.fDemandDate= '"+strDate+"'";
			}else{
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o = :fid" ;
			}
			Iterator<Row> rows = KSQL.select(ksql, map, DataModel, null).iterator();
			if(rows.hasNext()){
				Row rowID = resultTable.getRow("fID", sData1);
				if(rowID==null || !rowID.getString("fID").equals(sData1)){
					Row appendRow = resultTable.appendRow();
					appendRow.setString("fID", sData1);
					appendRow.setString("fApplyPsnName", taskInfo.getString("sCreatorPersonName"));
					appendRow.setString("fApplyType", "物品领用");
					appendRow.setState(ModifyState.NONE);
				}
			}
		}else if (strProcess.equals("/OA/signature/process/signatureApplyQuery/signatureApplyQueryProcess")){
//			印章
			tableName = "OA_SL_Signature";
			DataModel = "/OA/signature/data";
			if (strType.equals("close")){
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o = :fid and DateToString(dateTimeToDate(o.fUseDate))= '"+strDate+"'";
			}else{
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o = :fid" ;
			}
			Iterator<Row> rows = KSQL.select(ksql, map, DataModel, null).iterator();
			if(rows.hasNext()){
				Row rowID = resultTable.getRow("fID", sData1);
				if(rowID==null || !rowID.getString("fID").equals(sData1)){
					Row appendRow = resultTable.appendRow();
					appendRow.setString("fID", sData1);
					appendRow.setString("fApplyPsnName", taskInfo.getString("sCreatorPersonName"));
					appendRow.setString("fApplyType", "印章申请");
					appendRow.setState(ModifyState.NONE);
				}
			}
		}else if (strProcess.equals("/OA/workTime/process/evection/evectionProcess")){
//			出差
			tableName = "OA_WM_OtherApply";
			DataModel = "/OA/workTime/data";
			if (strType.equals("close")){
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o.fID = '"+sData1+"' and o.FSTARTTIME<= '"+strDate+"' and o.FENDTIME>='"+strDate+"'" ;
			}else{
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o.fID = '"+sData1+"'" ;
			}
			Map<String, String> sql = new HashMap<String, String>();
			sql.put(DatabaseProduct.DEFAULT.toString(), ksql);
			Iterator<Row> rows = SQL.select(sql, null, DataModel).iterator();
			if(rows.hasNext()){
				Row rowID = resultTable.getRow("fID", sData1);
				if(rowID==null || !rowID.getString("fID").equals(sData1)){
					Row appendRow = resultTable.appendRow();
					appendRow.setString("fID", sData1);
					appendRow.setString("fApplyPsnName", taskInfo.getString("sCreatorPersonName"));
					appendRow.setString("fApplyType", "出差");
					appendRow.setState(ModifyState.NONE);
				}
			}
		}else if (strProcess.equals("/OA/workTime/process/outApply/outApplyProcess")){
//			外出
			tableName = "OA_WM_outApply";
			DataModel = "/OA/workTime/data";
			if (strType.equals("close")){
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o.fID = '"+sData1+"' and date_format(o.fStartTime,'%Y-%m-%d')<= str_to_date('"+strDate+"','%Y-%m-%d') and date_format(o.fEndTime,'%Y-%m-%d')>=str_to_date('"+strDate+"','%Y-%m-%d')" ;
			}else{
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o.fID = '"+sData1+"'" ;
			}
			Map<String, String> sql = new HashMap<String, String>();
			sql.put(DatabaseProduct.DEFAULT.toString(), ksql);
			Iterator<Row> rows = SQL.select(sql, null, DataModel).iterator();
			if(rows.hasNext()){
				Row rowID = resultTable.getRow("fID", sData1);
				if(rowID==null || !rowID.getString("fID").equals(sData1)){
					Row appendRow = resultTable.appendRow();
					appendRow.setString("fID", sData1);
					appendRow.setString("fApplyPsnName", taskInfo.getString("sCreatorPersonName"));
					appendRow.setString("fApplyType", "外出");
					appendRow.setState(ModifyState.NONE);
				}
			}
		}else if (strProcess.equals("/OA/finance/process/financeReimbrseApply/financeReimbrseApplyProcess")){
//			报销
			tableName = "OA_FC_ReimbApplyM";
			DataModel = "/OA/finance/data";
			if (strType.equals("close")){
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o = :fid and o.fLoanDate= '"+strDate+"'";
			}else{
				ksql = "SELECT o.* FROM "+tableName+" o WHERE o = :fid" ;
			}
			Iterator<Row> rows = KSQL.select(ksql, map, DataModel, null).iterator();
			
			if(rows.hasNext()){
				Row rowID = resultTable.getRow("fID", sData1);
				if(rowID==null || !rowID.getString("fID").equals(sData1)){
					Row appendRow = resultTable.appendRow();
					appendRow.setString("fID", sData1);
					appendRow.setString("fApplyPsnName", taskInfo.getString("sCreatorPersonName"));
					appendRow.setString("fApplyType", "报销");
					appendRow.setState(ModifyState.NONE);
				}
			}
		}
		return resultTable;
	}
	

	public static JSONObject querySignPerson(String strDate){
		Map<String, String> sysParams = (Map<String, String>) ContextHelper.getSysParams();
		String strDeptName = sysParams.get("currentDeptName");
		JSONObject json = new JSONObject();
		
		Table resultTable = TableUtils.createTable(null, "fID","String","fPersonName","String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "fID");
		
		String ksql = "SELECT s as fID,s.fPersonName FROM OA_Sign s WHERE s.fDeptName = '"+strDeptName+"' and DateToString(dateTimeToDate(s.fSignTime))='"+strDate+"'"
				+ " order by s.fSignTime desc";
		
		Iterator<Row> iterator = KSQL.select(ksql, null, "/OA/sign/data", null).iterator();
		while (iterator.hasNext()) {
			Row row = iterator.next();
			String strPersonName = row.getString("fPersonName");
			Row rowPsn = resultTable.getRow("fPersonName", strPersonName);
			if(rowPsn!=null && rowPsn.getString("fPersonName").equals(strPersonName)){
				continue;
			} else {
				Row appendRow = resultTable.appendRow();
				appendRow.setString("fID", row.getString("fID"));
				appendRow.setString("fPersonName", strPersonName);
				appendRow.setState(ModifyState.NONE);
			}
		}
		
		json.put("sign", resultTable);
		return json;
	}
	
	
	
}