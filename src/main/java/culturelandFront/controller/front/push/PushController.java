package culturelandFront.controller.front.push;
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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.helper.ListHelper;
import culturelandFront.core.util.FilesUtil;
import culturelandFront.core.util.PropUtil;
import culturelandFront.service.BoardService;
import culturelandFront.service.CategoryService;
import culturelandFront.service.FileMngService;
import culturelandFront.vo.AdminUserVO;
import culturelandFront.vo.FileVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
/**
 * 게시판 관리(공지사항)
 * 
 * */
@Controller
@RequestMapping("/admin/board/push")
public class PushController extends NdnAbstractController{

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
	@RequestMapping("/list.do")
	public String list(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model
			) {
		
		ListHelper listHelper = new ListHelper(param);
		
		listHelper = boardService.getSelectPushList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "02");
		model.addAttribute("sub_menu_id", "13");
		
		return "/admin/board/push/list";
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
		
		if(!"".equals(seq)){
			HashMap detail = (HashMap)boardService.getSelectPushDetail(param);
			
			model.addAttribute("detail", detail);
		}
		
		model.addAttribute("menu_id", "02");
		model.addAttribute("sub_menu_id", "13");
		
		return "/admin/board/push/write";
	}
	
	/**
	 * 게시판 글쓰기
	 * */
	@RequestMapping("/write_proc.json")
	@ResponseBody
	public String write_proc( final MultipartHttpServletRequest multiRequest,
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			@RequestParam(value="seq",  defaultValue="") String seq,
 			@RequestParam (value="atchFileId", defaultValue="")  String atchFileId,
			Model model
			) throws Exception{
		
		JSONObject obj = new JSONObject();
		
		String returnUrl = ""; 
		String subMenu = "";
		
		AdminUserVO adminUser = (AdminUserVO)request.getSession().getAttribute(PropUtil.get("session.admin"));
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		int result = 0;
		
		MultipartFile file1 = (MultipartFile) multiRequest.getFile("file_0");
		
		if(file1 != null){
			if ( "".equals(atchFileId)){
				
				atchFileId = fileGnrService.getNextStringId();
				param.put("atchFileId", atchFileId);
				
				
				FileVO fvo =   FilesUtil.parseFileInfOne(file1, "PUSH_", 0, atchFileId, "push");
				
				fileMngService.insertFileInf(fvo);
				
			}else{
				
				FileVO fvo =  FilesUtil.parseFileInfOne(file1, "PUSH_", 0, atchFileId, "push");
				
				List<FileVO> fileList = new ArrayList();
				fileList.add(fvo);
				
				fileMngService.updateFileInfs(fileList);
			}
		}
		
		if("".equals(seq)){
			result = boardService.insertPush(param);
		}else{
			result = boardService.updatePush(param);
		}
		
		model.addAttribute("menu_id", "02");
		model.addAttribute("sub_menu_id", "13");
		
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
		
		if ( !"".equals(seq) ||  seqArray.length > 0){
			
			result = boardService.deletePush(param);
		}
		
		
		if ( result > 0 ){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		return obj.toString();		
	}
}
