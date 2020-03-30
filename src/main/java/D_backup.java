

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.util.NdnUtil;
import culturelandFront.service.BannerService;
import culturelandFront.service.BoardService;
import culturelandFront.service.PurchaseService;
@Controller
public class D_backup extends NdnAbstractController {
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private BannerService bannereService;
	
	@Resource
	private PurchaseService purchaseService;
	
	/**
	 * front 메인 
	 * 
	 */
	@RequestMapping(value={"/index.do", "/m/index.do"})
	public String index	(
						HttpServletRequest request
						, Model model
						, @RequestParam Map param
						,Device device) {

		List<Map> bannerList = new ArrayList<Map>();
		List<Map> purchaseList = new ArrayList<Map>();
		List<Map> noticeList = new ArrayList<Map>();
		List<Map> faqList = new ArrayList<Map>();
		
		if(device.isMobile()){	//모바일 화면
			param.put("PLAY_GUBUN", "M");
		}else{					//WEB 화면
			param.put("PLAY_GUBUN", "P");
		}

		bannerList = bannereService.getSelectBannerList(param);
		purchaseList = purchaseService.getSelectIndexPurchaseList(param);
		noticeList = boardService.getSelectIndexNoticeBoardList(param);
		faqList = boardService.getSelectIndexFaqBoardList(param);
		double charge = boardService.selectCharge(param);

		model.addAttribute("bannerList", bannerList);
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("faqList", faqList);
		model.addAttribute("charge", charge);
		
		System.out.println("userIp : " + NdnUtil.getRemoteAddr(request));
		
		if(device.isMobile()){	//모바일 화면
			return  "/mobile/index";
		}else{					//WEB 화면
			return  "/front/index";
		}
		
	}	
	
	/**
	 * front 메인 
	 * 
	 */
	@RequestMapping( "/test.do")
	public String test	(
						HttpServletRequest request
						, Model model
						, @RequestParam Map param) {
	
		
		System.out.println("test입니다.");

		
		return  "/front/test";
	}	
	
	/**
	 * front 메인 
	 * 
	 */
	@RequestMapping( "/test2.do")
	public String tes2	(
			HttpServletRequest request
			, Model model
			, @RequestParam Map param) {
		
		
		System.out.println("param : " + param.toString() + "    param token : " + param.get("token"));
		
		
		try {
		    String apiURL = "https://auth.logintalk.io/exchange?token="+param.get("token");
		      URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      System.out.print("responseCode="+responseCode);
		      if(responseCode==200) {
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		        System.out.println("res.toString() : " + res.toString());
		      }
		      
		    } catch (Exception e) {
		      System.out.println(e);
		    }

		
		
		model.addAttribute("param", param);
		
		
		return  "/front/test2";
	}	
	
	/**
	 * front_gnb 로고 붙이기
	 * */
	@RequestMapping("/logo.json")
	@ResponseBody
	public String logo(
			@RequestParam Map param ,
			Device device
			) throws Exception{
		
		JSONObject obj = new JSONObject();
		
		if(device.isMobile()){	//모바일 화면
			param.put("PLAY_GUBUN", "M");
		}else{					//WEB 화면
			param.put("PLAY_GUBUN", "P");
		}
		
		obj.putAll((HashMap)bannereService.selectLogo(param));
		
		return obj.toString();
	}
	
	/**
	 * front 메인 
	 * 
	 */
	@RequestMapping( "/tradeRequest.do")
	public String tradeRequest	(
						HttpServletRequest request
						, Model model
						, @RequestParam Map param) {
	
		
		HashMap map = new HashMap();
		
		String reqDate = NdnUtil.getTimeStampString("yyyyMMdd");
		String reqTime = NdnUtil.getTimeStampString("HHmmss");
		String sendDate = NdnUtil.getTimeStampString("yyyyMMdd"); // 전송날짜 :
		
		//공통부 100
    	String classify = "         ";				//식별코드 			*9
    	String company = "FACTOLE1";				//업체코드			*8
    	String commonBankCode2 = "  ";		//은행코드2			*2
    	String message1 = "0600";//메세지코드			*4
    	String gubun = "400"; 			//업체구분			*3
    	String songsin = "1";					//송신횟수 고정값 '1'	*1
    	String preamble = "109923";				//전문번호			*6  업체코드(1) + 은행코드3(3) + 전송일자의 일(2)
    	String SendDate = reqDate;			//전송일자			*8
    	String SendTime = reqTime;				//전송시간			*6
    	String Response = "    ";				//응답코드			*4
    	String BankResponse = "    ";			//은행 응답코드		*4
    	String InquiryDate = "        ";		//조회일자			*8
    	String InquiryNumber = "      ";		//조회번호			*6
    	String BankNumber = "               ";	//은행 전문번호		*15
    	String commonBankCode3 = "099";		//은행코드3			*3
    	String spare = "             ";			//예비			*13
    	
    	String commonCode = classify + company + commonBankCode2 + message1 + gubun + songsin + preamble + SendDate + SendTime + Response
    			 			+ BankResponse + InquiryDate + InquiryNumber + BankNumber + commonBankCode3 + spare;
    	System.out.println("commonCode : " + commonCode.length());
    	System.out.println("commonCode : " + commonCode.getBytes().length);
    	
    	//개별부 200
    	String BusinessDate = reqDate.substring(4);	//거래일자			*4
    	String BankCode2 = "  ";	//은행코드2 (똑같음)			*2
    	String AccountNumber = "110420392599    ";	//계좌번호			*16
    	String AccountName = NdnUtil.spaceAdd(22);	//예금주명			*22
    	String IdNumber = NdnUtil.spaceAdd(13);	//신원확인번호			*13
    	String IdCheck = "  ";	//신원확인번호 체크			*2
    	String CompanyAccountNo = NdnUtil.spaceAdd(20);	//업체 계좌번호			*20
    	String BankCode3 = "088";	//은행코드3			*3
    	String amount = NdnUtil.spaceAdd(13);	//금액			*13
    	String InquiryDotcom = " ";	//닷컴통장 조회			*1
    	String CertificationType = " ";	//당/타행 인증유형			*1
    	String NHgubun = " ";	//농협계좌구분			*1
    	String spare2 = NdnUtil.spaceAdd(102);	//예비			*102
		
		String devCode = BusinessDate + BankCode2 + AccountNumber + AccountName + IdNumber + IdCheck + CompanyAccountNo + 
				BankCode3 + amount + InquiryDotcom + CertificationType + NHgubun + spare2;
		
		System.out.println("devCode : " + devCode.length());
    	System.out.println("devCode : " + devCode.getBytes().length);
				
    	String sendMsg = commonCode + devCode;
		
		
		System.out.println("sendMsg : " + sendMsg.replaceAll(" ", "_"));
		System.out.println("BusinessDate : " + BusinessDate);
		
		
		
		
		
		
		
		
		
		
		
		map.put("reqDate", reqDate);		//요청일자
		map.put("reqTime", reqTime);		//요청시간
		map.put("svcType", "FCS");			//서비스타입
		map.put("bankCode", commonBankCode3);		//은행코드
		map.put("compCode", "FACTOLE1");		//업체코드(은행에서 부여)
		map.put("seqNo", "000001");			//전문일련번호
		map.put("msgCode", "0600400");		//전문구분 (개시)
		map.put("sendFlag", "N");			//전송여부
		map.put("recvFlag", "N");			//응답수신여부
		map.put("sendDate", sendDate);		//송신일자
		map.put("sendTime", null);			//송신시간
//		map.put("recvDate", null);			//수신일자
//		map.put("recvTime", null);			//수신시간
		map.put("sendMsg", sendMsg);		//요청전문
//		map.put("recvMsg", null);			//응답전문
		
		purchaseService.insertTradeRequest(map);
		
		
		return  "/front/test";
	}
	
}
