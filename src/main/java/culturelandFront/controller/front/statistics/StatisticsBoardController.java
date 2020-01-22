package culturelandFront.controller.front.statistics;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.service.FileMngService;
import culturelandFront.service.StatisticsService;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
/**
 * 통계 관리(회원가입, 매입처리)
 * 
 * */
@Controller
@RequestMapping("/admin/statistics")
public class StatisticsBoardController extends NdnAbstractController{

	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private StatisticsService statisticsService;
	
	@Resource
	private FileMngService fileMngService;
	
	/** fileGnrService */
    @Resource(name="fileGnrService")
    private EgovIdGnrService fileGnrService;
    
	/**
	 * 회원가입 통계
	 * */
	@RequestMapping("/join.do")
	public String join(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			@RequestParam (required=false, defaultValue="")  String seq,
			Model model
			) {
		
		List statList = statisticsService.selectJoinList(param);

		model.addAttribute("statList", statList);
		
		model.addAttribute("menu_id", "05");
		model.addAttribute("sub_menu_id", "41");
		
		return "/admin/statistics/join";
	}
    
	/**
	 * 매입처리 통계
	 * */
	@RequestMapping("/purchase.do")
	public String purchase(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			@RequestParam (required=false, defaultValue="")  String seq,
			Model model
			) {
		
		List statList = statisticsService.selectPurchaseList(param);

		model.addAttribute("statList", statList);
		
		model.addAttribute("menu_id", "05");
		model.addAttribute("sub_menu_id", "41");
		
		return "/admin/statistics/purchase";
	}
}
