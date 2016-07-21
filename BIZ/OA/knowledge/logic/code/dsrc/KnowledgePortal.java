import java.math.*;
import java.sql.*;
import java.util.*;

import org.dom4j.*;

import com.justep.system.action.ActionUtils;
import com.justep.system.data.*;

public class KnowledgePortal {


	public static Map<String, Object> newsPortal(){
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("fLabel", "新闻查看");
		result.put("fProcess", "/OA/knowledge/process/knowledgeMobile/knowledgeMobileProcess");
		result.put("fActivity", "knowledgeNewsMobileActivity");
		
		result.put("fUrl", "$UI/OA/knowledge/process/knowledgeMobile/knowledgeNewsMobileActivity.a");
		
		
		/*result.put("fProcess", "/SA/task/taskView/taskViewProcess");
		result.put("fActivity", "mainActivity");
		result.put("fUrl", "$UI/SA/task/taskView/waitActivity.a");*/
		
		
		result.put("fCount", 0);

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("limit", 1);
		params.put("offset", 0);
		params.put("variables", new HashMap<String, Object>());
			
		//查询最新数据
		Table data = (Table)ActionUtils.invokeAction(
				"/OA/knowledge/process/knowledgeMobile/knowledgeMobileProcess", "knowledgeNewsMobileActivity", 
				"queryOA_KM_KnowledgeNewsAction", "*", params);
			
		if(data.size() > 0 ){
			
			Row row = data.iterator().next();
			result.put("fContent", row.getString("fTitle"));
			result.put("fDate", row.getDateTime("fReleaseTime"));
		//	result.put("fTag", row.getString("fApprove"));
			//获得所有未读数
			Integer size = (Integer)data.getProperties().get(Table.PROP_DB_COUNT);
			if(size == null) size = 0;
			
			String subLabel = size + "条未阅";
			
			result.put("fSubLabel", subLabel);
		}
		//计算所有待审批数
	/*	params.put("limit", -1);
		data = (Table)ActionUtils.invokeAction(
				"/OA/personalOffice/process/evection/evectionProcess", "mainActivity", 
				"queryOA_EvectionOpAction", "*", params);
			
		if(data.size() > 0 ){
			data.getMetaData().setKeyColumn("sGroupID");
		    Collection<Row> rows = data.getRows("A");
		    if(rows.size() > 0)
		    	result.put("fSubLabel", rows.size() + "条待审批");
		}*/
		return result;
	}
	
	public static Map<String, Object> noticePortal(){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("fLabel", "公告查看");
		result.put("fProcess", "/OA/knowledge/process/knowledgeMobile/knowledgeMobileProcess");
		result.put("fActivity", "knowledgeNoticeMobileActivity");
	
		
		result.put("fUrl", "$UI/OA/knowledge/process/knowledgeMobile/knowledgeNoticeMobileActivity.a");
		
		result.put("fCount", 0);

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("limit", 1);
		params.put("offset", 0);
		params.put("variables", new HashMap<String, Object>());
			
		//查询最新数据
		Table data = (Table)ActionUtils.invokeAction(
				"/OA/knowledge/process/knowledgeMobile/knowledgeMobileProcess", "knowledgeNoticeMobileActivity", 
				"queryOA_KM_KnowledgeNoticeAction", "*", params);
			
		if(data.size() > 0 ){
			Row row = data.iterator().next();
			result.put("fContent", row.getString("fTitle"));
			result.put("fDate", row.getDateTime("fReleaseTime"));
		//	result.put("fTag", row.getString("fApprove"));
			//获得所有未读数
		//	Integer size = (Integer)data.getProperties().get(Table.PROP_DB_COUNT);
		//	result.put("fCount", size);
			Integer size = (Integer)data.getProperties().get(Table.PROP_DB_COUNT);
			if(size == null) size = 0;
			
			String subLabel = size + "条未阅";
			
			result.put("fSubLabel", subLabel);
		}
		return result;
	}

	public static Map<String, Object> publishPortal(){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("fLabel", "文件中心");
		result.put("fProcess", "/OA/knowledge/process/knowledgeMobile/knowledgeMobileProcess");
		result.put("fActivity", "knowledgeDocMobileActivity");
		result.put("fUrl", "$UI/OA/knowledge/process/knowledgeMobile/knowledgeDocMobileActivity.a");
		result.put("fCount", 0);

		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("limit", 1);
		params.put("offset", 0);
		params.put("variables", new HashMap<String, Object>());
			
		//查询最新数据
		Table data = (Table)ActionUtils.invokeAction(
				"/OA/knowledge/process/knowledgeMobile/knowledgeMobileProcess", "knowledgeDocMobileActivity", 
				"queryOA_KM_KnowledgeDocAction", "*", params);
			
		if(data.size() > 0 ){
			Row row = data.iterator().next();
			result.put("fContent", row.getString("fTitle"));
			result.put("fDate", row.getDateTime("fReleaseTime"));
		//	result.put("fTag", row.getString("fApprove"));
			//获得所有未读数
		//	Integer size = (Integer)data.getProperties().get(Table.PROP_DB_COUNT);
		//	result.put("fCount", size);
			Integer size = (Integer)data.getProperties().get(Table.PROP_DB_COUNT);
			if(size == null) size = 0;
			
			String subLabel = size + "条未阅";
			
			result.put("fSubLabel", subLabel);
		}
		return result;
	}
}