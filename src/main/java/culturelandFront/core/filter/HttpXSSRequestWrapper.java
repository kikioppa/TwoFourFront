package culturelandFront.core.filter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.lang.StringEscapeUtils;

import culturelandFront.core.util.NdnUtil;

public class HttpXSSRequestWrapper extends HttpServletRequestWrapper {
	
	private Map<String, String[]> escapedParametersValuesMap = new HashMap<String, String[]>();

	public HttpXSSRequestWrapper(HttpServletRequest req){
		super(req);
	}

	@Override
	public String getParameter(String name){
		String[] escapedParameterValues = escapedParametersValuesMap.get(name);
		String escapedParameterValue = null; 
		if(escapedParameterValues!=null){
			escapedParameterValue = escapedParameterValues[0];
		}else{
			String parameterValue = super.getParameter(name);
			escapedParameterValue = org.springframework.web.util.HtmlUtils.htmlEscape(parameterValue);	
			escapedParameterValue = xssReplace(escapedParameterValue);	// 안되는게 많아서 한번 더 
			
			escapedParameterValue = StringEscapeUtils.escapeSql(escapedParameterValue);
			escapedParametersValuesMap.put(name, new String[]{escapedParameterValue});
		}//end-else
		
		return escapedParameterValue;
	}

	@Override
	public String[] getParameterValues(String name){
		String[] escapedParameterValues = escapedParametersValuesMap.get(name);
		if(escapedParameterValues == null){
			String[] parametersValues = super.getParameterValues(name);
			if( parametersValues != null ) {
				escapedParameterValues = new String[parametersValues.length];
	
				for(int i=0; i<parametersValues.length; i++){
					String parameterValue = parametersValues[i];
					String escapedParameterValue = parameterValue;
					
					// HTML transformation characters
					escapedParameterValue = org.springframework.web.util.HtmlUtils.htmlEscape(parameterValue);	
					escapedParameterValue = xssReplace(escapedParameterValue);	// 안되는게 많아서 한번 더 
					
					// SQL injection characters
					escapedParameterValue = StringEscapeUtils.escapeSql(escapedParameterValue);
					escapedParameterValues[i] = escapedParameterValue;
				}
				
				escapedParametersValuesMap.put(name, escapedParameterValues);
			}
		}
		
		return escapedParameterValues;
	}

	
    
    // 크로스 사이트 스크립트 방지
	public static String xssReplace(String oriStr ){
    	String replaceStr = oriStr;
    	
    	if( NdnUtil.isNotEmpty(oriStr) ) {
		    	replaceStr = replaceStr.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
		        replaceStr = replaceStr.replaceAll("\\(", "&#40;").replaceAll("\\)", "&#41;");
		        replaceStr = replaceStr.replaceAll("\"", "&quot;");
		        replaceStr = replaceStr.replaceAll("'", "&#39;");
		        replaceStr = replaceStr.replaceAll("%", "&#37;");
		        replaceStr = replaceStr.replaceAll("eval\\((.*)\\)", "");
		        replaceStr = replaceStr.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
		        replaceStr = replaceStr.replaceAll("script", "");
		        
		        
		        if ( NdnUtil.cntInStr(replaceStr.toLowerCase() , "onmouseover" ) > 0 ) {   replaceStr = replaceStr.toLowerCase().replaceAll("onmouseover", ""); }
		        if ( NdnUtil.cntInStr(replaceStr.toLowerCase() , "alert" ) > 0 ) {   replaceStr = replaceStr.toLowerCase().replaceAll("alert", ""); }
		   	 
    	}
        
    	return replaceStr;
    }
    
    
}
