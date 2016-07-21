import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.justep.system.action.ActionUtils;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.util.CommonUtils;

public class SchedulePortal {
	public static Map<String, Object> schedulePortal(){
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("fLabel", "日程管理");
		result.put("fProcess", "/OA/schedule/process/mobileSechedule/mobileSecheduleProcess");
		result.put("fActivity", "mainActivity");
		result.put("fCount", 0);
		
		///UI2/OA/schedule/process/mobileSechedule/mainActivity.m.w
		result.put("fUrl", "$UI/OA/schedule/process/mobileSechedule/mainActivity.a");
		
		HashMap<String, Object> params = new HashMap<String, Object>();
	
		//查询今天的一条数据
		Table data = (Table)ActionUtils.invokeAction(
				"/OA/schedule/process/mobileSechedule/mobileSecheduleProcess", "mainActivity", 
				"queryOA_ScheduleMonthAction", "*", params);
		System.out.println("==日程数=="+data.size());	
		if(data.size() > 0 ){
			
			data.getMetaData().setKeyColumn("fScheDay");
			String sCurrDate = CommonUtils.dateFormat(CommonUtils.getCurrentDate(),"yyyy-MM-dd");
		    Collection<Row> rows = data.getRows(sCurrDate);
		   
		    for (Row row : rows){
		    	
		    	if(row.getString("fIsTitle").equals("0")){
		    		String sTimePeriod = row.getString("fTimePeriod");
		    		
		    		
		    		System.out.println("=sTimePeriod="+sTimePeriod +"=row.getString(fScheDay)="+row.getString("fScheDay"));
		    		String sDate;
		    		int iPos = sTimePeriod.indexOf("-");
		    		
		    		if(iPos == 5){
		    			sDate = row.getString("fScheDay") + " " + sTimePeriod.substring(0,5);
		    		}else{
		    			sDate = sTimePeriod.substring(0,16);
		    		}
					result.put("fContent", row.getString("fTitle") + "：" + row.getString("fTimePeriod"));
					result.put("fDate", CommonUtils.toDateTime(sDate+":00"));
					break;
		    	}
		    }
		}

		//计算今天的日程数
	/*	String ksql = "select count(OA_Schedule) as sMessageNumber from OA_Schedule OA_Schedule join SA_Social SA_Social"
	    	+ " on OA_Schedule = SA_Social.sData1 and SA_Social.sValidState = '1' and SA_Social.sTypeID = 'RelativeOrg'"
	    	+ " and (SA_Social.sESField01 is null) and SA_Social.sPersonID = :currentPersonID()";
		Table numTable = KSQL.select(ksql, null, "/OA/personalOffice/data", null);
		if(numTable.size() > 0 ){
			Row row = numTable.iterator().next();
			if(row.getValue("sMessageNumber") != null){
				Object o = row.getValue("sMessageNumber");
				String s = o.toString();
				if(!s.equals("0"))
					result.put("fSubLabel", "有" + s + "个未确认日程");
			}
		}*/
		return result;
	}
}