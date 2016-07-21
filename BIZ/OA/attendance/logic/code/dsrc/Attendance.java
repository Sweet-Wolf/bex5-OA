import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.naming.NamingException;

import com.alibaba.fastjson.JSONObject;
import com.justep.oa.SysUtils;
import com.justep.system.data.DatabaseProduct;
import com.justep.system.data.KSQL;
import com.justep.system.data.ModifyState;
import com.justep.system.data.Row;
import com.justep.system.data.SQL;
import com.justep.system.data.Table;
import com.justep.system.data.TableUtils;

public class Attendance {

	public static JSONObject queryCheckStat(String strDate) {
		JSONObject json = new JSONObject();
		// String fPersonID = SysUtils.getCurrentPersonID();
		String[] time = getCheckRuleTime().split("   ");
		Arrays.sort(time);
		
		String checkOutPMtime=time[0].split("-")[1] ;
		String checkInAMtime =time[0].split("-")[0] ;
		String checkTime = "";
		String strMistimeing = "";
		Table resultTable = TableUtils.createTable(null, "fID", "String", "fCheckTime", "String", "fStatus", "String", "fUnusualMistiming", "String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "fID");

		// 当月正常考勤
		String ksql1 = "select o as fID,dateTimeToString(o.fCheckOutPM) as checkTime \n" + "   from OA_ChekInOut o \n" + "  where o.fPersonID = :currentPersonID() AND o.fCheckOutPM like '" + strDate
				+ "%' and (o.fIsLate='' or o.fIsLate is null) and (o.fIsLeaving='' or o.fIsLeaving is null)  order by o.fCheckInAM";
		// 当月迟到
		String ksql2 = "select o as fID,dateTimeToString(o.fCheckInAM) as checkTime\n" + "   from OA_ChekInOut o \n" + "  where o.fPersonID = :currentPersonID() AND o.fCheckInAM like '" + strDate
				+ "%' and o.fIsLate='迟到' order by o.fCheckInAM";
		// 当月早退
		String ksql3 = "select o as fID,dateTimeToString(o.fCheckOutPM) as checkTime\n" + "   from OA_ChekInOut o \n" + "  where o.fPersonID = :currentPersonID() AND o.fCheckOutPM like '" + strDate
				+ "%' and o.fIsLeaving='早退' order by o.fCheckInAM";
		// 当月未打卡
		String ksql4 = "select o as fID,substring(dateTimeToString(o.fCheckInAM),1,10) as checkTime \n" + "   from OA_ChekInOut o \n"
				+ "  where o.fPersonID = :currentPersonID() AND o.fCheckInAM like '" + strDate + "%' and (o.fCheckOutPM='' or o.fCheckOutPM is null)  order by o.fCheckInAM";

		// 当月全部考勤
		String ksql5 = "select o as fID,dateTimeToString(o.fCheckInAM) as checkTime \n" + "   from OA_ChekInOut o \n" + "  where o.fPersonID = :currentPersonID() AND o.fCheckInAM like '" + strDate
				+ "%'  order by o.fCheckInAM";
		 
		
		
		//需要自定义日期范围。
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date oneDate;
		Date endDate;
		String firstDay = "";
		String endDay = "";
		try {
			oneDate = dateFormat.parse(strDate + "-01");
			endDate = getMonthEnd(dateFormat.parse(strDate + "-01"));
			firstDay = dateFormat.format(oneDate);
			endDay = dateFormat.format(endDate);
		} catch (ParseException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		}
		// 查询当月审批通过的请假，出差和外出 ，注意过滤时fStartTime必须《=当前月最后一天；fEndTime必须大于当月第一天。
		String ksqlLeave = " SELECT DateToString(dateTimeToDate(OA_WM_LeaveApply.fStartTime)) as fStartTime, \n"
                 + " DateToString(dateTimeToDate(OA_WM_LeaveApply.fEndTime)) as fEndTime \n"
                 + " FROM OA_WM_LeaveApply OA_WM_LeaveApply where OA_WM_LeaveApply.fApplyPersonID = :currentPersonID() \n" 
                 + " and DateToString(dateTimeToDate(OA_WM_LeaveApply.fStartTime)) <= '" + endDay 
                 + "' and DateToString(dateTimeToDate(OA_WM_LeaveApply.fEndTime))>='" + firstDay
				 + "' and OA_WM_LeaveApply.fBizState='bsFinished'"
		 
				 + "\n union \n"
				 
				 + " SELECT DateToString(dateTimeToDate(OA_WM_EvecApply.fSTARTTIME)) as fStartTime, \n"
				 + " DateToString(dateTimeToDate(OA_WM_EvecApply.fENDTIME)) as fEndTime \n"
				 + " FROM OA_WM_EvecApply OA_WM_EvecApply where OA_WM_EvecApply.fAPPLYPERSONID = :currentPersonID() \n"  
				 + " and DateToString(dateTimeToDate(OA_WM_EvecApply.fSTARTTIME)) <= '" + endDay 
				 + "' and DateToString(dateTimeToDate(OA_WM_EvecApply.fENDTIME))>='" + firstDay
				 + "' and OA_WM_EvecApply.fBizState='bsFinished'"
		
		         + "\n union \n"
		         
		         + "SELECT DateToString(dateTimeToDate(OA_WM_outApply.fSTARTTIME)) as fStartTime, \n"
		         + " DateToString(dateTimeToDate(OA_WM_outApply.fENDTIME)) as fEndTime \n"
		         + "FROM OA_WM_outApply OA_WM_outApply " + " WHERE  OA_WM_outApply.fAPPLYPERSONID = :currentPersonID() \n"  
		         + " and DateToString(dateTimeToDate(OA_WM_outApply.fSTARTTIME)) <= '" + endDay 
				 + "' and DateToString(dateTimeToDate(OA_WM_outApply.fENDTIME))>='" + firstDay
				 + "' and OA_WM_outApply.fBizState='bsFinished'";
 
		Table table1 = KSQL.select(ksql1, null, "/OA/attendance/data", null);
		Table table2 = KSQL.select(ksql2, null, "/OA/attendance/data", null);
		Table table3 = KSQL.select(ksql3, null, "/OA/attendance/data", null);
		Table table4 = KSQL.select(ksql4, null, "/OA/attendance/data", null);
		Table table5 = KSQL.select(ksql5, null, "/OA/attendance/data", null);
		
		//System.out.println("ksqlLeave:" + ksqlLeave); 
		Table tblLeave = KSQL.select(ksqlLeave, null, "/OA/workTime/data", null);
		
		Iterator<Row> iterator1 = table1.iterator();
		Iterator<Row> iterator2 = table2.iterator();
		Iterator<Row> iterator3 = table3.iterator();
		Iterator<Row> iterator4 = table4.iterator();
		Iterator<Row> iterator5 = table5.iterator();

		//所有的外出出差等信息。
		Iterator<Row> iteratorLeave = tblLeave.iterator();

		
		while (iterator1.hasNext()) {
			Row appendRow = resultTable.appendRow();
			Row info = iterator1.next();
			checkTime = info.getString("checkTime");

			appendRow.setString("fID", info.getString("fID"));
			appendRow.setString("fStatus", "正常考勤");
			appendRow.setString("fCheckTime", getDateFormat(checkTime, true));
			appendRow.setString("fUnusualMistiming", "");

			appendRow.setState(ModifyState.NONE);
		}

		while (iterator2.hasNext()) {
			Row appendRow = resultTable.appendRow();
			Row info = iterator2.next();
			checkTime = info.getString("checkTime");
			strMistimeing = getDateDiff(checkTime.substring(0, 10) + " " + checkInAMtime, checkTime);

			appendRow.setString("fID", info.getString("fID"));
			appendRow.setString("fStatus", "迟到");
			appendRow.setString("fCheckTime", getDateFormat(checkTime, true));
			appendRow.setString("fUnusualMistiming", "迟到" + strMistimeing);

			appendRow.setState(ModifyState.NONE);
		}

		while (iterator3.hasNext()) {
			Row appendRow = resultTable.appendRow();
			Row info = iterator3.next();
			checkTime = info.getString("checkTime");
			strMistimeing = getDateDiff(checkTime, checkTime.substring(0, 10) + " " + checkOutPMtime);

			appendRow.setString("fID", info.getString("fID"));
			appendRow.setString("fStatus", "早退");
			appendRow.setString("fCheckTime", getDateFormat(checkTime, true));
			appendRow.setString("fUnusualMistiming", "早退" + strMistimeing);

			appendRow.setState(ModifyState.NONE);
		}

		while (iterator4.hasNext()) {
			Row appendRow = resultTable.appendRow();
			Row info = iterator4.next();
			if (checkOutPMtime != null && !checkOutPMtime.equals("")) {
				checkTime = info.getString("checkTime") + " " + checkOutPMtime;
			} else {
				checkTime = info.getString("checkTime") + " 18:00:00";
			}

			appendRow.setString("fID", info.getString("fID"));
			appendRow.setString("fStatus", "未打卡");
			appendRow.setString("fCheckTime", getDateFormat(checkTime, true));
			appendRow.setString("fUnusualMistiming", "");

			appendRow.setState(ModifyState.NONE);
		}

		// 当月旷工判断
		boolean bln = false;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date = df.parse(strDate + "-01");
			Date monthEnd = getMonthEnd(df.parse(strDate + "-01"));
			Date nowDate = df.parse(df.format(new Date()));
			Calendar c = Calendar.getInstance();

			int i = 0;
			while (!date.after(monthEnd)) {
				c.setTime(date);
				int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
				if (date.before(nowDate) && dayOfWeek != 1 && dayOfWeek != 7) {
					bln = false;
					String monthDate = df.format(date);
					iterator5 = table5.iterator();
					
					//if (iterator5.hasNext()) { 有可能请几个月的假
						//在全部打卡中寻找，如果有打卡记录那么不算旷工
						while (iterator5.hasNext()) {
							Row info = iterator5.next();
							if (monthDate.equals(df.format(df.parse(info.getString("checkTime"))))) {
								bln = true;
								break;
							}
						}
						//如果全部打卡没找才在外出等中找
						if (!bln) {
							while (iteratorLeave.hasNext()) {
								Row info = iteratorLeave.next();
								Date dbegin = df.parse(info.getString("fStartTime"));
								Date dend = df.parse(info.getString("fEndTime"));
								//当前日期大于等于请假的开始日期 并且小于等于请假的结束日期
								if (date.compareTo(dbegin) >=0 && date.compareTo(dend) <=0 ) {
									bln = true;
									break;
								}
							}	
						}
						if (!bln) {
							Row appendRow = resultTable.appendRow();
							appendRow.setString("fID", "" + i++);
							appendRow.setString("fStatus", "旷工");
							appendRow.setString("fCheckTime", getDateFormat(monthDate, false));
							appendRow.setString("fUnusualMistiming", "");
							appendRow.setState(ModifyState.NONE);
						}
					/*} else {
						Row appendRow = resultTable.appendRow();
						appendRow.setString("fID", "" + i++);
						appendRow.setString("fStatus", "旷工");
						appendRow.setString("fCheckTime", getDateFormat(monthDate, false));
						appendRow.setString("fUnusualMistiming", "");
						appendRow.setState(ModifyState.NONE);
					}*/
				}
				date = getNextDay(date);
			}
		} catch (ParseException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

		json.put("attendanceData", resultTable);
		return json;
	}
	
	
	
	

	public static JSONObject queryCheckStatDept(String strDate) {
		JSONObject json = new JSONObject();
		Table resultTable = TableUtils.createTable(null, "fID", "String", "fOrgID", "String", "fOrgName", "String", "fDeptID", "String", "fDeptName", "String", "fOrgPersonCount", "String",
				"fActualPersonCount", "String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "fID");
		String strLike = "";
		String strTotal = "";
		String strActualTotal = "";
		String strActualOgn = "";
		String sFID = SysUtils.getCurrentDeptFID();
		if (sFID == null) {// 公司统计
			strLike = "AND SA_OPOrg.sFID like '" + SysUtils.getCurrentOrgFID() + "%dpt%'";
			strTotal = "select (:currentOgnID()) as fOrgID,(:currentOgnName()) as fOrgName,'' as fDeptID,'所有员工' as fDeptName,count(SA_OPOrg) as fPersonCount "
					+ "  from SA_OPOrg SA_OPOrg where SA_OPOrg.sOrgKindID = 'psm' " + strLike + "\n union \n";

			strActualOgn = " and  OA_ChekInOut.fOrgID  =  :currentOgnID() and OA_ChekInOut.fDeptID  <>  :currentOgnID()";
			strActualTotal = "select OA_ChekInOut.fOrgID as fOrgID,OA_ChekInOut.fOrgName as fOrgName,'' as fDeptID,'所有员工' as fDeptName,(count(OA_ChekInOut.fOrgID)) as fPersonCount "
					+ "  from OA_ChekInOut OA_ChekInOut " + " where OA_ChekInOut.fCheckInAM LIKE '" + strDate
					+ "%'  and  OA_ChekInOut.fOrgID  =  :currentOgnID() and OA_ChekInOut.fDeptID  <>  :currentOgnID() \n" + " union \n";

		} else {// 部门统计
			strLike = "AND SA_OPOrg.sFID like '" + sFID + "%'";
			strActualOgn = " and  OA_ChekInOut.fDeptID  =  :currentDeptID() ";
		}

		// 应到人数
		String allKsql = strTotal + "select p.fOrgID as fOrgID,p.fOrgName as fOrgName,p.fDeptID as fDeptID, p.fDeptName as fDeptName,count(p.fDeptName) as fPersonCount "
				+ "  from (select (:currentOgnID()) as fOrgID,(:currentOgnName()) as fOrgName,"
				+ "			(substring(replace(SA_OPOrg.sFID, :currentOgnFID(), ''), 2, instr(replace(SA_OPOrg.sFID, :currentOgnFID(), ''), '/', 2) - 6 )) as fDeptID,"
				+ " 		(substring(replace(SA_OPOrg.sFName, :currentOgnFName(), ''), 2, instr(replace(SA_OPOrg.sFName, :currentOgnFName(), ''), '/', 2) - 2 )) as fDeptName,"
				+ "			SA_OPOrg.sName as sName from SA_OPOrg SA_OPOrg where SA_OPOrg.sOrgKindID = 'psm' " + strLike + ") p group by p.fDeptName ";
		// 实到人数
		String actualKsql = strActualTotal
				+ "select OA_ChekInOut.fOrgID as fOrgID,OA_ChekInOut.fOrgName as fOrgName,OA_ChekInOut.fDeptID as fDeptID,OA_ChekInOut.fDeptName as fDeptName,(count(OA_ChekInOut.fDeptName)) as fPersonCount "
				+ " from OA_ChekInOut OA_ChekInOut where OA_ChekInOut.fCheckInAM LIKE '" + strDate + "%' " + strActualOgn + " group by OA_ChekInOut.fDeptID ";

		Table tableAll = KSQL.select(allKsql, null, "/system/data", null);
		Table tableActual = KSQL.select(actualKsql, null, "/OA/attendance/data", null);

		Iterator<Row> iterator1 = tableAll.iterator();
		Iterator<Row> iterator2 = tableActual.iterator();

		int i = 0;
		while (iterator1.hasNext()) {
			Row appendRow = resultTable.appendRow();
			Row info = iterator1.next();

			appendRow.setString("fID", "" + i++);
			appendRow.setString("fOrgID", info.getString("fOrgID"));
			appendRow.setString("fOrgName", info.getString("fOrgName"));
			appendRow.setString("fDeptID", info.getString("fDeptID"));
			appendRow.setString("fDeptName", info.getString("fDeptName"));
			appendRow.setString("fOrgPersonCount", "" + info.getInteger("fPersonCount"));
			appendRow.setString("fActualPersonCount", "0");

			appendRow.setState(ModifyState.NONE);
		}

		String strOrgID = "";
		String strDeptName = "";
		String srtActualCount = "";
		Iterator<Row> iteratorTable;
		while (iterator2.hasNext()) {
			Row info = iterator2.next();
			iteratorTable = resultTable.iterator();

			strOrgID = info.getString("fOrgID");
			strDeptName = info.getString("fDeptName");
			srtActualCount = "" + info.getInteger("fPersonCount");
			while (iteratorTable.hasNext()) {
				Row row = iteratorTable.next();
				if (row.getString("fOrgID").equals(strOrgID) && row.getString("fDeptName").equals(strDeptName)) {
					row.setString("fActualPersonCount", srtActualCount);
					break;
				}
			}
		}

		json.put("deptData", resultTable);
		return json;
	}

	public static JSONObject queryCheckSortStat(String strDeptID, String strDate) {

		JSONObject json = new JSONObject();
		String strDeptIDs = "";
		String strCheckInOutWhere = "";
		String strLeaveWhere = "";
		String strOtherWhere = "";
		
		
		String strAllWhere = ""; //取所有人的条件
		if (strDeptID == null || "".equals(strDeptID)) {
			strDeptID = SysUtils.getCurrentOgnID();
			strCheckInOutWhere = " and o.fOrgID = '" + strDeptID + "' and o.fDeptID  <>  '" + strDeptID + "'";
			strDeptIDs = getDeptIDs();
			strLeaveWhere = " and o.fApplyDeptID in (" + strDeptIDs + ")";
			strOtherWhere = " and o.fAPPLYDEPTID in (" + strDeptIDs + ")";
			strAllWhere = "AND SA_OPOrg.sFID like '%" + strDeptID + "%dpt%'";
		} else {
			strCheckInOutWhere = " and o.fDeptID = '" + strDeptID + "' ";
			strLeaveWhere = " and o.fApplyDeptID = '" + strDeptID + "' ";
			strOtherWhere = " and o.fAPPLYDEPTID = '" + strDeptID + "' ";
			strAllWhere = "AND SA_OPOrg.sFID like '%" + strDeptID + "%'";
		}
		Table resultTable = TableUtils.createTable(null, "fID", "String", "fOrgID", "String", "fOrgName", "String", "fDeptID", "String", "fDeptName", "String", "fPersonID", "String", "fPersonName",
				"String", "fStatus", "String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "fID");

		// 正常考勤
		String ksqlNormal = "select o as fID,o.fOrgID as fOrgID,o.fOrgName as fOrgName,o.fDeptID as fDeptID,o.fDeptName as fDeptName,o.fPersonID as fPersonID,o.fPersonName as fPersonName \n"
				+ "   from OA_ChekInOut o \n" + "  where o.fCheckOutPM like '" + strDate + "%' and (o.fIsLate='' or o.fIsLate is null) and (o.fIsLeaving='' or o.fIsLeaving is null) " + strCheckInOutWhere;
		// 迟到
		String ksqlLate = "select o as fID,o.fOrgID as fOrgID,o.fOrgName as fOrgName,o.fDeptID as fDeptID,o.fDeptName as fDeptName,o.fPersonID as fPersonID,o.fPersonName as fPersonName \n"
				+ "   from OA_ChekInOut o \n" + "  where o.fCheckInAM like '" + strDate + "%' and o.fIsLate='迟到'" + strCheckInOutWhere;
		// 早退
		String ksqlEarly = "select o as fID,o.fOrgID as fOrgID,o.fOrgName as fOrgName,o.fDeptID as fDeptID,o.fDeptName as fDeptName,o.fPersonID as fPersonID,o.fPersonName as fPersonName \n"
				+ "   from OA_ChekInOut o \n" + "  where o.fCheckOutPM like '" + strDate + "%' and o.fIsLeaving='早退'" + strCheckInOutWhere;
		// 未打卡
		String ksqlMissing = "select o as fID,o.fOrgID as fOrgID,o.fOrgName as fOrgName,o.fDeptID as fDeptID,o.fDeptName as fDeptName,o.fPersonID as fPersonID,o.fPersonName as fPersonName \n"
				+ "   from OA_ChekInOut o \n" + "  where o.fCheckInAM like '" + strDate + "%' and (o.fCheckOutPM='' or o.fCheckOutPM is null) " + strCheckInOutWhere;

		// 查询审批通过的请假
		String ksqlLeave = " select o as fID, \n"
				+ " case when o.fDeptPath is null then o.fApplyDeptID  else substring(o.fDeptPath, 2, instr(o.fDeptPath, '.')-2)  end as fOrgID , \n"
				+ " case when o.fDeptPath is null then o.fApplyDeptName  else ''  end as fOrgName , \n" 
				+ " case when o.fDeptPath is null then '' else o.fApplyDeptID  end as fDeptID   ,\n" 
				+ " case when o.fDeptPath is null then '' else o.fApplyDeptName  end as fDeptName ,\n" 
				+ " o.fApplyPersonID as fPersonID, o.fApplyPersonName as fPersonName \n" 
				+ " FROM OA_WM_LeaveApply o " + " WHERE DateToString(dateTimeToDate(o.fStartTime))<= '" + strDate + "' and DateToString(dateTimeToDate(o.fEndTime))>='" + strDate
				+ "' " + strLeaveWhere + "   and o.fBizState='bsFinished'";
		// 查询审批通过的出差
		String sqlOther = "select o as fID, \n"
				+ " case when o.fDEPTPATH is null then o.fAPPLYDEPTID  else substring(o.fDEPTPATH, 2, instr(o.fDEPTPATH, '.')-2)  end as fOrgID , \n"
				+ " case when o.fDEPTPATH is null then o.fAPPLYDEPTNAME  else ''  end as fOrgName , \n" 
				+ " case when o.fDEPTPATH is null then '' else o.fAPPLYDEPTID  end as fDeptID   ,\n" 
				+ " case when o.fDEPTPATH is null then '' else o.fAPPLYDEPTNAME  end as fDeptName ,\n" 
				+ " o.fAPPLYPERSONID as fPersonID, o.fAPPLYPERSONNAME as fPersonName \n" 
				+ " from OA_WM_EvecApply o \n"
				+ " WHERE o.fSTARTTIME  <= '" + strDate + "' and o.fENDTIME>='" + strDate + "' " + strOtherWhere + " and o.fBizState='bsFinished'";
		
		// 查询审批通过的外出
		String sqlOut = "SELECT  o as fID,  '' as fOrgID, '' as fOrgName, o.fAPPLYDEPTID as fDeptID , "
				+ "  o.fAPPLYDEPTNAME  as fDeptName , o.fAPPLYPERSONID as fPersonID,  o.fAPPLYPERSONNAME as fPersonName "
				+ " FROM OA_WM_outApply o " + " WHERE DateToString(dateTimeToDate(o.fSTARTTIME))<= '" + strDate
				+ "' and DateToString(dateTimeToDate(o.fENDTIME))>= '" + strDate + "'" + strOtherWhere + " and o.fBizState='bsFinished'";
		
		getResultTable(resultTable, ksqlNormal, "/OA/attendance/data", "正常考勤", "ksql");
		getResultTable(resultTable, ksqlLate, "/OA/attendance/data", "迟到", "ksql");
		getResultTable(resultTable, ksqlEarly, "/OA/attendance/data", "早退", "ksql");
		getResultTable(resultTable, ksqlMissing, "/OA/attendance/data", "未打卡", "ksql");
		getResultTable(resultTable, ksqlLeave, "/OA/workTime/data", "请假", "ksql");
		getResultTable(resultTable, sqlOther, "/OA/workTime/data", "出差", "ksql");
		getResultTable(resultTable, sqlOut, "/OA/workTime/data", "外出", "ksql");

		//查询部门下所有的人
		//增加的是迟到部分。取得部门所有的人，然后减去上述的就是。
		 

		String allKsql =  " select SA_OPOrg as fID,  (:currentOgnID()) as fOrgID,(:currentOgnName()) as fOrgName, \n	"
			+ "(substring(replace(SA_OPOrg.sFID, :currentOgnFID(), ''), 2, instr(replace(SA_OPOrg.sFID, :currentOgnFID(), ''), '/', 2) - 6 )) as fDeptID, \n" 
			+ " (substring(replace(SA_OPOrg.sFName, :currentOgnFName(), ''), 2, instr(replace(SA_OPOrg.sFName, :currentOgnFName(), ''), '/', 2) - 2 )) as  fDeptName \n"
	        + ",SA_OPOrg.sPersonID as fPersonID,SA_OPOrg.sName as fPersonName \n "
			+ " from SA_OPOrg SA_OPOrg  where SA_OPOrg.sOrgKindID = 'psm' \n" + strAllWhere ;
		
		//System.out.println("allKsql：" + allKsql);
		
		Iterator<Row> iterator;
		Iterator<Row> iteratorFind;
		iterator = KSQL.select(allKsql, null, "/system/data", null).iterator();
		 
		while (iterator.hasNext()) {
			//获取PersonId，比较PersonId即可。
			Row row = iterator.next();
			String PersonId = row.getString("fPersonID");
			boolean exists = false; //初始表示不存在。只有不存在下面的数据中才可以。
			
			iteratorFind = resultTable.iterator();
			while (iteratorFind.hasNext()) {
				Row rowFind = iteratorFind.next();
				if (rowFind.getString("fPersonID").equals(row.getString("fPersonID"))){
					exists = true;
					break;
				}
			}
			if (!exists){
				Row appendRow = resultTable.appendRow();
				appendRow.setString("fID", row.getString("fID"));
				appendRow.setString("fOrgID", row.getString("fOrgID"));
				appendRow.setString("fOrgName", row.getString("fOrgName"));
				appendRow.setString("fDeptID", row.getString("fDeptID"));
				appendRow.setString("fDeptName", row.getString("fDeptName"));
				appendRow.setString("fPersonID", row.getString("fPersonID"));
				appendRow.setString("fPersonName", row.getString("fPersonName"));
				appendRow.setString("fStatus", "旷工");
				appendRow.setState(ModifyState.NONE);
			}
			
		}
			
			json.put("sortData", resultTable);
			return json;
		}

	public static String getDeptIDs() {
		String strDeptIDs = "";
		String ksql = "select o as fID from SA_OPOrg o where o.sParent = :currentOgnID() and o.sOrgKindID='dpt'";
		Table table = KSQL.select(ksql, null, "/system/data", null);
		Iterator<Row> iterator = table.iterator();
		while (iterator.hasNext()) {
			Row info = iterator.next();
			strDeptIDs = strDeptIDs + "'" + info.getString("fID") + "',";
		}
		return strDeptIDs.substring(0, strDeptIDs.length() - 1);
	}

	public static String getCheckRuleTime() {
		String strTime = "";
		String personID = SysUtils.getCurrentPersonID();
		String ksql = "select OA_AttendanceWeek.fDepartTime as fDepartTime "
			  +" from OA_AttendanceWeek OA_AttendanceWeek "
			   +" where OA_AttendanceWeek.fAttendanceAdminID  =  (select OA_AttendanceAdmin from OA_AttendanceAdmin OA_AttendanceAdmin where OA_AttendanceAdmin.fAttendancePersonID LIKE '%"+personID+"%')";
		Table table = KSQL.select(ksql, null, "/OA/attendance/data", null);
		Iterator<Row> iterator = table.iterator();
		while (iterator.hasNext()) {
			Row info = iterator.next();
			strTime = info.getString("fDepartTime");
		}
		return strTime;
	}

	public static void getResultTable(Table table, String ksql, String strDataModel, String strStatus, String sqlType) {
		Iterator<Row> iterator;
		if (sqlType.equals("ksql")) {
			iterator = KSQL.select(ksql, null, strDataModel, null).iterator();
		} else {
			Map<String, String> sql = new HashMap<String, String>();
			sql.put(DatabaseProduct.DEFAULT.toString(), ksql);
			iterator = SQL.select(sql, null, strDataModel).iterator();
		}
		while (iterator.hasNext()) {
			Row appendRow = table.appendRow();
			Row row = iterator.next();
			appendRow.setString("fID", row.getString("fID"));
			appendRow.setString("fOrgID", row.getString("fOrgID"));
			appendRow.setString("fOrgName", row.getString("fOrgName"));
			appendRow.setString("fDeptID", row.getString("fDeptID"));
			appendRow.setString("fDeptName", row.getString("fDeptName"));
			appendRow.setString("fPersonID", row.getString("fPersonID"));
			appendRow.setString("fPersonName", row.getString("fPersonName"));
			appendRow.setString("fStatus", strStatus);

			appendRow.setState(ModifyState.NONE);
		}
	}

	private static Date getNextDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DATE, 1);
		return calendar.getTime();
	}

	private static Date getMonthEnd(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, 1);
		int index = calendar.get(Calendar.DAY_OF_MONTH);
		calendar.add(Calendar.DATE, (-index));
		return calendar.getTime();
	}

	public static String getDateDiff(String startTime, String endTime) {
		String strTime = "";
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date d1 = df.parse(startTime);
			Date d2 = df.parse(endTime);
			long diff = d2.getTime() - d1.getTime();
			long days = diff / (1000 * 60 * 60 * 24);
			long hours = (diff - days * (1000 * 60 * 60 * 24)) / (1000 * 60 * 60);
			long minutes = (diff - days * (1000 * 60 * 60 * 24) - hours * (1000 * 60 * 60)) / (1000 * 60);
			long second = (diff - days * (1000 * 60 * 60 * 24) - hours * (1000 * 60 * 60) - minutes * (1000 * 60)) / 1000;
			if (days >= 1) {
				strTime = days + "天" + hours + "小时" + minutes + "分钟" + second + "秒";
			} else if (hours >= 1) {
				strTime = hours + "小时" + minutes + "分钟" + second + "秒";
			} else if (minutes >= 1) {
				strTime = minutes + "分钟" + second + "秒";
			} else {
				strTime = second + "秒";
			}
		} catch (Exception e) {
		}
		return strTime;
	}

	public static String getDateFormat(String strDate, boolean hasHour) {
		String strDateTime = "";
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		DateFormat df2 = new SimpleDateFormat("yyyy年MM月dd日 E HH:mm:ss");
		if (!hasHour) {
			df = new SimpleDateFormat("yyyy-MM-dd");
			df2 = new SimpleDateFormat("yyyy年MM月dd日 E");
		}
		try {
			Date dt = df.parse(strDate);
			Calendar cal = Calendar.getInstance();
			cal.setTime(dt);
			int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
			if (w < 0)
				w = 0;
			strDateTime = df2.format(dt);
		} catch (ParseException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return strDateTime;
	}

	//查询当前人的班制以及班次，上、下班时间
	public static JSONObject  queryStartEndTime(){
		JSONObject json = new JSONObject();
		Table resultTable = TableUtils.createTable(null,"id", "String", "fAttendanceClass", "String", "fDeparting", "String", "fStartAM", "String", "fEndAM", "String", "fStartPM", "String","fEndPM", "String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "id");
		      //查班次时间
		      String ksql="select OA_AttendanceAdmin,OA_AttendanceAdmin.fAttendanceClass as fAttendanceClass,OA_AttendanceTime.fDepart as fDepart,OA_AttendanceTime.fStartAM as fStartAM,OA_AttendanceTime.fStartPM as fStartPM,OA_AttendanceTime.fEndAM as fEndAM,OA_AttendanceTime.fEndPM as fEndPM \n" 
				+"	from OA_AttendanceAdmin OA_AttendanceAdmin optional   join OA_AttendanceTime OA_AttendanceTime on OA_AttendanceAdmin = OA_AttendanceTime.fAttendanceAdminID "
				+" where OA_AttendanceAdmin = (select OA_ParticipateAttendancePerson.fAttendanceAdminID as fAttendanceAdminID from OA_ParticipateAttendancePerson OA_ParticipateAttendancePerson where OA_ParticipateAttendancePerson.fPersonID = :currentPersonID()) order by OA_AttendanceTime.fStartAM DESC";
		Table tableActual = KSQL.select(ksql, null, "/OA/attendance/data", null);
		
		Iterator<Row> iterator = tableActual.iterator();
		
		while(iterator.hasNext()) {
			Row appendRow = resultTable.appendRow();
			Row info = iterator.next();
			appendRow.setString("id",info.getString("OA_AttendanceAdmin"));
			appendRow.setString("fAttendanceClass",info.getString("fAttendanceClass"));
			appendRow.setString("fDeparting",info.getString("fDeparting"));
			appendRow.setString("fStartAM",info.getString("fStartAM"));
			appendRow.setString("fEndAM",info.getString("fEndAM"));
			appendRow.setString("fStartPM",info.getString("fStartPM"));
			appendRow.setString("fEndPM",info.getString("fEndPM"));
			appendRow.setState(ModifyState.NONE);
		}
		json.put("StartEndTime", resultTable);
		return json;
	}

	public static JSONObject queryAttendanceTime(String rowID){
		Table resultTable = TableUtils.createTable(null,"id", "String", "fDepart", "String", "fStartAM", "String", "fEndAM","String","fTime","String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "id");
		String ksql ="select OA_AttendanceTime.fDepart as fDepart,OA_AttendanceTime.fStartAM as fStartAM,OA_AttendanceTime.fEndAM as fEndAM"
			  +"  from OA_AttendanceTime OA_AttendanceTime"
			  +"  where OA_AttendanceTime.fOrgID  = '"+SysUtils.getCurrentOgnID()+"' and OA_AttendanceTime.fAttendanceAdminID = '"+rowID+"'"
			   +" order by OA_AttendanceTime.fDepart asc";

		Table table = KSQL.select(ksql, null, "/OA/attendance/data", null);

		Iterator<Row> iterator = table.iterator();

		String key = null;
		Row appendRow = null;
		while (iterator.hasNext()) {
			Row info = iterator.next();
			if (info.getString("fDepart") != null && info.getString("fDepart").equals(key)) {
				appendRow.setString("fTime",appendRow.getString("fTime") + "   " + info.getString("fStartAM") + "-" + info.getString("fEndAM"));
			} else {
				appendRow = resultTable.appendRow();
				appendRow.setString("fDepart", info.getString("fDepart"));
				key = info.getString("fDepart");
				appendRow.setString("fTime", info.getString("fStartAM") + "-" + info.getString("fEndAM"));
				appendRow.setState(ModifyState.NONE);
			}
			
		}

		JSONObject jo = new JSONObject();
		jo.put("DepartData", resultTable);
		return jo;
		
	}

	public static JSONObject queryGoWorkTime(){
		JSONObject json = new JSONObject();
		Table resultTable = TableUtils.createTable(null,"id","String","fOgnID", "String",  "fGoWorkTime", "String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "id");
		      //查班次时间
		      String ksql="select OA_AdvancedSetting,OA_AdvancedSetting.version as version,OA_AdvancedSetting.fGoWorkTime as fGoWorkTime,"
		    		  	+"OA_AdvancedSetting.fLateTime as fLateTime,OA_AdvancedSetting.fAbsentTime as fAbsentTime,OA_AdvancedSetting.fFirstEarlyTime as fFirstEarlyTime,"
		    		  	+"OA_AdvancedSetting.fOgnID as fOgnID,OA_AdvancedSetting.fOgnName as fOgnName,OA_AdvancedSetting.fCreatepreID as fCreatepreID,"
		    		  	+"OA_AdvancedSetting.fCreatepreName as fCreatepreName from OA_AdvancedSetting OA_AdvancedSetting  where OA_AdvancedSetting.fOgnID = :currentOgnID()";
		Table tableActual = KSQL.select(ksql, null, "/OA/attendance/data", null);
		
		Iterator<Row> iterator = tableActual.iterator();
		
		while(iterator.hasNext()) {
			Row appendRow = resultTable.appendRow();
			Row info = iterator.next();
			appendRow.setString("id",info.getString("OA_AdvancedSetting"));
			appendRow.setString("fOgnID",info.getString("fOgnID"));
			appendRow.setString("fGoWorkTime",info.getString("fGoWorkTime"));
			appendRow.setState(ModifyState.NONE);
		}
		json.put("GoWorkTime", resultTable);
		return json;
	}
	
	
	public static JSONObject queryOA_AttendanceGroup(String personID){
		JSONObject json = new JSONObject();
		Table resultTable = TableUtils.createTable(null,"fAttendanceID","String","fAttendanceGroupName", "String",  "fPersonNameS","String","fPersonNameSID","String","fPersonNameJ","String","fPersonNameJID","String","fAttendanceClass","String","fWeek","String","fDepart","String","fAMPM","String","fAttenAddrName","String","wifiName","String","wifiAddr","String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID,"fAttendanceID");
		
		String person="";
		//处理查询当前考勤人的考勤时间
		if(!personID.equals("1")){
			person = " and fAttendancePersonID like '%"+personID+"%'";
		}
		
		String ksql="select OA_AttendanceAdmin as fID,OA_AttendanceAdmin.fAttendanceClass as fAttendanceClass,OA_AttendanceAdmin.fAttendanceGroupName as fAttendanceGroupName,OA_AttendanceAdmin.fAttendanceTeamManager as fAttendanceTeamManager,OA_AttendanceAdmin.fAttendanceTeamManagerID as fAttendanceTeamManagerID,OA_AttendanceAdmin.fAttendancePersonName as fAttendancePersonName,OA_AttendanceAdmin.fAttendancePersonID as fAttendancePersonID "
						    +" from OA_AttendanceAdmin OA_AttendanceAdmin"
						    +" where OA_AttendanceAdmin.fOrgID  =  :currentOgnID()" + person;

		 String ksql_Adds= "";
		 String ksql_Week= "";
		 String fAttendanceID = "";
		 String fWeeks = "";
		 String sPersonCount = ""; //考勤组负责人
		 String sPersonCountID = ""; //考勤组负责人ID
		 int jPersonCount = 0; //参与考勤人名称
		 String jPersonCountID = ""; //参与考勤人ID
		 
		Table tableActual = KSQL.select(ksql, null, "/OA/attendance/data", null);
		Iterator<Row> iterator = tableActual.iterator();
		while(iterator.hasNext()) {
			Row appendRow = resultTable.appendRow();
			Row info = iterator.next();
			fAttendanceID = info.getString("fID");
			appendRow.setString("fAttendanceID",fAttendanceID);
			appendRow.setString("fAttendanceClass",info.getString("fAttendanceClass"));
			appendRow.setString("fAttendanceGroupName",info.getString("fAttendanceGroupName"));
			if( info.getString("fAttendanceTeamManager")!= null){
				sPersonCount = info.getString("fAttendanceTeamManager");
			}
			
			if( info.getString("fAttendanceTeamManagerID")!= null){
				sPersonCountID = info.getString("fAttendanceTeamManagerID");
				sPersonCountID=sPersonCountID.join(",");
			}else{
				sPersonCountID = "";
			}
			
			if( info.getString("fAttendancePersonName")!= null && !info.getString("fAttendancePersonName").equals("")){
				jPersonCount = info.getString("fAttendancePersonName").split(",").length;
			}else{
				jPersonCount = 0;
			}
			
			if( info.getString("fAttendancePersonID")!= null){
				jPersonCountID = info.getString("fAttendancePersonID");
				jPersonCountID = jPersonCountID.join(",");
			}else{
				jPersonCountID = "";
			}
		
			appendRow.setString("fPersonNameS",sPersonCount);
			appendRow.setString("fPersonNameSID",sPersonCountID);
			appendRow.setString("fPersonNameJ",jPersonCount+"人");
			appendRow.setString("fPersonNameJID",jPersonCountID);
			
			ksql_Week ="select OA_AttendanceWeek.fAttendanceAdminID as fAttendanceAdminID,OA_AttendanceWeek.fDepartID as fDepartID,OA_AttendanceWeek.fMonday as fMonday,OA_AttendanceWeek.fTuesday as fTuesday,OA_AttendanceWeek.fWednesday as fWednesday,OA_AttendanceWeek.fThursday as fThursday,OA_AttendanceWeek.fFriday as fFriday,OA_AttendanceWeek.fSaturday as fSaturday,OA_AttendanceWeek.fSunday as fSunday,OA_AttendanceWeek.fDepart as fDepart,OA_AttendanceWeek.fDepartTime as fDepartTime "
				  +"  from OA_AttendanceWeek OA_AttendanceWeek"
				  +"  where OA_AttendanceWeek.fAttendanceAdminID  = '"+fAttendanceID+"'";
					
			Table tableWeek = KSQL.select(ksql_Week, null, "/OA/attendance/data", null);
			Iterator<Row> iteratorWeek = tableWeek.iterator();
			String fDepart = "";
			String fDepartTime = "";
			if(iteratorWeek.hasNext()) {
				Row weekRow = iteratorWeek.next();
				fWeeks = "星期";
				if("true".equals(weekRow.getString("fMonday"))){
					fWeeks = fWeeks+"一";
				}
				if("true".equals(weekRow.getString("fTuesday"))){
					if(fWeeks.equals("星期")){
						fWeeks = fWeeks+"二";
					}else{
						fWeeks = fWeeks +"、二";
					}
				}
				if("true".equals(weekRow.getString("fWednesday"))){
					if(fWeeks.equals("星期")){
						fWeeks = fWeeks+"三";
					}else{
						fWeeks = fWeeks +"、三";
					}
				}
				if("true".equals(weekRow.getString("fThursday"))){
					if(fWeeks.equals("星期")){
						fWeeks = fWeeks+"四";
					}else{
						fWeeks = fWeeks +"、四";
					}
				}
				if("true".equals(weekRow.getString("fFriday"))){
					if(fWeeks.equals("星期")){
						fWeeks = fWeeks+"五";
					}else{
						fWeeks = fWeeks +"、五";
					}
				}
				if("true".equals(weekRow.getString("fSaturday"))){
					if(fWeeks.equals("星期")){
						fWeeks = fWeeks+"六";
					}else{
						fWeeks = fWeeks +"、六";
					}
				}
				if("true".equals(weekRow.getString("fSunday"))){
					if(fWeeks.equals("星期")){
						fWeeks = fWeeks+"日";
					}else{
						fWeeks = fWeeks +"、日";
					}
				}
				fDepart = weekRow.getString("fDepart");
				fDepartTime = weekRow.getString("fDepartTime");
			}
			appendRow.setString("fWeek",fWeeks);
			appendRow.setString("fDepart", fDepart);
			appendRow.setString("fAMPM", fDepartTime);
			
			
			ksql_Adds = "select oap.fAttendanceAdminID as fAttendanceAdminID,oap.fAttenAddrName as fAttenAddrName \n"
							+ "from OA_AttendanceMap oap\n"
							+ "where oap.fAttendanceAdminID =  '"+fAttendanceID+"'";
			Table tableAdds = KSQL.select(ksql_Adds, null, "/OA/attendance/data", null);
			Iterator<Row> iteratorAdds = tableAdds.iterator();
			String strAdds = "";
			while(iteratorAdds.hasNext()) {
				Row addsRow = iteratorAdds.next();
				if(strAdds.equals("")){
					strAdds = addsRow.getString("fAttenAddrName");
				}else{
					strAdds = strAdds + "、" +addsRow.getString("fAttenAddrName");
				}
			}
			appendRow.setString("fAttenAddrName",strAdds);
			
			String wifi_ksql = "select oaw.fWifiName as fWifiName,oaw.fMacAddress as fMacAddress from OA_AttendanceWifi oaw where oaw.fAttendanceAdminID = '"+fAttendanceID+"'";
			Table tableWifi = KSQL.select(wifi_ksql, null, "/OA/attendance/data", null);
			Iterator<Row> iteratorWifi = tableWifi.iterator();
			String wifiName = "";
			String fMacAddress = "";
			while(iteratorWifi.hasNext()){
				Row wifiRow = iteratorWifi.next();
				wifiName +=wifiRow.getString("fWifiName")+",";
				fMacAddress +=wifiRow.getString("fMacAddress")+",";
			}
			appendRow.setString("wifiName",wifiName);
			appendRow.setString("wifiAddr",fMacAddress);
			appendRow.setState(ModifyState.NONE);
		}
		
		json.put("AttendanceInfo", resultTable);
		return json;
	}

	public static void deleteAttendance(String deleteAll){
		String mainSql = "delete from OA_AttendanceAdmin where fID='"+deleteAll+"'";
		String wifiSql = "delete  from OA_AttendanceWifi where fAttendanceAdminID='"+deleteAll+"'";
		String mapSql = "delete  from OA_AttendanceMap where fAttendanceAdminID='"+deleteAll+"'";
		String timeSql = "delete  from OA_AttendanceTime where fAttendanceAdminID='"+deleteAll+"'";
		String weekSql = "delete  from OA_AttendanceWeek where fAttendanceAdminID='"+deleteAll+"'";
		
		
        com.justep.system.data.Transaction  tx = new com.justep.system.data.Transaction();
        Connection conn = null;
         PreparedStatement pstmt = null; 
        try {
			conn = tx.getConnection("/OA/attendance/data");
		 
			tx.begin();
            // 更新一个字段
            pstmt = conn.prepareStatement(mainSql);
            pstmt.execute();
            // 更新另一个字段
//            pstmt = conn.prepareStatement(personSql);
//            pstmt.execute();
             // 更新另一个字段
            pstmt = conn.prepareStatement(wifiSql);
            pstmt.execute();
             // 更新另一个字段
            pstmt = conn.prepareStatement(mapSql);
            pstmt.execute();
             // 更新另一个字段
            pstmt = conn.prepareStatement(timeSql);
            pstmt.execute();
             // 更新另一个字段
            pstmt = conn.prepareStatement(weekSql);
            pstmt.execute();
            tx.commit();
		} catch (NamingException e) {
			// TODO 自动生成的 catch 块
			try {
				tx.rollback();
			} catch (SQLException e1) {
				// TODO 自动生成的 catch 块
				e1.printStackTrace();
			}
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} finally {
		   if (null != pstmt) {
			   try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
		   }
		   if (null != conn) {
			   try {
				   if (!conn.isClosed()){
					   tx.closeConnections();
				   }
				} catch (SQLException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
		   }
        }
	}

	public static JSONObject queryPerson(String person,String rowID){
		String[] arr = person.split(",");
		JSONObject json = new JSONObject();
		Table resultTable = TableUtils.createTable(null,"fID","String","fPersonID", "String",  "fPersonName", "String","fAttendanceGroupName","String");
		resultTable.getProperties().put(Table.PROP_NAME_ROWID,"fID");
		
		String ksql = "select OA_AttendanceAdmin,OA_AttendanceAdmin.fAttendanceGroupName as fAttendanceGroupName,OA_AttendanceAdmin.fAttendancePersonName as fAttendancePersonName,OA_AttendanceAdmin.fAttendancePersonID as fAttendancePersonID"
			    +" from OA_AttendanceAdmin OA_AttendanceAdmin"
			   +"  where OA_AttendanceAdmin.fPersonID  =  :currentPersonID()  and  OA_AttendanceAdmin  <> '"+rowID+"'";
		
		Table tableActual = KSQL.select(ksql, null, "/OA/attendance/data", null);
		Iterator<Row> iterator = tableActual.iterator();

		while(iterator.hasNext()) {
			
			Row departRow = iterator.next();
			String mainID=departRow.getString("OA_AttendanceAdmin");
			String[] personID = departRow.getString("fAttendancePersonID").split(",");
			String[] personName = departRow.getString("fAttendancePersonName").split(",");
			String groupName = departRow.getString("fAttendanceGroupName");
			for(int i =0;i<arr.length;i++){
				for(int j=0;j<personID.length;j++){
					if(arr[i].equals(personID[j])){
						Row appendRow = resultTable.appendRow();
						appendRow.setString("fID", mainID);
						appendRow.setString("fPersonID", arr[i]);
						appendRow.setString("fPersonName", personName[j]);
						appendRow.setString("fAttendanceGroupName", groupName);
						appendRow.setState(ModifyState.NONE);
					}
				}
			}
			
		}
		json.put("person", resultTable);
		return json;
	}
}