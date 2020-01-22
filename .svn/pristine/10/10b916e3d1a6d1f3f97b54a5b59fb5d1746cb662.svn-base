package culturelandFront.config;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import culturelandFront.core.util.PropUtil;
import culturelandFront.service.BoardService;

/**
 *	스케쥴러 
 *
 */
//@Profile("cultureland")	//실행 변수 - prod : 운영서버, default : 로컬
//@Profile("prod")	//실행 변수 - prod : 운영서버, default : 로컬
@Configuration
@EnableScheduling
public class ScheduledConfig {

	@Resource
	private BoardService boardService;
	
	//@Scheduled(fixedDelay = 1000)
	
//	@Scheduled(cron = "0/10 * * * * *")
//	@Scheduled(cron = "* * * * * *")
//	@Scheduled(cron = "30 0/30 * * * *")
	public void scheduleFixedDelayTask() throws IOException {
//	    System.out.println( "Fixed delay task - " + System.currentTimeMillis() / 1000);
		
	    HashMap param = new HashMap();
	    
	    HashMap pushMsg = (HashMap)boardService.selectPushMsg(param);
	    
	    if(pushMsg != null){
//	    	System.out.println("pushMsg : " + pushMsg.toString());
	    	List deviceList = boardService.selectPushDevice(param);
//	    	System.out.println("deviceList : " + deviceList.size());
	    	
	    	StringBuffer urlAddress = new StringBuffer();
	    	urlAddress.append("http://api.dkdk.co.kr:980/_jbft/api.php?f=sendPushAnd");
	    	urlAddress.append("&title=" + pushMsg.get("title")+"&message=" + pushMsg.get("message"));
	    	urlAddress.append("&push_flag=" + pushMsg.get("push_flag"));
	    	
	    	if(!"".equals(pushMsg.get("img_url")) && pushMsg.get("img_url") != null){
	    		//운영서버 반영 시, 운영서버 URL 입력
	    		urlAddress.append("&img_url=" + PropUtil.get("web.server.url") + "/upload" + pushMsg.get("img_url"));
	    	}
	    	
	    	if("U".equals(pushMsg.get("push_flag").toString())){
	    		urlAddress.append("&push_url=" + pushMsg.get("push_url"));
	    	}else if("D".equals(pushMsg.get("push_flag").toString())){
	    		urlAddress.append("&push_url=" + pushMsg.get("push_url") + "&contents_flag=" + pushMsg.get("contents_flag"));
	    	}
	    	
	    	
	    	for (int i = 0; i < deviceList.size(); i++) {
				HashMap deviceInfo = (HashMap)deviceList.get(i);
				urlAddress.append("&to=" + deviceInfo.get("push_token"));
				
				URL url = new URL(urlAddress.toString());
			    HttpURLConnection con = (HttpURLConnection)url.openConnection();
			    con.setUseCaches(false);
			    con.setDoOutput(true);
			    con.setDoInput(true);
			    
//			    System.out.println("urlAddress.toString() : " + urlAddress.toString());
			    
			    byte[] postDataBytes = urlAddress.toString().getBytes("UTF-8");
			    
			    con.getOutputStream().write(postDataBytes); // POST 호출
			    
		        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		 
		        String inputLine;
		        while((inputLine = in.readLine()) != null) { // response 출력
//		            System.out.println(inputLine);
		        }
		 
		        in.close();
				   
			}
	    	
	    	
	    }else{
//	    	System.out.println("없다");
	    }
	    
	    
	    
	}
	
	
}
