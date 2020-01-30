package culturelandFront.controller.front.myPage;
/**
 * 매입처리관리
 * */
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.helper.ListHelper;
import culturelandFront.core.util.PropUtil;
import culturelandFront.service.AccountService;
import culturelandFront.service.FileMngService;
import culturelandFront.service.PurchaseService;
import culturelandFront.vo.AdminUserVO;
import culturelandFront.vo.UserVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;




@Controller
@RequestMapping("/front/myPage")
public class MyPageController extends NdnAbstractController{

	private final Logger logger = Logger.getLogger(this.getClass());
	
	
	@Resource
	private AccountService accountService;
	
	@Resource
	private PurchaseService purchaseService;
	
	@Resource
	private FileMngService fileMngService;
	
	/** fileGnrService */
    @Resource(name="fileGnrService")
    private EgovIdGnrService fileGnrService;
	
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
    
    /**매입신청내역*/
    
	@RequestMapping("/list.do")
	public String purchaseList(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model
			) {
		
		//param.put("largeYn", "N");
		//ListHelper listHelper = new ListHelper(param);
		
	//	listHelper = purchaseService.getSelectPurchaseList(listHelper);
		
		//model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "02");
		model.addAttribute("sub_menu_id", "11");
		
		return "/front/myPage/list";
	}
	
	/**계좌인증*/
	
	@RequestMapping("/account.do")
	public String detail(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model
			) {
		
		//매입 상세
		//HashMap detail = (HashMap)purchaseService.getSelectPurchaseDetail(param);
		
		//매입 상세 목록
		//List detailList = new ArrayList();
		//detailList = purchaseService.getSelectPurchaseDetailList(param);
		
		//model.addAttribute("detail", detail);
		//model.addAttribute("detailList", detailList);
		
		return "/front/myPage/account";
	}
	
	/**매입한도*/
	
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
	
	/**개인정보 수정*/
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
		Map memberInfo = (Map) accountService.selectMemberInfo(param);
		
		System.out.println("개인정보"+memberInfo);
		
		
		model.addAttribute("memberInfo", memberInfo);
		//매입 상세
//		HashMap detail = (HashMap)purchaseService.getSelectLargePurchaseDetail(param);
				
		//매입 상세 목록
	//	ListHelper listHelper = new ListHelper(param);
//		listHelper = purchaseService.getSelectLargePurchaseDetailList(listHelper);
		
//		model.addAttribute("detail", detail);
//		model.addAttribute("listHelper", listHelper);
		
		return "/front/myPage/myInfo";
	}	
	
	/**
	 * 매입 수정
	 * */
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
		
		result = purchaseService.updateLargePurchase(param);
		
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
