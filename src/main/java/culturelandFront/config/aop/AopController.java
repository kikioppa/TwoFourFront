package culturelandFront.config.aop;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.util.NdnUtil;
import culturelandFront.core.util.PropUtil;
import culturelandFront.core.util.StaticContextAccessor;
import culturelandFront.core.value.CodeMap;
import culturelandFront.core.value.MapValue;

/**
 *	AOP Controller
 *
 */
@Aspect
@Component
public class AopController extends NdnAbstractController{


	private final Logger logger = Logger.getLogger(this.getClass());	
	
	@Pointcut("execution(public * culturelandFront.service.*Impl.*(..))")
	private void commonChk() {}
	
	@Pointcut("execution(public * culturelandFront.service.*Impl.*(..)) || execution(public * culturelandFront.service.*Impl.*(..)) ")
	private void menuChk() {}
//	@Pointcut("execution(public * culturelandFront.controller..*(..))")
//	private void commonChk() {}
//	
//	@Pointcut("execution(public * culturelandFront.controller.front..*(..)) || execution(public * culturelandFront.controller.m..*(..)) ")
//	private void menuChk() {}
	
//	@Autowired 
//	private CacheManager cacheManager;
	
	@Before("commonChk()")
	public void aopService(){
		
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();		
		
		
		String curUrl = request.getRequestURL().toString();
		if (  NdnUtil.cntInStr(curUrl.toLowerCase() , ".json") == 0 ) {	// json은 안함
				
				CodeMap codeMap = new CodeMap();		
				MapValue mapValue = new MapValue();		

				request.setAttribute("web_server_url" ,PropUtil.get("web.server.url") );
				request.setAttribute("web_nomal_url" ,PropUtil.get("web.nomal.url") );
				request.setAttribute("web_ssl_url" ,PropUtil.get("web.ssl.url") );
				
				request.setAttribute("mobile_server_url" ,PropUtil.get("mobile.server.url") );
				request.setAttribute("mobile_nomal_url" ,PropUtil.get("mobile.nomal.url") );
				request.setAttribute("mobile_ssl_url" ,PropUtil.get("mobile.ssl.url") );
				
				request.setAttribute("imageupload_url" ,PropUtil.get("image.web.upload.url") );
				
				request.setAttribute("CodeMap" , codeMap);
				request.setAttribute("MapValue" , mapValue);
				request.setAttribute("getProfiles" , StaticContextAccessor.getProfiles());

		}
		
		
		
	}


	/**
	 * 메뉴 가져오기
	 * 
	 */
	@Before("menuChk()")
	public void getMenu() throws Exception {
		
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();
		
		
		String curUrl = request.getRequestURL().toString();
		if (  NdnUtil.cntInStr(curUrl.toLowerCase() , ".json") == 0) {	// json은 안함
				
				
		}
		
	}

}
