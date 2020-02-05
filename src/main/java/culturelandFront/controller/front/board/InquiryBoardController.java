package culturelandFront.controller.front.board;
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
import culturelandFront.core.util.PropUtil;
import culturelandFront.service.BoardService;
import culturelandFront.service.FileMngService;
import culturelandFront.vo.UserVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
/**
 * 게시판 관리(공지사항)
 * 
 * */
@Controller
@RequestMapping({"/board/inquiry", "/m/board/inquiry"})
public class InquiryBoardController extends NdnAbstractController{

	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@Resource
	private FileMngService fileMngService;
	
	/** fileGnrService */
    @Resource(name="fileGnrService")
    private EgovIdGnrService fileGnrService;
    
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
			Model model,
			Device device
			) {

		UserVO user = (UserVO)request.getSession().getAttribute(PropUtil.get("session.user"));
		
		model.addAttribute("memberNo", user.getMemberNo());
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "32");

		if(device.isMobile()){			//모바일에서 접속 시
			return "/mobile/board/inquiry/write";
		}else{
			return "/front/board/inquiry/write";
		}
	}
	
	/**
	 * 게시판 글쓰기
	 * */
	@RequestMapping("/write_proc.json")
	@ResponseBody
	public String write_proc(
			HttpServletRequest request,
			@RequestParam Map param 
			) throws Exception{
		
		JSONObject obj = new JSONObject();

		UserVO user = (UserVO)request.getSession().getAttribute(PropUtil.get("session.user"));
		param.put("memberNo", user.getMemberNo());
		
		int result = 0;
		
		result = boardService.insertInquiryBoard(param);
		
		if(result > 0){
			obj.put("success", true);
		}else{
			obj.put("success", false);
		}
		
		return obj.toString();
	}
}