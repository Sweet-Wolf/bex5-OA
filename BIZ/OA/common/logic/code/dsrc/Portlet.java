import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.ModifyState;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.data.TableUtils;

import com.alibaba.fastjson.JSONObject;


public class Portlet {
	
	
	public static String getRoleType(String fOrgFID) {
		String[] orgIDs = fOrgFID.split("/");
		String resultIDs = "", resultNames = "";
		for (int i = 1; i < orgIDs.length; i++) {
			String tempOrgID = orgIDs[i].substring(0, orgIDs[i].lastIndexOf("."));//orgIDs[i].split(".")[0];
			if (tempOrgID != "" && tempOrgID != null) {
				String roleStr = getRoleInfoByOrgID(tempOrgID);
				if(roleStr.indexOf("|") != -1){
					resultIDs += roleStr.substring(0, roleStr.indexOf("|"));//roleStr.split("|")[0];
					resultNames += roleStr.substring(roleStr.indexOf("|")+1, roleStr.length());// roleStr.split("|")[1];
				}
			}
		}
		if(resultIDs == ""){
			return "";
		}
		return resultIDs.substring(0, resultIDs.length()-1) + "|" + resultNames.substring(0, resultNames.length()-1);
	}

	public static String getRoleInfoByOrgID(String orgID) {
		String ksql = String
				.format("select role as roleID,role.sName as roleName from SA_OPRole role join SA_OPAuthorize author on role = author.sAuthorizeRoleID and author.sOrgID = '%s' and role.sValidState = 1",
						orgID);
		Table table = KSQL.select(ksql, null, "/system/data", null);
		String roleIDs = "", roleNames = "";
		for(Iterator<Row> it = table.iterator(); it.hasNext();){
			Row row = it.next();
			String roleName = row.getString("roleName");
			String roleID = row.getString("roleID");
			if(roleID != null && roleID != ""){
				roleIDs += roleID + ",";
				roleNames += roleName + ",";
			}
		}
		if(roleIDs == "")
			return "";
		return roleIDs + "|" + roleNames;
	}
	
	public static String getAllDeptUnderOrg(){
		String ksql = "select SA_OPOrg as orgID,SA_OPOrg.sName as orgName from SA_OPOrg SA_OPOrg where SA_OPOrg.sValidState = 1 and (SA_OPOrg.sDescription='0' or SA_OPOrg.sDescription='1') and (SA_OPOrg.sOrgKindID <> 'pos' and SA_OPOrg.sOrgKindID <> 'psm') and SA_OPOrg.sParent in (select org from SA_OPOrg org where org.sParent is null and org.sValidState = 1)";
		Table table = KSQL.select(ksql, null, "/system/data", null);
		String deptIDs = "", deptNames = "";
		for(Iterator<Row> it = table.iterator(); it.hasNext();){
			Row row = it.next();
			String orgName = row.getString("orgName");
			String orgID = row.getString("orgID");
			if(orgID != null && orgID != ""){
				deptIDs += orgID + ",";
				deptNames += orgName + ",";
			}
		}
		if(deptIDs == "")
				return "";
		return deptIDs.substring(0, deptIDs.length()-1) + "|" + deptNames.substring(0, deptNames.length()-1);
	}
	
	public static JSONObject querylistDataEx(String type,String tableName,String sProcess,String notInActivities,String DataModel){
		JSONObject json = new JSONObject();
		if (type == null || "".equals(type)) {
			
		}else {
			json.put(type, queryTable(type,tableName,sProcess,notInActivities,DataModel));
		}
		return json;
	}
	
	private static Table queryTable(String type,String tableName,String sProcess,String notInActivities,String DataModel) {
		Table resultTable = TableUtils.createTable(null, "fID","String","fApplyPsnID","String","fApplyPsnName","String",
				"fApplyDate","DateTime","fNo","String","sStatusName","String","sID","String","sEURL","String","sProcess","String","sActivity","String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "fID");
		String ksql = "SELECT o.* FROM "+tableName+" o WHERE o = :fid" ;
			Table taskInfos = getTaskInfo(type,tableName,sProcess,notInActivities);
			Iterator<Row> iterator = taskInfos.iterator();
			while (iterator.hasNext()) {
				Row taskInfo = iterator.next();
				String sData1 = taskInfo.getString("sData1");
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("fid", sData1);
				Iterator<Row> rows = KSQL.select(ksql, map, DataModel, null).iterator();
				Row appendRow = resultTable.appendRow();
				if(rows.hasNext()){
					Row row = rows.next();
					appendRow.setString("fID", sData1);
					appendRow.setString("fApplyPsnID", taskInfo.getString("sCreatorPersonID"));
					appendRow.setString("fApplyPsnName", taskInfo.getString("sCreatorPersonName"));
					appendRow.setDateTime("fApplyDate", taskInfo.getDateTime("sCreateTime"));
					appendRow.setString("fNo", taskInfo.getString("sName"));
				}
				if("execute".equals(type)){
					appendRow.setString("sID", taskInfo.getString("s"));
					appendRow.setString("sEURL", taskInfo.getString("sEURL"));
					appendRow.setString("sProcess", taskInfo.getString("sProcess"));
					appendRow.setString("sActivity", taskInfo.getString("sActivity"));
					appendRow.setString("sStatusName", "待 "+ContextHelper.getPersonMember().getName()+" 审批");
				}else if ("clo".equals(type)) {
					appendRow.setString("sStatusName", ContextHelper.getPersonMember().getName()+" 已审批");
				} else{
					appendRow.setString("sStatusName", ContextHelper.getPersonMember().getName()+" "+taskInfo.getString("sStatusName"));
				}
				appendRow.setState(ModifyState.NONE);
			}
		
		return resultTable;
	}
	
	private static Table getTaskInfo(String type,String tableName,String sProcess,String notInActivities){
		String sPersonFID = ContextHelper.getPersonMember().getFID();
		Map<String, String> sysParams = (Map<String, String>) ContextHelper.getSysParams();
		String processCond = "";
		String spersonID = sysParams.get("currentPersonID");
		String ksql = "SELECT s.* FROM SA_Task s WHERE  " +
				"s.sExecutorFID = '"+sPersonFID+"'";
	
		ksql = ksql + " AND s.sProcess = '"+sProcess+"'  and (not (s.sActivity in ("+notInActivities+")))";
		
		if("execute".equals(type)){//我审批
			ksql = ksql + " AND s.sStatusID in ('tesReady','tesExecuting')";
		}else if ("cre".equals(type)) {//我发起
			ksql = "SELECT s.* FROM SA_Task s WHERE s.sProcess = '"+sProcess+"' AND " +
					"s.sCreatorPersonID = '"+spersonID+"' AND s.sStatusID <> 'tesFinished' and (not (s.sActivity in ("+notInActivities+")))";
		}else if ("par".equals(type)) {//我相关
			ksql = "SELECT s.* FROM SA_Task s WHERE not (s in ( SELECT SA_Task FROM SA_Task SA_Task WHERE SA_Task.sExecutorPersonID = '"+spersonID+"' AND SA_Task.sKindID in ('tkTask', 'tkExecutor')  " +
					"AND SA_Task.sStatusID = 'tesReady' AND SA_Task.sProcess ='"+sProcess+"')) and s.sProcess ='"+sProcess+"' and (not (s.sActivity in ("+notInActivities+")))";
		}else if ("clo".equals(type)) {//已审批
			ksql = "SELECT s.* FROM SA_Task s WHERE s.sProcess = '"+sProcess+"' AND " +
					"s.sExecutorPersonID = '"+spersonID+"' AND s.sStatusID = 'tesFinished' and (not (s.sActivity in ("+notInActivities+")))";
		}
		ksql = ksql + " order by s.sCreateTime desc";
		System.out.println("==ksql=="+ksql);
		return KSQL.select(ksql, null, "/system/data", null);
	}
}