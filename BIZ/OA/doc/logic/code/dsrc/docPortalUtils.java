import org.dom4j.*;

import java.sql.*;
import java.util.*;

import com.justep.model.ModelUtils;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.transform.SimpleTransform;
import com.justep.system.action.ActionUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.opm.PersonMember;
import com.justep.system.process.TaskStatus;
import com.justep.util.Utils;
import com.justep.system.util.CommonUtils;

public class docPortalUtils {


	public static Map<String, Object> getOpinion(String id, String flag)
			throws Exception {
		Map map = new HashMap<String, Object>();
		String ksql = "";
		if (flag.equals("send")) {
			ksql = "select e.fOpinion,e.fCreateTime,e.fCreatePsnName from OA_DC_DocExecute e Where  e.fActivityLabel = '院首长签阅' and e.fMasterID = '"
					+ id + "' Order by e.fCreateTime desc";
			map.put("s1",
					table2String(KSQL.select(ksql, null, "/OA/doc/data", null)));
			ksql = "select e.fOpinion,e.fCreateTime,e.fCreatePsnName from OA_DC_DocExecute e Where  e.fActivityLabel = '处领导阅稿' and e.fMasterID = '"
					+ id + "' Order by e.fCreateTime desc";
			map.put("s2",
					table2String(KSQL.select(ksql, null, "/OA/doc/data", null)));
			ksql = "select e.fOpinion,e.fCreateTime,e.fCreatePsnName from OA_DC_DocExecute e Where  e.fActivityLabel = '部领导审批' and e.fMasterID = '"
					+ id + "' Order by e.fCreateTime desc";
			map.put("s3",
					table2String(KSQL.select(ksql, null, "/OA/doc/data", null)));
		} else if (flag.equals("telephone")) {
			ksql = "select e.fOpinion,e.fCreateTime,e.fCreatePsnName from OA_DC_DocExecute e Where  (e.fActivityLabel = '院首长签阅' or e.fActivityLabel = '部领导审批') and e.fMasterID = '"
					+ id + "' Order by e.fCreateTime desc";
			map.put("s",
					table2String(KSQL.select(ksql, null, "/OA/doc/data", null)));
		} else if (flag.equals("receive")) {
			ksql = "select e.fOpinion,e.fCreateTime,e.fCreatePsnName from OA_DC_DocExecute e Where  (e.fActivityLabel = '院首长签阅' or e.fActivityLabel = '部领导签阅') and e.fMasterID = '"
					+ id + "' Order by e.fCreateTime desc";
			map.put("s",
					table2String(KSQL.select(ksql, null, "/OA/doc/data", null)));
		} else if (flag.equals("read")) {
			ksql = "select e.fOpinion,e.fCreateTime,e.fCreatePsnName from OA_DC_DocExecute e Where  e.fActivityLabel = '院首长签阅' and e.fMasterID = '"
					+ id + "' Order by e.fCreateTime desc";
			map.put("s1",
					table2String(KSQL.select(ksql, null, "/OA/doc/data", null)));
			ksql = "select e.fOpinion,e.fCreateTime,e.fCreatePsnName from OA_DC_DocExecute e Where  e.fActivityLabel = '部领导审批' and e.fMasterID = '"
					+ id + "' Order by e.fCreateTime desc";
			map.put("s2",
					table2String(KSQL.select(ksql, null, "/OA/doc/data", null)));
		}
		return map;
	}

	public static String table2String(Table tab) {
		String s = "";
		Iterator<Row> rows = tab.iterator();
		while (rows.hasNext()) {
			Row row = rows.next();
			if (s.equals("")) {
				s = row.getString("fOpinion")
						+ " "
						+ row.getString("fCreatePsnName")
						+ " "
						+ row.getDateTime("fCreateTime")
								.toString()
								.substring(
										0,
										row.getDateTime("fCreateTime")
												.toString().indexOf(" "));
			} else {
				s = s
						+ "\n"
						+ row.getString("fOpinion")
						+ " "
						+ row.getString("fCreatePsnName")
						+ " "
						+ row.getDateTime("fCreateTime")
								.toString()
								.substring(
										0,
										row.getDateTime("fCreateTime")
												.toString().indexOf(" "));
			}
		}
		return s;
	}

	private static final String DATA_MODEL = "/system/data";

	public static Document queryWaitTaskNoDoc() {
		String condition = TaskUtils.getExecutorCondition("t", ContextHelper
				.getPerson().getPersonMembers(), true);

		String query = "select t, t.sName, t.sCURL, t.sProcess, t.sActivity, t.sCreateTime, t.sExecutorFName, t.sExecutorNames, t.sEURL, t.sCreatorFName, t.sShortcut, t.sHints, t.sCreatorFID, t.sExecutorFID "
				+ " from SA_Task t "
				+ " where (t.sKindID='tkTask' or t.sKindID='tkExecutor' or t.sKindID='tkNotice' or t.sKindID IS NULL) "
				+ " and (t.sStatusID='tesReady' or t.sStatusID='tesExecuting') "
				+ " and (t.sTypeID IS NULL or t.sTypeID <> 'WORKREMIND')"
				+ " and not(t.sProcess  like '%/OA/doc%')"
				+ " and "
				+ condition
				+ " order by  t.sCreateTime desc " + " limit 0,8 ";
		return toDOM(KSQL.select(query, null, DATA_MODEL, null));
	}

	public static Document queryWaitTaskDoc() {
		String condition = TaskUtils.getExecutorCondition("t", ContextHelper
				.getPerson().getPersonMembers(), true);

		String query = "select t, t.sName, t.sCURL, t.sProcess, t.sActivity, t.sCreateTime, t.sExecutorFName, t.sExecutorNames, t.sEURL, t.sCreatorFName, t.sShortcut, t.sHints, t.sCreatorFID, t.sExecutorFID "
				+ " from SA_Task t "
				+ " where (t.sKindID='tkTask' or t.sKindID='tkExecutor' or t.sKindID='tkNotice' or t.sKindID IS NULL) "
				+ " and (t.sStatusID='tesReady' or t.sStatusID='tesExecuting') "
				+ " and (t.sTypeID IS NULL or t.sTypeID <> 'WORKREMIND')"
				+ " and t.sProcess like '%/OA/doc%'"
				+ " and "
				+ condition
				+ " order by  t.sCreateTime desc " + " limit 0,8 ";
		return toDOM(KSQL.select(query, null, DATA_MODEL, null));
	}

	private static Document toDOM(Table table) {
		Document result = DocumentHelper.createDocument();
		Element tasks = result.addElement("tasks");
		if (table != null) {
			for (Iterator<Row> it = table.iterator(); it.hasNext();) {
				Row r = it.next();
				Element task = tasks.addElement("SA_Task");
				task.addAttribute("id", r.getString("t"));
				task.addElement("sName").addText(
						getValue(r.getString("sName"), ""));

				task.addElement("sCURL").addText(
						getValue(r.getString("sCURL"), ""));

				task.addElement("sEURL").addText(
						getValue(r.getString("sEURL"), ""));
				task.addElement("sProcess").addText(
						getValue(r.getString("sProcess"), ""));
				task.addElement("sActivity").addText(
						getValue(r.getString("sActivity"), ""));
				task.addElement("sCreateTime").addText(
						getValue(SimpleTransform.transToString(r
								.getDateTime("sCreateTime")), ""));
				task.addElement("sCreatorFID").addText(
						getValue(r.getString("sCreatorFID"), ""));
				task.addElement("sExecutorFID").addText(
						getValue(r.getString("sExecutorFID"), ""));

				{
					String executorName = getValue(
							r.getString("sExecutorFName"), "");
					if (Utils.isEmptyString(executorName)) {
						executorName = getValue(r.getString("sExecutorNames"),
								"");
					} else {
						executorName = CommonUtils.getNameOfFile(executorName);
					}

					if (executorName == null) {
						executorName = "";
					}

					task.addElement("sExecutorFName").addText(executorName);
				}

				{
					String creatorName = getValue(r.getString("sCreatorFName"),
							"");
					creatorName = CommonUtils.getNameOfFile(creatorName);
					if (creatorName == null) {
						creatorName = "";
					}
					task.addElement("sCreatorFName").addText(creatorName);
				}

				task.addElement("sHints").addText(
						getValue(r.getString("sHints"), ""));
				task.addElement("sShortcut").addText(
						getValue(r.getString("sShortcut"), ""));
			}

		}

		return result;
	}

	private static String getValue(String obj, String defaultValue) {
		if (obj == null) {
			return defaultValue;
		} else {
			return obj;
		}
	}
	
	
	
	public static String getCurrentMembersURLFilter(String urlField) {
		String filter = "";
		List<PersonMember> psnMembers = ContextHelper.getPersonMembers();
		for(int i = 0;i< psnMembers.size();i++){
			String psmFID = psnMembers.get(i).getFID();
			String[] psmFIDSplit = psmFID.split("/");
			String psmFIDPart = "";
			for(int j = 0;j<psmFIDSplit.length;j++){
				String splitID = psmFIDSplit[j];
				if (splitID.equals(""))
					continue;
       
				if (psmFIDPart.equals("")) {
					psmFIDPart = "/" + splitID;
				} else {
					psmFIDPart = psmFIDPart + "/" + splitID;
				}
				

				String condition = "(" + urlField + " = '" + psmFIDPart + "')";
				
				if(filter.equals(""))
					filter = condition;
				else
					filter = filter +" or " + condition;
			}
		}
		
		return filter;
	}
	
	public static Map<String, Object> mobileReadDocPortal(){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("fLabel", "待阅公文");
		result.put("fProcess", "/OA/doc/process/mobileReadDocQuery/mobileReadDocQueryProcess");
		result.put("fActivity", "mainActivity");
		
		result.put("fUrl", "$UI/OA/doc/process/mobileReadDocQuery/mainActivity.a");
		
		result.put("fCount", 0);

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("limit", 1);
		params.put("offset", 0);
		params.put("variables", new HashMap<String, Object>());
			
		//查询最新数据 var personFilter = common.getCurrentMembersURLFilter(this.getContext(),'r.fRangeURL');
		
		String personId = ContextHelper.getPerson().getID();
		String filter = getCurrentMembersURLFilter("r.fRangeURL");
		//noReadfilter   = "OA_DC_Doc in (select distinct d from OA_DC_Doc d join OA_DC_ReaderRange r on d = r.fMasterID and ("+ filter +")) and ('"+personId+"' in (select t.fPersonID from OA_DC_ReaderRange t where t.fMasterID = OA_DC_Doc)) and (not(OA_DC_Doc.fReaderIDs like '%"+personId+"%') or OA_DC_Doc.fReaderIDs is null)";
		String ksql = " select OA_DC_Doc.fTitle,OA_DC_Doc.fCreatePsnName,OA_DC_Doc.fCreateTime from OA_DC_Doc OA_DC_Doc "
				     +" where OA_DC_Doc in (select distinct d from OA_DC_Doc d join OA_DC_ReaderRange r on d = r.fMasterID "
				     +" and ("+ filter +")) and ('"+personId+"' in (select t.fPersonID from OA_DC_ReaderRange t "
				     +" where t.fMasterID = OA_DC_Doc)) and (not(OA_DC_Doc.fReaderIDs like '%"+personId+"%') or OA_DC_Doc.fReaderIDs is null)"
				     +" order by OA_DC_Doc.fCreateTime desc";
		

		
		Table data = KSQL.select(ksql, null, "/OA/doc/data", null);	
		if(data.size() > 0 ){
			
			Row row = data.iterator().next();
			result.put("fContent", row.getString("fTitle"));
			result.put("fDate", row.getDateTime("fCreateTime"));
		//	result.put("fTag", row.getString("fApprove"));
			//获得所有未读数
			Integer size = data.size();
			if(size == null) size = 0;
			
			String subLabel = size + "条未阅";
			
			result.put("fSubLabel", subLabel);
		}
		
		return result;
	}
	
	public static Map<String, Object> mobileDocDealPortal(){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("fLabel", "公文处理");
		result.put("fProcess", "/OA/doc/process/mobileDocDeal/mobileDocDealProcess");
		result.put("fActivity", "mainActivity");
		
		result.put("fUrl", "$UI/OA/doc/process/mobileDocDeal/mainActivity.a");
		
		result.put("fCount", 0);

			
		//查询最新数据 var personFilter = common.getCurrentMembersURLFilter(this.getContext(),'r.fRangeURL');
		
		
		//noReadfilter   = "OA_DC_Doc in (select distinct d from OA_DC_Doc d join OA_DC_ReaderRange r on d = r.fMasterID and ("+ filter +")) and ('"+personId+"' in (select t.fPersonID from OA_DC_ReaderRange t where t.fMasterID = OA_DC_Doc)) and (not(OA_DC_Doc.fReaderIDs like '%"+personId+"%') or OA_DC_Doc.fReaderIDs is null)";
		String ksql = " select SA_Task.sName,SA_Task.sCreatorPersonName,SA_Task.sCreateTime from SA_Task SA_Task "
				     +" where SA_Task.sTypeName = '公文业务流程'"
				     +" and ((SA_Task.sProcess ='/OA/doc/process/sendDoc/sendDocProcess' and not (SA_Task.sActivity in ('draftActivity','registerNumActivity','stampActivity','dispenseActivity','secretaryDealActivity'))) "
				     +" or (SA_Task.sProcess='/OA/doc/process/receiveDoc/receiveDocProcess' and not (SA_Task.sActivity in  ('regActivity','secretaryActivity'))))"
				     +" and SA_Task.sExecutorPersonID = '"+ContextHelper.getPerson().getID()+"'"
				     +" and (SA_Task.sStatusID='" + TaskStatus.READY + "'" +
				     " or SA_Task.sStatusID='" + TaskStatus.EXECUTING + "')"
				     +" order by SA_Task.sCreateTime desc";
		/*
		 String waitingCondition = "(" + alias + ".sStatusID='" + TaskStatus.READY + "'" +
				" or " + alias + ".sStatusID='" + TaskStatus.EXECUTING + "')";
				
				ContextHelper.getPerson().getID();
		 * */

		
		Table data = KSQL.select(ksql, null, "/system/data", null);	
		if(data.size() > 0 ){
			
			Row row = data.iterator().next();
			result.put("fContent", row.getString("sName"));
			result.put("fDate", row.getDateTime("sCreateTime"));
		//	result.put("fTag", row.getString("fApprove"));
			//获得所有未读数
			Integer size = data.size();
			if(size == null) size = 0;
			
			String subLabel = size + "条待处理";
			
			result.put("fSubLabel", subLabel);
		}
		
		return result;
	}

}