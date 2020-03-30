package culturelandFront.controller.front.purchase;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import culturelandFront.core.util.NdnUtil;
import culturelandFront.core.util.PropUtil;
import culturelandFront.vo.UserVO;

public class RequestCheckController {
	
	public String appendSpace(String str, int len){
		int strLength = str.getBytes().length;
		String tempStr =str;
		if(strLength < len){
			int endCount = len-strLength;
			
			for(int i=0; i<endCount; i++){
				str=str+"";
			}
		} else if (strLength >len){
			byte[]temp = new byte[len];
			System.arraycopy(str.getBytes(),0,temp,0,len);
			str =new String(temp);
		}else{
	}
		return str;
}
	
	
	public HashMap<String, Object> CultureLogin(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param,Model model) throws Exception{
		UserVO user = (UserVO)session.getAttribute(PropUtil.get("session.user"));
		RequestCheckController as = new RequestCheckController();
		String MemberID = as.appendSpace(user.getId(), 20);
		String socketIp = PropUtil.get("fincode.check.ip");
		String HeadNo = "8310";
    	String MessageLength = "0442";
    	String MemberCode = "A009555     ";
    	String UserID = "lsi135790606        ";
    	String UserPW = "2E483FA0D9A00DFC3D8F6806D7851D77                  ";
    	String UserIP = socketIp;
//		UserVO MemberID = user;
    	String gap = "                                                                                                                                                                                                                                                                                                                                             "; 
    	
    	String resultCode = "";
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
//    	String ScrachNo ="2100000465111111";
//    	System.out.println("getTimeStamp() : " + NdnUtil.getTimeStampString("yyyyMMddHHmm") );
//    	System.out.println("getTimeStamp() day : " + NdnUtil.getTimeStampString("yyyyMMdd"));
//    	System.out.println("getTimeStamp() hour : " + NdnUtil.getTimeStampString("HHmmss"));
//    	System.out.println("socketIp : " + socketIp);
//    	System.out.println("code : " + code);
    	
    	String codeCheckData = HeadNo + MessageLength + MemberCode + UserID + UserPW + UserIP + MemberID + gap;
    	
    	System.out.println("socketIp : " + socketIp);
        try {
            //서버 접속
            Socket socket = new Socket(socketIp, 5984);

            //Server에 보낼 데이터 
            BufferedWriter bufWriter = 
            new BufferedWriter( new OutputStreamWriter( socket.getOutputStream()));
            
            // 전문 ID    submember  가맹점				 요청일자 회원 id 등등등									추적넘버		해시넘버				//  210000부터 상품권코드
            bufWriter.write(codeCheckData);
          //  bufWriter.newLine();
            bufWriter.flush();

            //Server가 보낸 데이터 출력
            BufferedReader bufReader =
            new BufferedReader( new InputStreamReader( socket.getInputStream(),"euc-kr"));
            
            String message = bufReader.readLine();
            resultCode = message.substring(66,70);
            System.out.println("Message : " + resultCode);
            
            resultMap.put("resultCode", resultCode);
            resultMap.put("returnMsg", message.replaceAll(" ", ""));
            
           /* String[] sp= message.split("");
            
            System.out.println("Message : " + sp[71] +sp[72]);*/

            System.out.println("Message : " + message );
            socket.close();
            bufReader.close();
            bufWriter.close();

          }

          catch( Exception e ){

            e.printStackTrace();

          }
		return resultMap;
	}


	
	}
	
