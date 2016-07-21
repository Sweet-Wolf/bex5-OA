import java.math.*;
import java.sql.*;
import java.util.*;

import org.dom4j.*;

import com.alibaba.fastjson.JSONObject;
import com.justep.system.data.*;

public class WorkHome {


	public static Table queryWorks(){
//		
		Table resultTable = TableUtils.createTable(null, "fID","String","fLabel","String",
					"fIconClass","String","fProcess","String","fActivity","String","fUrl",
					"String","fColor","String");
		
		resultTable.getProperties().put(Table.PROP_NAME_ROWID, "fID");
		
		String ksql = "select distinct wf.* \n" +
					 "   from OA_WorkFavorite wf \n" +
					 "   where wf.fPresonID = :currentPersonID() and wf.fDevicesType='m' \n" +
					 "   order by wf.fLabel asc";
		
		Table table =  KSQL.select(ksql, null, "/OA/workHome/data", null);
		Iterator<Row> iterator = table.iterator();
		while(iterator.hasNext()) {
			Row appendRow = resultTable.appendRow();
			Row info = iterator.next();
			appendRow.setString("fID",info.getString("wf"));
			appendRow.setString("fLabel",info.getString("fLabel"));
			appendRow.setString("fIconClass","");
			appendRow.setString("fColor","");
			appendRow.setString("fProcess",info.getString("fProcess"));
			appendRow.setString("fActivity",info.getString("fActitvty"));
			appendRow.setString("fUrl",info.getString("fUrl"));
			appendRow.setState(ModifyState.NONE);
		}
		return resultTable;
	}
}