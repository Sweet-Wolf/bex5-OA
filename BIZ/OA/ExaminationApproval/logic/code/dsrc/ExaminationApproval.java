import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;


public class ExaminationApproval {
	/**
	 * 
	 * @param sheetId
	 * @param activityName
	 * @param step
	 * @return
	 */

	public static JSONObject queryActivityExecutorPersonIDs(String sheetId,String activityName,String step){
		JSONObject json = new JSONObject();
		String ksql;
		if (null != step && "prev".equals(step.trim())){
			//如果前一环节没有执行人，那么应该是提交人，即单据的申请人。
			ksql = " select case when o.sExecutorPersonID is null  then o.sCreatorPersonID \n"
		         + " else o.sExecutorPersonID END as fPersonID \n"  
		         + " from SA_Task o  \n"
		         + " join SA_TaskRelation r on o = r.sTaskID2 \n"
		         + " where  o.sData1 = '" +  sheetId + "' and o.sActivityName  ='" + activityName.trim() +  "'";
		} else {
		    /*ksql = "select o.sExecutorPersonID as fPersonID from SA_Task o where o.sData1 = '" 
		      +  sheetId + "' and o.sActivityName  ='" + activityName.trim() +  "' and o.sExecutorPersonID is not null \n and o.sStatusID <> 'tesFinished' ";*/
			ksql = "select o.sExecutorPersonID as fPersonID, o.sParent as sParentID, o.sStatusID from SA_Task o where o.sData1 = '" 
				      +  sheetId + "' and o.sActivityName  ='" + activityName.trim() +  "' and o.sExecutorPersonID is not null \n order by o.sCreateTime desc limit 0, 40 ";
		}
		Table table =  KSQL.select(ksql, null, "/system/data", null);
		//System.out.println(ksql);
		
		List<String> list = new ArrayList<String>(); //保存父任务Id+sStatusID
		Iterator<Row> iterator = table.iterator();
		
		StringBuilder builder = new StringBuilder();
		while(iterator.hasNext()) {
			
			Row info = iterator.next();
			String sign = info.getString("sParentID").trim() + info.getString("sStatusID");
			if (list.isEmpty()){
				list.add(sign);
			} else {
				if (!list.contains(sign)) {
					break;
				}
			}
			
			String personId = info.getString("fPersonID");
			if (null == personId || !"".equals(personId.trim())){
				if ( builder.length() == 0) {
					builder.append(personId.trim());
				} else {
					builder.append("," + personId.trim());
				}
			}
		}
		json.put("sExecutorPersonIDs", builder.toString());
		return json;
	}
	
	public static JSONObject queryAllPersonIDs(){
		JSONObject json = new JSONObject();
		String ksql  = "select o as fPersonID from SA_OPPerson o ";
		Table table =  KSQL.select(ksql, null, "/system/data", null);
		//System.out.println(ksql);
		Iterator<Row> iterator = table.iterator();
		StringBuilder builder = new StringBuilder();
		while(iterator.hasNext()) {
			Row info = iterator.next();
			String personId = info.getString("fPersonID");
			 
			if ( builder.length() == 0) {
				builder.append(personId.trim());
			} else {
				builder.append("," + personId.trim());
			}
		 
		}
		json.put("sAllPersonIDs", builder.toString());
		return json;
	}
}