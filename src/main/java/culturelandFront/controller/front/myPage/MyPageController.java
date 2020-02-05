package culturelandFront.controller.front.myPage;
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

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.helper.ListHelper;
import culturelandFront.core.security.sha256.sha256;
import culturelandFront.core.util.PropUtil;
import culturelandFront.service.AccountService;
import culturelandFront.service.BoardService;
import culturelandFront.service.MemberService;
import culturelandFront.service.PurchaseService;
import culturelandFront.service.StatisticsService;
import culturelandFront.vo.UserVO;

@Controller
@RequestMapping({"/front/myPage", "/m/myPage"})
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
    
	@RequestMapping("/purchaseList.do")
	public String purchaseList(
			HttpServletRequest request,
			@RequestParam Map param ,
			Model model,
			Device device
			) {

		UserVO user = (UserVO)request.getSession().getAttribute(PropUtil.get("session.user"));
		param.put("memberNo", user.getMemberNo());
		
		ListHelper listHelper = new ListHelper(param);
		
		listHelper = purchaseService.getSelectPurchaseList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "04");
		model.addAttribute("sub_menu_id", "41");
		if(device.isMobile()){
			return "/mobile/myPage/purchaseList";
		}else{
			return "/front/myPage/purchaseList";
		}
	}
    
    /**매입신청내역상세*/
    
	@RequestMapping("/purchaseDetail.do")
	public String purchaseDetail(
			HttpServletRequest request,
			@RequestParam Map param ,
			Model model,
			Device device
			) {

		UserVO user = (UserVO)request.getSession().getAttribute(PropUtil.get("session.user"));
		param.put("memberNo", user.getMemberNo());
		
		ListHelper listHelper = new ListHelper(param);
		
		listHelper = purchaseService.getSelectPurchaseDetailList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		
		if(device.isMobile()){
			return "/mobile/myPage/purchaseDetail";
		}else{
			return "/front/myPage/purchaseDetail";
		}
	}
    
    /**대용량 매입신청내역*/
    
	@RequestMapping("/largePurchaseList.do")
	public String largePurchaseList(
			HttpServletRequest request,
			@RequestParam Map param ,
			Model model,
			Device device
			) {

		UserVO user = (UserVO)request.getSession().getAttribute(PropUtil.get("session.user"));
		param.put("memberNo", user.getMemberNo());
		
		ListHelper listHelper = new ListHelper(param);
		
		listHelper = purchaseService.getSelectLargePurchaseList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "04");
		model.addAttribute("sub_menu_id", "42");
		if(device.isMobile()){
			return "/mobile/myPage/largePurchaseList";
		}else{
			return "/front/myPage/largePurchaseList";
		}
	}
    
    /**대용량 매입신청내역상세*/
    
	@RequestMapping("/largePurchaseDetail.do")
	public String largePurchaseDetail(
			HttpServletRequest request,
			@RequestParam Map param ,
			Model model,
			Device device
			) {

		UserVO user = (UserVO)request.getSession().getAttribute(PropUtil.get("session.user"));
		param.put("memberNo", user.getMemberNo());
		
		ListHelper listHelper = new ListHelper(param);
		
		listHelper = purchaseService.getSelectLargePurchaseDetailList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "04");
		model.addAttribute("sub_menu_id", "42");
		if(device.isMobile()){
			return "/mobile/myPage/largePurchaseDetail";
		}else{
			return "/front/myPage/largePurchaseDetail";
		}
	}
    
    /**1:1 문의 내역*/
    
	@RequestMapping("/question.do")
	public String questionList(
			HttpServletRequest request,
			@RequestParam Map param ,
			Model model,
			Device device
			) {

		ListHelper listHelper = new ListHelper(param);
		
		listHelper = boardService.getSelectInquiryBoardList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "04");
		model.addAttribute("sub_menu_id", "43");

		if(device.isMobile()){
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
			Model model,
			Device device
			) {
		UserVO user = (UserVO)session.getAttribute(PropUtil.get("session.user"));
		
		Map paramMap = new HashMap();
		paramMap.put("gubun" , "BANK");
		codelist = statisticsService.selectCodeList(paramMap);
		model.addAttribute("bankList", codelist);
		
		if(user != null){
			logger.debug("user"+user);
			param.put("memberNo", user.getMemberNo());
			HashMap detail = (HashMap)accountService.getSelectAccountDetail(param);
			model.addAttribute("detail", detail);
		}		
		model.addAttribute("menu_id", "04");
		model.addAttribute("sub_menu_id", "44");		
		if(device.isMobile()){
			return "/mobile/myPage/account";
		}else{
			return "/front/myPage/account";
		}
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
			Model model,
			Device device
			) {
		
		//param.put("largeYn", "Y");
		//ListHelper listHelper = new ListHelper(param);
		
		//listHelper = purchaseService.getSelectPurchaseList(listHelper);
		
		//model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "04");
		model.addAttribute("sub_menu_id", "45");
		if(device.isMobile()){
			return "/mobile/myPage/limit";
		}else{
			return "/front/myPage/limit";
		}
	}	
	
	/**개인정보수정 페이지*/
	@RequestMapping("/myInfo.do")
	public String largeDetail(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model,
			Device device
			) {
		UserVO user = (UserVO)request.getSession().getAttribute(PropUtil.get("session.user"));
		param.put("memberNo", user.getMemberNo());
		Map memberInfo = (Map) memberService.selectMemberInfo(param);
		
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("menu_id", "04");
		model.addAttribute("sub_menu_id", "46");		
		if(device.isMobile()){
			return "/mobile/myPage/myInfo";
		}else{
			return "/front/myPage/myInfo";
		}
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
	 * 정보수정 번호인증
	 */
	
	@RequestMapping("/requestValid.json")
	@ResponseBody
	public String phoneVal(
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
		
		result = memberService.findIdCount(param);
		
		if(result < 0){
			obj.put("result", "success");
		}else{
			obj.put("result", "error");
		}
		
		
		return obj.toString();
	}

	
	/**
	 * 
	 * 개인정보페이지 핸드폰번호 인증
	 * 
	 * 
	 * */

	@RequestMapping(value ={"/phoneValid.json","/m/phoneValid.json"})
	@ResponseBody
	public String phoneValid	(
			HttpServletRequest request
			, Model model
			, @RequestParam Map param) {

		ObjectMapper mapper = new ObjectMapper();
		JSONObject obj = new JSONObject();
		int result = 0;
		Map resultMap = new HashMap();
		int updatemember;
		UserVO user = (UserVO)request.getSession().getAttribute(PropUtil.get("session.user"));
		param.put("memberNo", user.getMemberNo());
		/*param.put("memberPhone", user.getCellphone());*/
		param.put("memberName", user.getName());
	/*	Map memberInfo = (Map) memberService.selectMemberInfo(param);
		param.put("memberPhone", memberInfo.get("MEMBER_PHONE"));
		param.put("memberName", memberInfo.get("MEMBER_NAME"));
	*/	
		System.out.println("일빠"+param);
		
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
		        System.out.println("성공");
		      } else {
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		        System.out.println("실패");
		      }
		      
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		    	System.out.println("inputLine : " + inputLine);
		        res.append(inputLine);
		    
		      }
		      br.close();
		      resultMap = mapper.readValue(res.toString(), new TypeReference<Map>(){});
		      System.out.println("맵맵맵"+resultMap);
		      if(responseCode==200) {
	    			updatemember= memberService.updateMemberPhone(param);
					System.out.println("아이디 :  "+ param.toString());
	    			//System.out.println("아이디 22:  " +idList);
					obj.put("result",true);
		      }else{
		    	  obj.put("result",false);
		      }
	    }catch (Exception e) {
	      System.out.println(e);
	    }
		
		return  obj.toString();
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
	@RequestMapping("/user_info_update.json")
	@ResponseBody
	public String resetPassword(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model
			) throws Exception {
		
		JSONObject obj = new JSONObject();
		
		System.out.println("info update : " + param.toString());
		
		int result = 0;
		
		result = memberService.updateMemberInfo(param);
		
		if("Y".equals(param.get("gubun"))){
			result = memberService.resetPassword(param);
		}
		
		if(result > 0){
			obj.put("result", true);
		}else{
			obj.put("result", false);
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
