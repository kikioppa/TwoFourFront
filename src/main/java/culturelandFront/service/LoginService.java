package culturelandFront.service;

import java.util.Map;
import culturelandFront.vo.UserVO;

public interface LoginService {
	
	public UserVO getUserLogin(UserVO userVO);
	
	public int insertUserPageHis(Map param);
	
//	public int getAdminLoginCheck(Map param);
//	
//	public int insertAdminLogin(HistoryAdminloginVO adminLoginVO);
//	
//	public int insertAdminPageHis(Map param);
//	
//	public int updatePassword(Map param);
}
