package culturelandFront.controller.front;

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

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import culturelandFront.service.AccountService;
import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.service.BoardService;
import culturelandFront.service.PurchaseService;
import culturelandFront.service.StatisticsService;
@Controller
public class IndexController extends NdnAbstractController {
	
	
	@Resource
	private AccountService accountService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private PurchaseService purchaseService;
	
	@Resource
	private StatisticsService statisticsService;
	
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

		List<Map> noticeList = new ArrayList<Map>();
		List<Map> faqList = new ArrayList<Map>();

		noticeList = boardService.getSelectIndexNoticeBoardList(param);
		faqList = boardService.getSelectIndexFaqBoardList(param);
		double charge = boardService.selectCharge(param);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("faqList", faqList);
		model.addAttribute("charge", charge);
		
		System.out.println("index입니다.");
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "22");
		System.out.println("device.isMobile() : " + device.isMobile());
		
		
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
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "22");

		
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
		
		JSONObject obj = new JSONObject();
	
		System.out.println("param : " + param.toString() + "    param token : " + param.get("token"));
		
		System.out.println();
	
		
		int result = 0;
		
	
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
		        //result = accountService.insertAccount(param);
		      } else {
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);

		      }
		   /*   Map<String, Object> rs = new ObjectMapper().readValue(res.toString(), Map.class) ;
		      Map<String, Object> name = (Map)rs.get("name") ;
		    */  br.close();
		      if(responseCode==200) {
		        System.out.println("res.toString() : " + res.toString());
		        System.out.println(param.get("memberName"));
		    /*    if(name == (param.get("memberName"))){
		    */    	 result = accountService.insertAccount(param);
		       }
		        System.out.println(obj);
		      
		    } catch (Exception e) {
		      System.out.println(e);
		    }

		
		
		model.addAttribute("param", param);
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "22");
		
		
		return  "/front/test2";
	}	
}
