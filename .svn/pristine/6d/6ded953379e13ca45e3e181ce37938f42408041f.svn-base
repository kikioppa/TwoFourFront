package culturelandFront.controller.front.account;
import java.util.HashMap;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.helper.ListHelper;
import culturelandFront.core.util.PropUtil;
import culturelandFront.core.value.JavaScript;
import culturelandFront.service.AccountService;
import culturelandFront.service.FileMngService;
import culturelandFront.vo.AdminUserVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
/**
 * 계정 관리
 * 
 * */
@Controller
@RequestMapping("/admin/account")
public class AccountController extends NdnAbstractController{

	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private AccountService accountService;
	
	@Resource
	private FileMngService fileMngService;
	
	/** fileGnrService */
    @Resource(name="fileGnrService")
    private EgovIdGnrService fileGnrService;
	
	/**
	 * 스태프 목록
	 * */
	@RequestMapping("/list.do")
	public String list(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model
			) {
		AdminUserVO adminUser = (AdminUserVO)request.getSession().getAttribute(PropUtil.get("session.admin"));
		
		
	//	ListHelper listHelper = new ListHelper(param);
		
//		listHelper = accountService.getSelectAccountList(listHelper);
		
//		model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "02");
		model.addAttribute("sub_menu_id", "12");
		
		return "/admin/account/list";
	}
	
	/**
	 * 게시판 글쓰기폼
	 * */
	@RequestMapping("/writeTemplate.do")
	public String write(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			@RequestParam (required=false, defaultValue="")  String seq,
			Model model
			) {
		
		if(!"".equals(seq)){
//			HashMap detail = (HashMap)accountService.getSelectAccountDetail(param);
			
//			model.addAttribute("detail", detail);
		}
		
		model.addAttribute("menu_id", "02");
		model.addAttribute("sub_menu_id", "12");
		
		return "/admin/account/write";
	}
	
	/**
	 * 회원상태 변경
	 */
	
	
	
	/**
	 * 유저 등록 및 수정
	 * */
	@RequestMapping("/--------.json")
	@ResponseBody
	public String write_proc( 
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			@RequestParam(value="memberNo",  defaultValue="") String memberNo,
			Model model
			) throws Exception{
		
		JSONObject obj = new JSONObject();
		
		String returnUrl = ""; 
		String subMenu = "";
		
		
		int result = 0;
		
		if("".equals(memberNo)){
		//result = accountService.insertAccount(param);
		System.out.println("param "+ param.toString());
		}else{
		//result = accountService.insertAccount(param);
		System.out.println("param "+ param.toString());
		}
		
		if(result > 0){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		
		return obj.toString();
	}
	
	/**
	 * 유저 비밀번호 변경
	 * */
	@RequestMapping("/write_pass_proc.json")
	@ResponseBody
	public String write_pass_proc( 
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			@RequestParam(value="seq",  defaultValue="") String seq,
			@RequestParam (value="atchFileId", defaultValue="")  String atchFileId,
			Model model
			) throws Exception{
		
		JSONObject obj = new JSONObject();
		
		AdminUserVO adminUser = (AdminUserVO)request.getSession().getAttribute(PropUtil.get("session.admin"));
		
		int result = 0;
		
//		result = accountService.updateAccountPassChange(param);
		
		model.addAttribute("menu_id", "02");
		model.addAttribute("sub_menu_id", "12");
		
		if(result > 0){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		
		return obj.toString();
	}
	
	/**
	 * 유저 비밀번호 변경
	 * */
	@RequestMapping("/write_info_pass_proc.json")
	@ResponseBody
	public String write_info_pass_proc( 
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			@RequestParam(value="seq",  defaultValue="") String seq,
			@RequestParam (value="atchFileId", defaultValue="")  String atchFileId,
			Model model
			) throws Exception{
		
		JSONObject obj = new JSONObject();
		
		//AdminUserVO adminUser = (AdminUserVO)request.getSession().getAttribute(PropUtil.get("session.admin"));
		
		int result = 0;
		
		param.put("pwd", param.get("userPwd"));
		param.put("seq", param.get("infoSeq"));
			
		System.out.println("param : " + param.toString());
		
//		result = accountService.updateAccountPassChange(param);
		
		model.addAttribute("menu_id", "02");
		model.addAttribute("sub_menu_id", "12");
		
		if(result > 0){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		
		return obj.toString();
	}
	
	/**
	  * 게시판 삭제
	  */
	@RequestMapping(value="/del_proc.json")
	@ResponseBody
	public String del_proc( 
						ModelMap model,  
						HttpSession session, 
						HttpServletRequest request,
			 			@RequestParam Map param,
			 			@RequestParam (value="seq", defaultValue="")  String seq	//단일 삭제
			 		
					) throws Exception{
		
		JSONObject obj = new JSONObject();
				
		int result = 0;
		
		if ( !"".equals(seq)){
			param.put("seq", seq);			
		}
		
		if ( !"".equals(seq)){
			
//			result = accountService.deleteAccount(param);
		}
		
		
		if ( result > 0 ){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		return obj.toString();		
	}
}
