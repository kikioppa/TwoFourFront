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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.helper.ListHelper;
import culturelandFront.core.util.FilesUtil;
import culturelandFront.core.util.PropUtil;
import culturelandFront.service.BoardService;
import culturelandFront.service.FileMngService;
import culturelandFront.vo.AdminUserVO;
import culturelandFront.vo.FileVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
/**
 * 게시판 관리(공지사항)
 * 
 * */
@Controller
@RequestMapping("/board/notice")
public class NoticeBoardController extends NdnAbstractController{

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
		
		listHelper = boardService.getSelectNoticeBoardList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "21");
		
		if(device.isMobile()){			//모바일에서 접속 시
			return "/mobile/board/notice/list";
		}else{
			return "/front/board/notice/list";
		}
	}
	
	/**
	 * 게시판 글쓰기폼
	 * */
	@RequestMapping({"/detail.do", "/m/detail.do"})
	public String detail(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			@RequestParam (required=false, value="noticeId", defaultValue="")  String seq,
			Model model,
			Device device
			) {
		
		if(!"".equals(seq)){
			HashMap detail = (HashMap)boardService.getSelectNoticeBoardDetail(param);
			HashMap next = (HashMap)boardService.getSelectBoardNext(param);
			HashMap prev = (HashMap)boardService.getSelectBoardPrev(param);

			model.addAttribute("detail", detail);
			model.addAttribute("next", next);
			model.addAttribute("prev", prev);
		}
		
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "21");
		
		if(device.isMobile()){			//모바일에서 접속 시
			return "/mobile/board/notice/noticeView";
		}else{
			return "/front/board/notice/noticeView";
		}
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
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		MultipartFile file1 = (MultipartFile) multiRequest.getFile("file_0");
		
		String returnUrl = ""; 
		String subMenu = "";
		
		AdminUserVO adminUser = (AdminUserVO)request.getSession().getAttribute(PropUtil.get("session.admin"));
		
		int result = 0;
		
		if (file1 != null &&  !file1.isEmpty()) {
			
			if ( "".equals(atchFileId)){
				
				atchFileId = fileGnrService.getNextStringId();
				param.put("atchFileId", atchFileId);
				
				FileVO fvo =   FilesUtil.parseFileInfOne(file1, "NOTI_", 0, atchFileId, "noti");
				
				fileMngService.insertFileInf(fvo);
				
			}else{
				
				FileVO fvo =  FilesUtil.parseFileInfOne(file1, "NOTI_", 0, atchFileId, "noti");
				
				List<FileVO> fileList = new ArrayList();
				fileList.add(fvo);
				
				fileMngService.updateFileInfs(fileList);
			}
	
		}
		
		if("".equals(seq)){
	//		param.put("regUser", adminUser.getId());
			result = boardService.insertNoticeBoard(param);
		}else{
			result = boardService.updateNoticeBoard(param);
		}
		
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "21");
		
		if(result > 0){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		
		return obj.toString();
	}
	
	/**
	  * 게시판 글 삭제
	  */
	@RequestMapping(value="/del_proc.json")
	@ResponseBody
	public String del_proc( 
						ModelMap model,  
						HttpSession session, 
						HttpServletRequest request,
			 			@RequestParam Map param,
			 			@RequestParam (value="seq", defaultValue="")  String seq
					) throws Exception{
		
		JSONObject obj = new JSONObject();
				
		int result = 0;
		
		if ( !"".equals(seq)){
			param.put("seq", seq);			
		}
		
		if ( !"".equals(seq)){
			result = boardService.deleteNoticeBoard(param);
		}
		
		
		if ( result > 0 ){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		return obj.toString();		
	}
}
