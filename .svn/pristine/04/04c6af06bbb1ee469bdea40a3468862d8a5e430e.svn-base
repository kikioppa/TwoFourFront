package culturelandFront.config.interceptor;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.util.PropUtil;
import culturelandFront.core.value.MapValue;
import culturelandFront.service.GrantService;
import culturelandFront.service.LoginService;
import culturelandFront.vo.AdminUserVO;
import culturelandFront.vo.HistoryAdminloginVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	private final Logger logger = Logger.getLogger(this.getClass());	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
		
		//logger.debug("<< admin preHandle Method Execute >>");
		HttpSession session = request.getSession();
//		Object object = session.getAttribute(PropUtil.get("session.admin"));
//		if( object == null || !(object instanceof AdminUserVO) ) {
//			response.sendRedirect("/admin/login.do");
//			return false;
//		}
		
//		AdminUserVO adminUser = (AdminUserVO)request.getSession().getAttribute(PropUtil.get("session.admin"));
//		
//		request.setAttribute("adminUri", NdnAbstractController.ADMIN_URI);
//		request.setAttribute("admin", adminUser);
//		request.setAttribute("auths", adminUser.getAuth()  );
		
		//슈퍼관리자 접속 ip 제한
//		if(!isResult && "cultureland".equals(adminUser.getId())){
//			out.print("<script>location.href='/error.do';</script>");
//			out.flush();
//			return false;
//		}
		//슈퍼관리자 접속 ip 제한
		
		return true;
	}
	
	@Override
	public void postHandle(	HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) throws Exception {
		logger.debug("<< admin postHandle Method Execute >>");
		
//		AdminUserVO adminUser = (AdminUserVO)request.getSession().getAttribute(PropUtil.get("session.admin"));
//		String getUri = request.getRequestURI();
//		HashMap param = new HashMap();
//		param.put("action", getUri);
//		param.put("ip", getRemoteAddr(request));
//		param.put("adminid", adminUser.getId());
//		
//		loginService.insertAdminPageHis(param);
		
		request.setAttribute("ADMIN_MENU_1", MapValue.AUTH_MENU_1);
		request.setAttribute("ADMIN_MENU_2", MapValue.AUTH_MENU_2);
		
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
			Object handler, Exception ex) throws Exception {
		//logger.debug("<< admin preHandle Method Execute >>");
		
		
		
	}
	
	public static String getRemoteAddr(HttpServletRequest request){
		String ip = null;
		
		ip = request.getHeader("X-Forwarded-For");
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	    	ip = request.getHeader("X_Real-IP");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	    	ip = request.getHeader("X_RealIP");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	    	ip = request.getHeader("REMOTE_ADDR");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getRemoteAddr();
	    }
	    
		return ip;
	}
}
	