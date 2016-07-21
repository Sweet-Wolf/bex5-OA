import java.math.*;
import java.sql.*;
import java.util.*;

import org.dom4j.*;

import com.alibaba.fastjson.JSONObject;
import com.justep.oa.SysUtils;
import com.justep.system.data.*;

public class WorkLog {


	public static JSONObject queryOA_WorkLog(String strDate){
		JSONObject json = new JSONObject();
		
		String fPersonID = SysUtils.getCurrentPersonID();
		String fReleaseScope = SysUtils.getCurrentPersonName();
		
		Table resultTable = TableUtils.createTable(null, "fID","String","PersonName","String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "fID");
		String ksql1 = "select distinct OA_WorkDaily.fPersonName \n" +
					 "   from OA_WorkDaily OA_WorkDaily \n" +
					 "   where OA_WorkDaily.fDate = '"+strDate+"' AND ( OA_WorkDaily.fPersonID = '"+fPersonID+"' OR instr(OA_WorkDaily.fReleaseScope, '"+fReleaseScope+"') >= 1 )";
		
		String ksql2 = "select distinct OA_WorkWeekly.fPersonName \n" +
				 "   from OA_WorkWeekly OA_WorkWeekly \n" +
				 "   where OA_WorkWeekly.fDate = '"+strDate+"' AND ( OA_WorkWeekly.fPersonID = '"+fPersonID+"' OR instr(OA_WorkWeekly.fReleaseScope, '"+fReleaseScope+"') >= 1 )";

		String ksql3 = "select distinct OA_Workmonthly.fPersonName \n" +
				 "   from OA_Workmonthly OA_Workmonthly \n" +
				 "   where OA_Workmonthly.fDate = '"+strDate+"' AND ( OA_Workmonthly.fPersonID = '"+fPersonID+"' OR instr(OA_Workmonthly.fReleaseScope, '"+fReleaseScope+"') >= 1 )";
	
		Table table1 =  KSQL.select(ksql1, null, "/OA/workLog/data", null);
		Table table2 =  KSQL.select(ksql2, null, "/OA/workLog/data", null);
		Table table3 =  KSQL.select(ksql3, null, "/OA/workLog/data", null);
		
		Iterator<Row> iterator1 = table1.iterator();
		Iterator<Row> iterator2 = table2.iterator();
		Iterator<Row> iterator3 = table3.iterator();
		
		int rowID = 0;
		while(iterator1.hasNext()) {
			Row info = iterator1.next();
			String strPresonName = info.getString("fPersonName");
			Row rowPsn = resultTable.getRow("PersonName", strPresonName);
			if(rowPsn==null || !rowPsn.getString("PersonName").equals(strPresonName)){
				Row appendRow = resultTable.appendRow();
				appendRow.setString("fID",""+rowID++);
				appendRow.setString("PersonName",info.getString("fPersonName"));
				appendRow.setState(ModifyState.NONE);
			}
		}
		while (iterator2.hasNext()) {
			Row info = iterator2.next();
			String strPresonName = info.getString("fPersonName");
			Row rowPsn = resultTable.getRow("PersonName", strPresonName);
			if(rowPsn==null || !rowPsn.getString("PersonName").equals(strPresonName)){
				Row appendRow = resultTable.appendRow();
				appendRow.setString("fID",""+rowID++);
				appendRow.setString("PersonName",info.getString("fPersonName"));
				appendRow.setState(ModifyState.NONE);
			}
		}
		while (iterator3.hasNext()) {
			Row info = iterator3.next();
			String strPresonName = info.getString("fPersonName");
			Row rowPsn = resultTable.getRow("PersonName", strPresonName);
			if(rowPsn==null || !rowPsn.getString("PersonName").equals(strPresonName)){
				Row appendRow = resultTable.appendRow();
				appendRow.setString("fID",""+rowID++);
				appendRow.setString("PersonName",info.getString("fPersonName"));
				appendRow.setState(ModifyState.NONE);
			}
			
		}
		json.put("PersonName", resultTable);
//		System.out.println(json);
		return json;
	}

	public static JSONObject queryOA_WorkDailyScope(String strStartDate,String strEndDate){
		JSONObject json = new JSONObject();
		
		String fPersonID = SysUtils.getCurrentPersonID();
		String fReleaseScope = SysUtils.getCurrentPersonName();
		
		String strWhere = "";
		if(strStartDate!=null && !strStartDate.equals("") && strEndDate!=null && !strEndDate.equals("")){
			strWhere = "		and OA_WorkDaily.fCreateTime>='"+strStartDate+"' and OA_WorkDaily.fCreateTime<='"+strEndDate+"' \n" ;
		}
		Table resultTable = TableUtils.createTable(null, "fID","String","fPersonName","String","fCreateTime","DateTime",
				"fFinishWork","String","fWorkPlan","String","fNeedHelp","String","fRemark","String","fImgURL","String");
		
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "fID");
		
		String ksql = "select distinct OA_WorkDaily.* \n" +
					 "   from OA_WorkDaily OA_WorkDaily \n" +
					 "   where (OA_WorkDaily.fPersonID = '"+fPersonID+"' OR instr(OA_WorkDaily.fReleaseScope, '"+fReleaseScope+"') >= 1 ) \n" +
					 strWhere +
					 "   order by OA_WorkDaily.fCreateTime desc";
		
	
		Table table =  KSQL.select(ksql, null, "/OA/workLog/data", null);
		Iterator<Row> iterator = table.iterator();
		while(iterator.hasNext()) {
			Row appendRow = resultTable.appendRow();
			Row info = iterator.next();
			appendRow.setString("fID",info.getString("OA_WorkDaily"));
			appendRow.setString("fPersonName",info.getString("fPersonName"));
			appendRow.setDateTime("fCreateTime",info.getDateTime("fCreateTime"));
			appendRow.setString("fFinishWork",info.getString("fFinishWork"));
			appendRow.setString("fWorkPlan",info.getString("fWorkPlan"));
			appendRow.setString("fNeedHelp",info.getString("fNeedHelp"));
			appendRow.setString("fRemark",info.getString("fRemark"));
			appendRow.setString("fImgURL",info.getString("fImgURL"));
			appendRow.setState(ModifyState.NONE);
		}
		json.put("workDailyData", resultTable);
//		System.out.println(json);
		return json;
	}

	public static JSONObject queryOA_WorkWeeklyScope(String strStartDate,String strEndDate){
		JSONObject json = new JSONObject();
		
		String fPersonID = SysUtils.getCurrentPersonID();
		String fReleaseScope = SysUtils.getCurrentPersonName();
		Table resultTable = TableUtils.createTable(null, "fID","String","fPersonName","String","fCreateTime","DateTime",
				"fFinishWork","String","fWorkSummary","String","fWorkPlan","String","fNeedHelp","String","fRemark","String","fImgURL","String");
		
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "fID");
		
		String strWhere = "";
		if(strStartDate!=null && !strStartDate.equals("") && strEndDate!=null && !strEndDate.equals("")){
			strWhere = "	   and OA_WorkWeekly.fCreateTime>='"+strStartDate+"' and OA_WorkWeekly.fCreateTime<='"+strEndDate+"' \n";
		}
		
		String ksql = "select distinct OA_WorkWeekly.* \n" +
					 "   from OA_WorkWeekly OA_WorkWeekly \n" +
					 "   where (OA_WorkWeekly.fPersonID = '"+fPersonID+"' OR instr(OA_WorkWeekly.fReleaseScope, '"+fReleaseScope+"') >= 1) \n" +
					 strWhere +
					 "   order by OA_WorkWeekly.fCreateTime desc";
		
	
		Table table =  KSQL.select(ksql, null, "/OA/workLog/data", null);
		Iterator<Row> iterator = table.iterator();
		while(iterator.hasNext()) {
			Row appendRow = resultTable.appendRow();
			Row info = iterator.next();
			appendRow.setString("fID",info.getString("OA_WorkWeekly"));
			appendRow.setString("fPersonName",info.getString("fPersonName"));
			appendRow.setDateTime("fCreateTime",info.getDateTime("fCreateTime"));
			appendRow.setString("fFinishWork",info.getString("fFinishWork"));
			appendRow.setString("fWorkSummary",info.getString("fWorkSummary"));
			appendRow.setString("fWorkPlan",info.getString("fWorkPlan"));
			appendRow.setString("fNeedHelp",info.getString("fNeedHelp"));
			appendRow.setString("fRemark",info.getString("fRemark"));
			appendRow.setString("fImgURL",info.getString("fImgURL"));
			appendRow.setState(ModifyState.NONE);
		}
		json.put("workWeeklyData", resultTable);
//		System.out.println(json);
		return json;
	}

	public static JSONObject queryOA_WorkmonthlyScope(String strStartDate,String strEndDate){
		JSONObject json = new JSONObject();
		
		String fPersonID = SysUtils.getCurrentPersonID();
		String fReleaseScope = SysUtils.getCurrentPersonName();
		
		Table resultTable = TableUtils.createTable(null, "fID","String","fPersonName","String","fCreateTime","DateTime",
				"fFinishWork","String","fWorkSummary","String","fWorkPlan","String","fNeedHelp","String","fRemark","String","fImgURL","String");
		
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "fID");
		
		String strWhere = "";
		if(strStartDate!=null && !strStartDate.equals("") && strEndDate!=null && !strEndDate.equals("")){
			strWhere = "		and OA_Workmonthly.fCreateTime>='"+strStartDate+"' and OA_Workmonthly.fCreateTime<='"+strEndDate+"' \n" ;
		}
		
		String ksql = "select distinct OA_Workmonthly.* \n" +
					 "   from OA_Workmonthly OA_Workmonthly \n" +
					 "   where (OA_Workmonthly.fPersonID = '"+fPersonID+"' OR instr(OA_Workmonthly.fReleaseScope, '"+fReleaseScope+"') >= 1 )\n" +
					 strWhere +
					 "   order by OA_Workmonthly.fCreateTime desc";
		
	
		Table table =  KSQL.select(ksql, null, "/OA/workLog/data", null);
		Iterator<Row> iterator = table.iterator();
		while(iterator.hasNext()) {
			Row appendRow = resultTable.appendRow();
			Row info = iterator.next();
			appendRow.setString("fID",info.getString("OA_Workmonthly"));
			appendRow.setString("fPersonName",info.getString("fPersonName"));
			appendRow.setDateTime("fCreateTime",info.getDateTime("fCreateTime"));
			appendRow.setString("fFinishWork",info.getString("fFinishWork"));
			appendRow.setString("fWorkSummary",info.getString("fWorkSummary"));
			appendRow.setString("fWorkPlan",info.getString("fWorkPlan"));
			appendRow.setString("fNeedHelp",info.getString("fNeedHelp"));
			appendRow.setString("fRemark",info.getString("fRemark"));
			appendRow.setString("fImgURL",info.getString("fImgURL"));
			appendRow.setState(ModifyState.NONE);
		}
		json.put("workMonthlyData", resultTable);
//		System.out.println(json);
		return json;
	}

	public static Table queryWorkLogReport(String strConcept,String strStartDate,String strEndDate){
		
		String ksql = "select distinct o as fID,o.fPersonName,DateTimeToString(o.fCreateTime) as fCreateTime,o.fFinishWork,o.fWorkPlan,o.fNeedHelp,o.fRemark,o.fImgURL \n" +
//				String ksql = "select distinct o.fID,o.fPersonName,DateTimeToString(o.fCreateTime) as fCreateTime,o.fFinishWork,o.fWorkSummary,o.fNeedHelp,o.fRemark,o.fImgURL \n" +
				 "   from "+strConcept+" o \n" +
				 "   where (o.fPersonID = :currentPersonName() OR instr(o.fReleaseScope, :currentPersonName()) >= 1 )\n" +
				 "	   and o.fCreateTime>='"+strStartDate+"' and o.fCreateTime<='"+strEndDate+"' \n" +
				 "   order by o.fCreateTime desc";
		return KSQL.select(ksql, null, "/OA/workLog/data", null);
		
	}

}