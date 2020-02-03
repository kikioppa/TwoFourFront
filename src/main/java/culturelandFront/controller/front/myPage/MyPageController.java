package culturelandFront.controller.front.myPage;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.helper.ListHelper;
import culturelandFront.core.security.sha256.sha256;
import culturelandFront.core.util.PropUtil;
import culturelandFront.service.AccountService;
import culturelandFront.service.BoardService;
import culturelandFront.service.FileMngService;
import culturelandFront.service.MemberService;
import culturelandFront.service.PurchaseService;
import culturelandFront.service.StatisticsService;
import culturelandFront.vo.UserVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Controller
@RequestMapping("/front/myPage")
public class MyPageController extends NdnAbstractController{

	private final Logger logger = Logger.getLogger(this.getClass());
	
	
	@Resource
	private MemberService memberService;
	
	
	@Resource
	private AccountService accountService;
	
	@Resource
	private PurchaseService purchaseService;
	
	@Resource
	private StatisticsService statisticsService;
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private FileMngService fileMngService;
	
	/** fileGnrService */
    @Resource(name="fileGnrService")
    private EgovIdGnrService fileGnrService;
	
	private List codelist;     
    
	/**
	 * ***** 마이페이지 *****
	 * 
	 * 		 매입 신청내역
	 * 		 매입 신청내역 상세
	 * 		 대용량 매입신청내역
	 * 		 대용량 매입신청내역 상세
	 * 	     1:1 문의 내역
	 * 		 계좌 인증
	 * 		 계좌 인증 상세
	 * 		 매입 한도
	 * 		 개인정보 수정
	 * 		 개인정보 수정 상세
	 * */
    
    /**매입신청내역*/
    
	@RequestMapping({"/purchaseList.do", "/m/purchaseList.do"})
	public String purchaseList(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model,
			Device device
			) {

		UserVO user = (UserVO)request.getSession().getAttribute(PropUtil.get("session.user"));
		param.put("memberNo", user.getMemberNo());
		
		ListHelper listHelper = new ListHelper(param);
		
		listHelper = purchaseService.getSelectPurchaseList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		
		if(device.isMobile()){	//모바일에서 접속 시
			return "/mobile/myPage/purchaseList";
		}else{
			return "/front/myPage/purchaseList";
		}
	}
    
    /**매입신청내역상세*/
    
	@RequestMapping({"/purchaseDetail.do", "/m/purchaseDetail.do"})
	public String purchaseDetail(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model,
			Device device
			) {

		UserVO user = (UserVO)request.getSession().getAttribute(PropUtil.get("session.user"));
		param.put("memberNo", user.getMemberNo());
		
		ListHelper listHelper = new ListHelper(param);
		
		listHelper = purchaseService.getSelectPurchaseDetailList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		
		if(device.isMobile()){	//모바일에서 접속 시
			return "/mobile/myPage/purchaseDetail";
		}else{
			return "/front/myPage/purchaseDetail";
		}
	}
    
    /**대용량 매입신청내역*/
    
	@RequestMapping({"/largePurchaseList.do", "/m/largePurchaseList.do"})
	public String largePurchaseList(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model,
			Device device
			) {

		UserVO user = (UserVO)request.getSession().getAttribute(PropUtil.get("session.user"));
		param.put("memberNo", user.getMemberNo());
		
		ListHelper listHelper = new ListHelper(param);
		
		listHelper = purchaseService.getSelectLargePurchaseList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		
		if(device.isMobile()){	//모바일에서 접속 시
			return "/mobile/myPage/largePurchaseList";
		}else{
			return "/front/myPage/largePurchaseList";
		}
	}
    
    /**대용량 매입신청내역상세*/
    
	@RequestMapping({"/largePurchaseDetail.do", "/m/largePurchaseDetail.do"})
	public String largePurchaseDetail(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model,
			Device device
			) {

		UserVO user = (UserVO)request.getSession().getAttribute(PropUtil.get("session.user"));
		param.put("memberNo", user.getMemberNo());
		
		ListHelper listHelper = new ListHelper(param);
		
		listHelper = purchaseService.getSelectLargePurchaseDetailList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		
		if(device.isMobile()){	//모바일에서 접속 시
			return "/mobile/myPage/largePurchaseDetail";
		}else{
			return "/front/myPage/largePurchaseDetail";
		}
	}
    
    /**1:1 문의 내역*/
    
	@RequestMapping("/question.do")
	public String questionList(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model,
			Device device
			) {

		ListHelper listHelper = new ListHelper(param);
		
		listHelper = boardService.getSelectInquiryBoardList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "02");
		model.addAttribute("sub_menu_id", "11");

		if(device.isMobile()){	//모바일에서 접속 시
			return "/mobile/myPage/question";
		}else{
			return "/front/myPage/question";
		}
	}
	
	/**
	 * 계좌인증
	 * @param session
	 * @param param
	 * @param model
	 * @return
	 */
	@RequestMapping("/account.do")
	public String account(
			HttpSession session,
			@RequestParam Map param ,
			Model model
			) {
		
		Map paramMap = new HashMap();
		paramMap.put("gubun" , "BANK");
		codelist = statisticsService.selectCodeList(paramMap);
		model.addAttribute("bankList", codelist);
				
		return "/front/myPage/account";
	}
	
	/**
	 * 매입한도
	 * @param session
	 * @param request
	 * @param response
	 * @param param
	 * @param model
	 * @return
	 */
	
	@RequestMapping("/limit.do")
	public String largelist(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model
			) {
		
		//param.put("largeYn", "Y");
		//ListHelper listHelper = new ListHelper(param);
		
		//listHelper = purchaseService.getSelectPurchaseList(listHelper);
		
		//model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "12");
		
		return "/front/myPage/limit";
	}	
	
	/**개인정보수정 페이지*/
	@RequestMapping("/myInfo.do")
	public String largeDetail(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model
			) {
		UserVO user = (UserVO)request.getSession().getAttribute(PropUtil.get("session.user"));
		System.out.println(user.getMemberNo());
		param.put("memberNo", user.getMemberNo());
		Map memberInfo = (Map) memberService.selectMemberInfo(param);
		
		System.out.println("개인정보"+memberInfo);
		
		
		model.addAttribute("memberInfo", memberInfo);
	
		return "/front/myPage/myInfo";
	}	
	
	/**
	 * 
	 * 회원탈퇴
	 * @param session
	 * @param request
	 * @param response
	 * @param param
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete_user.json")
	@ResponseBody
	public String deleteUser(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model
			) throws Exception {
		
		JSONObject obj = new JSONObject();
		
		int result = 0;
		
		UserVO user = (UserVO)request.getSession().getAttribute(PropUtil.get("session.user"));
		param.put("memberNo", user.getMemberNo());
		Map memberInfo = (Map) memberService.selectMemberInfo(param);
		param.put("memberName", memberInfo.get("MEMBER_NAME"));
		param.put("memberPhone", memberInfo.get("MEMBER_PHONE"));
		
		result = memberService.deleteMember(param);
		
		if(result > 0){
			session.setAttribute("loginVO", null);
			session.invalidate();
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		
		
		return obj.toString();
	}

	
	/**
	 * 개인정보수정 (새비밀번호)
	 * @param session
	 * @param request
	 * @param response
	 * @param param
	 * @param model
	 * @return
	 * @throws Exception
	 */
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
		
		result = memberService.resetPassword(param);
		
		if(result > 0){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		
		
		return obj.toString();
	}

	
	/**
	 * 매입수정
	 * @param session
	 * @param request
	 * @param response
	 * @param param
	 * @param seq
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/write_proc.json")
	@ResponseBody
	public String write_proc( 
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			@RequestParam(value="seq",  defaultValue="") String seq,
			Model model
			) throws Exception{
		
		JSONObject obj = new JSONObject();
		
		int result = 0;
		
//		result = purchaseService.updateLargePurchase(param);
		
		model.addAttribute("menu_id", "04");
		model.addAttribute("sub_menu_id", "31");
		
		if(result > 0){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		
		return obj.toString();
	}
	
}
