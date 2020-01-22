package culturelandFront.core.util;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

/**
 * 세션 유틸
 * 
 * @author jin
 *
 */
public class SessionUtil {

	
	
	
	
	/**
	 * 세션을 맵으로
	 * session -> Map
	 * 
	 */
	public static Map sessionToMap(HttpSession session) throws Exception {
		
		Map entrySet = new HashMap();

        Enumeration enumeration = session.getAttributeNames();
        while (enumeration.hasMoreElements()) {
            String name = enumeration.nextElement().toString();
            Object value = session.getAttribute(name);
            entrySet.put(name,value);
        }
        
        return entrySet;
	}
	
	
	
	/**
	 * 세션 정리
	 * @desc 로그인시 저장하는 세션외 모두 삭제
	 * 
	 */
public static void sessionClear(HttpSession session) throws Exception {		

        Enumeration enumeration = session.getAttributeNames();
        while (enumeration.hasMoreElements()) {
            String name = enumeration.nextElement().toString();
            
            if ( !"loginVO".equals(name) &&  !"wishList".equals(name)  && !"myStep".equals(name)){		// 로그인시 저장하는 세션을 제외하고
            	session.setAttribute(name , "");
            }
            
        }        
	}


	
	
}
