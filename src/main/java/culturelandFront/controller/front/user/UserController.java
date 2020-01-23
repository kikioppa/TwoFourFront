package culturelandFront.controller.front.user;

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
		
		
		int result = 0;
		int idcheck =0;
		
		System.out.println("param "+ param.toString());
		idcheck = accountService.idCheck(param);
		
		if(idcheck > 0){
			obj.put("result", "idError");
		}else{
			//result = accountService.insertAccount(param);
			System.out.println("param "+ param.toString());
			obj.put("result", "success");
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
		
		UserVO user = loginService.getUserLogin(userVO);
		
		if( user == null) {
			
			obj.put("result", "fail");
		} else {
			
			if("B".equals(user.getMemberStat())){		//블랙리스트 처리된 회원
				obj.put("result", "black");
			}else{
				session.setAttribute(PropUtil.get("session.user"), user);
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

