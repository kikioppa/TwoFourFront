package culturelandFront.core.util;


import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * json Util
 * @author jin
 *
 */
public class JsonUtils {

	/**
	 * Json - > Map 
	 * 
	 * @param jObj
	 * @return
	 * @throws Exception
	 */
    public static HashMap getJsonMap(JSONObject jObj ) throws Exception {                
                            
                Iterator iter = jObj.keySet().iterator();
                HashMap map = new HashMap();
                while(iter.hasNext()){
                    String key = (String)iter.next();
                    map.put(key, NdnUtil.checkNull(jObj.get(key)));
                }
                
        return map;
    }

    
    /**
     * String -> Map
     * 
     * @param paramStr
     * @return
     * @throws Exception
     */
	public static Map<String, Object> getJsonMap(String paramStr) throws Exception {
		
		JSONParser parser = new JSONParser();
		JSONObject jsonObject;
		
		
		jsonObject = (JSONObject) parser.parse(paramStr);
		
		
		return getJsonMap(jsonObject) ;
	}

	
	
}
