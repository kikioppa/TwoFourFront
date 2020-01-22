package culturelandFront.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import culturelandFront.core.abstr.NdnAbstractMapper;
import culturelandFront.vo.UserVO;

@Repository("loginDAO")
public class LoginDAO extends NdnAbstractMapper {

	
	public UserVO getUserLogin(UserVO userVO) {
		return (UserVO)selectOne("login.selectUserLogin", userVO);
	}
	
	public int insertUserPageHis(Map param) {
		return insert("login.insertUserPageHis", param);
	}
	
//	public int getAdminLoginCheck(Map param) {
//		return selectInt("login.selectAdminLoginCheck", param);
//	}
//	
//	public int insertAdminLogin(HistoryAdminloginVO adminLoginVO) {
//		return insert("historyAdminlogin.insertAdminLogin", adminLoginVO);
//	}
//	
//	public int insertAdminPageHis(Map param) {
//		return insert("historyAdminlogin.insertAdminPageHis", param);
//	}
//	
//	public int updatePassword(Map param) {
//		return update("login.updatePassword", param);
//	}
	
}
