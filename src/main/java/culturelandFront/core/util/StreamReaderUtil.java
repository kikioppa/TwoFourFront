package culturelandFront.core.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.log4j.Logger;

 
/**
 * StreamReaderUtil
 * @author jsnoh
 * 
 */
public class StreamReaderUtil {	

	private static final Logger logger = Logger.getLogger(StreamReaderUtil.class);
	
	// 파라미터가 없을때
    public static String reader(String url) {
         
        String result = "";        
         
        result =  reader(url , "" );        
        
		return result;
    }
    
    
    // 파라미터가 있을때 , POST
    public static String reader(String url , String paramStr ) {
    	String result = "";   
    	
    	
        try {
            URL urlWeather = new URL(url); 
            HttpURLConnection httpURLConnection = (HttpURLConnection) urlWeather.openConnection();
            OutputStreamWriter wr = null;
            
            if ( !"".equals(paramStr)){
            	httpURLConnection.setDoOutput(true);
            	httpURLConnection.setRequestMethod("POST");
            	httpURLConnection.addRequestProperty("Content-Type", "text/xml; charset=utf-8");
            	
            	// BODY 영역에 쓰기
                wr = new OutputStreamWriter(httpURLConnection.getOutputStream());
                wr.write(paramStr);
                wr.flush();
            }
 
            if (httpURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {
 
                InputStreamReader inputStreamReader = new InputStreamReader(httpURLConnection.getInputStream());
                BufferedReader bufferedReader =  new BufferedReader(inputStreamReader);
                                
                StringBuffer strbuf =  new StringBuffer();
                String line = null;
                
                line = bufferedReader.readLine();
                while( line  != null){
                    strbuf.append(line);
                    line = bufferedReader.readLine();
                }
                 
                result = strbuf.toString();
                bufferedReader.close();   
               
 
            } else {
            	logger.error("Error in httpURLConnection.getResponseCode()!!!");
            	logger.error("connection :: "+url);
            }
 
            
            httpURLConnection.disconnect();            
            if ( !"".equals(paramStr)){
            	wr.close();
            }
            
            
        } catch (Exception ex) {        	
        	logger.error(ex.getMessage());
        	logger.error(url);
        	logger.error(paramStr);
        	
       
        }
    	
        logger.debug("return reader :" +result);
        
    	return result;
    }
    
     
}