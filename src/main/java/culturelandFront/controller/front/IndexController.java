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
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import culturelandFront.service.AccountService;
import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.util.NdnUtil;
import culturelandFront.core.util.PropUtil;
import culturelandFront.service.BoardService;
import culturelandFront.service.LoginService;
import culturelandFront.service.PurchaseService;
import culturelandFront.service.StatisticsService;
import culturelandFront.vo.AdminUserVO;
import culturelandFront.vo.UserVO;
@Controller
public class IndexController extends NdnAbstractController {
	
	
	@Resource
	private LoginService loginService;
	
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
	 * 
	 * 아이디 찾기
	 * 
	 * 
	 * */

	@RequestMapping( "/test3.do")
	public String tes3	(
			HttpServletRequest request
			, Model model
			, @RequestParam Map param) {

		ObjectMapper mapper = new ObjectMapper();
		Map resultMap = new HashMap();
		int result = 0;
		List idList = new ArrayList();
	
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
		    	System.out.println("inputLine : " + inputLine);
		        res.append(inputLine);
		    
		      }
		      br.close();
		      if(responseCode==200) {
		    			idList = accountService.findId(param);
		     
						model.addAttribute("idList", idList);
		    			System.out.println("아이디 :  "+ param.toString());
		    			System.out.println("아이디 22:  " +idList);
		    
		       }
		     }catch (Exception e) {
		      System.out.println(e);
		    }

		
		
		model.addAttribute("param", param);
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "22");
		
		
		return  "/front/test3";
	}	
	
	/**
	 * front 메인 
	 * 
	 *//*
	@RequestMapping( "/test.do")
	public String test	(
						HttpServletRequest request
						, Model model
						, @RequestParam Map param) {
	
		
		System.out.println("test입니다.");
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "22");

		
		return  "/front/test";
	}	*/
	
	/**
	 * 회원가입 본인인증 
	 * 
	 */
	@RequestMapping( "/test2.do")
	public String tes2	(
			HttpServletRequest request
			, Model model
			, @RequestParam Map param) {
		


		System.out.println("테테param : " + param.toString() + "    테토param token : " + param.get("token"));
		
		System.out.println();
	
		ObjectMapper mapper = new ObjectMapper();
		Map resultMap = new HashMap();
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
		    	System.out.println("inputLine : " + inputLine);
		        res.append(inputLine);
		    
		      }
		      
		      br.close();
		   
		    	resultMap = mapper.readValue(res.toString(), new TypeReference<Map>(){});
		        System.out.println("res.toString() : " + res.toString());
		        System.out.println("resultMap : " + resultMap.toString());  
		        System.out.println(param.get("memberName"));
		        System.out.println(resultMap.get("name"));
		        System.out.println("birthday : " + resultMap.get("birthday"));
		        System.out.println("sex : " + resultMap.get("sex"));
		       /*
		        * 이름유효성 확인먼저하고 insert
		        * **/
		    
		        if(resultMap.get("name").equals(param.get("memberName"))){
		    		  System.out.println("성성성성");
		    		  result = accountService.insertAccount(param);
		        }else{
		        	 System.out.println(("ㄲㅈ"));
		        }
		}catch (Exception e) {
		      System.out.println(e);
		}


		
		
		model.addAttribute("param", param);
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "22");
		
		
		return  "/front/test2";
	}	
	

	
}
