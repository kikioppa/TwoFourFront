package culturelandFront.controller.front.user;

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
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.helper.ListHelper;
import culturelandFront.core.security.sha256.sha256;
import culturelandFront.core.util.NdnUtil;
import culturelandFront.core.util.PropUtil;
import culturelandFront.service.AccountService;
import culturelandFront.service.BoardService;
import culturelandFront.service.FileMngService;
import culturelandFront.service.LoginService;
import culturelandFront.vo.AdminUserVO;
import culturelandFront.vo.UserVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Controller
@RequestMapping("/front/member")
public class UserController extends NdnAbstractController{

	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private AccountService accountService;
	
	@Resource
	private LoginService loginService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private FileMngService fileMngService;
	
	/** fileGnrService */
    @Resource(name="fileGnrService")
    private EgovIdGnrService fileGnrService;
    
	@RequestMapping("/list.do")
	public String list(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model
			) {
		AdminUserVO adminUser = (AdminUserVO)request.getSession().getAttribute(PropUtil.get("session.admin"));
		
	
		System.out.println("param : " + param.toString());
		ListHelper listHelper = new ListHelper(param);
		
		listHelper = accountService.getSelectAccountList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "01");
		model.addAttribute("sub_menu_id", "01");
		
		
		return "/admin/account/userList";
	}
	

	@RequestMapping("/detail.do")
	public String view(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			@RequestParam(value="memberId",  defaultValue="") String memberId,
			Model model
			) {

			
		HashMap detail = (HashMap)accountService.getSelectAccountDetail(param);
		ListHelper listHelper = new ListHelper(param);
		listHelper = boardService.getSelectInquiryBoardList(listHelper);
		
		List purList = new ArrayList();
		purList = accountService.getSelectAccountPurchaseList(param);
			
		model.addAttribute("detail", detail);
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("purList", purList);
		
		model.addAttribute("menu_id", "01");
		model.addAttribute("sub_menu_id", "02");
		
		return "admin/account/userDetail";
	}
	
	
	
	@RequestMapping(value={"/join_user.json","/m/join_user.json"})
	@ResponseBody
	public String join( 
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			@RequestParam(value="seq",  defaultValue="") String seq,
			Model model
			) throws Exception{
		
		JSONObject obj = new JSONObject();
		
		String returnUrl = ""; 
		String subMenu = "";
		
		ListHelper listHelper = new ListHelper(param);
		
		listHelper = accountService.getSelectAccountList(listHelper);
		
		
		int result = 0;
		int accheck = 0;
		int idcheck =0;
		
		System.out.println("param "+ param.toString());
		idcheck = accountService.idCheck(param);
		accheck = accountService.acCheck(param);
		if(idcheck > 0){
			System.out.println("냥1"+param);
			obj.put("result", "idError");
		}else if(accheck >0){
			System.out.println("냥냥"+ accheck);
			obj.put("result", "acError");
		}else{
			System.out.println("성공");
			obj.put("result", "success");
		}
		
		return obj.toString();
	}
	
	
	/**
	 * 
	 * 아이디 찾기 유효성 검증
	 * 
	 * */
	@RequestMapping(value={"/user_findId.json","/m/user_findId.json"})
	@ResponseBody
	public String findId( 
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			@RequestParam(value="seq",  defaultValue="") String seq,
			Model model
			) throws Exception{
		
	
		List idList = new ArrayList();
		idList = accountService.findId(param);
		
	
		int findidcount =0;
		List findid;
		JSONObject obj = new JSONObject();
		
		String returnUrl = ""; 
		String subMenu = "";
		
		findidcount = accountService.findIdCount(param);
		System.out.println("param "+ param.toString());
		
		if(findidcount == 0){
			obj.put("result", "idError");
		}else{
			obj.put("result", "success");
		}
		
		return obj.toString();
	}
	
	
	


	
	/**
	 * 
	 * 아이디 인증 결과
	 * 
	 * 
	 * */
/*
	@RequestMapping(value ={"/test3.do","/m/test3.do"})
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
	
*/	
	
	/**
	 * 비밀번호 찾기 유효성 체크
	 * */
	@RequestMapping(value={"/user_findPwCheck.json","/m/user_findPwCheck.json"})
	@ResponseBody
	public String user_findPwCheck( 
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model
			) throws Exception{
		
		
		int tidcount = 0;
		JSONObject obj = new JSONObject();
		
		tidcount = accountService.findIdTrueCount(param);
		System.out.println("param "+ param.toString());
		
		if(tidcount == 0){
			obj.put("result", "idError");
		}else{
			obj.put("result", "success");
		}
		
		return obj.toString();
	}
	
	
	/**
	 * 비밀번호 본인 인증(로그인톡 인증)
	 * 
	 * */
	@RequestMapping(value={"/user_findPw.json", "/m/user_findPw.json"})
	@ResponseBody
	public String findPw( 
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model
			) throws Exception{
		
		JSONObject obj = new JSONObject();
		ObjectMapper mapper = new ObjectMapper();
		Map resultMap = new HashMap();
		UserVO user = new UserVO();
		HashMap memberInfo = new HashMap();
		
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
		    	resultMap = mapper.readValue(res.toString(), new TypeReference<Map>(){});
		        System.out.println("res.toString() : " + res.toString());
		        System.out.println("resultMap : " + resultMap.toString());  
		        System.out.println("paramFindPw : " + param.toString());
		        System.out.println(param.get("memberName"));
		        System.out.println(resultMap.get("name"));
		        System.out.println("birthday : " + resultMap.get("birthday"));
		        System.out.println("sex : " + resultMap.get("sex"));
		        
		        
		        System.out.println("양양펀치");
		        
		        
		        if(resultMap.get("mobile_number").equals(param.get("memberPhone")) 
		        		&& resultMap.get("name").equals(param.get("memberName"))){
		        	
		        	memberInfo = (HashMap)accountService.selectParam(param);
		        	
		        	user.setId(param.get("memberId").toString());
			        user.setPw(memberInfo.get("MEMBER_PASSWORD").toString());
			        
			        user = loginService.getUserLogin(user);
			        
			        session.setAttribute(PropUtil.get("session.user"), user);
			        
			        logUser(request, "LOGIN");
					
					// 사용자 세션 삭제
					session.setAttribute("loginVO", null);
					
					obj.put("result", "success");
			        
		        }else{
		        	obj.put("result", "error");
			    	return obj.toString();
		        }
		        
		       }else{
		    	   obj.put("result", "error");
		    	   return obj.toString();
		       }
		     }catch (Exception e) {
		      System.out.println(e);
		    }
		
		return obj.toString();
	}
	
	
	
	@RequestMapping("/updateStat.json")
	@ResponseBody
	public String updateStat(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model
			) {
		
		JSONObject obj = new JSONObject();
		
		int result = 0;
		
		System.out.println("param : " + param.toString());
		
		
		result = accountService.updateAccountStatus(param);
		
		
		
		if(result > 0){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		
		
		return obj.toString();
	}

	@RequestMapping("/resetPassword.json")
	@ResponseBody
	public String resetPassword(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model
			) throws Exception {
		
		JSONObject obj = new JSONObject();
		
		int result = 0;
		
		System.out.println("param : " + param.toString());
//		sha256.createHash("1234");
		System.out.println("reset : " + sha256.createHash("1234"));
//		param.put("restPassword", sha256.createHash("asd"));
		param.put("reset",sha256.createHash("1234"));
		result = accountService.resetPassword(param);
		
		if(result > 0){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		
		
		return obj.toString();
	}

	
	
	/**
	 * 회원가입페이지
	 * */
	
	@RequestMapping("/join.do")
	public String write(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			@RequestParam (required=false, defaultValue="")  String seq,
			Model model
			) {
		
		if(!"".equals(seq)){
			HashMap detail = (HashMap)accountService.getSelectAccountDetail(param);
			
			model.addAttribute("detail", detail);
		}
		System.out.println("가입페이지");
		model.addAttribute("menu_id", "04");
		model.addAttribute("sub_menu_id", "31");
		
		return "/front/member/join";
	}
	

	


	
	/**
	* ***** 로그인페이지 *****
	* 		로그인
	* 		아이디 찾기
	* 		비밀번호 찾기
	**/
	
	@RequestMapping( value={"/login.do", "/m/login.do"})
	public String login	(
						HttpServletRequest request
						, Model model
						, @RequestParam Map param
						, Device device) {

			if(device.isMobile()){
				return  "/mobile/member/login";
			}else{
				return  "/front/member/login";
			}

			
	}
	
	/**
	 * ***** 로그인페이지 *****
	 * 		로그인
	 * 		아이디 찾기
	 * 		비밀번호 찾기
	 **/
	
	@RequestMapping(value={"/loginAction.do", "/m/loginAction.do"})
	@ResponseBody
	public String loginAction	(
			@Valid UserVO userVO
			, BindingResult result
			,HttpSession session
			,HttpServletRequest request
			, Model model
			, @RequestParam Map param
			) {
		JSONObject obj = new JSONObject();
		Map memberInfo;
		memberInfo = accountService.selectMemberInfo(param);
		UserVO user = loginService.getUserLogin(userVO);
		
		if( user == null) {
			
			obj.put("result", "fail");
		} else {
			
			if("B".equals(user.getMemberStat())){		//블랙리스트 처리된 회원
				obj.put("result", "black");
			}else{
				session.setAttribute(PropUtil.get("session.user"), user);
		//		session.setAttribute("ID",user.getId());
		//		session.setAttribute("NAME",user.getName());
				
				System.out.println("파파람"+user.getMemberNo());
				System.out.println("회원정보 param~"+memberInfo);
//				logAdmin(request, "LOGIN");
				
				logUser(request, "LOGIN");
				
				// 사용자 세션 삭제
				session.setAttribute("loginVO", null);
				
				obj.put("result", "success");
			}
		}
		
		
		return obj.toString();
	}

	/**
	 * 유저 로그아웃
	 * @param request
	 * @param session
	 * @param modl
	 * @return
	 */
	@RequestMapping(value={"/logout.do", "/m/logout.do"})
	public String logout(HttpServletRequest request, HttpSession session, Model modl) {
		
		logUser(request, "LOGOUT");
		
		session.setAttribute(PropUtil.get("session.user"), null);
		session.invalidate();
		return goPage("/index.do");
	}
	
	@RequestMapping( "/findPw.do")
	public String findPw	(
						HttpServletRequest request
						, Model model
						, @RequestParam Map param) {

		
			System.out.println("findPw 페이지.");
			model.addAttribute("menu_id", "03");
			model.addAttribute("sub_menu_id", "22");

			return  "/front/member/findPw";
	}
	
	@RequestMapping( "/findId.do")
	public String findId	(
						HttpServletRequest request
						, Model model
						, @RequestParam Map param) {

		
			System.out.println("findId 페이지.");
			model.addAttribute("menu_id", "03");
			model.addAttribute("sub_menu_id", "22");

			return  "/front/member/findId";
	}

	
	
	
	/**
	 * ***** 마이페이지 *****
	 * 
	 * 		 매입 신청내역
	 * 		 계좌 인증
	 * 		 계좌 인증 상세
	 * 		 매입 한도
	 * 		 개인정보 수정
	 * 		 개인정보 수정 상세
	 * */
	
	@RequestMapping( "/myPage.do")
	public String myPage	(
						HttpServletRequest request
						, Model model
						, @RequestParam Map param) {

		
			System.out.println("로그인 페이지.");
			model.addAttribute("menu_id", "03");
			model.addAttribute("sub_menu_id", "22");

			return  "/front/myPage/purchase";
	}
	
	
	private void logUser(HttpServletRequest request, String action) {
		Object sesObj = request.getSession().getAttribute(PropUtil.get("session.user"));
		if( sesObj != null && sesObj instanceof UserVO ) {
			UserVO user = (UserVO)request.getSession().getAttribute(PropUtil.get("session.user"));
			String getUri = request.getRequestURI();
			HashMap param = new HashMap();
			param.put("action", action);
			param.put("ip", NdnUtil.getRemoteAddr(request));
			param.put("memberNo", user.getMemberNo());
			
			loginService.insertUserPageHis(param);
		}
		
		
		
	}
	
		
	
	
}

