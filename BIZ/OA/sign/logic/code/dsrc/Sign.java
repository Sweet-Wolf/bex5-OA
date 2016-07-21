import java.math.*;
import java.sql.*;
import java.util.*;

import org.dom4j.*;

import com.alibaba.fastjson.JSONObject;
import com.justep.oa.SysUtils;
import com.justep.system.data.*;

public class Sign {


	public static void queryOA_Sign(List range,String concept,String select,String from,String aggregate,String dataModel,String fnModel,String condition,Boolean distinct,String idColumn,String filter,Integer limit,Integer offset,String columns,String orderBy,String aggregateColumns,Map variables){
		
	}

	public static JSONObject querySignCount(String strDate){
		
		JSONObject json = new JSONObject();
		String fPersonID = SysUtils.getCurrentPersonID();
		Table resultTable = TableUtils.createTable(null, "fID","String","fPersonName","String","fSignTime","DateTime","fLongitude","String","fDimension","String",
				"fSignAddress","String","fRemark","String","fImgURL","String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "fID");
		String ksql1 = "select distinct o as fID,o.fPersonName,o.fSignTime,o.fLongitude,o.fDimension,o.fSignAddress,o.fRemark,o.fImgURL \n" +
					 "   from OA_Sign o \n" +
					 "  where o.fPersonID = :currentPersonID() AND dateTimeToDate(o.fSignTime) = '"+strDate+"' \n";
		Table table1 =  KSQL.select(ksql1, null, "/OA/sign/data", null);
		
		Iterator<Row> iterator = table1.iterator();
		
		//int rowID = 0;
		while(iterator.hasNext()) {
			Row appendRow = resultTable.appendRow();
			Row info = iterator.next();
			appendRow.setString("fID",info.getString("fID"));
			appendRow.setString("fPersonName",info.getString("fPersonName"));
			appendRow.setDateTime("fSignTime",info.getDateTime("fSignTime"));
			appendRow.setString("fLongitude",info.getString("fLongitude"));
			appendRow.setString("fDimension",info.getString("fDimension"));
			appendRow.setString("fSignAddress",info.getString("fSignAddress"));
			appendRow.setString("fRemark",info.getString("fRemark"));
			appendRow.setString("fImgURL",info.getString("fImgURL"));
			appendRow.setState(ModifyState.NONE);
		}
		json.put("signData", resultTable);
//		System.out.println(json);
		return json;
	}

	public static JSONObject queryDeptLatestSign(String strDate){
		JSONObject json = new JSONObject();
		String strWhereOgn = "";
		String fDeptID = SysUtils.getCurrentDeptID();
		if(fDeptID==null || "".equals(fDeptID)){
			fDeptID = SysUtils.getCurrentOgnID();
			strWhereOgn = " and o.fOrgID = '"+fDeptID+"' ";
		}else{
			strWhereOgn = " and o.fDeptID = '"+fDeptID+"' ";
		}
		
//		查询团队最新签到的人员ID，人员名称，部门ID，部门名称，签到信息（时间，地点fAddress），头像图片信息
		        
		Table resultTable = TableUtils.createTable(null, "fID","String","fPersonID", "String", "fPersonName","String", "fSignCount", "Integer",  "fSignTime","DateTime",
				"fDeptId","String","fDeptName","String", "fLongitude","String","fDimension","String", 
				"fAddress","String","fRemark","String","fImgURL","String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "fID");
		
		String ksql = "select  o as fID, o.fPersonID, o.fPersonName,o.fSignTime, o.fDeptID, o.fDeptName, o.fLongitude,o.fDimension,o.fSignAddress,o.fRemark,o.fImgURL \n" +
					 "   from OA_Sign o \n" +
					 "  where  dateTimeToDate(o.fSignTime) = '"+strDate+ "' \n" + strWhereOgn +
					 "   order by o.fPersonName , o.fSignTime desc ";
		//System.out.println(SysUtils.getCurrentDeptID());
		Table table =  KSQL.select(ksql, null, "/OA/sign/data", null);
		
		Iterator<Row> iterator = table.iterator();
		
		int rowID = 0;
		List<String> listPersonId = new ArrayList<String>();
		while(iterator.hasNext()) {
			Row info = iterator.next();
			String personID = info.getString("fPersonID");
			if (!listPersonId.contains(personID))
			{
				Row appendRow = resultTable.appendRow();
				appendRow.setString("fID",info.getString("fID"));
				appendRow.setString("fPersonID",info.getString("fPersonID"));
				appendRow.setString("fPersonName",info.getString("fPersonName"));
				appendRow.setDateTime("fSignTime",info.getDateTime("fSignTime"));
				appendRow.setString("fLongitude",info.getString("fLongitude"));
				appendRow.setString("fDimension",info.getString("fDimension"));
				appendRow.setString("fDeptId",info.getString("fLongitude"));
				appendRow.setString("fDeptName",info.getString("fDimension"));
				
				appendRow.setString("fAddress",info.getString("fSignAddress"));
				appendRow.setString("fRemark",info.getString("fRemark"));
				appendRow.setString("fImgURL",info.getString("fImgURL"));
				
				appendRow.setInteger("fSignCount", 1);
				appendRow.setState(ModifyState.NONE);
				listPersonId.add(info.getString("fPersonID"));
			} else {
				Iterator<Row> iteratorRow = resultTable.iterator();
				while (iteratorRow.hasNext()){
					Row row = iteratorRow.next();
					if (row.getString("fPersonID").equals(personID)){
						row.setInteger("fSignCount", row.getInteger("fSignCount") + 1);
					}
				}
			}
		}
		json.put("deptLatestSign", resultTable);
//		System.out.println(json);
		return json;
	}

	public static JSONObject queryDeptNotSign(String strDate){
		JSONObject json = new JSONObject();
		String strWhereSignOgn = "";
		String strWhereOgn = "";
		String fDeptID = SysUtils.getCurrentDeptID();
		if(fDeptID==null || "".equals(fDeptID)){
			fDeptID = SysUtils.getCurrentOgnID();
			strWhereSignOgn = " and o.fOrgID = '"+fDeptID+"' ";
			strWhereOgn = SysUtils.getCurrentOrgFID();
		}else{
			strWhereSignOgn = " and o.fDeptID = '"+fDeptID+"' ";
			strWhereOgn = SysUtils.getCurrentDeptFID();
		}

//		查询团队最新签到的人员ID，人员名称，部门ID，部门名称，签到信息（时间，地点fAddress），头像图片信息
		        
		Table resultTable = TableUtils.createTable(null,"fID","String", "fPersonID", "String", "fPersonName","String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "fID");
		
	    String ksqlSign = " select o.fPersonID from OA_Sign o where dateTimeToDate(o.fSignTime) = '"+strDate+ "'" + strWhereSignOgn; 
		Table tableSign = KSQL.select(ksqlSign, null, "/OA/sign/data", null);
		
		Iterator<Row> iteratorSign = tableSign.iterator();
		List<String> signList = new ArrayList(); 
		while (iteratorSign.hasNext()){
			Row row = iteratorSign.next();
			String fPersonID = row.getString("fPersonID");
			if(!signList.contains(fPersonID)){
				signList.add(row.getString(0));
			}
		}
	    
//		String ksqlPerson = "select psn as fPersonID, psn.sName as fPersonName from SA_OPPerson psn " +
//				"where psn.sMainOrgID in (select org from SA_OPOrg org where org.sParent = :currentDeptID()) order by psn.sName";

		String ksqlPerson = "select ogn as fPersonID, ogn.sName as fPersonName from SA_OPOrg ogn where ogn.sFID like '"+strWhereOgn+"%' and ogn.sOrgKindID = 'psm' ";
		
		Table tablePerson =  KSQL.select(ksqlPerson, null, "/system/data", null);
		
		Iterator<Row> iteratorPserson = tablePerson.iterator();
	 
		while(iteratorPserson.hasNext()) {
			Row info = iteratorPserson.next();
			String fPersonID = info.getString("fPersonID");
			fPersonID = fPersonID.substring(0, fPersonID.indexOf("@"));
			if (!signList.contains(fPersonID)){
				Row appendRow = resultTable.appendRow();
				appendRow.setString("fID",fPersonID);
				appendRow.setString("fPersonID", fPersonID);
				appendRow.setString("fPersonName",info.getString("fPersonName"));
				appendRow.setState(ModifyState.NONE);
			}
		}
		json.put("deptNotSign", resultTable);
//		System.out.println(json);
		return json;
	} 

	
}