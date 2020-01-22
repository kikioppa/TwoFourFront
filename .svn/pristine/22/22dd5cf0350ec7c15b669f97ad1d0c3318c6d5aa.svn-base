package culturelandFront.core.value;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;

import culturelandFront.core.util.NdnUtil;
import culturelandFront.service.CategoryService;
/**
 * 관리자
 *
 */
public class MapValue {
	
	public Object getAuthCodeList(){
		return  NdnUtil.hashMapToList1(AUTH_LEVEL);
	}
	public Object getAuthCode(){
		return  AUTH_LEVEL;
	}	
	public Object getAuthMenu1List(){
		return  NdnUtil.hashMapToList1(AUTH_MENU_1);
	}
	public Object getAuthMenu1Code(){
		return  AUTH_MENU_1;
	}	
	public Object getAuthMenu2List(){
		return  NdnUtil.hashMapToList1(AUTH_MENU_2);
	}
	public Object getAuthMenu2Code(){
		return  AUTH_MENU_2;
	}	
	public Object getAuthMenu3List(){
		return  NdnUtil.hashMapToList1(AUTH_MENU_3);
	}
	public Object getAuthMenu3Code(){
		return  AUTH_MENU_3;
	}	
	public Object getAuthMenu4List(){
		return  NdnUtil.hashMapToList1(AUTH_MENU_4);
	}
	public Object getAuthMenu4Code(){
		return  AUTH_MENU_4;
	}	
	public Object getAuthMenu5List(){
		return  NdnUtil.hashMapToList1(AUTH_MENU_5);
	}
	public Object getAuthMenu5Code(){
		return  AUTH_MENU_5;
	}	
	public Object getAuthMenu6List(){
		return  NdnUtil.hashMapToList1(AUTH_MENU_6);
	}
	public Object getAuthMenu6Code(){
		return  AUTH_MENU_6;
	}	

	
	public Object getAuthMenuUrlList(){
		return  NdnUtil.hashMapToList1(AUTH_MENU_URL);
	}
	public Object getAuthMenuUrlCode(){
		return  AUTH_MENU_URL;
	}
	/**
	 * 관리자 권한
	 */
	public static final HashMap<String, String> AUTH_LEVEL = new LinkedHashMap<String, String>() {
		private static final long serialVersionUID = 1L;
		{
			put("1", "수퍼관리자");
			put("2", "운영관리자");
			put("3", "일반관리자");
		}
	};
	
	// 컨텐츠 관리
	public static final HashMap<String, String> AUTH_MENU_1 = new LinkedHashMap<String, String>() {
		private static final long serialVersionUID = 1L;
		{
			put("01", "");
		}
	};
	
	// 시스템 관리
	public static final HashMap<String, String> AUTH_MENU_2 = new LinkedHashMap<String, String>() {
		private static final long serialVersionUID = 1L;
		{
			put("11",    "매입 리스트");
			put("12",    "대용량 매입리스트");

			            
		}
	};
	
	// 게시판 관리
	public static final HashMap<String, String> AUTH_MENU_3 = new LinkedHashMap<String, String>() {
		private static final long serialVersionUID = 1L;
		{
			put("21", "공지사항");
			put("22", "1:1문의");
			put("23", "자주하는질문(FAQ)");
		}
	};
	
	// 권한 관리
	public static final HashMap<String, String> AUTH_MENU_4 = new LinkedHashMap<String, String>() {
		private static final long serialVersionUID = 1L;
		{
			put("31", "");
		}
	};
	
	// 통계 관리
	public static final HashMap<String, String> AUTH_MENU_5 = new LinkedHashMap<String, String>() {
		private static final long serialVersionUID = 1L;
		{
			put("41", "회원가입 통계");
			put("42", "매입처리 통계");
		}
	};
	
	// 전시 관리
	public static final HashMap<String, String> AUTH_MENU_6 = new LinkedHashMap<String, String>() {
		private static final long serialVersionUID = 1L;
		{
			put("51", "");
		}
	};
	

	
	public static final HashMap<String, String> AUTH_MENU_URL = new LinkedHashMap<String, String>() {
		private static final long serialVersionUID = 1L;
		{
			
			put("01", "/admin/account/userList.do");
			put("02", "/admin/account/userDetail.do");
			
			put("11", "/admin/purchase/list.do");
			put("12", "/admin/purchase/largeList.do");
//			put("14", "/admin/board/test/list.do");
			
			put("21", "/admin/board/notice/list.do");
			put("22", "/admin/board/inquiry/list.do");
			put("23", "/admin/board/FAQ/list.do");
			
			put("31", "/admin/grant/list.do");
			
			put("41", "/admin/statistics/join.do");
			put("42", "/admin/statistics/purchase.do");

			put("51", "/admin/display/write.do");
		}
	};	
}
