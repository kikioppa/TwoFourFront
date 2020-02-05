package culturelandFront.controller.front.board;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.helper.ListHelper;
import culturelandFront.service.BoardService;

@Controller
@RequestMapping({"/board/notice", "/m/board/notice"})
public class NoticeBoardController extends NdnAbstractController{

	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	/**
	 * 게시판 목록
	 * */
	@RequestMapping("/list.do")
	public String list(
			HttpServletRequest request,
			@RequestParam Map param ,
			Model model,
			Device device
			) {
		
		ListHelper listHelper = new ListHelper(param);
		
		listHelper = boardService.getSelectNoticeBoardList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "33");
		if(device.isMobile()){
			return "/mobile/board/notice/list";
		}else{
			return "/front/board/notice/list";
		}
	}
	
	/**
	 * 게시판 글읽기
	 * */
	@RequestMapping("/detail.do")
	public String detail(
			HttpServletRequest request,
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
		model.addAttribute("sub_menu_id", "33");
		if(device.isMobile()){
			return "/mobile/board/notice/noticeView";
		}else{
			return "/front/board/notice/noticeView";
		}
	}
}
