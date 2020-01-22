package culturelandFront.controller.front.purchase;
/**
 * 매입처리관리
 * */
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

import culturelandFront.core.abstr.NdnAbstractController;
import culturelandFront.core.helper.ListHelper;
import culturelandFront.core.util.PropUtil;
import culturelandFront.service.FileMngService;
import culturelandFront.service.PurchaseService;
import culturelandFront.vo.AdminUserVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;




@Controller
@RequestMapping("/purchase")
public class PurchaseController extends NdnAbstractController{

	private final Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private PurchaseService purchaseService;
	
	@Resource
	private FileMngService fileMngService;
	
	/** fileGnrService */
    @Resource(name="fileGnrService")
    private EgovIdGnrService fileGnrService;
	
	/**
	 * 
	 * */
	@RequestMapping({"/apply.do", "/m/apply.do"})
	public String purchaseApply(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model,
			Device device
			) {
		ListHelper listHelper = new ListHelper(param);
		
//		listHelper = purchaseService.getSelectPurchaseList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "02");
		model.addAttribute("sub_menu_id", "11");

		if(device.isMobile()){			//모바일에서 접속 시
			return "/mobile/purchase/apply";
		}else{
			return "/front/purchase/apply";
		}
	}
	
	/**
	 * 
	 * */
	@RequestMapping({"/confirm.do", "/m/confirm.do"})
	public String purchaseConfirm(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model,
			Device device
			) {
		ListHelper listHelper = new ListHelper(param);
		
//		listHelper = purchaseService.getSelectPurchaseList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "02");
		model.addAttribute("sub_menu_id", "11");

		if(device.isMobile()){			//모바일에서 접속 시
			return "/mobile/purchase/confirm";
		}else{
			return "/front/purchase/confirm";
		}
	}
	
	/**
	 * 
	 * */
	@RequestMapping({"/complete.do", "/m/complete.do"})
	public String purchaseComplete(
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam Map param ,
			Model model,
			Device device
			) {
		ListHelper listHelper = new ListHelper(param);
		
//		listHelper = purchaseService.getSelectPurchaseList(listHelper);
		
		model.addAttribute("listHelper", listHelper);
		model.addAttribute("menu_id", "02");
		model.addAttribute("sub_menu_id", "11");

		if(device.isMobile()){			//모바일에서 접속 시
			return "/mobile/purchase/complete";
		}else{
			return "/front/purchase/complete";
		}
	}
}
