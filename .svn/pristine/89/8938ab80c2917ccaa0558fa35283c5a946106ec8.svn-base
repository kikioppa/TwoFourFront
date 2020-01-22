package culturelandFront.controller.front.board;
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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.helper.ListHelper;
import culturelandFront.core.util.PropUtil;
import culturelandFront.service.BoardService;
import culturelandFront.service.FileMngService;
import culturelandFront.vo.AdminUserVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
/**
 * 게시판 관리(공지사항)
 * 
 * */
@Controller
@RequestMapping("/board/FAQ")
public class FAQBoardController extends NdnAbstractController{

	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private FileMngService fileMngService;
	
	/** fileGnrService */
    @Resource(name="fileGnrService")
    private EgovIdGnrService fileGnrService;
	
	/**
	 * 게시판 목록
	 * */
	@RequestMapping({"/list.do", "/m/list.do"})
	public String list(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model,
			Device device
			) {

		ListHelper listHelper = new ListHelper(param);
		List<Map> categoryList = new ArrayList<Map>();

		listHelper = boardService.getSelectFaqBoardList(listHelper);
		categoryList = boardService.getSelectCategoryList(param);

		model.addAttribute("listHelper", listHelper);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "23");

		if(device.isMobile()){			//모바일에서 접속 시
			return "/mobile/board/faq/list";
		}else{
			return "/front/board/faq/list";
		}
	}
	
	/**
	 * 게시판 글쓰기폼
	 * */
	@RequestMapping("/write.do")
	public String write(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			@RequestParam (required=false, defaultValue="")  String seq,
			Model model
			) {

		List<Map> categoryList = new ArrayList<Map>();
		
		categoryList = boardService.getSelectCategoryList(param);
			
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "23");
		
		return "/admin/board/faq/write";
	}
	
	/**
	 * 자주하는질문 글쓰기
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
		
		String returnUrl = ""; 
		String subMenu = "";
		
		AdminUserVO adminUser = (AdminUserVO)request.getSession().getAttribute(PropUtil.get("session.admin"));
		
		int result = 0;
		
	//	param.put("regUser", adminUser.getId());
		result = boardService.insertFaqBoard(param);
		
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "23");
		
		if(result > 0){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		
		return obj.toString();
	}
	
	/**
	 * 카테고리 추가
	 * */
	@RequestMapping("/cate_write_proc.json")
	@ResponseBody
	public String cate_write_proc(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model
			) throws Exception{
		
		JSONObject obj = new JSONObject();
		
		String returnUrl = ""; 
		String subMenu = "";
		
		AdminUserVO adminUser = (AdminUserVO)request.getSession().getAttribute(PropUtil.get("session.admin"));
		
		int result = 0;
		
//		param.put("regUser", adminUser.getId());
		result = boardService.insertCategoryBoard(param);
		
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "23");
		
		if(result > 0){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		
		return obj.toString();
	}
	
	/**
	  * 자주하는질문 글 삭제
	  */
	@RequestMapping(value="/del_proc.json")
	@ResponseBody
	public String del_proc( 
						ModelMap model,  
						HttpSession session, 
						HttpServletRequest request,
			 			@RequestParam Map param,
			 			@RequestParam (value="faqId", defaultValue="")  String faqId	//단일 삭제
					) throws Exception{
		
		JSONObject obj = new JSONObject();
				
		int result = 0;
		
		if ( !"".equals(faqId)){
			param.put("faqId", faqId);			
		}
		
		if ( !"".equals(faqId)){
			result = boardService.deleteFaqBoard(param);
		}
		
		
		if ( result > 0 ){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		return obj.toString();		
	}
	
	/**
	  * 카테고리 삭제
	  */
	@RequestMapping(value="/cate_del_proc.json")
	@ResponseBody
	public String cate_del_proc( 
						ModelMap model,  
						HttpSession session, 
						HttpServletRequest request,
			 			@RequestParam Map param,
			 			@RequestParam(value="seqArray",  defaultValue="") String[] seqArray,	// 여러개 삭제
			 			@RequestParam (value="seq", defaultValue="")  String seq	//단일 삭제
			 		
					) throws Exception{
		
		JSONObject obj = new JSONObject();
				
		int result = 0;
		
		if ( !"".equals(seq)){
			param.put("seq", seq);			
		}
		
		if ( seqArray.length > 0){
			param.put("seqArray", seqArray);			
		}
		
		if (seqArray.length > 0){
			
			result = boardService.deleteCategoryBoard(param);
		}
		
		
		if ( result > 0 ){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		return obj.toString();		
	}
}
