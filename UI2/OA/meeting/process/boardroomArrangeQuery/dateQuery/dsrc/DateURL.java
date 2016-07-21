import java.io.File;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.justep.biz.client.Action;
import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.ActionResult;
import com.justep.biz.client.ActionUtils;
import com.justep.common.Utils;
import com.justep.filesystem.FileSystemWrapper;
import com.justep.ui.JProcessor;
import com.justep.ui.exception.UIException;
import com.justep.ui.util.NetUtils;
import com.justep.ui.util.UIUtils;

public class DateURL implements JProcessor {
	private static final String GET_DATA_ACTION = "getDateQueryDataAction";
	private static final String VIEW = "/UI2/OA/meeting/process/boardroomArrangeQuery/dateQuery/date_query.xhtml";
	private static final String PROCESS = "/OA/meeting/process/boardroomArrangeQuery/boardroomArrangeQueryProcess";
	private static final String ACTIVITY = "startActivity";

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Document data = getData(request);
		Document viewData = getView();
		String executor = NetUtils.getExecutor(request);
		if (executor == null) {
			executor = "";
		}
		data.getRootElement().addElement(NetUtils.EXECUTOR).addText(executor);
		Map<String, Object> params = new HashMap<String, Object>();
		Document result = UIUtils.xslt(viewData, data, params);
		UIUtils.ouputXHTML(request, response, result);
	}

	private Document getView() {
		try {
			String path = FileSystemWrapper.instance().getRealPath(VIEW);
			SAXReader reader = new SAXReader();
			return reader.read(new File(path));
		} catch (Exception e) {
			throw new UIException(e.getMessage(), e);
		}
	}

	private Document getData(HttpServletRequest request) {
			String xml = request.getParameter("xml-data-0");
			Document instance = null;
			ActionResult ar = null;
			try {
				instance = DocumentHelper.parseText(URLDecoder.decode(xml, "utf-8"));
				String beginDate = ((Element) instance.selectSingleNode("/form/date-begin")).getText();
				String endDate = ((Element) instance.selectSingleNode("/form/date-end")).getText();
				String roomID = ((Element) instance.selectSingleNode("/form/date-roomid")).getText();
				Action action = new Action();
				action.setProcess(PROCESS);
				action.setActivity(ACTIVITY);
				action.setName(GET_DATA_ACTION);
				action.setExecutor(NetUtils.getExecutor(request));
				action.setExecuteContext(NetUtils.getExecuteContext(request));
				
				action.setParameter("beginDate", beginDate);
				action.setParameter("endDate", endDate);
				action.setParameter("roomID", roomID);
				
				String bsessionID = NetUtils.getBSessionID(request);
				String language = NetUtils.getLanguage(request);
				ar = ActionEngine.invokeAction(action, ActionUtils.XML_CONTENT_TYPE, bsessionID, language, null);
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		return (Document) ar.getContent();
	}
}
