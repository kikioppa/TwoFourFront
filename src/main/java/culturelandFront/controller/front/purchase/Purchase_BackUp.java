package culturelandFront.controller.front.purchase;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.util.HashMap;

import culturelandFront.core.util.NdnUtil;
import culturelandFront.core.util.PropUtil;

public class Purchase_BackUp {

	
	
	public HashMap<String, Object> finCodeCheck(String code){
		String socketIp = PropUtil.get("fincode.check.ip");
		String HeadNo = "9110";
    	String MessageLength = "0442";
    	String MemberCode = "A009555     ";
    	String SubMemberCode = "cult                ";
//    	String TransNo = "201911120001";
//    	String SendDate = "20191210";
//    	String SendTime = "162601";
    	String TransNo = NdnUtil.getTimeStampString("yyyyMMddHHmm");				//추적시간 : 현재날짜시간으로 설정함
    	String SendDate = NdnUtil.getTimeStampString("yyyyMMdd");					//전송날짜 : 년월일
    	String SendTime = NdnUtil.getTimeStampString("HHmmss");						//전송시간 : 시분초
    	String UserId = "lsi135790606        ";
    	String CustId = "95413062    ";
    	String HashNo ="3700e7dd8b47abbcff7881fb8";
    	String gap = "                                                                                                                                                                                                                                                                                                                       "; 
    	String resultCode = "";
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
//    	String ScrachNo ="2100000465111111";
//    	System.out.println("getTimeStamp() : " + NdnUtil.getTimeStampString("yyyyMMddHHmm") );
//    	System.out.println("getTimeStamp() day : " + NdnUtil.getTimeStampString("yyyyMMdd"));
//    	System.out.println("getTimeStamp() hour : " + NdnUtil.getTimeStampString("HHmmss"));
//    	System.out.println("socketIp : " + socketIp);
//    	System.out.println("code : " + code);
    	
    	String codeCheckData = HeadNo + MessageLength + MemberCode + SubMemberCode + TransNo + SendDate + SendTime + UserId + CustId + HashNo + code + gap;
    	
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
