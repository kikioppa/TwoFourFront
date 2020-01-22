package culturelandFront.core.abstr;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.transaction.annotation.Transactional;

import culturelandFront.core.exception.AdminAuthException;
import culturelandFront.core.util.NdnUtil;
import culturelandFront.core.value.JavaScript;

@Transactional
public abstract class NdnAbstractController {

	@Autowired
	protected MessageSource resourceBundleMessageSource;
	
	@Autowired
	private HttpServletRequest request;
	
	public static final String ADMIN_URI = "/admin";
	
	public void checkAdminAuth(int auth) throws AdminAuthException {
		String[] auths = (String[])request.getAttribute("auths");
		if( !NdnUtil.convertString(auths[auth]).equals("1")) {
			throw new AdminAuthException();
		}
	}
	
	public String getMsg(String code) {
		//System.out.println(resourceBundleMessageSource.toString());
		
		return resourceBundleMessageSource.getMessage(code, null, Locale.getDefault());
	}
	
	public String getMsg(String code, String[] args) {
		return resourceBundleMessageSource.getMessage(code, args, Locale.getDefault());
	}
	
	
	public String goPage(String page) {
		JavaScript javaScript = new JavaScript();
		javaScript.location(page);
		return goScript(javaScript);
	}
	
	public String goPage(String page, String message) {
		JavaScript javaScript = new JavaScript();
		javaScript.location(page);
		javaScript.message(message);
		return goScript(javaScript);
	}
	
	public String goBack(String message) {
		JavaScript javaScript = new JavaScript();
		javaScript.script("window.history.back()");
		javaScript.message(message);
		return goScript(javaScript);
	}
	
	
	public String goScript(JavaScript javaScript) {
		request.setAttribute("javaScript", javaScript);
		return "forward:/common/javascript.do";
	}
	
	
}
