package culturelandFront.controller.front.board;
import java.util.ArrayList;
import java.util.List;
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
@RequestMapping({"/board/FAQ", "/m/board/FAQ"})
public class FAQBoardController extends NdnAbstractController{

	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping("/list.do")
	public String list(
			HttpServletRequest request,
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
		model.addAttribute("sub_menu_id", "31");
		if(device.isMobile()){
			return "/mobile/board/faq/list";
		}else{
			return "/front/board/faq/list";
		}
	}
}
