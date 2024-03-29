package culturelandFront.controller.front.board;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
		model.addAttribute("id", param.get("id"));
		model.addAttribute("menu_id", "03");
		model.addAttribute("sub_menu_id", "31");
		if(device.isMobile()){
			return "/mobile/board/faq/list";
		}else{
			return "/front/board/faq/list";
		}
	}
	/**
	 * 더보기 페이징
	 * @param request
	 * @param param
	 * @param model
	 * @param device
	 * @return
	 */
	@RequestMapping("/moreList.json")
	@ResponseBody
	public String moreList(
			HttpServletRequest request,
			@RequestParam Map param ,
			Model model,
			Device device
			) {
		JSONObject obj = new JSONObject();
		
		//DB에서 시간 데이터를 꺼내지 않기 위한 파라미터
		param.put("no_date", "Y");
		
		ListHelper listHelper = new ListHelper(param);
		
		listHelper = boardService.getSelectFaqBoardList(listHelper);

		List list = listHelper.getList();
		int curPage = Integer.parseInt((String)param.get("curPage")) + 1;

		obj.put("list", list);
		obj.put("curPage", curPage);

		param.put("curPage", curPage);
		ListHelper tempListHelper = new ListHelper(param);
		tempListHelper = boardService.getSelectFaqBoardList(tempListHelper);
		
		if(tempListHelper.getList().isEmpty()) {
			obj.put("last", true);
		}else {
			obj.put("last", false);
		}
		
		return obj.toString();
	}
}
