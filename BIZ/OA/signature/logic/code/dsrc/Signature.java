import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.alibaba.fastjson.JSONObject;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.KSQL;
import com.justep.system.data.ModifyState;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.data.TableUtils;

public class Signature {
	private static final String DATA_MODEL = "/OA/signature/data";

	public static JSONObject querySLSignatureEx(String type) {
			JSONObject json = new JSONObject();
			if (type == null || "".equals(type)) {
				
			}else {
				json.put(type, queryTable(type));
			}
		return json;
	}

	/**
	 * @param type
	 * @return
	 */
	private static Table queryTable(String type) {
		Table resultTable = TableUtils.createTable(null, "fID","String","fApplyPsnID","String","fApplyPsnName","String",
				"fApplyDate","DateTime","fSignatureTypeName","String","sStatusName","String","sID","String","sEURL","String","sProcess","String","sActivity","String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "fID");
		String ksql = "SELECT o.* FROM OA_SL_Signature o WHERE o = :fid" ;
			Table taskInfos = getTaskInfo(type);
			Iterator<Row> iterator = taskInfos.iterator();
			while (iterator.hasNext()) {
				Row taskInfo = iterator.next();
				String sData1 = taskInfo.getString("sData1");
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("fid", sData1);
				Iterator<Row> rows = KSQL.select(ksql, map, DATA_MODEL, null).iterator();
				Row appendRow = resultTable.appendRow();
				if(rows.hasNext()){
					Row row = rows.next();
					appendRow.setString("fID", sData1);
					appendRow.setString("fApplyPsnID", row.getString("fApplyPsnID"));
					appendRow.setString("fApplyPsnName", row.getString("fApplyPsnName"));
					appendRow.setDateTime("fApplyDate", row.getDateTime("fApplyDate"));
					appendRow.setString("fSignatureTypeName", row.getString("fSignatureTypeName"));
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
	
	private static Table getTaskInfo(String type){
		String sPersonFID = ContextHelper.getPersonMember().getFID();
		Map<String, String> sysParams = (Map<String, String>) ContextHelper.getSysParams();
		String spersonID = sysParams.get("currentPersonID");
		String ksql = "SELECT s.* FROM SA_Task s WHERE s.sProcess = '/OA/signature/process/signatureApply/signatureApplyProcess' AND " +
				"s.sExecutorFID = '"+sPersonFID+"' AND s.sStatusID in ";
		if("execute".equals(type)){//我审批
			ksql = ksql + " ('tesReady','tesExecuting')";
		}else if ("cre".equals(type)) {//我发起
			ksql = "SELECT s.* FROM SA_Task s WHERE s.sProcess = '/OA/signature/process/signatureApply/signatureApplyProcess' AND " +
					"s.sCreatorPersonID = '"+spersonID+"' AND s.sStatusID <> 'tesFinished'";
		}else if ("par".equals(type)) {//我相关
			ksql = "SELECT SA_Task.* FROM SA_Task SA_Task WHERE not (SA_Task in ( SELECT s FROM SA_Task s WHERE s.sExecutorPersonID = '"+spersonID+"' AND s.sKindID in ('tkTask', 'tkExecutor')  " +
					"AND s.sStatusID = 'tesReady' AND s.sProcess ='/OA/signature/process/signatureApply/signatureApplyProcess')) and SA_Task.sProcess ='/OA/signature/process/signatureApply/signatureApplyProcess'";
		}else if ("clo".equals(type)) {//已审批
			ksql = "SELECT s.* FROM SA_Task s WHERE s.sProcess = '/OA/signature/process/signatureApply/signatureApplyProcess' AND " +
					"s.sExecutorPersonID = '"+spersonID+"' AND s.sStatusID = 'tesFinished'";
		}
		return KSQL.select(ksql, null, "/system/data", null);
	}

}