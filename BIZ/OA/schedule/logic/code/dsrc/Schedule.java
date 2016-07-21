import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.justep.system.action.ActionUtils;
import com.justep.system.context.ContextHelper;
import com.justep.system.data.DataPermission;
import com.justep.system.data.KSQL;
import com.justep.system.data.Row;
import com.justep.system.data.Table;
import com.justep.system.data.TableUtils;
import com.justep.system.util.CommonUtils;
import java.util.ArrayList;


public class Schedule {
	public static final String OADataModel ="/OA/schedule/data";
	public static final String sysDataModel ="/system/data";
	static Table scheTable, originalTable;
	static Row originalRow;
	
	public static String newSchedule(String fTitle, String fBeginTime,String fEndTime) throws ParseException{
		SimpleDateFormat s = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
		java.util.Date beginTime = s.parse(fBeginTime);
		java.util.Date endTime = s.parse(fEndTime);
		String beginTimePart = String.format("%tR", s.parse(fBeginTime));
		String endTimePart = String.format("%tR", s.parse(fEndTime));

		String currentPsnID = com.justep.oa.SysUtils
				.getCurrentPersonID();
		String currentPsnName = com.justep.oa.SysUtils
				.getCurrentPersonName();
		String currentPsnURL = com.justep.oa.SysUtils
				.getCurrentPersonMemberFID();
		String currentPsnFName = com.justep.oa.SysUtils
		.getCurrentPersonMemberFName();
		String id = java.util.UUID.randomUUID().toString();
		
		String sqlNewSchedule = "insert into OA_SD_Schedule s "
				+ "	(s.version, s, s.fTitle, s.fBeginDatePart, s.fBeginTimePart, s.fBeginTime, "
				+ "		s.fEndDatePart, s.fEndTimePart, s.fEndTime, s.fExecutors, "
				+ "		s.fCreatePsnID, s.fCreatePsnName, s.fCreateURL, s.fCreateTime, s.fIsShared) "
				+ "	values (0, '"+id+"', '"+fTitle+"',:fBeginDatePart,:fBeginTimePart,:fBeginTime,:fEndDatePart,:fEndTimePart,:fEndTime, " 
				+ "'"+currentPsnName+"','"+currentPsnID+"','"+currentPsnName+"','"+currentPsnURL+"',:fCreateTime, 1) ";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("fBeginDatePart",new java.sql.Date(beginTime.getTime()));
		param.put("fBeginTimePart", beginTimePart);
		param.put("fBeginTime", new java.sql.Timestamp(beginTime.getTime()));
		param.put("fEndDatePart", new java.sql.Date(endTime.getTime()));
		param.put("fEndTimePart", endTimePart);
		param.put("fEndTime",new java.sql.Timestamp(endTime.getTime()));
		param.put("fCreateTime", new java.sql.Timestamp(new java.util.Date().getTime()));
		KSQL.executeUpdate(sqlNewSchedule, param, OADataModel, null);
		
		String sqlNewExecutor = "insert into OA_SD_Executor e"
				+ "	(e.version, e, e.fSDMasterID, e.fExecutorID, e.fExecutorName, e.fExtendStr1) "
				+ "	values (0, guid(), '"+id+"','"+currentPsnID+"','"+currentPsnName+"','"+currentPsnFName+"') ";
		KSQL.executeUpdate(sqlNewExecutor, null, OADataModel, null);

		return id;
	}

	public static void deleteSchedule(String fID) {
		String sqlDelSchedule = "delete from OA_SD_Schedule s where s = '"+fID+"'";
		KSQL.executeUpdate(sqlDelSchedule, null, OADataModel, null);
		
		String sqlDelExecutor = "delete from OA_SD_Executor e where e.fSDMasterID = '"+fID+"'";
		KSQL.executeUpdate(sqlDelExecutor, null, OADataModel, null);
	}

	public static void deleteScheduleByBiz(String fBizID, String fBizType){
		String sqlDelSchedule = "delete from OA_SD_Schedule s where s.fBizID = '"+fBizID+"' and s.fBizType='"+fBizType+"'";
		KSQL.executeUpdate(sqlDelSchedule, null, OADataModel, null);
		
		String sqlDelExecutor = "delete from OA_SD_Executor e where e.fSDMasterID in (select s from OA_SD_Schedule s where s.fBizID = '"+fBizID+"' and s.fBizType='"+fBizType+"')";
		KSQL.executeUpdate(sqlDelExecutor, null, OADataModel, null);

	}

	public static void updateSchedule(String fID, String fTitle,String fBeginTime, String fEndTime) throws ParseException {
		SimpleDateFormat s = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
		java.util.Date beginTime = s.parse(fBeginTime);
		java.util.Date endTime = s.parse(fEndTime);
		DateFormat formatTime = new SimpleDateFormat("HH:mm");
				
		String ksql = "update OA_SD_Schedule s  set s.fTitle = '"+fTitle+"',s.fBeginDatePart = :fBeginDatePart,s.fBeginTimePart = :fBeginTimePart, s.fBeginTime=:fBeginTime, "
				+ "s.fEndDatePart = :fEndDatePart, s.fEndTimePart = :fEndTimePart, s.fEndTime = :fEndTime where s = '"+fID+"' ";
				
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("fBeginDatePart", new java.sql.Date(beginTime.getTime()));
		param.put("fBeginTimePart", formatTime.format(beginTime));
		param.put("fBeginTime", new java.sql.Timestamp(beginTime.getTime()));
		param.put("fEndDatePart", new java.sql.Date(endTime.getTime()));
		param.put("fEndTimePart", formatTime.format(endTime));
		param.put("fEndTime", new java.sql.Timestamp(endTime.getTime()));
		KSQL.executeUpdate(ksql, param, OADataModel, null);

	}

	public static String getCurrentPersonID() {
		return com.justep.oa.SysUtils.getCurrentPersonID();
	}

	public static Document getPortletData(String dateStr, String count){
		Document result = DocumentHelper.createDocument();
		Element items = result.addElement("items");
		int fCount = 0;
		Element itemsCount = items.addElement("COUNT");

			String sql = "";
			String currentPsnID = getCurrentPersonID();
			sql = "select s, s.fTitle, s.fBeginTime, s.fEndTime, s.fCreatePsnName, s.fContent FROM OA_SD_Schedule s"
					+ "	where s IN (select e.fSDMasterID FROM OA_SD_Executor e WHERE e.fExecutorID = '"+currentPsnID+"') "
					+ "	AND (s.fBeginDatePart < stringToDate('"+dateStr+"') OR s.fBeginDatePart = stringToDate('"+dateStr+"')) "
					+ " AND (s.fEndDatePart > stringToDate('"+dateStr+"') OR s.fEndDatePart = stringToDate('"+dateStr+"')) "
					+ "	ORDER BY  s.fBeginTimePart ASC limit 0,"+Integer.parseInt(count)+"";
			Table table = KSQL.select(sql, null, OADataModel, null);
			Iterator<Row> rows = table.iterator();
			while (rows.hasNext()) {
				Row rs = rows.next();
				Element item = items.addElement("items");
				Element key = item.addElement("FID");
				Element fTitle = item.addElement("FTITLE");
				Element fBeginTime = item.addElement("FBEGINTIME");
				Element fEndTime = item.addElement("FENDTIME");
				Element fCreatePsnName = item.addElement("FCREATEPSNNAME");
				Element fContent = item.addElement("FCONTENT");
				key.setText(rs.getString("s"));
				fTitle.setText(rs.getString("fTitle"));
				fBeginTime.setText(rs.getDateTime("fBeginTime").toString());
				fEndTime.setText(rs.getDateTime("fEndTime").toString());
				fCreatePsnName.setText(rs.getString("fCreatePsnName"));
				fContent.setText(rs.getString("fContent")==null?"":rs.getString("fContent"));
				fCount++;

			}
			itemsCount.setText(String.valueOf(fCount));

			return result;
	
	}

	public static void deleteScheduleExecutorsByID(String fMasterID) {
		String sql = "delete  from OA_SD_Executor e WHERE e.fSDMasterID='" + fMasterID + "'";
		KSQL.executeUpdate(sql, null, OADataModel, null);
	}


	public static String isValidate(String beginDate, String title,
			String name, String endDate) {
		String fTitle = "\n";
		beginDate = beginDate.substring(0, 10);
		endDate = endDate.substring(0, 10);

		String sql = "select s.fTitle from OA_SD_ScheduleEsp s where (s.fEndDatePart>=stringToDate('"
					+ beginDate+"') and s.fBeginDatePart<=stringToDate('" + beginDate + "')"
					+ "or s.fEndDatePart>=stringToDate('" + endDate + "')"
					+ "and s.fBeginDatePart<=stringToDate('" + endDate + "'))"
					+ " and s.fExecutors like '%" + name + "%'"
					+ " and s.fTitle = '" + title + "'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();		
			fTitle += rs.getString("fTitle") + "\n";
		}
		return fTitle;
	}

	public static String isValidatePerson(String fID,String rowID) {
		String fExecutorName = "";
		String sql = "select p.fExecutorName from OA_SD_especialSchedulePerson p where p.fExecutorID='"
				+ fID + "' and p <> '"+rowID+"'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			fExecutorName = rs.getString("fExecutorName");
		}
		return fExecutorName;
	}

	public static void deleteExecutorAndUpdateExecutor(String deleteId, String names) {
		String [] deleteIdAry = deleteId.split(",");
		String [] deleteNameAry = names.split(",");
		String sql = "";

		for (int i = 1; i < deleteIdAry.length; i++) {
            sql = "delete from OA_SD_Executor e where e.fExecutorID='"+deleteIdAry[i]+"'";
            KSQL.executeUpdate(sql, null, OADataModel, null);
		}
		for(int j=1;j<deleteNameAry.length;j++){
			sql = "update OA_SD_ScheduleEsp s  set s.fExecutors=replace(replace(replace(fexecutors,'"+deleteNameAry[j]+",',''),',"+deleteNameAry[j]+"',''),'"+deleteNameAry[j]+"','')";
			KSQL.executeUpdate(sql, null, OADataModel, null);
		}
	}



	public static String checkPerson(String fID,String rowID){
		String fExecutorName = "";
		String sql = "select p.fExecutorName from OA_SD_especialSchedulePerson p where p.fExecutorID='"
				+ fID + "' and p <> '"+rowID+"'";
		Table table = KSQL.select(sql, null, OADataModel, null);
		Iterator<Row> rows = table.iterator();
		while (rows.hasNext()) {
			Row rs = rows.next();
			fExecutorName = rs.getString("fExecutorName");
		}
		return fExecutorName;
	}


	public static Table queryOA_ScheduleMonth(List<DataPermission> range,String concept,String select,String from,String aggregate,String dataModel,String fnModel,String condition,Boolean distinct,String idColumn,String filter,Integer limit,Integer offset,String columns,String orderBy,String aggregateColumns,Map<String, Object> variables,String scheMonth,String schePerson){
		//schePerson未空，就使用当前人
		//scheType  0 本人  1 公开日程  2 领导日程
		
		String sPersonID = ContextHelper.getPerson().getID();
		String sPubSche = "";
		if (schePerson != null && !schePerson.equals("")) {
			if(!sPersonID.equals(schePerson))
				sPubSche = " and (OA_SD_Schedule.fIsShared is null or OA_SD_Schedule.fIsShared = 1)";
			sPersonID = schePerson;
		}
		
		
		if (scheMonth == null || scheMonth.equals("")) {
			scheMonth = CommonUtils.dateFormat(CommonUtils.getCurrentDate(),"yyyy-MM");
		}
		String scheMonthFirstDay = scheMonth + "-01";
		//不是当前人，表示正在查询公开日程或者领导日程，增加只显示公开日程的条件
	    HashMap<String, Object> params = new HashMap<String, Object>();
	    params.put("sPersonID", sPersonID);
	    params.put("scheMonthFirstDay", scheMonthFirstDay);
	    //查询日程表，查询月1日 >= 开始日期所在月1日    并且  （截止日期is null 或者 查询月1日<=截止日期）
	  //stringToDate(concat(getYear(OA_SD_Schedule.fBeginTime), '-', getMonth(OA_SD_Schedule.fBeginTime), '-01'))
	    
	    String ksql = "select OA_SD_Schedule.fBeginTime,OA_SD_Schedule.fEndTime,"
	        +" OA_SD_Schedule.fEndDatePart,OA_SD_Schedule.fCreatePsnID,"
	    	+" OA_SD_Schedule.fTitle,OA_SD_Schedule "
	    	+ " from OA_SD_Schedule OA_SD_Schedule where OA_SD_Schedule in "
	    	+ " (select OA_SD_Executor.fSDMasterID from OA_SD_Executor OA_SD_Executor where OA_SD_Executor.fExecutorID = :sPersonID)"
	    	+ " and stringToDate(:scheMonthFirstDay) >= stringToDate(concat(substring(dateTimeToString(fBeginTime),1,7), '-01'))"
	    	+ " and (OA_SD_Schedule.fEndDatePart is null or stringToDate(:scheMonthFirstDay) <= fEndDatePart)" + sPubSche;
	    
	  
	 //   System.out.println("==ksql=="+ksql);
		originalTable = KSQL.select(ksql, params, "/OA/schedule/data", null);

		// 在内存中构造日程的数据集
		List<String> names = new ArrayList<String>();
		names.add("fScheDay"); names.add("fTimePeriod");	names.add("fCreatePsnID"); names.add("fTitle");  names.add("fScheID"); names.add("fIsTitle");
		List<String> types = new ArrayList<String>();
		types.add("String"); types.add("String"); types.add("String"); types.add("String");  types.add("String");	types.add("String");
		// 创建table，names代表列，types代表列的类型
		scheTable = TableUtils.createTable(null, names, types);
		
		String sStartTime, sEndTime;
	
		Iterator<Row> it = originalTable.iterator();
		while (it.hasNext()){
		    originalRow = it.next();
		   
		    sStartTime = originalRow.getDateTime("fBeginTime").toString();
		    sEndTime = originalRow.getDateTime("fEndTime").toString();
			addNoRepearSche(scheMonth,sStartTime,sEndTime);
		
		}
		

		return sortTable(scheMonth);
	}
	
	/**
	 * 产生不重复的日程
	 */
		private static void  addNoRepearSche(String sScheMonth,String sStartTime,String sEndTime){
	    	String sScheDay = sStartTime.substring(0,10);
			addSche(sScheMonth,sScheDay,sStartTime,sEndTime);
		}
		/**
		 * 产生日程
		 * 计算日程时间段
		 * 如果是多天的日程，产生多个日程
		 */
	private static void  addSche(String sScheMonth,String sScheDay,String sStartTime,String sEndTime){
		String sTimePeriod;
		Date startDate = CommonUtils.toDate(sStartTime.substring(0,10));
		Date endDate = CommonUtils.toDate(sEndTime.substring(0,10));
		if(startDate.equals(endDate)){
			//日程时间段计算规则：如果开始时间和结束时间是同一天，则取出时间部分拼接
			sTimePeriod = sStartTime.substring(11,16) + "-" + sEndTime.substring(11,16);
			addOneDaySche(sTimePeriod, sScheDay);
		}else{
					//否则，先计算出结束时间-开始时间的天数差
					//日程日+开始时间的时间部分 + 日程日+天数差 +结束时间的时间部分
			 int delta = (int)CommonUtils.dateDiff("d", startDate, endDate);
			java.util.Date scheDay = CommonUtils.toDate(sScheDay);
			java.util.Date newEndDate = CommonUtils.addDays(scheDay, delta);
			String sNewEndDate = CommonUtils.dateFormat(newEndDate, "yyyy-MM-dd");
					
			sTimePeriod = sScheDay + " " + sStartTime.substring(11,16) + "-" + sNewEndDate + " " + sEndTime.substring(11,16);

			for(int i = 0;i<delta;i++){
				addOneDaySche(sTimePeriod,sScheDay);
				scheDay = CommonUtils.addDays(scheDay, 1);
				sScheDay = CommonUtils.dateFormat(scheDay, "yyyy-MM-dd");
			}
		}
	}
	/**
	 * 产生某天的日程时，判断是否大于等于开始日期，且小于等于截止日期，否则不产生日程
	 */
		private static void addOneDaySche(String sTimePeriod,String sScheDay){
			Date scheDay = CommonUtils.toDate(sScheDay);
			if(!scheDay.before(CommonUtils.toDate(originalRow.getDateTime("fBeginTime")))
				&& (originalRow.getDate("fEndDatePart") == null
				|| !scheDay.after(originalRow.getDate("fEndDatePart")))){
				Row row = scheTable.appendRow();
				row.setString("fTimePeriod", sTimePeriod);
				row.setString("fScheDay", sScheDay);
				row.setString("fIsTitle", "0");
				row.setString("fCreatePsnID", originalRow.getString("fCreatePsnID"));
				row.setString("fTitle", originalRow.getString("fTitle"));
				
				row.setString("fScheID", originalRow.getString("OA_SD_Schedule"));
			}
		}
		/**
		 * 重新生成一个排好序的table，遍历查询月的每一天，如果有记录，先生成标题记录，然后复制记录
		 */
			private static Table sortTable(String sScheMonth){
				// 在内存中构造日程的数据集
				List<String> names = new ArrayList<String>();
				names.add("fScheDay"); names.add("fTimePeriod");	names.add("fCreatePsnID"); names.add("fTitle");  names.add("fScheID"); names.add("fIsTitle");
				List<String> types = new ArrayList<String>();
				types.add("String"); types.add("String"); types.add("String"); types.add("String"); types.add("String");	types.add("String");
				// 创建table，names代表列，types代表列的类型
				Table sortTable = TableUtils.createTable(null, names, types);
				//设置查找列
				scheTable.getMetaData().setKeyColumn("fScheDay");

				Date scheMonth = CommonUtils.toDate(sScheMonth+"-01");
				Date scheMonthFirstDay = CommonUtils.getFirstDateOfMonth(scheMonth);
				Date scheMonthLastDay = CommonUtils.getLastDateOfMonth(scheMonth);
				java.util.Date currDate = scheMonthFirstDay;
				String sCurrDate;
				//遍历查询月的每一天
				while(!currDate.after(scheMonthLastDay)){
					sCurrDate = CommonUtils.dateFormat(currDate,"yyyy-MM-dd");
				    Collection<Row> rows = scheTable.getRows(sCurrDate);
				    if(rows.iterator().hasNext()){
				    	//存在某天的日程，则先增加标题行
						Row toRow = sortTable.appendRow();
						toRow.setString("fScheDay", CommonUtils.dateFormat(currDate, "yyyy-MM-dd"));
						toRow.setString("fIsTitle", "1");
				    }
				    for (Row fromRow : rows){
				    	//复制某天的记录
						Row toRow = sortTable.appendRow();
						toRow.setString("fTimePeriod", fromRow.getString("fTimePeriod"));
						toRow.setString("fScheDay", fromRow.getString("fScheDay"));
						toRow.setString("fIsTitle", "0");
						toRow.setString("fCreatePsnID", fromRow.getString("fCreatePsnID"));
						toRow.setString("fTitle", fromRow.getString("fTitle"));
						
						toRow.setString("fScheID", fromRow.getString("fScheID"));
				    }
					currDate = CommonUtils.addDays(currDate, 1);
				}
				return sortTable;
			}

			

}