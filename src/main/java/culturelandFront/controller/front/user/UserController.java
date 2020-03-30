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
import culturelandFront.core.value.JavaScript;
import culturelandFront.service.AccountService;
import culturelandFront.service.BoardService;
import culturelandFront.service.FileMngService;
/*import culturelandFront.service.KakaoAPI;*/
import culturelandFront.service.LoginService;
import culturelandFront.service.MemberService;
import culturelandFront.vo.AdminUserVO;
import culturelandFront.vo.UserVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Controller
@RequestMapping({"/member", "/m/member"})
public class UserController extends NdnAbstractController{

	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private MemberService memberService;
	
	@Resource
	private LoginService loginService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private FileMngService fileMngService;
	
/*	@Resource KakaoAPI kakaoApi;*/
	/** fileGnrService */
    @Resource(name="fileGnrService")
    private EgovIdGnrService fileGnrService;
    
    
	/**
	 * 
	 * 회원가입 
	 * 
	 * */	
	@RequestMapping("/join_user.json")
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
		
		listHelper = memberService.getSelectMemberList(listHelper);
		
		int result = 0;
		int accheck = 0;
		int idcheck =0;
		
		idcheck = memberService.idCheck(param);
		accheck = memberService.acCheck(param);
		if(idcheck > 0){
			obj.put("result", "idError");
		}else if(accheck >0){
			obj.put("result", "acError");
		}else{
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
		
		int findidcount =0;
		JSONObject obj = new JSONObject();
		
		findidcount = memberService.findIdCount(param);
		
		if(findidcount == 0){
			obj.put("result", "idError");
		}else{
			obj.put("result", "success");
		}
		
		return obj.toString();
	}

	/**
	 * 
	 * 아이디 찾기
	 * 
	 * 
	 * */
	@RequestMapping(value={"/foundid.do"})
	public String tes3	(
			HttpSession session
			, Model model
			, Device device
			, @RequestParam Map param) {
		
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
	    			Map findMap = memberService.findId(param);
					model.addAttribute("findMap", findMap);
		       }
	     }catch (Exception e) {
	      System.out.println(e);
	    }
		
		model.addAttribute("param", param);
		
		if(device.isMobile()){			//모바일에서 접속 시
			return "/mobile/member/foundid";
		}else{
			return "/front/member/foundid";
		}
	}	
	
	/**
	 * 
	 * 개인정보페이지 핸드폰번호 인증
	 * 
	 * 
	 * */

	@RequestMapping("/phoneValid.json")
	public String phoneValid	(
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
		        //result = memberService.insertMember(param);
		      } else {
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
//		    	System.out.println("inputLine : " + inputLine);
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		    			//idList = memberService.findId(param);
						//model.addAttribute("idList", idList);
//		    			System.out.println("아이디 :  "+ param.toString());
//		    			System.out.println("아이디 22:  " +idList);
		       }
		     }catch (Exception e) {
		      System.out.println(e);
		    }

		
		
		model.addAttribute("param", param);

		
		return  "/front/myPage/myInfo.do";
	}	
		
	/**
	 * 비밀번호 찾기 유효성 체크
	 * */
	@RequestMapping("/user_findPwCheck.json")
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
		
		tidcount = memberService.findIdTrueCount(param);
		
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
	@RequestMapping("/user_findPw.json")
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
		      if(responseCode==200) {
		        br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
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
		    	resultMap = mapper.readValue(res.toString(), new TypeReference<Map>(){});
		        
		        if(resultMap.get("mobile_number").equals(param.get("memberPhone")) 
		        		&& resultMap.get("name").equals(param.get("memberName"))){
		        	
		        	memberInfo = (HashMap)memberService.selectParam(param);
		        	
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
	
	/**
	 * 회원가입페이지
	 * */
	@RequestMapping("/join.do")
	public String write(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Device device,
			@RequestParam (required=false, defaultValue="")  String seq,
			Model model
			) {
		
		UserVO user = (UserVO)session.getAttribute(PropUtil.get("session.user"));
		if (user != null){
			JavaScript javaScript = new JavaScript();
			javaScript.script("history.back(-1);");
			return goScript(javaScript);
		}
		
		if(!"".equals(seq)){
			HashMap detail = (HashMap)memberService.getSelectMemberDetail(param);
			
			model.addAttribute("detail", detail);
		}
		
	
		
		if(device.isMobile()){
		return "/mobile/member/join";
		}else{
			return  "/front/member/join";

		}
	}

	
	/**
	 * 회원가입 본인인증 
	 * 
	 */
	@RequestMapping( value ={"/join_valid.json","/m/join_valid.json"})
	@ResponseBody
	public String join_valid(@Valid UserVO userVO,HttpServletRequest request, Model model, @RequestParam Map param) {
		
		JSONObject obj = new JSONObject();
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
		        br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		        //result = memberService.insertMember(param);
		      } else {
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		    
		      }
		      
		      br.close();
		   
		    	resultMap = mapper.readValue(res.toString(), new TypeReference<Map>(){});
	
		    	userVO.setPw(sha256.createHash(sha256.pwEncode(param.get("memberId").toString(),param.get("memberPw").toString())));
		    	param.put("birthday", resultMap.get("birthday"));
		        param.put("gender", resultMap.get("sex"));
		        param.put("memberPw", userVO.getPw());
		        
		        /*
		         * 이름유효성 확인먼저하고 insert
			     */ 
		        if(resultMap.get("name").equals(param.get("memberName"))){
		    		  result = memberService.insertMember(param);
		        }else{
//		        	 System.out.println(("이름이 일치하지 않습니다."));
		        }
		}catch (Exception e) {
		      System.out.println(e);
		}

		model.addAttribute("param", param);
	
		if(result > 0){	
			obj.put("result", "success");
			}else{			
			obj.put("result","failed");
		}
		
		return obj.toString();
	
	}	

	/**
	* ***** 로그인페이지 *****
	* 		
	**/
	
	@RequestMapping("/login.do")
	public String login	(
						HttpSession session
						, Model model
						, @RequestParam Map param
						, Device device) {

		UserVO user = (UserVO)session.getAttribute(PropUtil.get("session.user"));
		/*System.out.println("코드으"+ code );*/
		if (user != null){
			JavaScript javaScript = new JavaScript();
			javaScript.script("history.back(-1);");
			return goScript(javaScript);
		}
		
		if(device.isMobile()){
			return  "/mobile/member/login";
		}else{
			return  "/front/member/login";
		}

			
	}
	

	/*@RequestMapping("/kakaologin.do")
	public String klogin	(
						HttpSession session
						, Model model
						, @RequestParam Map param,@RequestParam("code") String code
						, Device device) {

		UserVO user = (UserVO)session.getAttribute(PropUtil.get("session.user"));
		
		String access_Token = kakaoApi.getAccessToken(code);
		HashMap<String, Object> userInfo = kakaoApi.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
		System.out.println("코드으"+ code );
		System.out.println("엑쎼쓰토끈쓰"+ access_Token);
		if (userInfo.get("email") != null) {
		    session.setAttribute("userId", userInfo.get("email"));
		    session.setAttribute("access_Token", access_Token);
		    }
		
		if(device.isMobile()){
			return  "/mobile/member/login";
		}else{
			return  "/front/member/login";
		}

			
	}
*/
	
	/**
	 * ***** 로그인페이지 *****
	 * 		로그인 액션
	 * @throws Exception 
	 **/
	@RequestMapping("/loginAction.do")
	@ResponseBody
	public String loginAction	(
			@Valid UserVO userVO
			, BindingResult result
			,HttpSession session
			,HttpServletRequest request
			, Model model
			, @RequestParam Map param
			, Device device
			) throws Exception {
		JSONObject obj = new JSONObject();
		userVO.setPw(sha256.createHash(sha256.pwEncode(param.get("id").toString(),param.get("pw").toString())));
		
		UserVO user = loginService.getUserLogin(userVO);
		
		if( user == null) {
			
			obj.put("result", "fail");
		} else {
			
			if("B".equals(user.getMemberStat())){		//블랙리스트 처리된 회원
				obj.put("result", "black");
			}else{
				session.setAttribute(PropUtil.get("session.user"), user);
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
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request, HttpSession session,
			Model modl,
			Device device) {
		
		logUser(request, "LOGOUT");
		
		session.setAttribute(PropUtil.get("session.user"), null);
		session.invalidate();
		
		
		if(device.isMobile()){
			return "redirect:/m/index.do";

		}else{
			return "redirect:/index.do";

		}

	}
	
	/**
	 * 유저 블랙리스트 로그아웃
	 * @param request
	 * @param session
	 * @param modl
	 * @return
	 */
	@RequestMapping("/blackLogout.do")
	public String blackLogout(HttpServletRequest request, HttpSession session,
			Model modl,
			Device device) {
		
		logUser(request, "BLACKLOGOUT");
		
		session.setAttribute(PropUtil.get("session.user"), null);
		session.invalidate();
		
		JavaScript javaScript = new JavaScript();
		javaScript.message("블랙처리 되었습니다.");
		
		if(device.isMobile()){
			javaScript.script("location.href = '/m/index.do'");
		}else{
			javaScript.script("location.href = '/index.do'");
		}
		
		return goScript(javaScript);
		
	}
	
	/**
	 * 비밀번호 찾기 페이지
	 * */
	@RequestMapping("/findPw.do")
	public String findPw	(
						HttpSession session
						, Model model
						, @RequestParam Map param
						, Device device) {
		UserVO user = (UserVO)session.getAttribute(PropUtil.get("session.user"));
		if (user != null){
			JavaScript javaScript = new JavaScript();
			javaScript.script("history.back(-1);");
			return goScript(javaScript);
		}
		
		if(device.isMobile()){
			return  "/mobile/member/findPw";
		}else{
			return  "/front/member/findPw";

		}		
	}
	
	/***
	 * 
	 * @param request
	 * @param model
	 * @param param
	 * @param device
	 * @return
	 */
	@RequestMapping("/findId.do")
	public String findId	(
						HttpSession session
						, Model model
						, @RequestParam Map param
						, Device device) {
		
			UserVO user = (UserVO)session.getAttribute(PropUtil.get("session.user"));
			if (user != null){
				JavaScript javaScript = new JavaScript();
				javaScript.script("history.back(-1);");
				return goScript(javaScript);
			}
			
			if(device.isMobile()){
				return  "/mobile/member/findId";
			}else{
				return  "/front/member/findId";

			}
	}

	
	
	
	

	/**
	 * ***** 인덱스 마이페이지  *****
	 * 
	 * */
	
	@RequestMapping("/myPage.do")
	public String myPage	(
						HttpServletRequest request
						, Model model
						, @RequestParam Map param
						, Device device) {
		
			model.addAttribute("menu_id", "03");
			model.addAttribute("sub_menu_id", "22");
			
			if(device.isMobile()){
				return  "/mobile/myPage/purchase";
			}else{
				return  "/front/myPage/purchase";
			}
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

