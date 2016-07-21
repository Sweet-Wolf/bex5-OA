import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.justep.biz.client.Action;
import com.justep.biz.client.ActionEngine;
import com.justep.biz.client.ActionResult;
import com.justep.biz.client.ActionUtils;
import com.justep.filesystem.FileSystemWrapper;
import com.justep.ui.JProcessor;
import com.justep.ui.exception.UIException;
import com.justep.ui.util.NetUtils;
import com.justep.ui.util.UIUtils;


public class SurveyTask implements JProcessor  {	
	private static final String GET_DATA_ACTION = "getSurveyTaskDataAction";
	private static final String VIEW = "/UI2/OA/survey/process/surveyTask/surveyTask.xhtml";
	private static final String PROCESS = "/OA/survey/process/surveyAnswer/surveyAnswerProcess";
	private static final String ACTIVITY = "surveyAnswerActivity";
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Document data = getData(request);
		Document viewData = getView();
		String executor = NetUtils.getExecutor(request);
		if (executor == null){
			executor = "";
		}
		data.getRootElement().addElement(NetUtils.EXECUTOR).addText(executor);
		Map<String, Object> params = new HashMap<String, Object>();
		System.out.println("data----"+data.asXML());
		Document result = UIUtils.xslt(viewData, data, params);
		UIUtils.ouputXHTML(request, response, result);
	}
	private Document getView(){
		try {
			String path = FileSystemWrapper.instance().getRealPath(VIEW);
			SAXReader reader = new SAXReader();
			return reader.read(new File(path));
		} catch (Exception e) {
			throw new UIException(e.getMessage(), e);
		}
	}
	private Document getData(HttpServletRequest request) {
		String paperID = request.getParameter("paperID");
		String task = request.getParameter("task");
		String surveyID = request.getParameter("surveyID");
		System.out.println("paperID ="+paperID+"--task="+task+"--surveyID="+surveyID);
		Action action = new Action();
		action.setProcess(PROCESS);
		action.setActivity(ACTIVITY);
		action.setName(GET_DATA_ACTION);
		action.setExecutor(NetUtils.getExecutor(request));
		action.setExecuteContext(NetUtils.getExecuteContext(request));
		action.setParameter("paperID", paperID);
		action.setParameter("task", task);
		action.setParameter("surveyID", surveyID);
		
		String bsessionID = NetUtils.getBSessionID(request);
		String language = NetUtils.getLanguage(request);
		ActionResult ar = ActionEngine.invokeAction(action, ActionUtils.XML_CONTENT_TYPE, bsessionID, language, null);
		return (Document)ar.getContent();
	}
}
