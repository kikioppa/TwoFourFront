package culturelandFront.controller.front;

import java.io.BufferedReader;

import java.io.IOException;
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

import culturelandFront.controller.front.ksnet.BankingController;
import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.util.NdnUtil;
import culturelandFront.core.util.PropUtil;
import culturelandFront.service.BannerService;
import culturelandFront.service.BoardService;
import culturelandFront.service.PurchaseService;
@Controller
public class IndexController extends NdnAbstractController {
	
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
/*	@RequestMapping( "/test.do")
	public String test	(
						HttpServletRequest request
						, Model model
						, @RequestParam Map param) {
	
		
		System.out.println("test입니다.");

		
		return  "/front/test";
	}	*/
	
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
	 * front_gnb 로고 붙이기
	 * */
	@RequestMapping("/tradeRequest.do")
	@ResponseBody
	public String tradeRequest(
			@RequestParam Map param ,
			Device device
			) throws Exception{
		
		JSONObject obj = new JSONObject();
		Map dataMap = new HashMap();
		
		String ksNetSeq = purchaseService.selectKsNetSeq();
		purchaseService.updateKsNetSeq();
		
		dataMap.put("ksNetSeq", String.valueOf(ksNetSeq));
		dataMap.put("accountNo", "110420392599");
		dataMap.put("bankCode", "088");
		
		HashMap applyMap = BankingController.transfer(dataMap);
		
		purchaseService.insertTradeRequest(applyMap);
		
		return obj.toString();
	}
	

	
}
