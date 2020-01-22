package culturelandFront.controller.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.util.PropUtil;
import culturelandFront.core.value.JavaScript;


/**
 * 에러처리 
 * 
 * @author jin
 *
 */
@Controller
public class ErrorController  extends NdnAbstractController {
	
	private final Logger logger = Logger.getLogger(this.getClass());	

	/**
	 *  에러 화면
	 *  
	 */
    @RequestMapping(value="/error.do")
    public String handle(HttpServletRequest request, Exception exception,  Model model) {

    	String stateCode = (String) request.getAttribute("javax.servlet.error.status_code").toString();
    	
    	String page = "";
    	    	
    	if ( "404".equals(stateCode)){
    		return "exception/404";
    	}else{
    		
        	model.addAttribute("status", request.getAttribute("javax.servlet.error.status_code"));
        	model.addAttribute("reason", request.getAttribute("javax.servlet.error.message"));
        	
        	model.addAttribute("exception", exception);
        	model.addAttribute("url", request.getRequestURL());
        	model.addAttribute("client", request.getRemoteAddr());
        	model.addAttribute("type",  exception.getClass().getName() );
        	model.addAttribute("web_nomal_url" ,PropUtil.get("web.nomal.url") );
        	
        	logger.error(request.getAttribute("javax.servlet.error.status_code"));
        	logger.error(request.getAttribute("javax.servlet.error.message"));
        	logger.error(exception);
        	
        	exception.printStackTrace();
        	
    		return "exception/error";
    	}
        
    }
    
    
    
    
	/**
	 * ie8 버전 이하일 경우
	 */
	@RequestMapping( "/index_IE8.do" )
	public String index_ie8(
						HttpServletRequest request,
						@RequestParam Map param ,
						Model model
						) {
		
		return "/index_ie8";
	}
	
	/**
	 * 해당 권한이 없습니다.
	 */
	@RequestMapping( "/no_permission.do" )
	public String no_permission(
						HttpServletRequest request,
						@RequestParam Map param ,
						Model model
						) {
		JavaScript javaScript = new JavaScript();
		javaScript.message("해당 권한이 없습니다.");
		javaScript.script("history.back(-1);");
	
		return goScript(javaScript);
	}


}